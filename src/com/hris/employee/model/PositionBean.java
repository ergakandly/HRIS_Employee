package com.hris.employee.model;

import java.io.Serializable;

public class PositionBean implements Serializable {
	private String positionId;
	private String position;
	
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
}
