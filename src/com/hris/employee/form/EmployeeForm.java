package com.hris.employee.form;

import java.util.List;

import org.apache.struts.action.ActionForm;

import com.hris.employee.model.BankBean;
import com.hris.employee.model.CityBean;
import com.hris.employee.model.DepartmentBean;
import com.hris.employee.model.EmployeeBean;
import com.hris.employee.model.LocationBean;
import com.hris.employee.model.MajorBean;
import com.hris.employee.model.PositionBean;
import com.hris.employee.model.ProvinceBean;
import com.hris.employee.model.RoleBean;

public class EmployeeForm extends ActionForm {
	private List<EmployeeBean> listEmp;
	private List<DepartmentBean> listDept;
	private List<BankBean> listBank;
	private List<CityBean> listCity;
	private List<LocationBean> listLocation;
	private List<MajorBean> listMajor;
	private List<PositionBean> listPosition;
	private List<ProvinceBean> listProvince;
	private List<RoleBean> listRole;
	
	private EmployeeBean empBean = new EmployeeBean();
	private String task;
	private String id;
	private String search; 
	private String searchBy;
	private String searchByDept;
	private String searchByLoc;
	private String searchByEmp;
	private String sidebar = "1";
	private Integer provinceId;
	private String department;
	
	private String notification;
	private String urlPortal;
	
	public String getNotification() {
		return notification;
	}
	public void setNotification(String notification) {
		this.notification = notification;
	}
	public String getUrlPortal() {
		return urlPortal;
	}
	public void setUrlPortal(String urlPortal) {
		this.urlPortal = urlPortal;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public Integer getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	public List<ProvinceBean> getListProvince() {
		return listProvince;
	}
	public void setListProvince(List<ProvinceBean> listProvince) {
		this.listProvince = listProvince;
	}
	public List<RoleBean> getListRole() {
		return listRole;
	}
	public void setListRole(List<RoleBean> listRole) {
		this.listRole = listRole;
	}
	public String getSidebar() {
		return sidebar;
	}
	public void setSidebar(String sidebar) {
		this.sidebar = sidebar;
	}
	public List<DepartmentBean> getListDept() {
		return listDept;
	}
	public void setListDept(List<DepartmentBean> listDept) {
		this.listDept = listDept;
	}
	public List<BankBean> getListBank() {
		return listBank;
	}
	public void setListBank(List<BankBean> listBank) {
		this.listBank = listBank;
	}
	public List<CityBean> getListCity() {
		return listCity;
	}
	public void setListCity(List<CityBean> listCity) {
		this.listCity = listCity;
	}
	public List<LocationBean> getListLocation() {
		return listLocation;
	}
	public void setListLocation(List<LocationBean> listLocation) {
		this.listLocation = listLocation;
	}
	public List<MajorBean> getListMajor() {
		return listMajor;
	}
	public void setListMajor(List<MajorBean> listMajor) {
		this.listMajor = listMajor;
	}
	public List<PositionBean> getListPosition() {
		return listPosition;
	}
	public void setListPosition(List<PositionBean> listPosition) {
		this.listPosition = listPosition;
	}
	public String getSearchByLoc() {
		return searchByLoc;
	}
	public void setSearchByLoc(String searchByLoc) {
		this.searchByLoc = searchByLoc;
	}
	public String getSearchByEmp() {
		return searchByEmp;
	}
	public void setSearchByEmp(String searchByEmp) {
		this.searchByEmp = searchByEmp;
	}
	public String getSearchBy() {
		return searchBy;
	}
	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}
	public String getSearchByDept() {
		return searchByDept;
	}
	public void setSearchByDept(String searchByDept) {
		this.searchByDept = searchByDept;
	}
	public List<EmployeeBean> getListEmp() {
		return listEmp;
	}
	public void setListEmp(List<EmployeeBean> listEmp) {
		this.listEmp = listEmp;
	}
	public EmployeeBean getEmpBean() {
		return empBean;
	}
	public void setEmpBean(EmployeeBean empBean) {
		this.empBean = empBean;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
}
