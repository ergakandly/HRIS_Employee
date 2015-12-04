package com.hris.employee.handler;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.google.gson.Gson;
import com.hris.employee.form.EmployeeForm;
import com.hris.employee.manager.EmployeeManager;
import com.hris.employee.model.CityBean;
import com.hris.employee.model.DocBean;
import com.hris.employee.model.EmployeeBean;
import com.hris.employee.model.RoleBean;
import com.hris.employee.util.EmployeeUtil;

public class EmployeeAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		EmployeeForm eForm = (EmployeeForm) form;
		EmployeeManager manager = new EmployeeManager();
		String parameter = null;
		
		HttpSession session = request.getSession(false);
		String param = null;
		//check session jika ada parameter yang diterima
		if (null!=request.getParameter("zx") && EmployeeUtil.isBase64(request.getParameter("zx").replace(' ', '+'))) {
			//parameter diterima
			System.out.println("EMPLOYEE Check session dari parameter.");
			param = request.getParameter("zx").replace(' ', '+');
			String user[] = EmployeeUtil.decrypt(param).split("##");
			
			// cek apakah memang data memiliki hak akses
			if (manager.isAuthorized(user[0], user[1])) {
				//parameter yang akan dikirim
			    System.out.println("EMPLOYEE param dikirim: "+ param);
			    request.setAttribute("zx", param);
			    parameter = param;
			    
				System.out.println("EMPLOYEE Set session "+user[0]+".");
				session.setAttribute("username", user[0]);
				session.setAttribute("password", user[1]);
				session.setAttribute("roleId", user[2]);
				session.setAttribute("userId", user[3]);
				session.setAttribute("employeeId", user[4]);
				session.setAttribute("employeeName", user[5]);
			}
			else {
				// hancurkan session karena username dan password tidak pernah ada
		    	System.out.println("EMPLOYEE "+session.getAttribute("username")+" tidak terautorisasi. Session dihancurkan.");
		    	if (null != session)
		    		session.invalidate();
			}	
		}
		eForm.setParameter(parameter);
		
		//String role = "HR";  
		String role = manager.getSessionRole(session.getAttribute("roleId").toString()); 
		System.out.println("Role "+role);
		
		//String nameSession = "donny.setiawan";
		String nameSession = session.getAttribute("username").toString();
		
		eForm.setUrlDashboard("http://192.168.10.29:8080"+manager.getUrl("Portal")+"?zx="+eForm.getParameter());
		System.out.println(eForm.getUrlDashboard());
		
		List privList = manager.getPrivilege(nameSession); //ganti dengan username dari session
		System.out.println("list:"+privList);
		
		request.setAttribute("privList", privList);
		
		if(role.equals("HR") || role.equals("Finance") || role.equals("Super") ){
			if("view".equalsIgnoreCase(eForm.getTask())){
				System.out.println("ID: "+eForm.getId());
				
				List<DocBean> diplomaIdList = manager.getEmployeeDocumentsId(eForm.getId(), "1");
				List<DocBean> certificateIdList = manager.getEmployeeDocumentsId(eForm.getId(), "2");
				List<DocBean> personalIdList = manager.getEmployeeDocumentsId(eForm.getId(), "3");
				
				eForm.setEmpBean(manager.getOneEmployee(eForm.getId()));
				request.setAttribute("empId", eForm.getId());
				request.setAttribute("diplomaIdList", diplomaIdList);
				request.setAttribute("certificateIdList", certificateIdList);
				request.setAttribute("personalIdList", personalIdList);
				
				request.setAttribute("imageSize", manager.getEmployeeImageSize(eForm.getId()));
				return mapping.findForward("view");
			}
			else if("add".equalsIgnoreCase(eForm.getTask())){
				System.out.println("Add Task: "+eForm.getTask());
				eForm.setEmpBean(new EmployeeBean());
				
				eForm.setListDept(manager.getDepartment());
				eForm.setListLocation(manager.getLocation());
				eForm.setListPosition(manager.getPosition());
				eForm.setListMajor(manager.getMajor());
				eForm.setListProvince(manager.getProvince());
				eForm.setListBank(manager.getBank());
				eForm.setListEmp(manager.getEmployeeName());
				eForm.getEmpBean().setEmployeeName("");
				eForm.getEmpBean().setDescription(""); 
				
				return mapping.findForward("add");
			}
			
			else if("insert".equalsIgnoreCase(eForm.getTask())){
				if(eForm.getEmpBean().getEmployeePhoto().getContentType().contains("image")) {
					eForm.getEmpBean().setPhotoFileData(eForm.getEmpBean().getEmployeePhoto().getFileData());
				}

				eForm.getEmpBean().setUserId(session.getAttribute("userId").toString());
				manager.insertEmployeeData(eForm.getEmpBean(), session.getAttribute("userId").toString());
				eForm.setListEmp(manager.getEmployee(0));
				
				eForm.setNotification("Employee has been succesfully added.");
				eForm.setEmpBean(new EmployeeBean()); //reset field
				return mapping.findForward("success");
			}
			else if("edit".equalsIgnoreCase(eForm.getTask())){
				eForm.setListDept(manager.getDepartment());
				eForm.setListLocation(manager.getLocation());
				eForm.setListPosition(manager.getPosition());
				eForm.setListMajor(manager.getMajor());
				eForm.setListProvince(manager.getProvince());
				eForm.setListBank(manager.getBank());
				eForm.setListEmp(manager.getEmployeeName());
				
				List<DocBean> diplomaIdList = manager.getEmployeeDocumentsId(eForm.getId(), "1");
				List<DocBean> certificateIdList = manager.getEmployeeDocumentsId(eForm.getId(), "2");
				List<DocBean> personalIdList = manager.getEmployeeDocumentsId(eForm.getId(), "3");
				
				eForm.setEmpBean(manager.getOneEmployee(eForm.getId()));
				eForm.setListCity(manager.getCity(Integer.parseInt(eForm.getEmpBean().getProvinceId())));
				request.setAttribute("empId", eForm.getId());
				request.setAttribute("diplomaIdList", diplomaIdList);
				request.setAttribute("certificateIdList", certificateIdList);
				request.setAttribute("personalIdList", personalIdList);
				
				request.setAttribute("imageSize", manager.getEmployeeImageSize(eForm.getId()));
				return mapping.findForward("edit");
			}
			else if("update".equalsIgnoreCase(eForm.getTask())){
				if(eForm.getEmpBean().getEmployeePhoto().getContentType().contains("image")) {
					eForm.getEmpBean().setPhotoFileData(eForm.getEmpBean().getEmployeePhoto().getFileData());
				} 
				
				eForm.getEmpBean().setEmpId(eForm.getId());
				eForm.getEmpBean().setUserId(session.getAttribute("userId").toString());
				manager.updateEmployee(eForm.getEmpBean());

				manager.updateDocument(eForm.getEmpBean());
				
				//mapping ke view
				List<DocBean> diplomaIdList = manager.getEmployeeDocumentsId(eForm.getId(), "1");
				List<DocBean> certificateIdList = manager.getEmployeeDocumentsId(eForm.getId(), "2");
				List<DocBean> personalIdList = manager.getEmployeeDocumentsId(eForm.getId(), "3");
				
				eForm.setEmpBean(manager.getOneEmployee(eForm.getId()));
				request.setAttribute("empId", eForm.getId());
				request.setAttribute("diplomaIdList", diplomaIdList);
				request.setAttribute("certificateIdList", certificateIdList);
				request.setAttribute("personalIdList", personalIdList);
				
				request.setAttribute("imageSize", manager.getEmployeeImageSize(eForm.getId()));
				
				eForm.setNotification("Employee data has been succesfully updated.");
				
				return mapping.findForward("view");
			}
			else if("deactivate".equalsIgnoreCase(eForm.getTask())){
				manager.deactivate(eForm.getId(),eForm.getEmpBean().getDescription(),eForm.getEmpBean().getQuitDate());
				eForm.setEmpBean(new EmployeeBean()); 
			}
			else if("mutate".equalsIgnoreCase(eForm.getTask())){
				eForm.setListDept(manager.getDepartment());
				eForm.setListEmp(manager.getEmployee(1));
				
				eForm.setEmpBean(manager.getOneEmployeeName(eForm.getId()));
				return mapping.findForward("mutate");
			}
			else if("updateMutation".equalsIgnoreCase(eForm.getTask())){
				System.out.println(eForm.getEmpBean().getDepartmentId());
				System.out.println(eForm.getEmpBean().getRoleId());
				manager.mutate(eForm.getId(), eForm.getEmpBean().getDepartmentId(), eForm.getEmpBean().getRoleId(),session.getAttribute("userId").toString());
				
				//reset
				eForm.setId(""); eForm.setEmpBean(new EmployeeBean()); 
			}
			else if("select".equalsIgnoreCase(eForm.getTask())){
				eForm.setListDept(manager.getDepartment());
				return mapping.findForward("select");
			}
			else if("loadCity".equalsIgnoreCase(eForm.getTask())) {
				Gson gson = new Gson(); 
				
			    List<CityBean> listCity = manager.getCity(eForm.getProvinceId()); 
			    System.out.println("Province ID: "+eForm.getProvinceId());
			    
			    String jsonData= gson.toJson(listCity); 
			    
			    response.setContentType("application/json"); 
			    response.setHeader("cache-control", "no-cache"); 
			    System.out.println(jsonData); 
			    
			    PrintWriter out = response.getWriter(); 
			    out.write(jsonData); 
			    out.flush();
			    
			    return null;
			}
			else if("loadRole".equalsIgnoreCase(eForm.getTask())) {
				Gson gson = new Gson(); 
				eForm.getEmpBean().setDepartment(eForm.getDepartment());;
				
			    List<RoleBean> listRole = manager.getRole(eForm.getDepartment());
			    
			    String jsonData= gson.toJson(listRole); 
			    
			    response.setContentType("application/json"); 
			    response.setHeader("cache-control", "no-cache"); 
			    System.out.println(jsonData); 
			    
			    PrintWriter out = response.getWriter(); 
			    out.write(jsonData); 
			    out.flush();
			    
			    return null;
			}
			else if("logout".equalsIgnoreCase(eForm.getTask())) {
				manager.updateStatusLogin(session.getAttribute("username").toString(), 0);
				System.out.println("EMPLOYEE "+session.getAttribute("username")+" logout.");
				
				if(session != null)
		    		session.invalidate();
				System.out.println("EMPLOYEE Kembali ke halaman login.");
			}
			eForm.setListEmp(manager.getEmployee(0));
			
			return mapping.findForward("success");
		}
		else {
			String idSession = "2";
//			String idSession = session.getAttribute("userId").toString();
			
			System.out.println("ID fix: "+idSession); 
			
			List<DocBean> diplomaIdList = manager.getEmployeeDocumentsId(idSession, "1");
			List<DocBean> certificateIdList = manager.getEmployeeDocumentsId(idSession, "2");
			List<DocBean> personalIdList = manager.getEmployeeDocumentsId(idSession, "3");
			
			eForm.setEmpBean(manager.getOneEmployee(idSession));
			request.setAttribute("empId", idSession);
			request.setAttribute("diplomaIdList", diplomaIdList);
			request.setAttribute("certificateIdList", certificateIdList);
			request.setAttribute("personalIdList", personalIdList);
			
			request.setAttribute("imageSize", manager.getEmployeeImageSize(idSession));
			return mapping.findForward("view");
		}
	}
}
