<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.access.model.*"%>
<%@ page import="com.title.model.*"%>
<%@ include file="/back-end/header.jsp"%>

<style>
body {
	background-color: #4e5452;
	color: #4e5452;
}

div.left {
	margin-top: 20px;
}

div.right {
	background-color: #fff;
	margin-top: 40px;
	padding: 50px 50px;
	border-radius: 5px;
}

a.content {
	color: #80c344;
}

a.content:hover {
	color: #4B7F52;
}

table {
	width: 600px;
	margin: 30px auto;
	border: 1px solid #4e5452;
}

th, td {
	text-align: center;
	border: 1px solid #4e5452;
	padding: 10px 15px;
}

td.function {
	text-align: justify;
}

label.spotlight {
	background-color: #80c344;
	padding: 2px 5px;
	border-radius: 5px;
	color: #fff;
}
</style>

<div class="container-fluid">
	<!-- 標頭 -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">特定權限的網站管理員列表</h1>
	</div>
	<!-- 中間區塊 -->
	<div class="row">
		<div class="col-xl-3 col-lg-12 col-md-9">
			<a
				href="<%=request.getContextPath()%>/back-end/access/select_page1.jsp"
				class="btn btn-success">回首頁</a>
			<p></p>
		</div>
		<div class="col-xl-12 col-lg-12 col-md-9">
			<div class="card shadow mb-10">
				<jsp:useBean id="functionSvc" scope="page"
					class="com.function.model.FunctionService" />
					<div class="card-header py-3">
						<h3 class="m-0 font-weight-bold text-primary">網站管理員列表:${functionSvc.getOneFunction(param.adminFunction).adminFunctionName}</h3>
					</div>
				
				<table class="table table table-bordered">
					<tr>
						<th>職稱</th>
						<th>姓名</th>
						<th>網站管理權限</th>
					</tr>
					<jsp:useBean id="adminSvc" scope="page"
						class="com.admin.model.AdminService" />
					<jsp:useBean id="accessSvc" scope="page"
						class="com.access.model.AccessService" />
					<c:forEach var="adminVO"
						items="${adminSvc.getFunctionAdminNo(param.adminFunction)}">
						<tr>
							<td>${adminVO.titleVO.adminTitle}</td>

							<td>${adminVO.adminName}</td>
							<td class="function"><c:forEach var="functionVO"
									items="${functionSvc.all}" varStatus="nextLine">
									<input type="checkbox" name="function${nextLine.count}"
										${accessSvc.getOneAccess(adminVO.adminNo,functionVO.adminFunction).adminFunction == functionVO.adminFunction ? 'checked':''}
										disabled />
									<label for="function${nextLine.count}"
										${accessSvc.getOneAccess(adminVO.adminNo,functionVO.adminFunction).adminFunction == functionVO.adminFunction ? 'class=spotlight':''}>${functionVO.adminFunctionName}</label>
							${nextLine.count%3 == 0 ? '<br>':''}
						</c:forEach></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

<%@ include file="/back-end/footer.jsp"%>