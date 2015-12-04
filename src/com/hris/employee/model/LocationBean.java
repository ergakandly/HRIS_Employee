package com.hris.employee.model;

import java.io.Serializable;

public class LocationBean implements Serializable {
	private String locationId;
	private String location;
	
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
