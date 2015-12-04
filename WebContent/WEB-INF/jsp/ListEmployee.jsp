<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="PartBootstrap.jsp"%>
<title>Employee List</title>
</head>
<script type="text/javascript">
	function closeModal(){
		$('#contact-form').bootstrapValidator('resetField','empBean.quitDate');
		$('#contact-form').bootstrapValidator('resetField','empBean.description');
	}
	
	function flyToPage(task, id, currentSideBar) {
		var hireDate = $('#hiredate' + id).val();

		var quitDate = $('#quitDatePicker')
				.datepicker(
						{
							onRender : function(date) {
								return date.valueOf() <= Date.parse(hireDate) ? 'disabled'
										: '';
							}
						}).on('changeDate', function(ev) {
							$('#contact-form').bootstrapValidator('revalidateField','empBean.quitDate');
					quitDate.hide();
				}).data('datepicker');
		
		document.forms[0].task.value = task;
		if (id != "")
			document.forms[0].id.value = id;
		document.forms[0].sidebar.value = currentSideBar;
		
		if(task != 'deactivate')
			{
				document.forms[0].submit();
			}
	}

	$(document).ready(function() {

		$('.po-markup > .po-link').popover({
			trigger : 'hover',
			html : true, // must have if HTML is contained in popover

			// get the title and conent
			title : function() {
				return $(this).parent().find('.po-title').html();
			},
			content : function() {
				return $(this).parent().find('.po-body').html();
			},

			container : 'body',
			placement : 'right'

		});
	});
</script>
<body>
	<html:form method="post" action="/index" styleId="contact-form"
		styleClass="contact-form">
		<html:hidden name="empForm" property="task" />
		<html:hidden name="empForm" property="id" />
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
								<h3 id="timeline">Employee List</h3>
							</div>
							<!-- END JUDUL -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i> <a
									href="<bean:write name="empForm" property="urlDashboard" />">
										Dashboard</a></li>
								<li><i class="fa fa-list"></i> Employee List</li>
							</ul>
							<!-- END BREADCRUMB -->
							<logic:notEmpty name="empForm" property="notification">
								<div class="alert alert-info kiri" role="alert">
									<i class="fa fa-exclamation-triangle"></i>
									<bean:write name="empForm" property="notification" />
								</div>
							</logic:notEmpty>

							<div class="col-md-12">
								

								<!-- TABLE -->
								<table
									class="table table-striped table-hover table-condensed table-bordered"
									id="sort">
									<thead>
										<tr>
											
											<th>NIK</th>
											<th>Employee Name</th>
											<th>Department</th>
											<th>Location</th>
											<th>Status</th>
											<th class="tengah" style="width: 23%">Action</th>
										</tr>
									</thead>

									<tbody data-link="row" class="rowlink">
										<logic:notEmpty name="empForm" property="listEmp">
											<logic:iterate id="iterator" name="empForm"
												property="listEmp">
												<tr>
													<input type="hidden"
														id="hiredate<bean:write name="iterator" property="employeeId"/>"
														value="<bean:write name="iterator" property="hireDate"/>" />
													
													<td>
														<!-- TOOLTIP -->
														<div class="po-markup">
															<a class="po-link"><bean:write name="iterator"
																	property="nik" />
																<div class="po-content hidden">
																	<div class="po-title">
																		<p>
																			<i class="fa fa-info-circle"></i> Employee
																			Information
																		</p>
																	</div>

																	<div class="po-body">
																		<bean:define id="imageLength" name="iterator"
																			property="imageLength" type="java.lang.Integer" />
																		<%
																			if (0 < imageLength) {
																		%>
																		<img
																			src="ImageRenderer?empId=<bean:write name="iterator" property="employeeId"/>"
																			class="img-thumbnail" height="192" width="192" />
																		<%
																			} else {
																		%>
																		<img src="asset/img/default.png" height="192"
																			width="192" class="img-thumbnail" />
																		<%
																			}
																		%>
																		<br />Description : <br />
																		<logic:notEqual name="iterator" property="description"
																			value="">
																			<bean:write name="iterator" property="description" />
																		</logic:notEqual>
																		<logic:equal name="iterator" property="description"
																			value="">-
																									</logic:equal>

																	</div>
																	<!-- ./po-body -->
																</div> <!-- ./po-content -->
														</div> <!-- ./po-markup --> <!-- END TOOLTIP -->
													</td>
													<td>
														<!-- TOOLTIP -->
														<div class="po-markup">
															<a class="po-link"><bean:write name="iterator"
																	property="employeeName" /> </a>
															<div class="po-content hidden">
																<div class="po-title">
																	<p>
																		<i class="fa fa-info-circle"></i> Employee Information
																	</p>
																</div>

																<div class="po-body">

																	<bean:define id="imageLength" name="iterator"
																		property="imageLength" type="java.lang.Integer" />
																	<%
																		if (0 < imageLength) {
																	%>
																	<img
																		src="ImageRenderer?empId=<bean:write name="iterator" property="employeeId"/>"
																		class="img-thumbnail" height="192" width="192" />
																	<%
																		} else {
																	%>
																	<img src="asset/img/default.png" height="192"
																		width="192" class="img-thumbnail" />
																	<%
																		}
																	%>
																	<br />Description : <br />
																	<logic:notEqual name="iterator" property="description"
																		value="">
																		<bean:write name="iterator" property="description" />
																	</logic:notEqual>
																	<logic:equal name="iterator" property="description"
																		value="">-
																									</logic:equal>

																</div>
																<!-- ./po-body -->
															</div>
															<!-- ./po-content -->
														</div> <!-- ./po-markup --> <!-- END TOOLTIP -->
													</td>
													<td class="tengah">
														<!-- TOOLTIP -->
														<div class="po-markup">
															<a class="po-link"><bean:write name="iterator"
																	property="department" />
																<div class="po-content hidden">
																	<div class="po-title">
																		<p>
																			<i class="fa fa-info-circle"></i> Employee
																			Information
																		</p>
																	</div>

																	<div class="po-body">

																		<bean:define id="imageLength" name="iterator"
																			property="imageLength" type="java.lang.Integer" />
																		<%
																			if (0 < imageLength) {
																		%>
																		<img
																			src="ImageRenderer?empId=<bean:write name="iterator" property="employeeId"/>"
																			class="img-thumbnail" height="192" width="192" />
																		<%
																			} else {
																		%>
																		<img src="asset/img/default.png" height="192"
																			width="192" class="img-thumbnail" />
																		<%
																			}
																		%>
																		<br />Description : <br />
																		<logic:notEqual name="iterator" property="description"
																			value="">
																			<bean:write name="iterator" property="description" />
																		</logic:notEqual>
																		<logic:equal name="iterator" property="description"
																			value="">-
																									</logic:equal>

																	</div>
																	<!-- ./po-body -->
																</div> <!-- ./po-content -->
														</div> <!-- ./po-markup --> <!-- END TOOLTIP -->
													</td>
													<td>
														<!-- TOOLTIP -->
														<div class="po-markup">
															<a class="po-link"><bean:write name="iterator"
																	property="location" />
																<div class="po-content hidden">
																	<div class="po-title">
																		<p>
																			<i class="fa fa-info-circle"></i> Employee
																			Information
																		</p>
																	</div>

																	<div class="po-body">
																		<bean:define id="imageLength" name="iterator"
																			property="imageLength" type="java.lang.Integer" />
																		<%
																			if (0 < imageLength) {
																		%>
																		<img
																			src="ImageRenderer?empId=<bean:write name="iterator" property="employeeId"/>"
																			class="img-thumbnail" height="192" width="192" />
																		<%
																			} else {
																		%>
																		<img src="asset/img/default.png" height="192"
																			width="192" class="img-thumbnail" />
																		<%
																			}
																		%>
																		<br />Description : <br />
																		<logic:notEqual name="iterator" property="description"
																			value="">
																			<bean:write name="iterator" property="description" />
																		</logic:notEqual>
																		<logic:equal name="iterator" property="description"
																			value="">-
																									</logic:equal>

																	</div>
																	<!-- ./po-body -->
																</div> <!-- ./po-content -->
														</div> <!-- ./po-markup --> <!-- END TOOLTIP -->
													</td>
													<td style="width: auto" class="tengah"><logic:equal
															name="iterator" property="status" value="1">
															<i class="fa fa-check" data-toggle="tooltip"
																data-placement="bottom" title="Active"
																style="color: green"></i>
															<a style="color: transparent !important">l</a>
														</logic:equal> <logic:notEqual name="iterator" property="status"
															value="1">
															<i class="fa fa-close" data-toggle="tooltip"
																data-placement="bottom" title="Inactive"
																style="color: red"></i>
															<a style="color: transparent !important">i</a>
														</logic:notEqual></td>
													<td style="border-right-color: transparent;">
														<% List<String> privList = (List<String>) request.getAttribute("privList"); %> 
														<% if (privList.contains("1")) { %>
														<button type="button" class="btn btn-success"
															onclick="javascript:flyToPage('view','<bean:write name="iterator" property="employeeId"/>');">
															<span class="fa fa-eye fa-fw"></span> View
														</button>&nbsp; 
														<% } %> 
														<% if (privList.contains("4")) { %>
														<logic:notEqual name="iterator" property="status" value="2">
															<button type="button" class="btn btn-danger"
																data-toggle="modal" data-target="#deactivateModal" data-backdrop="static"
																onClick="javascript:flyToPage('deactivate','<bean:write name="iterator" property="employeeId"/>','1','1')"
																>
																<i class="fa fa-ban fa-fw"></i> Deactivate
															</button>
														</logic:notEqual> 
														<% } %></td>
													
												</tr>
											</logic:iterate>
										</logic:notEmpty>
									</tbody>


								</table>

								
							</div>

						</div>
						<!-- END CONTENT -->

					</div>
				</div>
			</div>
		</div>
		<!-- END CONTAINER -->


		<!-- MODAL -->
		<div class="modal fade" id="deactivateModal" tabindex="-1"
			role="dialog" aria-labelledby="#deactivateModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">
							Deactivate Employee
							<bean:write name="empForm" property="empBean.employeeName" />
						</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger kiri" role="alert">
							<i class="fa fa-exclamation-triangle"></i> Are you sure want to
							deactivate this employee?
						</div>
						<table class="table table-borderless" widht="100%">
							<tr>
								<td style="vertical-align: top; width:20%" class="kanan">Quit Date :</td>
								<td class="kiri">
									<div class="input-group form-group">
										<input class="form-control form-control-md-1"
											name="empBean.quitDate" type="text" id="quitDatePicker"
											readonly="true" /> <span
											class="input-group-addon input-number-resize"
											id="btnCal1"
											style="height: 22px !important; width: 50px !important; padding-top: 0; padding-bottom: 0; border-bottom-right-radius: 15px;"><i
											class="fa fa-calendar"></i></span>
									</div></td>
							</tr>
							<tr>
								<td style="vertical-align: top;" class="kanan">Status description :</td>
								<td class="kiri"><div class="form-group">
										<html:textarea name="empForm" property="empBean.description"
											styleClass="form-textarea"></html:textarea>
									</div></td>
							</tr>
						</table>
						
					</div>
					<div class="modal-footer">
						
						<button type="submit" class="btn btn-danger">
							<i class="fa fa-ban fa-fw"></i> Deactivate
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:closeModal();">
							<i class="fa fa-close"></i> Cancel
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- END MODAL -->
	</html:form>
	<%@include file="PartJavascript.jsp"%>
	
</body>
<script>
	$(document).ready(function() {
		$('#sort').dataTable();
	});

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
</script>
<script>
							$('#btnCal1').click(function() {
								$(document).ready(function() {
									$("#quitDatePicker").datepicker().focus();
								});
							});
							$('#contact-form')
									.bootstrapValidator(
											{
												//  live: 'disabled',
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													'empBean.quitDate' : {
														validators : {
															notEmpty : {
																message : 'Quit Date is required'
															}
														}
													},
													'empBean.description' : {
														validators : {
															notEmpty : {
																message : 'Mutate Description is required'
															},

															stringLength : {
																message : 'Mutate Description content must be less than 100 characters',
																max : function(
																		value,
																		validator,
																		$field) {
																	return 100 - (value
																			.match(/\r/g) || []).length;
																}
															}
														}
													}
												}
											});
						</script>
						<script>
						</script>

</html>