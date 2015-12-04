package com.hris.employee.model;

import java.io.Serializable;

public class DocBean implements Serializable {
	private String documentId;
	private String description;
	
	public String getDocumentId() {
		return documentId;
	}
	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
