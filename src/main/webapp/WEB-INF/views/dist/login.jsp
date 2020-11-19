<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {

			if ($("#inputEmailAddress").val() == "") {
				alert("이메일 입력!!!");
				return;
			} else if ($("#inputPassword").val() == "") {
				alert("비밀번호 입력!!!");
				return;
			} else {
				$("#loginform").attr("action", "${root}/user/login").submit();
			}
		});

		$('#mvRegisterBtn').focusin(function() {
			$(location).attr("href", "${root}/");
		});
	});
	/* function login() {
		if (document.getElementById("inputEmailAddress").value == "") {
			console.log("나오니?");
			alert("이메일 입력!!!");
			return;
		} else if (document.getElementById("inputPassword").value == "") {
			console.log(document.getElementById("inputEmailAddress").value);
			console.log("엔터");
			console.log($("#inputPassword").val());
			alert("비밀번호 입력!!!");
			return;
		} else {
			document.getElementById("loginform").action = "${root}/user/login";
			document.getElementById("loginform").submit();
		}
	} */
</script>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
<link href="${root }/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="text-center mt-5 ">
								<h1 class="text-white bg-dark">HAPPY HOUSE</h1>
							</div>
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
								</div>
								<div class="card-body">
									<form id="loginform" method="post" action="">
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">ID</label>
											<input class="form-control py-4" id="inputEmailAddress"
												name="email" type="email" placeholder="Enter ID" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPassword">Password</label>
											<input class="form-control py-4" id="inputPassword"
												name="userpwd" type="password" placeholder="Enter password" />
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox">
												<input class="custom-control-input"
													id="rememberPasswordCheck" type="checkbox" /> <label
													class="custom-control-label" for="rememberPasswordCheck">Remember
													password</label>
											</div>
										</div>
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="password.jsp">Forgot Password?</a>
											<!-- <button type="button" class="btn btn-primary" onclick="javascript:login();">Login</button> -->
											<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="register.jsp">Need an account? Sign up!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
</body>
</html>
