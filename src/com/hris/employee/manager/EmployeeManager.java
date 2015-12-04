package com.hris.employee.manager;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hris.employee.ibatis.IbatisHelper;
import com.hris.employee.model.EmployeeBean;
import com.hris.employee.model.RoleBean;
import com.ibatis.sqlmap.client.SqlMapClient;

public class EmployeeManager {
	private SqlMapClient ibatis;
	
	public EmployeeManager(){
		ibatis = new IbatisHelper().getSqlMapInstance();
	}
	
	public List getEmployee(int flag){
		List list = null;
		Map map = new HashMap();
		map.put("flag", flag);
		
		try {
			list = ibatis.queryForList("employee.getEmployee", map);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void deactivate(String empId, String statusDesc, String quitDate) {
		Map map = new HashMap();
		map.put("description", statusDesc);
		map.put("empId", empId);
		map.put("quitDate", quitDate);
		
		try{
			ibatis.startTransaction();
			ibatis.update("employee.deactivateEmployee", map);
			ibatis.commitTransaction();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void mutate(String empId, String deptId, String roleId, String userId) {
		Map mapDept = new HashMap();
		mapDept.put("deptId", deptId);
		mapDept.put("empId", empId);
		mapDept.put("userId", userId);
		
		Map mapRole = new HashMap();
		mapRole.put("roleId", roleId);
		mapRole.put("empId", empId);
		mapRole.put("userId", userId);
		
		try{
			ibatis.startTransaction();
			ibatis.update("employee.mutateEmployeeDepartment", mapDept);
			ibatis.update("employee.mutateEmployeeRole", mapRole);
			ibatis.commitTransaction();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public EmployeeBean getOneEmployee(String empId){
		EmployeeBean eBean = null;

		try{
			eBean = (EmployeeBean) ibatis.queryForObject("employee.getOneEmployee", empId);
		} catch (SQLException e){
			e.printStackTrace();
		}
		return eBean;
	}
	
	public EmployeeBean getOneEmployeeName(String empId){
		EmployeeBean eBean = null;
		try{
			eBean = (EmployeeBean) ibatis.queryForObject("employee.getOneEmployeeName", empId);
		} catch (SQLException e){
			e.printStackTrace();
		}
		return eBean;
	}
	
	public void updateEmployee(EmployeeBean bean) {
		
		try{
			ibatis.startTransaction();
			ibatis.update("employee.updateEmployee", bean);
			ibatis.commitTransaction();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void updateUsername(String username, String empId, String userId) {
		Map data = new HashMap();
		data.put("username", username);
		data.put("empId", empId);
		data.put("userId", userId);
		
		try{
			ibatis.startTransaction();
			ibatis.update("employee.updateUsername", data);
			ibatis.commitTransaction();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void updateDocument(EmployeeBean bean) {
		
		try{
			ibatis.startTransaction();
			
			System.out.println("counter di manager: "+bean.getCounterDoc());
			for(int i=0;i<bean.getCounterDoc();i++){
				if(bean.getEmployeeDoc()[i]!=null){
					if(bean.getEmployeeDoc()[i].getContentType().contains("image")){
						System.out.println("docID: "+bean.getDocId()[i]);
						System.out.println("doc: "+bean.getEmployeeDoc()[i].getFileData());
						System.out.println("desc: "+bean.getDocDesc()[i]);
						
						Map parameter = new HashMap();
						parameter.put("docId", bean.getDocId()[i]);
						parameter.put("doc", bean.getEmployeeDoc()[i].getFileData());
						parameter.put("desc", bean.getDocDesc()[i]);
						parameter.put("userId", bean.getUserId());
						ibatis.update("employee.updateDocument", parameter);
						System.out.println(parameter.get("docId") +" = "+parameter.get("doc")+ " = "+ parameter.get("desc"));
					}
				}
			}
			
			ibatis.commitTransaction();
		} catch (SQLException e){
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public List getDepartment(){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getDepartment", "");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getMajor(){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getMajor", "");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getPosition(){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getPosition", "");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getLocation(){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getLocation", "");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getCity(int provinceId){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getCity", provinceId);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getProvince(){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getProvince", "");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getBank(){
		List list = null;
		
		try {
			list = ibatis.queryForList("list.getBank", "");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getRole(String deptName){
		List list = null;
		Map data = new HashMap();
		data.put("deptName", deptName);
		
		try {
			list = ibatis.queryForList("list.getRole", data);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	}
	
	public List getEmployeeName(){
		List list = null;
		
		try {
			list = ibatis.queryForList("employee.getEmployeeName", "");
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public byte[] getImage(String empId){
		byte[] imageByte = null;
		
		try {
			EmployeeBean empBean = (EmployeeBean) ibatis.queryForObject("employee.getEmployeeImage", empId);
			imageByte = empBean.getEmployeeImage();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return imageByte;
	}
	
	public String getEmployeeImageSize(String empId){
		String imageSize = null;
		try {
			imageSize = (String) ibatis.queryForObject("employee.getEmployeeImageSize", empId);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return imageSize;
	}
	
	public byte[] getDocument(String docId){
		byte[] imageByte = null;
		
		try {
			EmployeeBean empBean = (EmployeeBean) ibatis.queryForObject("employee.getEmployeeDocuments", docId);
			imageByte = empBean.getEmployeeDocuments();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return imageByte;
	}

	public List getEmployeeDocumentsId(String empId, String docType){
		List list = null;
		Map data = new HashMap();
		data.put("empId", empId);
		data.put("docType", docType);
		
		try {
			list = ibatis.queryForList("employee.getEmployeeDocumentsId", data);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public List<RoleBean> getRoleName(){
		List<RoleBean> list =  null;
		
		try {
			ibatis.startTransaction();
			list = ibatis.queryForList("employee.getRoleName", "");
			ibatis.commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				ibatis.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public String getDepartmentName(String deptId){
		String result = null;
		try {
			result = (String) ibatis.queryForObject("employee.getDepartmentName", deptId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void insertEmployeeData(EmployeeBean bean, String userId) {
		
		try{
			ibatis.startTransaction();
			ibatis.insert("employee.insertEmployee", bean);
			
			for(int i=0;i<10;i++){
				if(bean.getEmployeeDoc()[i]!=null){
					if(bean.getEmployeeDoc()[i].getContentType().contains("image")){
						Map parameter = new HashMap();
						parameter.put("docType", bean.getDocType()[i]);
						parameter.put("employeeDoc", bean.getEmployeeDoc()[i].getFileData());
						parameter.put("docDesc", bean.getDocDesc()[i]);
						parameter.put("userId", userId);
						ibatis.insert("employee.insertDoc", parameter);
						System.out.println(parameter.get("docType") +" = "+parameter.get("employeeDoc")+ " = "+ parameter.get("docDesc"));
					}
				}
			}
			
			ibatis.commitTransaction();
		} catch (SQLException e){
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public int getSameUsername(String userName, String empId){
		int result = 0;
		Map map = new HashMap();
		map.put("userName", userName);
		map.put("empId", empId);
		
		try {
			result = (Integer) ibatis.queryForObject("employee.getSameUsername", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List getPrivilege(String userName){
		List list = null;
		
		try {
			list = ibatis.queryForList("employee.getPrivilege", userName);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	
	public boolean isAuthorized(String username, String password) {
		Map user = new HashMap();
		user.put("username", username);
		user.put("password", password);
		
		int result = 0;
		try {
			result = (Integer) ibatis.queryForObject("users.isAuthorized", user);
			if (result == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;	
	}
	
	public void updateStatusLogin(String username, int status) {
		Map<String,String> user = new HashMap<String,String>();
		user.put("username", username);
		user.put("status", String.valueOf(status));
		
		try {
			ibatis.startTransaction();
			ibatis.update("users.updateStatusLogin", user);
			ibatis.commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				ibatis.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public String getUrl(String menu){
		String result = "";
		
		try {
			result = (String) ibatis.queryForObject("employee.getUrl", menu);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getSessionRole(String roleId){
		String result = "";
		
		try {
			result = (String) ibatis.queryForObject("employee.getSessionRole", roleId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public String getPortalUrl() {
		String url = null;
		try {
			url = (String) ibatis.queryForObject("users.getPortalUrl", "");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return url;
	}
}
