<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Employee Mutation</title>
<%@include file="PartBootstrap.jsp"%>
</head>
<script type="text/javascript">
	function flyToPage(task, id, currentSideBar) {
		document.forms[0].task.value = task;
		document.forms[0].id.value = id;
		document.forms[0].sidebar.value = currentSideBar;
		document.forms[0].submit();
	}

	function getRoleDetail() {
		$
				.getJSON(
						"/HRIS_Employee/index.do",
						{
							department : $('#selectDept option:selected')
									.text().trim(),
							task : "loadRole"
						},
						function(data) {
							var content = '<select name="empBean.roleId" class="form-control">';
							$
									.each(
											data,
											function(index, element) {
												content += '<option value="'+element.roleId+'">'
														+ element.roleName
														+ '</option>';
											});

							content += "</select>";
							$("#contentRole").html(content);
						});
	}
</script>

<body>
	<div id="wrapper">
		<%@include file="PartNavbar.jsp"%>
		<div id="page-wrapper">
			<html:form method="post" action="/index" styleId="validate-form"
				styleClass="validate-form">
				<html:hidden name="empForm" property="task" value="updateMutation" />
				<html:hidden name="empForm" property="id" />
				<html:hidden name="empForm" property="sidebar" value="1" />

				<!-- CONTAINER -->
				<div class="container-fluid">
					<div class="row">

						<!-- ISI CONTENT -->
						<div class="col-md-12">


							<!--JUDUL-->
							<div class="page-header">
								<h3 id="timeline">Mutate Employee</h3>
							</div>
							<!-- END JUDUL -->

							<!-- BREADCRUMB -->
							<ul class="breadcrumb">
								<li><i class="fa fa-dashboard"></i><a href="<bean:write name="empForm" property="urlDashboard" />">
										Dashboard</a></li>
								<li><i class="fa fa-random"></i> Mutate</li>
							</ul>
							<!-- END BREADCRUMB -->
							<link rel="stylesheet"
								href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
							<script type="text/javascript"
								src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>

							<div class="col-md-8 col-md-offset-2">
								<!-- CONTAINER -->
								<div class="container-fluid well">
									<div class="row">
										<div class="col-md-12">
											<div class="tab-content">
												<div class="tab-pane active" id="dashboard">
													<br> <br> <br>

													<!-- KOLOM MD 6 CENTER-->
													<div class=".col-md-6 .col-md-offset-3">
														
															<table align="center"
																class="table table-nonfluid table-hover ">
																<thead>
																	<tr>
																		<th align="center" colspan="2">Mutate Employee</th>
																	</tr>
																</thead>
																<tr>
																	<td class="kanan">Employee Name :</td>
																	<td>
																		<div class="form-group">
																			<logic:notEmpty name="empForm" property="id">
																				<html:text styleClass="form-control"
																					styleId="exampleInputName2"
																					property="empBean.employeeName" readonly="true">
																					<bean:write name="empForm"
																						property="empBean.employeeName" />
																				</html:text>
																			</logic:notEmpty>
																			<logic:empty name="empForm" property="id">
																				<input type="text" class="form-control"
																					id="exampleInputName2" readonly="readonly"
																					name="empBean.employeeName" data-toggle="tooltip"
																					data-placement="bottom"
																					title="Select Employee First">
																			</logic:empty>
																		</div>
																	</td>
																	<td>
																		<button type="button" class="btn btn-primary"
																			data-toggle="modal" data-target="#listEmployeeName"
																			data-toggle="tooltip" data-placement="bottom"
																			title="Search Employee">
																			<i class="fa fa-search"></i>
																		</button>
																	</td>
																</tr>
																<tr>
																	<td class="kanan">Department :</td>
																	<td colspan="2"><logic:notEmpty name="empForm"
																			property="id">
																			<bean:write name="empForm"
																				property="empBean.department" />
																		</logic:notEmpty> <logic:empty name="empForm" property="id">
																			<label data-toggle="tooltip" data-placement="bottom"
																				title="Select Employee First">-</label>
																		</logic:empty></td>
																</tr>
																<tr>
																	<td class="kanan">Mutate To :</td>
																	<td colspan="2"><div class="form-group">
																			<select id="selectDept"
																				onchange="javascript:getRoleDetail();"
																				name="empBean.departmentId" class="form-control">
																				<option value="" disabled selected>Choose
																					one...</option>
																				<logic:iterate id="list" name="empForm"
																					property="listDept">
																					<option
																						value="<bean:write name="list" property="departmentId"/>">
																						<bean:write name="list" property="department" /></option>
																				</logic:iterate>
																			</select>
																		</div></td>
																</tr>
																<tr>
																	<td class="kanan">Role :</td>
																	<td colspan="2" id="contentRole"><select
																		name="empBean.roleId" class="form-control"
																		readonly="readonly" data-toggle="tooltip"
																		data-placement="bottom"
																		title="Select Department First">
																			<option value="" disabled selected>Choose
																				one...</option>
																	</select></td>
																</tr>
																<tr>
																	<td colspan="3" class="tengah">
																		<button type="submit" class="btn btn-primary"
																			onclick="javascript:clearAll();">
																			<i class="fa fa-check"></i> Submit
																		</button>
																	</td>
																</tr>
															</table>


														
													</div>
													<!-- END KOLOM MD 8-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- MODAL SEARCH EMPLOYEE-->
				<div class="modal fade" id="listEmployeeName" tabindex="-1"
					role="dialog" aria-labelledby="#deactivateModalLabel">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Search Employee</h4>
							</div>
							<div class="modal-body">
								<div class="alert alert-info alert-dismissible" role="alert">
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<i class="fa fa-info-circle"></i> <strong>Click row</strong> to
									select an employee.
								</div>
								<table
									class="table table-striped table-hover table-condensed table-bordered"
									id="sort">
									<thead>
										<tr>
											<th>Employee Name</th>
											<th>Department</th>
											<th>Location</th>
										</tr>
									</thead>
									<tbody>

										<logic:notEmpty name="empForm" property="listEmp">
											<logic:iterate id="iterator" name="empForm"
												property="listEmp">
												<tr
													onClick="javascript:flyToPage('mutate','<bean:write name="iterator" property="employeeId" />','1','3')"
													style="cursor: pointer">
													<td><bean:write name="iterator"
															property="employeeName" /></td>
													<td><bean:write name="iterator" property="department" /></td>
													<td><bean:write name="iterator" property="location" /></td>
												</tr>
											</logic:iterate>
										</logic:notEmpty>
									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
				<!-- END MODAL -->

			</html:form>
		</div>
	</div>

	<%@include file="PartJavascript.jsp"%>
	<script>
		$(document).ready(function() {
			$('#sort').dataTable({
				"columns" : [ null, null, null ]
			});
		});

		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
	<script type="text/javascript">
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
								'empBean.employeeName' : {
									validators : {
										notEmpty : {
											message : 'Name is required and cannot be empty'
										},

									}
								},
								'currentSpecialDateBean.description' : {
									validators : {
										notEmpty : {
											message : 'Description is required and cannot be empty'
										},

										stringLength : {
											message : 'Description content must be less than 100 characters',
											max : function(value, validator,
													$field) {
												return 100 - (value
														.match(/\r/g) || []).length;
											}
										}
									}
								},
								'empBean.departmentId' : {
									validators : {
										callback : {
											message : 'Destination Department is required and cannot be empty',
											callback : function(value,
													validator, $field) {
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
								}
							}
						});
	</script>
</body>
</html>