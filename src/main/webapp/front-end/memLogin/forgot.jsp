<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>忘記密碼</title>
<!-- Custom fonts for this template-->
<link href="<%=request.getContextPath()%>/back-end/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="<%=request.getContextPath()%>/back-end/assets/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-3 d-none d-lg-block "></div>
							<!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">忘記密碼了?</h1>
									</div>
									<form class="user" METHOD="post"
										ACTION="<%=request.getContextPath()%>/memServlet1.do">
										<div class="form-group">
											<input type="text" name="memAccount"
												class="form-control form-control-user" id="InputADMIN_MAIL"
												aria-describedby="emailHelp" placeholder="請輸入會員帳號">
											<label>會員帳號</label>
										</div>
										<div class="form-group">
											<input type="text" name="memMail"
												class="form-control form-control-user"
												id="InputADMIN_PASSWORD" placeholder="請輸入會員信箱"><label>會員信箱</label>
										</div>
										<input type="hidden" name="action" value="forgotpw"> 
										<input	type="submit" value="送出" class="btn btn-primary btn-user btn-block"> 
										<input	class="btn btn-secondary" type="reset" value="清除">
									</form>
									<div><a class="btn" href="<%=request.getContextPath() %>/front-end/memLogin/login.jsp">返回首頁</a></div>
									<div style="color: red">${errorMsgs}</div>
								</div>
							</div>
							<div class="col-lg-3 d-none d-lg-block "></div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="<%=request.getContextPath()%>/back-end/assets/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/back-end/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="<%=request.getContextPath()%>/back-end/assets/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="<%=request.getContextPath()%>/back-end/assets/js/sb-admin-2.min.js"></script>

</body>

</html>