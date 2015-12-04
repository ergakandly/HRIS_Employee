package com.hris.employee.model;

import java.io.Serializable;

public class BankBean implements Serializable{
	private String bankId;
	private String bank;
	
	public String getBankId() {
		return bankId;
	}
	public void setBankId(String bankId) {
		this.bankId = bankId;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
}
