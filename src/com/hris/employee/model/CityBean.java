package com.hris.employee.model;

import java.io.Serializable;

public class CityBean implements Serializable{
	private String cityId;
	private String city;
	
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
}
