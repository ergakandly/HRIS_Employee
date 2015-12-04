<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" type="image/ico" href="asset/img/icon.ico" />
</head>

<body onload="startTime()">
	<!-- NAVBAR -->
	<nav class="navbar navbar-inverse navbar-fixed-top role="navigation">

	<!-- LOGO -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"> <img alt="Brand"
			src="asset/img/logo-hover.png">
		</a>
	</div>
	<!-- END LOGO -->

	<ul class="nav navbar-right top-nav">
		
		<!-- DROPDOWN USER -->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class=" fa fa-user" id="warnaPutih"></i>
				<font color="white">Hi, <%= request.getSession().getAttribute("employeeName") %></font>  <b class="caret" id="warnaPutih"></b></a>
			<ul class="dropdown-menu">
				<li><a href="javascript:flyToPage('logout');"><span
						class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
			</ul></li>
		<!-- END DROPDOWN USER -->
	</ul>

	<!-- SIDEBAR  -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">

			<!-- SIDEBAR 1 -->
			<% List<String> priviList = (List<String>) request.getAttribute("privList"); %>
			<% if(priviList.contains("1")) { %>
				<logic:equal name="empForm" property="sidebar" value="1">
					<li class="active"><a
						href="javascript:flyToPage('backToList','','1','1')"><i
							class="fa fa-list"></i> Employee List</a></li>
				</logic:equal>
				<logic:notEqual name="empForm" property="sidebar" value="1">
					<li><a href="javascript:flyToPage('backToList','','1','1')"><i
							class="fa fa-list"></i> Employee List</a></li>
				</logic:notEqual>
			<% } %>

			<!-- SIDEBAR 2 -->
			<% if(priviList.contains("2")) { %>
				<logic:equal name="empForm" property="sidebar" value="2">
					<li class="active"><a
						href="javascript:flyToPage('add','','1','2');"><i
							class="fa fa-plus"></i> Add New Employee</a></li>
				</logic:equal>
				<logic:notEqual name="empForm" property="sidebar" value="2">
					<li><a href="javascript:flyToPage('add','','1','2');"><i
							class="fa fa-plus"></i> Add New Employee</a></li>
				</logic:notEqual>
			<% } %>

			<!-- SIDEBAR 3 -->
			<% if(priviList.contains("3")) { %>
			<logic:equal name="empForm" property="sidebar" value="3">
				<li class="active"><a
					href="javascript:flyToPage('mutate','','1','3');"><i
						class="fa fa-random"></i> Mutate Employee</a></li>
			</logic:equal>
			<logic:notEqual name="empForm" property="sidebar" value="3">
				<li><a href="javascript:flyToPage('mutate','','1','3');"><i
						class="fa fa-random"></i> Mutate Employee</a></li>
			</logic:notEqual>
			<% } %>
			
			<!-- SIDEBAR 4 -->
			<% if(priviList.isEmpty()) { %>
			<li class="active"> <a href="#"><i class="fa fa-eye"></i> View Profile</a></li>
			<% } %>
		</ul>
	</div>
	<!-- END SIDEBAR --> </nav>

	</nav>
	<!-- END NAVBAR -->
</body>
</html>