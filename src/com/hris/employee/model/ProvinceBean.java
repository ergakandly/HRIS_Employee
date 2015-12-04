package com.hris.employee.model;

import java.io.Serializable;

public class ProvinceBean implements Serializable{
	private Integer provinceId;
	private String province;
	
	public Integer getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}

}
