package com.hris.employee.model;

import java.io.Serializable;

public class MajorBean implements Serializable {
	private String majorId;
	private String major;
	
	public String getMajorId() {
		return majorId;
	}
	public void setMajorId(String majorId) {
		this.majorId = majorId;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
}
