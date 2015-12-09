<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Employee</title>

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
												content += '<option value="'+element.cityId+'">'
														+ element.city
														+ '</option>';
											});

							content += "</html:select>";
							$("#contentCity").html(content);
						});
	}

	var count = 0;
	$(document)
			.ready(
					function() {
						$("button#tambah")
								.click(
										function() {
											if (count < 9) {
												var tbody = document
														.getElementById("tbl").firstChild;
												count++;
												$('#tbl tr:last')
														.after(
																'<tr><td><select name="empBean.docType['+count+']" class="form-control input-sm"><option value="" disabled selected>Select One...</option><option value="1">Diploma</option><option value="2">Certificate</option><option value="3">Personal Document</option></select></td><td><div class="input-group input-group-sm"><input type="file" name="empBean.employeeDoc['+count+']"/></div></td><td><div class="input-group input-group-sm"><input type="text" name="empBean.docDesc['
																		+ count
																		+ ']" style="border-top-left-radius: 15px !important; border-bottom-right-radius: 15px !important;" placeholder="enter description here" class="form-control" size="100"><span class="input-group-btn"><i class="fa fa-close"></i></button></span></div></td></tr>');
											}
										});

						$(document).on('click', 'button.removebutton',
								function() {
									if (count > 0) {
										$('#tbl tr:last').remove();
										count--;
										return false;
									}
								});
					});

	function doValidate() {
		var tabName = $('.nav-tabs .active').text();

		if (tabName == "Personal Information") {
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.employeeName');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.placeOfBirth');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.dateOfBirth');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.religion');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.nationality');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.idCard');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.highestEducation');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.majorId');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.address');
			$('#validate-form').bootstrapValidator('revalidateField',
					'provinceId');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.phoneNumber');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.mobileNumber');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.email');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.maritalStatus');
		} else if (tabName == "Professional Information") {
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.positionId');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.departmentId');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.locationId');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.hireDate');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.employeeType');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.managerId');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.nik');
		} else if (tabName == "Other Information") {
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.accountNumber');
			$('#validate-form').bootstrapValidator('revalidateField',
					'empBean.accountName');
		}
	}
</script>
<body>
	<html:form action="/index" enctype="multipart/form-data"
		styleId="validate-form" styleClass="validate-form"
		onsubmit="javascript:doValidate();">
		<html:hidden name="empForm" property="task" value="insert" />
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
								<h3 id="timeline">Add New Employee</h3>
							</div>
							<!-- END JUDUL -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i>
								<a href="<bean:write name="empForm" property="urlPortal"/><%= request.getAttribute("zx") %>">Dashboard</a>
								</li>
								<li><i class="fa fa-plus"></i> Add New Employee</li>
							</ul>
							<!-- END BREADCRUMB -->

							<div class="col-md-9">

								<!-- TAB -->
								<ul id="mytabs" class="nav nav-tabs" role="tablist">
									<li class="active"><a href="#personal" role="tab"
										data-toggle="tab">Personal Information</a></li>
									<li><a href="#professional" role="tab" data-toggle="tab">Professional
											Information </a></li>
									<li><a href="#other" role="tab" data-toggle="tab">Other
											Information </a></li>
									<li><a href="#image" role="tab" data-toggle="tab">Documents
									</a></li>
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
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.employeeName"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Place of Birth <span
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.placeOfBirth"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Date of Birth <span
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<div class="input-group">
																<input class="form-control form-control-md-1"
																	name="empBean.dateOfBirth" type="text"
																	id="dobDatePicker" readonly="true" /> <span
																	class="input-group-addon input-number-resize"
																	id="basic-addon1"
																	style="height: 22px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"><i
																	class="fa fa-calendar"></i></span>
															</div>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Gender :</td>
													<td><html:radio name="empForm"
															property="empBean.gender" value="L" /> Male <html:radio
															name="empForm" property="empBean.gender" value="P" />
														Female</td>
												</tr>
												<tr>
													<td class="kanan">Religion <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:select name="empForm" property="empBean.religion"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<option value="1">Islam</option>
																<option value="2">Catholicism</option>
																<option value="3">Protestantism</option>
																<option value="4">Buddhism</option>
																<option value="5">Hinduism</option>
																<option value="6">Confucianism</option>
																<option value="7">Others</option>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Nationality <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:text name="empForm" property="empBean.nationality"
																styleClass="form-control form-control-md" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">ID Card <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<input name="empBean.idCard"
																class="form-control form-control-md"
																data-mask="9999.9999.9999.9999" />

														</div></td>
												</tr>
												<tr>
													<td class="kanan">Highest Education <span
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<html:select name="empForm"
																property="empBean.highestEducation"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<option value="1">Elementary School (SD)</option>
																<option value="2">Junior High School (SMP)</option>
																<option value="3">Senior High School (SMA/SMK)</option>
																<option value="4">Diploma 1 (D1)</option>
																<option value="5">Diploma 2 (D2)</option>
																<option value="6">Diploma 3 (D3)</option>
																<option value="7">Bachelor (S1)</option>
																<option value="8">Master (S2)</option>
																<option value="9">Doctoral (S3)</option>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Major <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:select name="empForm" property="empBean.majorId"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<logic:iterate id="list" name="empForm"
																	property="listMajor">
																	<option
																		value="<bean:write name="list" property="majorId" />">
																		<bean:write name="list" property="major" />
																	</option>
																</logic:iterate>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td colspan="2"><h5>
															<small><b>CONTACT INFORMATION</b></small>
														</h5>
														<hr style="margin: -5px 0 5px 0"></td>
												</tr>
												<tr>
													<td class="kanan">Address <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:textarea name="empForm" property="empBean.address"
																styleClass="form-textarea" />
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Province <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<select name="provinceId"
																onchange="javascript:getCityDetail();"
																id="selectProvince" class="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<logic:iterate id="list" name="empForm"
																	property="listProvince">
																	<option
																		value="<bean:write name="list" property="provinceId" />">
																		<bean:write name="list" property="province" />
																	</option>
																</logic:iterate>
															</select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">City <span style="color: red">*</span>
														:
													</td>
													<td id="contentCity"><select
														class="form-control form-control-md">
															<option value="" disabled selected>Choose one...</option>
													</select></td>
												</tr>
												<tr>
													<td class="kanan">Phone Number <span
														style="color: red">*</span> :
													</td>
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
														style="color: red">*</span> :
													</td>
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
													<td class="kanan">E-mail <span style="color: red">*</span>
														:
													</td>
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
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<html:select name="empForm"
																property="empBean.maritalStatus"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<option value="1">Single</option>
																<option value="2">Married</option>
																<option value="3">Divorced</option>
															</html:select>
														</div></td>
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
															</span> <input type="text" name="empBean.amenability"
																class="form-control form-control-sm input-number"
																value="0"> <span class="input-group-btn">
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
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<html:select name="empForm" property="empBean.positionId"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<logic:iterate id="list" name="empForm"
																	property="listPosition">
																	<option
																		value="<bean:write name="list" property="positionId" />">
																		<bean:write name="list" property="position" />
																	</option>
																</logic:iterate>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Department <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:select name="empForm"
																property="empBean.departmentId"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<logic:iterate id="list" name="empForm"
																	property="listDept">
																	<option
																		value="<bean:write name="list" property="departmentId" />">
																		<bean:write name="list" property="department" />
																	</option>
																</logic:iterate>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Location <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:select name="empForm" property="empBean.locationId"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<logic:iterate id="list" name="empForm"
																	property="listLocation">
																	<option
																		value="<bean:write name="list" property="locationId" />">
																		<bean:write name="list" property="location" />
																	</option>
																</logic:iterate>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Hire Date <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<div class="input-group">
																<input class="form-control form-control-md-1"
																	name="empBean.hireDate" type="text" id="hireDatePicker"
																	readonly="true" /> <span class="input-group-addon"
																	id="basic-addon1"
																	style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"><i
																	class="fa fa-calendar"></i></span>
															</div>
														</div></td>

												</tr>
												<tr>
													<td class="kanan">Employee Type <span
														style="color: red">*</span> :
													</td>
													<td><div class="form-group">
															<html:select name="empForm"
																property="empBean.employeeType"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<option value="1">Permanent</option>
																<option value="2">Contractual</option>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">End Contract Date :</td>
													<td><div class="input-group">
															<input class="form-control form-control-sm"
																name="empBean.endContractDate" type="text"
																readonly="true" id="endContractDatePicker" /></i> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 0px;"><i
																class="fa fa-calendar"></i></span> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"
																onclick="javascript:doResetEndContract();"><i
																class="fa fa-times-circle"></i></span>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Income Period Start :</td>
													<td><div class="input-group">
															<input class="form-control form-control-sm"
																name="empBean.incomePeriodStart" type="text"
																id="ipsDatePicker" readonly="true" /> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 0px;"><i
																class="fa fa-calendar"></i></span> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"
																onclick="javascript:doResetIpsDate();"><i
																class="fa fa-times-circle"></i></span>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Income Period End :</td>
													<td><div class="input-group">
															<input class="form-control form-control-sm"
																name="empBean.incomePeriodEnd" type="text"
																id="ipeDatePicker" readonly="true" /> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 0px;"><i
																class="fa fa-calendar"></i></span> <span
																class="input-group-addon" id="basic-addon1"
																style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"
																onclick="javascript:doResetIpeDate();"><i
																class="fa fa-times-circle"></i></span>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Manager <span style="color: red">*</span>
														:
													</td>
													<td><div class="form-group">
															<html:select name="empForm" property="empBean.managerId"
																styleClass="form-control form-control-md">
																<option value="" disabled selected>Choose
																	one...</option>
																<logic:iterate id="list" name="empForm"
																	property="listEmp">
																	<option
																		value="<bean:write name="list" property="employeeId" />">
																		<bean:write name="list" property="employeeName" />
																	</option>
																</logic:iterate>
															</html:select>
														</div></td>
												</tr>
												<tr>
													<td class="kanan">Employee Number :</td>
													<td><div class="form-group form-control-md">
															<html:text name="empForm" property="empBean.nik"
																styleClass="form-control" />
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
															<input name="empBean.npwp"
																class="form-control form-control-md"
																data-mask="99.999.999.9-999.999" />
													</td>
												</tr>
												<tr>
													<td class="kanan">PTKP :</td>
													<td><html:select name="empForm"
															property="empBean.taxPosition"
															styleClass="form-control form-control-md">
															<option value="" disabled selected>Choose one...</option>
															<option value="1">TK0</option>
															<option value="2">TK1</option>
															<option value="3">TK2</option>
															<option value="4">K0</option>
															<option value="5">K1</option>
															<option value="6">K2</option>
															<option value="7">K3</option>
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
													<td><select id="selectBank"
															name="empBean.bankId"
															styleClass="form-control form-control-md" onchange="javascript:getAccountLength();">
															<option value="" disabled selected>Choose one...</option>
															<logic:iterate id="list" name="empForm"
																property="listBank">
																<option
																	value="<bean:write name="list" property="bankId" />">
																	<bean:write name="list" property="bank" />
																</option>
															</logic:iterate>
														</select></td>
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

										<button type="button" id="tambah" class="btn btn-primary">
											<i class="fa fa-plus"></i> Add New Document
										</button>
										<button type="button" class="btn btn-danger removebutton">
											<i class="fa fa-minus"></i> Remove
										</button>

										<br /> <br />
										<table id="tbl" class="table table-bordered">
											<tr>
												<th width="20%">Type</th>
												<th class="width30">Image</th>
												<th class="width100">Description</th>
											</tr>
											<tr>
												<td><select name="empBean.docType[0]"
													class="form-control input-sm">
														<option value="" disabled selected>Select One...</option>
														<option value="1">Diploma</option>
														<option value="2">Certificate</option>
														<option value="3">Personal Documents</option>
												</select></td>
												<td>
													<div class="input-group input-group-sm">
														<input name="empBean.employeeDoc[0]" type="file" size="60"
															placeholder="Choose Picture" styleClass="form-control">
													</div>
												</td>
												<td><input type="text" name="empBean.docDesc[0]"
													placeholder="enter description here" size="100"
													class="form-control"></td>
											</tr>
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
								</div>
								<!-- END TAB IMAGES -->
							</div>
							<div class="col-md-3">
								<table class="table table-nonfluid table-borderless">
									<!-- <table class="table table-nonfluid table-striped table-bordered table-hover"> -->
									<tr>
										<td><h5 class="fontHitam">
												<small><b>EMPLOYEE PHOTO <span
														style="color: red">*</span></b></small>
											</h5>
											<hr style="margin: 3px 0 5px 0"></td>
									</tr>
									<tr>
										<td>
												<div class="fileinput fileinput-new"
													data-provides="fileinput">
													<div class="fileinput-new thumbnail"
														style="width: 192px; height: 192px;">
														<img src="asset/img/default.png" height="192" width="192">
													</div>
													<div class="fileinput-preview fileinput-exists thumbnail"
														style="max-width: 192px; max-height: 192px;"></div>
													<div>
														<span class="btn btn-default btn-file"><span
															class="fileinput-new">Select image</span><span
															class="fileinput-exists">Change</span><input type="file"
															name="empBean.employeePhoto" accept="image/*"
															id="inputFile"></span>
														<a href="#" class="btn btn-default fileinput-exists"
															data-dismiss="fileinput">Remove</a>
													</div>
													<%-- <html:file name="empForm" property="empBean.employeePhoto" /> --%>
												</div>
											</td>
									</tr>
								</table>
							</div>
							<!-- END ISI TAB -->
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
	}).on(
			'changeDate',
			function(ev) {
				$('#validate-form').bootstrapValidator('revalidateField',
						'empBean.dateOfBirth');
				dob.hide();
			}).data('datepicker');

	var hireDate = $('#hireDatePicker').datepicker({
		onRender : function(date) {
			return '';
		}
	}).on(
			'changeDate',
			function(ev) {

				$('#validate-form').bootstrapValidator('revalidateField',
						'empBean.hireDate');
				hireDate.hide();
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

		var newDate = new Date(ev.date)
		newDate.setDate(newDate.getDate() + 1);
		ipe.setValue(newDate);

		$('#ipeDatePicker').datepicker({
			onRender : function(date) {
				return date.valueOf() <= ips.date.valueOf() ? 'disabled' : '';
			}
		}).on('changeDate', function(ev) {
			ipe.hide();
		}).data('datepicker');
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
										'<div id="toTop" class="btn btn-info backToTop"><span class="glyphicon glyphicon-chevron-up"></span> Back to Top</div>');
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
	
	var accountLength = 15;
	function getAccountLength() {
		$
				.getJSON(
						"/HRIS_Employee/index.do",
						{
							bankId : $('#selectBank').val(),
							task : "loadAccountLength"
						},
						function(data) {
							accountLength = data;
						});
	}
	
	$('#validate-form')
			.bootstrapValidator(
					{
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
							'empBean.dateOfBirth' : {
								validators : {
									notEmpty : {
										message : 'Date of birth is required'
									},
								}
							},
							'empBean.religion' : {
								validators : {
									notEmpty : {
										message : 'Religion is required'
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
				                        message: 'Nationality must be less than 30 characters'
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
							'empBean.highestEducation' : {
								validators : {
									notEmpty : {
										message : 'Education is required'
									},
								}
							},
							'empBean.majorId' : {
								validators : {
									callback : {
										message : 'Major is required',
										callback : function(value, validator,
												$field) {
											// Get the selected options
											var options = validator
													.getFieldElements(
															'empBean.majorId')
													.val();

											if (options == null)
												return (false);
											else if (options != null)
												return (true);
										}
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
							'provinceId' : {
								validators : {
									callback : {
										message : 'Province is required',
										callback : function(value, validator,
												$field) {
											// Get the selected options
											var options = validator
													.getFieldElements(
															'provinceId').val();

											if (options == null)
												return (false);
											else if (options != null)
												return (true);
										}
									}
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

							// relationship

							'empBean.maritalStatus' : {
								validators : {
									notEmpty : {
										message : 'Marital status is required'
									},
								}
							},

							// tab 2
							// work information

							'empBean.positionId' : {
								validators : {
									callback : {
										message : 'Position is required',
										callback : function(value, validator,
												$field) {
											// Get the selected options
											var options = validator
													.getFieldElements(
															'empBean.positionId')
													.val();

											if (options == null)
												return (false);
											else if (options != null)
												return (true);
										}
									}
								}
							},

							'empBean.departmentId' : {
								validators : {
									callback : {
										message : 'Department is required',
										callback : function(value, validator,
												$field) {
											// Get the selected options
											var options = validator
													.getFieldElements(
															'empBean.departmentId')
													.val();

											if (options == null)
												return (false);
											else if (options != null)
												return (true);
										}
									}
								}
							},
							'empBean.locationId' : {
								validators : {
									callback : {
										message : 'Location is required',
										callback : function(value, validator,
												$field) {
											// Get the selected options
											var options = validator
													.getFieldElements(
															'empBean.locationId')
													.val();

											if (options == null)
												return (false);
											else if (options != null)
												return (true);
										}
									}
								}
							},
							'empBean.hireDate' : {
								validators : {
									notEmpty : {
										message : 'Hire date is required'
									},
								}
							},
							'empBean.employeeType' : {
								validators : {
									notEmpty : {
										message : 'Employee type is required'
									},
								}
							},
							'empBean.managerId' : {
								validators : {
									callback : {
										message : 'Manager is required',
										callback : function(value, validator,
												$field) {
											// Get the selected options
											var options = validator
													.getFieldElements(
															'empBean.managerId')
													.val();

											if (options == null)
												return (false);
											else if (options != null)
												return (true);
										}
									}
								}
							},
							'empBean.nik' : {
								validators : {
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
				                        //min: accountLength,
										max: accountLength,
				                        //message: 'Account number must be ' + accountLength + ' characters'
										message: 'Account name must be less than ' + accountLength + ' characters'
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