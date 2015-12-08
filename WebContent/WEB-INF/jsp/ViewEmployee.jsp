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
<%@include file="PartBootstrap.jsp"%>
<title>View Employee Data</title>
</head>
<style>
img {
	border: none;
}

.docs {
	margin: 0;
	padding: 0;
	list-style: none;
	float: left;
	display: inline;
	margin-right: 10px;
}
/*  */
#preview {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 5px;
	display: none;
	color: #fff;
}

/*  */
</style>

<script src="main.js" type="text/javascript"></script>
<script type="text/javascript">
	function flyToPage(task, id, currentSideBar) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].sidebar.value = currentSideBar;
		document.forms[0].submit();
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

	function doSubmit() {
		var frm = document.forms[0];
		if (!validateForm(frm)) {
			return;
		}
		frm.submit();
	}
</script>
<body>
	<html:form action="/index" enctype="multipart/form-data">
		<html:hidden name="empForm" property="task" value="insertDocuments" />
		<html:hidden name="empForm" property="id"/>
		<html:hidden name="empForm" property="sidebar" />
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
								<h3 id="timeline">Employee Profile</h3>
							</div>
							<!-- END JUDUL -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i><a
									href="<bean:write name="empForm" property="urlDashboard" />">
										Dashboard</a></li>
								<li><i class="fa fa-list"></i><a
									href="javascript:flyToPage('backToList','','1');"> List
										Employee</a></li>
								<li><i class="fa fa-eye"></i> View</li>
							</ul>
							<!-- END BREADCRUMB -->
							<logic:notEmpty name="empForm" property="notification">
								<div class="alert alert-info kiri" role="alert">
									<i class="fa fa-exclamation-triangle"></i>
									<bean:write name="empForm" property="notification" />
								</div>
							</logic:notEmpty>
							
							<div class="col-md-9">
								<!-- JUDUL TAB -->
								<ul class="nav nav-tabs" role="tablist">
									<li class="active"><a href="#personal" role="tab"
										data-toggle="tab">Personal Information</a></li>
									<li><a href="#professional" role="tab" data-toggle="tab">Professional
											Information </a></li>
									<li><a href="#other" role="tab" data-toggle="tab">Other
											Information </a></li>
									<li><a href="#docs" role="tab" data-toggle="tab">Documents
									</a></li>
									<%
										List<String> privList = (List<String>) request.getAttribute("privList");
									%>
									<%
										if (privList.contains("3")) {
									%>
									<li role="presentation"
										style="float: right; line-height: 45px;">
										<button type="button" class="btn btn-info"
											onclick="javascript:flyToPage('edit','<bean:write name="empForm" property="id"/>','1');">
											<span class="fa fa-pencil fa-fw"></span> Edit
										</button>
									</li>
									<%
										}
									%>
								</ul>

								<!-- END JUDUL TAB -->

								<!-- ISI TAB -->
								<div class="tab-content">

									<!-- TAB 1 -->
									<div class="tab-pane active" id="personal">
										<br />

										<table class="table table-nonfluid table-borderless">
											<!-- <table class="table table-nonfluid table-striped table-bordered table-hover"> -->
											<tr>
												<td colspan="2"><h5 class="fontHitam">
														<small><b>BASIC INFORMATION</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Employee Name :</td>
												<td><bean:write name="empForm"
														property="empBean.employeeName" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Place of Birth :</td>
												<td><bean:write name="empForm"
														property="empBean.placeOfBirth" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Date of Birth :</td>
												<td><bean:write name="empForm"
														property="empBean.dateOfBirth" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Gender :</td>
												<td><bean:write name="empForm"
														property="empBean.gender" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Religion :</td>
												<td><bean:write name="empForm"
														property="empBean.religion" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Nationality :</td>
												<td><bean:write name="empForm"
														property="empBean.nationality" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">ID Card :</td>
												<td><bean:write name="empForm"
														property="empBean.idCard" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Highest Education :</td>
												<td><bean:write name="empForm"
														property="empBean.highestEducation" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Major :</td>
												<td><bean:write name="empForm" property="empBean.major" /></td>
											</tr>
											<tr>
												<td colspan="2"><h5>
														<small><b>CONTACT INFORMATION</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Address :</td>
												<td><bean:write name="empForm"
														property="empBean.address" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">City :</td>
												<td><bean:write name="empForm" property="empBean.city" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Phone Number :</td>
												<td>(+62)<bean:write name="empForm"
														property="empBean.phoneNumber" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Mobile Number :</td>
												<td>(+62)<bean:write name="empForm"
														property="empBean.mobileNumber" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">E-mail :</td>
												<td><bean:write name="empForm" property="empBean.email" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">NIK :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.nik" value="">
														<bean:write name="empForm" property="empBean.nik" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.nik"
														value="">-
													</logic:equal></td>
											</tr>
											<tr>
												<td colspan="2"><h5>
														<small><b>RELATIONSHIP</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Marital Status :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.maritalStatus" value="">
														<bean:write name="empForm"
															property="empBean.maritalStatus" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.maritalStatus" value="">
													</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Amenability :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.amenability" value="">
														<bean:write name="empForm" property="empBean.amenability" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.amenability"
														value="">
													</logic:equal></td>
											</tr>
										</table>

									</div>
									<!-- END TAB1 -->

									<!-- TAB 2 -->
									<div class="tab-pane" id="professional">
										<br />
										<table class="table table-nonfluid table-borderless">
											<tr>
												<td colspan="2"><h5>
														<small><b>WORK INFORMATION</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Position :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.position" value="">
														<bean:write name="empForm" property="empBean.position" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.position"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Department :</td>
												<td><bean:write name="empForm"
														property="empBean.department" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Location :</td>
												<td><bean:write name="empForm"
														property="empBean.location" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Employee Type :</td>
												<td><bean:write name="empForm"
														property="empBean.employeeType" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Hire Date :</td>
												<td><bean:write name="empForm"
														property="empBean.hireDate" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">End Contract Date :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.endContractDate" value="">
														<bean:write name="empForm"
															property="empBean.endContractDate" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.endContractDate" value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Quit Date :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.quitDate" value="">
														<bean:write name="empForm" property="empBean.quitDate" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.quitDate"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Status :</td>
												<td><bean:write name="empForm"
														property="empBean.status" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Status Description :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.description" value="">
														<bean:write name="empForm" property="empBean.description" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.description"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Manager :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.managerName" value="">
														<bean:write name="empForm" property="empBean.managerName" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.managerName"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Employee Number :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.nik" value="">
														<bean:write name="empForm" property="empBean.nik" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.nik"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Income Period Start :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.incomePeriodStart" value="">
														<bean:write name="empForm"
															property="empBean.incomePeriodStart" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.incomePeriodStart" value="">-
												</logic:equal></td>
											</tr>

											<tr>
												<td class="kanan fontBold">Income Period End :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.incomePeriodEnd" value="">
														<bean:write name="empForm"
															property="empBean.incomePeriodEnd" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.incomePeriodEnd" value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td colspan="2"><h5>
														<small><b>LEAVE QUOTA</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Current Quota :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.currentLeaveQuota" value="">
														<bean:write name="empForm"
															property="empBean.currentLeaveQuota" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.currentLeaveQuota" value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Last Quota :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.lastLeaveQuota" value="">
														<bean:write name="empForm"
															property="empBean.lastLeaveQuota" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.lastLeaveQuota" value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Reward Quota :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.rewardLeaveQuota" value="">
														<bean:write name="empForm"
															property="empBean.rewardLeaveQuota" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.rewardLeaveQuota" value="">-
 												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Renewal Date :</td>
												<td><bean:write name="empForm"
														property="empBean.renewalDate" /></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Expired Date :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.expiredDate" value="">
														<bean:write name="empForm" property="empBean.expiredDate" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.expiredDate"
														value="">-
 												</logic:equal></td>
											</tr>
										</table>
									</div>
									<!-- END TAB 2 -->

									<!-- TAB 3 -->
									<div class="tab-pane" id="other">
										<br />
										<table class="table table-nonfluid table-borderless">
											<tr>
												<td colspan="2"><h5>
														<small><b>TAXES INFORMATION</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">NPWP :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.npwp" value="">
														<bean:write name="empForm" property="empBean.npwp" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.npwp"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">PTKP :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.taxPosition" value="">
														<bean:write name="empForm" property="empBean.taxPosition" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.taxPosition"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td colspan="2"><h5>
														<small><b>ACCOUNT INFORMATION</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Bank :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.bank" value="">
														<bean:write name="empForm" property="empBean.bank" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.bank"
														value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Number :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.accountNumber" value="">
														<bean:write name="empForm"
															property="empBean.accountNumber" />
													</logic:notEqual> <logic:equal name="empForm"
														property="empBean.accountNumber" value="">-
												</logic:equal></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Name :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.accountName" value="">
														<bean:write name="empForm" property="empBean.accountName" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.accountName"
														value="">-
												</logic:equal></td>
											</tr>

											<tr>
												<td colspan="2"><h5>
														<small><b>ADDITIONAL INFORMATION</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<tr>
												<td class="kanan fontBold">Description :</td>
												<td><logic:notEqual name="empForm"
														property="empBean.description" value="">
														<bean:write name="empForm" property="empBean.description" />
													</logic:notEqual> <logic:equal name="empForm" property="empBean.description"
														value="">-
												</logic:equal></td>
											</tr>
										</table>
									</div>
									<!-- END TAB 3 -->

									<!-- TAB 4 -->
									<div class="tab-pane" id="docs">
										<br />
										<div class="alert alert-info alert-dismissible" role="alert">
											<button type="button" class="close" data-dismiss="alert"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<i class="fa fa-info-circle"></i> <strong>Click
												image</strong> to view full size of image.
										</div>
										<br />

										<button type="button" class="btn btn-primary"
											data-backdrop="static" data-toggle="modal"
											data-target="#addDoc">
											<i class="fa fa-plus"></i> Add More Documents
										</button>
										<br /> <br />

										<!-- MODAL ADD NEW DOCS-->
										<div class="modal fade" id="addDoc" tabindex="-1"
											role="dialog" aria-labelledby="#deactivateModalLabel">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">Add New
															Document</h4>
													</div>
													<div class="modal-body">
														<button type="button" id="tambah" class="btn btn-primary">
															<i class="fa fa-plus"></i> Add New Document
														</button>
														<button type="button" class="btn btn-danger removebutton">
															<i class="fa fa-close"></i> Remove
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
													</div>
													<div class="modal-footer">
														<button type="submit" class="btn btn-primary">
															<i class="fa fa-check"></i> Save
														</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">
															<i class="fa fa-close"></i> Cancel
														</button>
													</div>
												</div>

											</div>
										</div>
										<!-- END MODAL ADD NEW -->
										<table class="table table-nonfluid table-borderless">
											<!-- <table class="table table-nonfluid table-striped table-bordered table-hover"> -->
											<% List<DocBean> diplomaIdList = (List<DocBean>) request.getAttribute("diplomaIdList"); %>
											<tr>
												<td><h5 class="fontHitam">
														<small><b>Diploma</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<% if (diplomaIdList.isEmpty()) { %>
											<tr>
												<td>Document not available.</td>
											</tr>
											<% } else { %>
											<tr>
												<ul>
													<% for (int i = 0; i < diplomaIdList.size(); i++) { %>
													<td>
														<li class="docs"><a
															href="DocRenderer?docId=<%=diplomaIdList.get(i).getDocumentId()%>"
															class="preview" target="_blank"
															title="<%=diplomaIdList.get(i).getDescription()%>"><img
																src="DocRenderer?docId=<%=diplomaIdList.get(i).getDocumentId()%>"
																alt="gallery thumbnail" class="img-thumbnail"
																height="192" width="192" /></a></li> <br /><%=diplomaIdList.get(i).getDescription()%>
													</td>
													<% } %>
												</ul>
											</tr>
											<% } %>

											<% List<DocBean> certificateIdList = (List<DocBean>) request.getAttribute("certificateIdList"); %>
											<tr>
												<td><h5 class="fontHitam">
														<small><b>Certificate</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<% if (certificateIdList.isEmpty()) { %>
											<tr>
												<td>Document not available.</td>
											</tr>
											<% } else { %>
											<tr>
												<% for (int i = 0; i < certificateIdList.size(); i++) { %>
												<td>
													<li class="docs"><a
														href="DocRenderer?docId=<%=certificateIdList.get(i).getDocumentId()%>"
														class="preview" target="_blank"
														title="<%=certificateIdList.get(i).getDescription()%>"><img
															src="DocRenderer?docId=<%=certificateIdList.get(i).getDocumentId()%>"
															alt="gallery thumbnail" class="img-thumbnail"
															height="192" width="192" /></a></li> <br /><%=certificateIdList.get(i).getDescription()%>
												</td>
												<% } %>
											</tr>
											<% } %>

											<% List<DocBean> personalIdList = (List<DocBean>) request.getAttribute("personalIdList"); %>
											<tr>
												<td><h5 class="fontHitam">
														<small><b>Personal Documents</b></small>
													</h5>
													<hr style="margin: -5px 0 5px 0"></td>
											</tr>
											<% if (personalIdList.isEmpty()) { %>
											<tr>
												<td>Document not available.</td>
											</tr>
											<% } else { %>
											<tr>
												<% for (int i = 0; i < personalIdList.size(); i++) { %>
												<td>
													<li class="docs"><a
														href="DocRenderer?docId=<%=personalIdList.get(i).getDocumentId()%>"
														class="preview" target="_blank"
														title="<%=personalIdList.get(i).getDescription()%>"><img
															src="DocRenderer?docId=<%=personalIdList.get(i).getDocumentId()%>"
															alt="gallery thumbnail" class="img-thumbnail"
															height="192" width="192" /></a></li> <br /><%=personalIdList.get(i).getDescription()%>
												</td>
												<% } %>
											</tr>
											<% } %>
										</table>
									</div>
								</div>
							</div>
							<!-- END ISI TAB -->
							<div class="col-md-3">
								<table class="table table-nonfluid table-borderless">
									<!-- <table class="table table-nonfluid table-striped table-bordered table-hover"> -->
									<tr>
										<td><h5 class="fontHitam">
												<small><b>EMPLOYEE PHOTO</b></small>
											</h5>
											<hr style="margin: 3px 0 5px 0"></td>
									</tr>
									<tr>
										<td>
											<%
												if (0 < Integer.parseInt(request.getAttribute("imageSize").toString())) {
											%> <img
											src="ImageRenderer?empId=<%=(String) request.getAttribute("empId")%>"
											class="img-thumbnail" height="192" width="192" /> <%
 	} else {
 %> <img src="asset/img/default.png" height="192" width="192"
											class="img-thumbnail" /> <%
 	}
 %>
										</td>

									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END CONTAINER -->
	</html:form>
	<%@include file="PartJavascript.jsp"%>
</body>
</html>