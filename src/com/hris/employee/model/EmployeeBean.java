package com.hris.employee.model;

import java.io.Serializable;
import java.util.List;

import org.apache.struts.upload.FormFile;

public class EmployeeBean implements Serializable{
	private String userId; //untuk session
	
	private String rnum;
	private String employeeId;
	
	private String department;
	private String managerName;
	private String employeeTypeName;
	
	private String employeeName;
	private String gender = "L";
	private String genderId;
	private String placeOfBirth;
	private String dateOfBirth;
	private String address;
	private String cityId;
	private String city;
	private String provinceId;
	private String phoneNumber;
	private String mobileNumber;
	private String email;
	private String idCard;
	private String highestEducation;
	private String highestEducationId;
	private String majorId;
	private String major;
	private String religion;
	private String religionId;
	private String nationality;
	private FormFile employeePhoto;
	private byte[] photoFileData;
	private byte[] employeeImage;
	private String maritalStatus;
	private String maritalStatusId;
	private String amenability;
	
	private String positionId;
	private String position;
	private String departmentId;
	private String locationId;
	private String location;
	private String hireDate;
	private String quitDate;
	private String endContractDate;
	private String incomePeriodStart;
	private String incomePeriodEnd;
	private String employeeType;
	private String employeeTypeId;
	private String status;
	private String statusId;
	private String description;
	private String managerId;
	private String nik;
	
	private String currentLeaveQuota;
	private String lastLeaveQuota;
	private String rewardLeaveQuota;
	private String renewalDate;
	private String expiredDate;
	
	private String npwp;
	private String taxPosition;
	private String taxPositionId;
	
	private String bankId;
	private String bank;
	private String accountNumber;
	private String accountName;
	
	private Integer imageLength;
	private String roleId;
	
	//insert new documents
	private String[] docType = new String[10];
	private FormFile[] employeeDoc = new FormFile[10];
	private String[] docDesc = new String[10];
//	private String docType;
//	private FormFile employeeDoc;
//	private String docDesc;
	
	//show documents preview
	private byte[] employeeDocuments;
	private String[] docId = new String[10];
	
	private String empId; //for where empId in update employee
	private int counterDoc;//counter for update documents
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getEmployeeTypeName() {
		return employeeTypeName;
	}
	public void setEmployeeTypeName(String employeeTypeName) {
		this.employeeTypeName = employeeTypeName;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGenderId() {
		return genderId;
	}
	public void setGenderId(String genderId) {
		this.genderId = genderId;
	}
	public String getPlaceOfBirth() {
		return placeOfBirth;
	}
	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
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
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getHighestEducation() {
		return highestEducation;
	}
	public void setHighestEducation(String highestEducation) {
		this.highestEducation = highestEducation;
	}
	public String getHighestEducationId() {
		return highestEducationId;
	}
	public void setHighestEducationId(String highestEducationId) {
		this.highestEducationId = highestEducationId;
	}
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
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getReligionId() {
		return religionId;
	}
	public void setReligionId(String religionId) {
		this.religionId = religionId;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public FormFile getEmployeePhoto() {
		return employeePhoto;
	}
	public void setEmployeePhoto(FormFile employeePhoto) {
		this.employeePhoto = employeePhoto;
	}
	public byte[] getPhotoFileData() {
		return photoFileData;
	}
	public void setPhotoFileData(byte[] photoFileData) {
		this.photoFileData = photoFileData;
	}
	public byte[] getEmployeeImage() {
		return employeeImage;
	}
	public void setEmployeeImage(byte[] employeeImage) {
		this.employeeImage = employeeImage;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getMaritalStatusId() {
		return maritalStatusId;
	}
	public void setMaritalStatusId(String maritalStatusId) {
		this.maritalStatusId = maritalStatusId;
	}
	public String getAmenability() {
		return amenability;
	}
	public void setAmenability(String amenability) {
		this.amenability = amenability;
	}
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
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
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
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getQuitDate() {
		return quitDate;
	}
	public void setQuitDate(String quitDate) {
		this.quitDate = quitDate;
	}
	public String getEndContractDate() {
		return endContractDate;
	}
	public void setEndContractDate(String endContractDate) {
		this.endContractDate = endContractDate;
	}
	public String getIncomePeriodStart() {
		return incomePeriodStart;
	}
	public void setIncomePeriodStart(String incomePeriodStart) {
		this.incomePeriodStart = incomePeriodStart;
	}
	public String getIncomePeriodEnd() {
		return incomePeriodEnd;
	}
	public void setIncomePeriodEnd(String incomePeriodEnd) {
		this.incomePeriodEnd = incomePeriodEnd;
	}
	public String getEmployeeType() {
		return employeeType;
	}
	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}
	public String getEmployeeTypeId() {
		return employeeTypeId;
	}
	public void setEmployeeTypeId(String employeeTypeId) {
		this.employeeTypeId = employeeTypeId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getNik() {
		return nik;
	}
	public void setNik(String nik) {
		this.nik = nik;
	}
	public String getCurrentLeaveQuota() {
		return currentLeaveQuota;
	}
	public void setCurrentLeaveQuota(String currentLeaveQuota) {
		this.currentLeaveQuota = currentLeaveQuota;
	}
	public String getLastLeaveQuota() {
		return lastLeaveQuota;
	}
	public void setLastLeaveQuota(String lastLeaveQuota) {
		this.lastLeaveQuota = lastLeaveQuota;
	}
	public String getRewardLeaveQuota() {
		return rewardLeaveQuota;
	}
	public void setRewardLeaveQuota(String rewardLeaveQuota) {
		this.rewardLeaveQuota = rewardLeaveQuota;
	}
	public String getRenewalDate() {
		return renewalDate;
	}
	public void setRenewalDate(String renewalDate) {
		this.renewalDate = renewalDate;
	}
	public String getExpiredDate() {
		return expiredDate;
	}
	public void setExpiredDate(String expiredDate) {
		this.expiredDate = expiredDate;
	}
	public String getNpwp() {
		return npwp;
	}
	public void setNpwp(String npwp) {
		this.npwp = npwp;
	}
	public String getTaxPosition() {
		return taxPosition;
	}
	public void setTaxPosition(String taxPosition) {
		this.taxPosition = taxPosition;
	}
	public String getTaxPositionId() {
		return taxPositionId;
	}
	public void setTaxPositionId(String taxPositionId) {
		this.taxPositionId = taxPositionId;
	}
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
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public Integer getImageLength() {
		return imageLength;
	}
	public void setImageLength(Integer imageLength) {
		this.imageLength = imageLength;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String[] getDocType() {
		return docType;
	}
	public void setDocType(String[] docType) {
		this.docType = docType;
	}
	public FormFile[] getEmployeeDoc() {
		return employeeDoc;
	}
	public void setEmployeeDoc(FormFile[] employeeDoc) {
		this.employeeDoc = employeeDoc;
	}
	public String[] getDocDesc() {
		return docDesc;
	}
	public void setDocDesc(String[] docDesc) {
		this.docDesc = docDesc;
	}
	
	public byte[] getEmployeeDocuments() {
		return employeeDocuments;
	}
//	public String getDocType() {
//		return docType;
//	}
//	public void setDocType(String docType) {
//		this.docType = docType;
//	}
//	public FormFile getEmployeeDoc() {
//		return employeeDoc;
//	}
//	public void setEmployeeDoc(FormFile employeeDoc) {
//		this.employeeDoc = employeeDoc;
//	}
//	public String getDocDesc() {
//		return docDesc;
//	}
//	public void setDocDesc(String docDesc) {
//		this.docDesc = docDesc;
//	}
	public void setEmployeeDocuments(byte[] employeeDocuments) {
		this.employeeDocuments = employeeDocuments;
	}
	public String[] getDocId() {
		return docId;
	}
	public void setDocId(String[] docId) {
		this.docId = docId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public int getCounterDoc() {
		return counterDoc;
	}
	public void setCounterDoc(int counterDoc) {
		this.counterDoc = counterDoc;
	}
}
