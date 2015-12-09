package com.hris.employee.model;

import java.io.Serializable;
import java.sql.Blob;

public class DocBean implements Serializable {
	private String documentId;
	private String description;
	private String documentContentType;
	
	public String getDocumentContentType() {
		return documentContentType;
	}
	public void setDocumentContentType(String documentContentType) {
		this.documentContentType = documentContentType;
	}
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
