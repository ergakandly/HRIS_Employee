<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ page import="com.hris.employee.model.DocBean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Employee</title>

<%@include file="PartBootstrap.jsp"%>
</head>
<script type="text/javascript">
	function flyToPage(task, id, currentSideBar) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].sidebar.value = currentSideBar;
		document.forms[0].submit();
	}

	$(function() {
		$('#prevTabPersonal').click(function(e) {
			e.preventDefault();
			$('#mytabs a[href="#personal"]').tab('show');
		})
		$('#prevTabProfessional').click(function(e) {
			e.preventDefault();
			$('#mytabs a[href="#professional"]').tab('show');
		})
		$('#prevTabOther').click(function(e) {
			e.preventDefault();
			$('#mytabs a[href="#other"]').tab('show');
		})
		$('#nextTabProfessional').click(function(e) {
			e.preventDefault();
			$('#mytabs a[href="#professional"]').tab('show');
		})
		$('#nextTabOther').click(function(e) {
			e.preventDefault();
			$('#mytabs a[href="#other"]').tab('show');
		})
		$('#nextTabImage').click(function(e) {
			e.preventDefault();
			$('#mytabs a[href="#image"]').tab('show');
		})
	})

	function getCityDetail() {
		$
				.getJSON(
						"/HRIS_Employee/index.do",
						{
							provinceId : $('#selectProvince').val(),
							task : "loadCity"
						},
						function(data) {
							var content = '<html:select name="empForm" property="empBean.cityId" styleClass="form-control">';

							$
									.each(
											data,
											function(index, element) {
												content += '<html:option value="'+element.cityId+'">'
														+ element.city
														+ '</html:option>';
											});

							content += "</html:select>";
							$("#contentCity").html(content);
						});
	}

	function doValidate() {

		var tabName = $('.nav-tabs .active').text();
		
		if (tabName == "Personal Information") {
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.username');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.employeeName');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.placeOfBirth');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.nationality');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.idCard');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.address');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.phoneNumber');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.mobileNumber');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.email');
		} else if (tabName == "Professional Information") {
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.nik');
		} else if (tabName == "Other Information") {
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.npwp');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.accountNumber');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.accountName');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.description');
		}
	}
</script>
<body>
	<html:form action="/index" enctype="multipart/form-data"
		styleId="validate-form" styleClass="validate-form"
		onsubmit="javascript:doValidate();">>
		<html:hidden name="empForm" property="task" value="update" />
		<html:hidden name="empForm" property="id" />
		<html:hidden name="empForm" property="sidebar" value="1" />
		
		<div id="wrapper">
			<%@include file="PartNavbar.jsp"%>
			<div id="page-wrapper">

				<!-- CONTAINER -->
				<div class="container-fluid">
					<div class="row">

						<!-- ISI CONTENT -->
						<div class="col-md-12">
							<!--JUDUL-->
							<div class="page-header">
								<h3 id="timeline">Edit Employee</h3>
							</div>
							<!-- END JUDUL -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i>
								<a href="<bean:write name="empForm" property="urlDashboard" />">
									Dashboard</a></li>
								<li><i class="fa fa-pencil"></i> Edit Employee</li>
							</ul>
							<!-- END BREADCRUMB -->

							<div class="col-md-9">
								
								<!-- TAB -->
								<ul id="mytabs" class="nav nav-tabs" role="tablist">
									<li class="active"><a href="#personal" role="tab"
										data-toggle="tab" >Personal Information</a></li>
									<li><a href="#professional" role="tab" data-toggle="tab">Professional Information </a></li>
									<li><a href="#other" role="tab" data-toggle="tab">Other Information </a></li>
									<li><a href="#image" role="tab" data-toggle="tab">Documents </a></li>
								</ul>

								<!-- ISI TAB -->
								<div class="tab-content">

									<!-- TAB PERSONAL -->
									<div class="tab-pane active" id="personal">
										<br />
										<div class="col-md-8">
											<table class="table table-nonfluid table-borderless">
												<tr>
													<td colspan="2"><h5>
															<small><b>BASIC INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan" width="200px">Employee Name <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.employeeName"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Place of Birth <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.placeOfBirth"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Date of Birth <span
														style="color: red">*</span> :</td>
													<td>
														<div class="input-group">
															<input class="form-control form-control-md-1"
																name="empBean.dateOfBirth" type="text"
																id="dobDatePicker" readonly="true"
																value="<bean:write name="empForm" property="empBean.dateOfBirth"/>" /><span
																class="input-group-addon input-number-resize"
																id="basic-addon1"
																style="height: 22px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"><i
																class="fa fa-calendar"></i></span>
														</div>
													</td>
												</tr>
												<tr>
													<td class="kanan">Gender :</td>
													<td><html:radio name="empForm"
															property="empBean.genderId" value="L" /> Male <html:radio
															name="empForm" property="empBean.genderId" value="P" />
														Female</td>
												</tr>
												<tr>
													<td class="kanan">Religion <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.religionId"
															styleClass="form-control form-control-md">
															<html:option value="1">Islam</html:option>
															<html:option value="2">Catholicism</html:option>
															<html:option value="3">Protestantism</html:option>
															<html:option value="4">Buddhism</html:option>
															<html:option value="5">Hinduism</html:option>
															<html:option value="6">Confucianism</html:option>
															<html:option value="7">Others</html:option>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Nationality <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.nationality"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">ID Card <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<input name="empBean.idCard" class="form-control form-control-md"
																data-mask="9999.9999.9999.9999" value="<bean:write name="empForm" property="empBean.idCard"/>"/>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Highest Education <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.highestEducationId"
															styleClass="form-control form-control-md">
															<html:option value="1">Elementary School (SD)</html:option>
															<html:option value="2">Junior High School (SMP)</html:option>
															<html:option value="3">Senior High School (SMA/SMK)</html:option>
															<html:option value="4">Diploma 1 (D1)</html:option>
															<html:option value="5">Diploma 2 (D2)</html:option>
															<html:option value="6">Diploma 3 (D3)</html:option>
															<html:option value="7">Bachelor (S1)</html:option>
															<html:option value="8">Master (S2)</html:option>
															<html:option value="9">Doctoral (S3)</html:option>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Major <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.majorId"
															styleClass="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listMajor">
																<bean:define id="majorId" name="list" property="majorId" />
																<html:option value="<%=majorId.toString()%>">
																	<bean:write name="list" property="major" />
																</html:option>
															</logic:iterate>
														</html:select></td>
												</tr>
												<tr>
													<td colspan="2"><h5>
															<small><b>CONTACT INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan">Address <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<html:textarea name="empForm" property="empBean.address"
																styleClass="form-textarea" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Province <span
														style="color: red">*</span> :</td>
													<td><select name="provinceId" id="selectProvince"
														onchange="javascript:getCityDetail();"
														class="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listProvince">
																<bean:define id="provinceId" name="list"
																	property="provinceId" type="java.lang.Integer" />
																<logic:equal name="empForm"
																	property="empBean.provinceId"
																	value="<%=Integer.toString(provinceId)%>">
																	<option value="<%=provinceId.toString()%>" selected>
																		<bean:write name="list" property="province" />
																	</option>
																</logic:equal>
																<logic:notEqual name="empForm"
																	property="empBean.provinceId"
																	value="<%=Integer.toString(provinceId)%>">
																	<option value="<%=provinceId.toString()%>">
																		<bean:write name="list" property="province" />
																	</option>
																</logic:notEqual>
															</logic:iterate>
													</select></td>
												</tr>
												<tr>
													<td class="kanan">City <span
														style="color: red">*</span> :</td>
													<td id="contentCity"><html:select name="empForm"
															property="empBean.cityId"
															styleClass="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listCity">
																<bean:define id="cityId" name="list" property="cityId" />
																<html:option value="<%=cityId.toString()%>">
																	<bean:write name="list" property="city" />
																</html:option>
															</logic:iterate>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Phone Number <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<div class="input-group">
																<span class="input-group-addon" id="basic-addon1"
																	style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-top-left-radius: 15px;">+62</span>
																<html:text name="empForm" property="empBean.phoneNumber"
																	styleClass="form-control form-control-md-1" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Mobile Number <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<div class="input-group">
																<span class="input-group-addon" id="basic-addon1"
																	style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-top-left-radius: 15px;">+62</span>
																<html:text name="empForm"
																	property="empBean.mobileNumber"
																	styleClass="form-control form-control-md-1" />
															</div>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">E-mail <span
														style="color: red">*</span> :</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.email"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td colspan="2"><h5>
															<small><b>RELATIONSHIP</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan">Marital Status <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.maritalStatusId"
															styleClass="form-control form-control-md">
															<html:option value="1">Single</html:option>
															<html:option value="2">Married</html:option>
															<html:option value="3">Divorced</html:option>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Amenability :</td>
													<td>
														<div class="input-group">
															<span class="input-group-btn">
																<button type="button"
																	class="btn btn-default btn-number input-number-resize"
																	disabled="disabled" data-type="minus"
																	data-field="empBean.amenability">
																	<span class="glyphicon glyphicon-minus"></span>
																</button>
															</span> <input type="text" min="0" max="10"
																name="empBean.amenability"
																class="form-control form-control-sm input-number"
																value="<bean:write name="empForm" property="empBean.amenability"/>">
															<span class="input-group-btn">
																<button type="button"
																	class="btn btn-default btn-number input-number-resize"
																	data-type="plus" data-field="empBean.amenability">
																	<span class="glyphicon glyphicon-plus"></span>
																</button>
															</span>
														</div>
													</td>
												</tr>
											</table>
										</div>
										
										<div class="row">
											<div class="col-md-12 kanan">
												<hr>
												<button type="button" id="nextTabProfessional"
													class="btn btn-default kanan">
													<i class="fa fa-arrow-right"></i> Go To Professional
													Information
												</button>
											</div>
										</div>
									</div>
									<!-- END TAB PERSONAL -->

									<!-- TAB PROFESIONAL -->
									<div class="tab-pane" id="professional">
										<br />
										<div class="col-md-8">
											<table class="table table-nonfluid table-borderless">
												<tr>
													<td colspan="2"><h5>
															<small><b>WORK INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan" width="200px">Position <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.positionId"
															styleClass="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listPosition">
																<bean:define id="positionId" name="list"
																	property="positionId" />
																<html:option value="<%=positionId.toString()%>">
																	<bean:write name="list" property="position" />
																</html:option>
															</logic:iterate>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Department <span
														style="color: red">*</span> :</td>
													<td><bean:write name="empForm"
															property="empBean.department" /></td>
												</tr>
												<tr>
													<td class="kanan">Location <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.locationId"
															styleClass="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listLocation">
																<bean:define id="locationId" name="list"
																	property="locationId" />
																<html:option value="<%=locationId.toString()%>">
																	<bean:write name="list" property="location" />
																</html:option>
															</logic:iterate>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Hire Date <span
														style="color: red">*</span> :</td>
													<td>
														<div class="input-group">
															<input class="form-control form-control-md-1"
																name="empBean.hireDate" type="text" id="hireDatePicker"
																readonly="true" disabled="true"
																value="<bean:write name="empForm" property="empBean.hireDate"/>" />
															<span class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"><i
																class="fa fa-calendar"></i></span>
														</div>
													</td>
												</tr>
												<tr>
													<td class="kanan">Employee Type <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.employeeTypeId"
															styleClass="form-control form-control-md">
															<html:option value="1">Permanent</html:option>
															<html:option value="2">Contractual</html:option>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">End Contract Date :</td>
													<td>
														<div class="input-group">
															<input class="form-control form-control-sm"
																name="empBean.endContractDate" type="text"
																id="endContractDatePicker" readonly="true"
																value="<bean:write name="empForm" property="empBean.endContractDate"/>" />
															<span class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 0px;"><i
																class="fa fa-calendar"></i></span><span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"
																onclick="javascript:doResetEndContract();"><i
																class="fa fa-times-circle"></i></span>
														</div>
													</td>
												</tr>
												<tr>
													<td class="kanan">Income Period Start :</td>
													<td>
														<div class="input-group">
															<input class="form-control form-control-sm"
																name="empBean.incomePeriodStart" type="text"
																id="ipsDatePicker" readonly="true"
																value="<bean:write name="empForm" property="empBean.incomePeriodStart"/>" />
															<span class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 0px;"><i
																class="fa fa-calendar"></i></span> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"
																onclick="javascript:doResetIpsDate();"><i
																class="fa fa-times-circle"></i></span>
														</div>
													</td>
												</tr>
												<tr>
													<td class="kanan">Income Period End :</td>
													<td>
														<div class="input-group">
															<input class="form-control form-control-sm"
																name="empBean.incomePeriodEnd" type="text"
																id="ipeDatePicker" readonly="true"
																value="<bean:write name="empForm" property="empBean.incomePeriodEnd"/>" />
															<span class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 0px;"><i
																class="fa fa-calendar"></i></span> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"
																onclick="javascript:doResetIpeDate();"><i
																class="fa fa-times-circle"></i></span>
														</div>

													</td>
												</tr>
												<tr>
													<td class="kanan">Manager <span
														style="color: red">*</span> :</td>
													<td><html:select name="empForm"
															property="empBean.managerId"
															styleClass="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listEmp">
																<bean:define id="employeeId" name="list"
																	property="employeeId" />
																<html:option value="<%=employeeId.toString()%>">
																	<bean:write name="list" property="employeeName" />
																</html:option>
															</logic:iterate>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Employee Number :</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.nik"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
											</table>
										</div>
										<div class="row">
											<div class="col-md-12">
												<hr>
												<div class="col-md-6 kiri">
													<button type="button" id="prevTabPersonal"
														class="btn btn-default">
														<i class="fa fa-arrow-left"></i> Back To Personal
														Information
													</button>
												</div>
												<div class="col-md-6 kanan">
													<button type="button" id="nextTabOther"
														class="btn btn-default">
														<i class="fa fa-arrow-right"></i> Go To Other Information
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- END TAB PROFESIONAL -->

									<!-- TAB OTHER -->
									<div class="tab-pane" id="other">
										<br />
										<div class="col-md-8">
											<table class="table table-nonfluid table-borderless">
												<tr>
													<td colspan="2"><h5>
															<small><b>TAXES INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan" width="200px">NPWP :</td>
													<td>
															<input name="empBean.npwp" class="form-control form-control-md"
																data-mask="99.999.999.9-999.999" value="<bean:write name="empForm" property="empBean.npwp"/>"/>
													</td>
												</tr>
												<tr>
													<td class="kanan">PTKP :</td>
													<td><html:select name="empForm"
															property="empBean.taxPositionId"
															styleClass="form-control form-control-md">
															<html:option value="1">TK0</html:option>
															<html:option value="2">TK1</html:option>
															<html:option value="3">TK2</html:option>
															<html:option value="4">K0</html:option>
															<html:option value="5">K1</html:option>
															<html:option value="6">K2</html:option>
															<html:option value="7">K3</html:option>
														</html:select></td>
												</tr>
												<tr>
													<td colspan="2"><h5>
															<small><b>ACCOUNT INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan">Bank :</td>
													<td><html:select name="empForm"
															property="empBean.bankId"
															styleClass="form-control form-control-md">
															<logic:iterate id="list" name="empForm"
																property="listBank">
																<bean:define id="bankId" name="list" property="bankId" />
																<html:option value="<%=bankId.toString()%>">
																	<bean:write name="list" property="bank" />
																</html:option>
															</logic:iterate>
														</html:select></td>
												</tr>
												<tr>
													<td class="kanan">Number :</td>
													<td><div class="form-group">
															<html:text name="empForm"
																property="empBean.accountNumber"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Name :</td>
													<td><div class="form-group"><html:text name="empForm"
															property="empBean.accountName"
															styleClass="form-control form-control-md" /></div></td>
															
												</tr>

												<tr>
													<td colspan="2"><h5>
															<small><b>ADDITIONAL INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan">Description :</td>
													<td><div class="form-group"><html:textarea name="empForm"
															property="empBean.description" styleClass="form-textarea" />
															</div>
													</td>
												</tr>
											</table>
										</div>
										<div class="row">
											<div class="col-md-12">
												<hr>
												<div class="col-md-6 kiri">
													<button type="button" id="prevTabProfessional"
														class="btn btn-default">
														<i class="fa fa-arrow-left"></i> Back To Professional
														Information
													</button>
												</div>
												<div class="col-md-6 kanan">
													<button type="button" id="nextTabImage"
														class="btn btn-default">
														<i class="fa fa-arrow-right"></i> Go To Documents
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- END TAB OTHER -->

									<!-- TAB IMAGES -->
									<div class="tab-pane" id="image">
										<br />

										<div class="alert alert-info alert-dismissible" role="alert">
											<button type="button" class="close" data-dismiss="alert"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<i class="fa fa-info-circle"></i> <strong>Click
												image</strong> to view full size of image.
										</div>

										<table class="table table-nonfluid table-borderless" id="tbl">
											<!-- <table class="table table-nonfluid table-striped table-bordered table-hover"> -->
											<%
												int counter = 0;
											%>
											<%
												List<DocBean> diplomaIdList = (List<DocBean>) request.getAttribute("diplomaIdList");
											%>
											<tr>
												<td><h5 class="fontHitam">
														<small><b>Diploma</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<%
												if (diplomaIdList.isEmpty()) {
											%>
											<tr>
												<td>Document not available.</td>
											</tr>
											<%
												} else {
											%>
											<tr>
												<ul>
													<%
														for (int i = 0; i < diplomaIdList.size(); i++) {
													%>
													<td>
														<div class="fileinput fileinput-new"
															data-provides="fileinput">
															<div>
																<input type="text" name="empBean.docDesc[<%=counter%>]"
																	value="<%=diplomaIdList.get(i).getDescription()%>"
																	placeholder="enter description here"
																	class="form-control" /> <input type="hidden"
																	name="empBean.docId[<%=counter%>]"
																	value="<%=diplomaIdList.get(i).getDocumentId()%>" />
															</div>
															<div class="fileinput-new thumbnail"
																style="width: 192px;">
																<img
																	src="DocRenderer?docId=<%=diplomaIdList.get(i).getDocumentId()%>"
																	height="192" width="192">
															</div>
															<div class="fileinput-preview fileinput-exists thumbnail"
																style="max-width: 192px; max-height: 192px;"></div>
															<div>
																<span class="btn btn-default btn-file"> <span
																	class="fileinput-new">Select image</span> <span
																	class="fileinput-exists">Change</span> <input
																	type="file" name="empBean.employeeDoc[<%=counter%>]"
																	accept="image/*" />
																</span> <a href="#" class="btn btn-default fileinput-exists"
																	data-dismiss="fileinput">Remove</a>
															</div>
														</div> 
													</td>
												<%
													counter++;
												%>
												<%
													}
												%>
												</ul>
											</tr>
											<%
												}
											%>

											<%
												List<DocBean> certificateIdList = (List<DocBean>) request.getAttribute("certificateIdList");
											%>
											<tr>
												<td><h5 class="fontHitam">
														<small><b>Certificate</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<%
												if (certificateIdList.isEmpty()) {
											%>
											<tr>
												<td>Document not available.</td>
											</tr>
											<%
												} else {
											%>
											<tr>
												<%
													for (int i = 0; i < certificateIdList.size(); i++) {
												%>
												<td>
													<div class="fileinput fileinput-new"
														data-provides="fileinput">
														<div>
															<input type="text" name="empBean.docDesc[<%=counter%>]"
																value="<%=certificateIdList.get(i).getDescription()%>"
																placeholder="enter description here"
																class="form-control" /> <input type="hidden"
																name="empBean.docId[<%=counter%>]"
																value="<%=certificateIdList.get(i).getDocumentId()%>" />
														</div>
														<div class="fileinput-new thumbnail" style="width: 192px;">
															<img
																src="DocRenderer?docId=<%=certificateIdList.get(i).getDocumentId()%>"
																height="192" width="192">
														</div>
														<div class="fileinput-preview fileinput-exists thumbnail"
															style="max-width: 192px; max-height: 192px;"></div>
														<div>
															<span class="btn btn-default btn-file"> <span
																class="fileinput-new">Select image</span> <span
																class="fileinput-exists">Change</span> <input
																type="file" name="empBean.employeeDoc[<%=counter%>]"
																accept="image/*" />
															</span> <a href="#" class="btn btn-default fileinput-exists"
																data-dismiss="fileinput">Remove</a>
														</div>
													</div> 
												</td>
												<%
													counter++;
												%>
												<%
													}
												%>
											</tr>
											<%
												}
											%>

											<%
												List<DocBean> personalIdList = (List<DocBean>) request.getAttribute("personalIdList");
											%>
											<tr>
												<td><h5 class="fontHitam">
														<small><b>Personal Documents</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<%
												if (personalIdList.isEmpty()) {
											%>
											<tr>
												<td>Document not available.</td>
											</tr>
											<%
												} else {
											%>
											<tr>
												<%
													for (int i = 0; i < personalIdList.size(); i++) {
												%>
												<td>
													<div class="fileinput fileinput-new"
														data-provides="fileinput">
														<div>
															<input type="text" name="empBean.docDesc[<%=counter%>]"
																value="<%=personalIdList.get(i).getDescription()%>"
																placeholder="enter description here"
																class="form-control" /> <input type="hidden"
																name="empBean.docId[<%=counter%>]"
																value="<%=personalIdList.get(i).getDocumentId()%>" />
														</div>
														<div class="fileinput-new thumbnail" style="width: 192px;">
															<img
																src="DocRenderer?docId=<%=personalIdList.get(i).getDocumentId()%>"
																height="192" width="192">
														</div>
														<div class="fileinput-preview fileinput-exists thumbnail"
															style="max-width: 192px; max-height: 192px;"></div>
														<div>
															<span class="btn btn-default btn-file"> <span
																class="fileinput-new">Select image</span> <span
																class="fileinput-exists">Change</span> <input
																type="file" name="empBean.employeeDoc[<%=counter%>]"
																accept="image/*" />
															</span> <a href="#" class="btn btn-default fileinput-exists"
																data-dismiss="fileinput">Remove</a>
														</div>
												</td>
												<%
													counter++;
												%>
												<%
													}
												%>
											</tr>
											<%
												}
											%>
											<html:hidden name="empForm" property="empBean.counterDoc"
												value="<%=String.valueOf(counter)%>" />
										</table>

										<div class="row">
											<div class="col-md-12 kiri">
												<hr>
												<div class="col-md-6 kiri">
													<button type="button" id="prevTabOther"
														class="btn btn-default">
														<i class="fa fa-arrow-left"></i> Back To Other Information
													</button>
												</div>
												<div class="col-md-6 kanan">
													<button type="submit" class="btn btn-primary">
														<span class="glyphicon glyphicon-floppy-disk"></span> Save
													</button>
													<button type="button" class="btn btn-danger"
														onclick="javascript:flyToPage('backToList','','1');">
														<span class="glyphicon glyphicon-remove"></span> Cancel
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- END TAB IMAGES -->
								</div>
								<!-- END ISI TAB -->
							</div>
							<div class="col-md-3">
											<table class="table table-nonfluid table-borderless">
												<tr>
													<td><h5 class="fontHitam">
												<small><b>EMPLOYEE PHOTO<span
														style="color: red">*</span></b></small>
											</h5>
											<hr style="margin: 3px 0 5px 0"></td>
												</tr>
												<tr>
													<td><div class="fileinput fileinput-new"
															data-provides="fileinput">
															<div class="fileinput-new thumbnail"
																style="width: 192px;">
																<%
																	if (0 < Integer.parseInt(request.getAttribute("imageSize").toString())) {
																%>
																<img
																	src="ImageRenderer?empId=<bean:write name="empForm" property="id"/>"
																	height="192" width="192">
																<%
																	} else {
																%>
																<img src="asset/img/default.png" height="192"
																	width="192" class="img-thumbnail" />
																<%
																	}
																%>


															</div>
															
																<div
																	class="fileinput-preview fileinput-exists thumbnail"
																	style="max-width: 192px; max-height: 192px;"></div>
																<div>
																	<span class="btn btn-default btn-file"><span
																		class="fileinput-new">Select image</span><span
																		class="fileinput-exists">Change</span><input
																		type="file" accept="image/*"
																		name="empBean.employeePhoto"></span> 
																</div>
														</div></td>
												</tr>
											</table>
										</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</html:form>
	<%@include file="PartJavascript.jsp"%>
</body>
<script>

	var nowTemp = new Date();
	var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp
			.getDate(), 0, 0, 0, 0);
	var dob = $('#dobDatePicker').datepicker({
		onRender : function(date) {
			return date.valueOf() > now.valueOf() ? 'disabled' : '';
		}
	}).on('changeDate', function(ev) {
		dob.hide();
	}).data('datepicker');

	var hireDate = $('#hireDatePicker').datepicker({
		onRender : function(date) {
		}
	}).on('changeDate', function(ev) {
		if (ev.date.valueOf() > quitDate.date.valueOf()) {
			var newDate = new Date(ev.date)
			newDate.setDate(newDate.getDate() + 1);
			quitDate.setValue(newDate);
		}
		hireDate.hide();
		$('#quitDatePicker')[0].focus();
	}).data('datepicker');

	var endContractDate = $('#endContractDatePicker').datepicker({
		onRender : function(date) {
			return date.valueOf() <= hireDate.date.valueOf() ? 'disabled' : '';
		}
	}).on('changeDate', function(ev) {
		endContractDate.hide();
		$('#ipsDatePicker')[0].focus();
	}).data('datepicker');

	var ips = $('#ipsDatePicker').datepicker({}).on('changeDate', function(ev) {
		if (ev.date.valueOf() > ipe.date.valueOf()) {
			var newDate = new Date(ev.date)
			newDate.setDate(newDate.getDate() + 1);
			ipe.setValue(newDate);
		}
		ips.hide();
		$('#ipeDatePicker')[0].focus();
	}).data('datepicker');
	var ipe = $('#ipeDatePicker').datepicker({
		onRender : function(date) {
			return date.valueOf() <= ips.date.valueOf() ? 'disabled' : '';
		}
	}).on('changeDate', function(ev) {
		ipe.hide();
	}).data('datepicker');

	//plugin bootstrap minus and plus
	//http://jsfiddle.net/laelitenetwork/puJ6G/
	$(document)
			.ready(
					function() {
						$('.btn-number').click(function(e) {
							e.preventDefault();

							var fieldName = $(this).attr('data-field');
							var type = $(this).attr('data-type');
							var input = $("input[name='" + fieldName + "']");
							var currentVal = parseInt(input.val());
							if (!isNaN(currentVal)) {
								if (type == 'minus') {
									var minValue = parseInt(input.attr('min'));
									if (!minValue)
										minValue = 0;
									if (currentVal > minValue) {
										input.val(currentVal - 1).change();
									}
									if (parseInt(input.val()) == minValue) {
										$(this).attr('disabled', true);
									}

								} else if (type == 'plus') {
									var maxValue = parseInt(input.attr('max'));
									if (!maxValue)
										maxValue = 10;
									if (currentVal < maxValue) {
										input.val(currentVal + 1).change();
									}
									if (parseInt(input.val()) == maxValue) {
										$(this).attr('disabled', true);
									}

								}
							} else {
								input.val(0);
							}
						});
						$('.input-number').focusin(function() {
							$(this).data('oldValue', $(this).val());
						});
						$('.input-number')
								.change(
										function() {

											var minValue = parseInt($(this)
													.attr('min'));
											var maxValue = parseInt($(this)
													.attr('max'));
											if (!minValue)
												minValue = 0;
											if (!maxValue)
												maxValue = 10;
											var valueCurrent = parseInt($(this)
													.val());

											var name = $(this).attr('name');
											if (valueCurrent >= minValue) {
												$(
														".btn-number[data-type='minus'][data-field='"
																+ name + "']")
														.removeAttr('disabled')
											} else {
												alert('Sorry, the minimum value was reached');
												$(this)
														.val(
																$(this)
																		.data(
																				'oldValue'));
											}
											if (valueCurrent <= maxValue) {
												$(
														".btn-number[data-type='plus'][data-field='"
																+ name + "']")
														.removeAttr('disabled')
											} else {
												alert('Sorry, the maximum value was reached');
												$(this)
														.val(
																$(this)
																		.data(
																				'oldValue'));
											}

										});
						$(".input-number")
								.keydown(
										function(e) {
											// Allow: backspace, delete, tab, escape, enter and .
											if ($.inArray(e.keyCode, [ 46, 8,
													9, 27, 13, 190 ]) !== -1
													||
													// Allow: Ctrl+A
													(e.keyCode == 65 && e.ctrlKey === true)
													||
													// Allow: home, end, left, right
													(e.keyCode >= 35 && e.keyCode <= 39)) {
												// let it happen, don't do anything
												return;
											}
											// Ensure that it is a number and stop the keypress
											if ((e.shiftKey || (e.keyCode > 57 || e.keyCode < 48))
													&& (e.keyCode > 105 || e.keyCode < 96)) {
												e.preventDefault();
											}
										});
					});

	$(document)
			.ready(
					function() {
						$('body')
								.append(
										'<div id="toTop" class="btn btn-info"><span class="glyphicon glyphicon-chevron-up"></span> Back to Top</div>');
						$(window).scroll(function() {
							if ($(this).scrollTop() != 0) {
								$('#toTop').fadeIn();
							} else {
								$('#toTop').fadeOut();
							}
						});
						$('#toTop').click(function() {
							$("html, body").animate({
								scrollTop : 0
							}, 600);
							return false;
						});
					});
</script>
<script type="text/javascript">
	var today = new Date();
	$('#validate-form').bootstrapValidator({
		//       live: 'disabled',
		excluded : 'disabled',
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {

			// tab 1
			// basic information
			'empBean.username' : {
				validators : {
					notEmpty : {
						message : 'Username is required'
					},
					stringLength: {
                        max: 30,
                        message: 'Username must be less than 30 characters'
					},
				}
			},
			'empBean.employeeName' : {
				validators : {
					notEmpty : {
						message : 'Name is required'
					},
					stringLength: {
                        max: 50,
                        message: 'Name must be less than 50 characters'
					},
				}
			},
			'empBean.placeOfBirth' : {
				validators : {
					notEmpty : {
						message : 'Place of birth is required'
					},
					stringLength: {
                        max: 50,
                        message: 'Place of birth must be less than 50 characters'
					},

				}
			},
			'empBean.nationality' : {
				validators : {
					notEmpty : {
						message : 'Nationality is required'
					},
					stringLength: {
                        max: 30,
                        message: 'Nationality must be less than 50 characters'
					},
				}
			},
			'empBean.idCard' : {
				validators : {
					notEmpty : {
						message : 'ID Card is required'
					},
					regexp : {
						regexp : /[0-9][0-9.]*[0-9]/i,
						message : 'The value is not a valid ID card number'
					}
				}
			},

			// contact information

			'empBean.address' : {
				validators : {
					notEmpty : {
						message : 'Address is required'
					},
					stringLength: {
                        max: 150,
                        message: 'Place of birth must be less than 150 characters'
					},
				}
			},
			'empBean.phoneNumber' : {
				validators : {
					notEmpty : {
						message : 'Phone number is required'
					},
					digits : {
						message : 'The value is not a valid number'
					},
					stringLength: {
                        max: 15,
                        message: 'Phone number must be less than 15 characters'
					},
				}
			},
			'empBean.mobileNumber' : {
				validators : {
					notEmpty : {
						message : 'Mobile number is required'
					},
					digits : {
						message : 'The value is not a valid number'
					},
					stringLength: {
                        max: 15,
                        message: 'Mobile number must be less than 15 characters'
					},
				}
			},
			'empBean.email' : {
				validators : {
					notEmpty : {
						message : 'Email is required'
					},

					regexp : {
						regexp : '^[^@\\s]+@([^@\\s]+\\.)+[^@\\s]+$',
						message : 'The value is not a valid email address'
					},
					stringLength: {
                        max: 50,
                        message: 'Email must be less than 50 characters'
					},
				}
			},

			// tab 2
			// work information

			'empBean.nik' : {
				validators : {
					digits : {
						message : 'The value is not a valid number'
					},
					stringLength: {
                        max: 20,
                        message: 'Employee number must be less than 20 characters'
					},
				}
			},
			'empBean.accountNumber' : {
				validators : {
					digits : {
						message : 'The value is not a valid number'
					},
					stringLength: {
                        max: 15,
                        message: 'Account number must be less than 15 characters'
					},
				}
			},
			'empBean.accountName' : {
				validators : {
					stringLength: {
                        max: 30,
                        message: 'Account name must be less than 30 characters'
					},
				}
			},
			'empBean.description' : {
				validators : {
					stringLength: {
                        max: 100,
                        message: 'Description must be less than 100 characters'
					},
				}
			}
		}
	});

	//reset date
	function doResetEndContract() {
		$("#endContractDatePicker").val("");
	}
	function doResetIpsDate() {
		$("#ipsDatePicker").val("");
	}
	function doResetIpeDate() {
		$("#ipeDatePicker").val("");
	}
</script>
</html>