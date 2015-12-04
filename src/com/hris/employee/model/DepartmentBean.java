package com.hris.employee.model;

import java.io.Serializable;

public class DepartmentBean implements Serializable{
	private String departmentId;
	private String department;
	
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
}
