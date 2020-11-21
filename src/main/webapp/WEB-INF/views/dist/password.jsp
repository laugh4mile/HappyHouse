<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />

<!DOCTYPE html>
<html lang="en">
<head>
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
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$("#find_pw_btn").click(function() {
			location.href = '../user/find_pw_form';
		});

	});
</script> -->

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
									<h3 class="text-center font-weight-light my-4">Find
										Password</h3>
								</div>
								<div class="card-body">
									<div class="small mb-3 text-muted">Enter your ID and we
										will find your password.</div>
									<form action="../user/find_pwd" method="post">
										<div class="form-group">
											<label class="small mb-1" for="inputEmailAddress">ID</label>
											<input class="form-control py-4" id="email" name="email" required
												type="text" aria-describedby="emailHelp"
												placeholder="Enter ID" />
										</div>
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<button type="submit" class="btn-register btn btn-primary"
												id=findBtn>Find Password</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="${root}">Return to login</a>
									</div>
								</div>
							</div>


							<!-- <div>
								<form action="../user/find_pwd" method="post">
									<div class="w3-center w3-large w3-margin-top">
										<h3>비밀번호 찾기</h3>
									</div>
									<div>
										<p>
											<label>ID</label> <input class="w3-input" type="text"
												id="email" name="email" required>
										</p>
										<p class="w3-center">
											<button type="submit" id=findBtn
												class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
											<button type="button" onclick="history.go(-1);"
												class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
										</p>
									</div>
								</form>
							</div> -->


						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2020</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- <div class="modal" id="userRegModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">비밀번호 변경</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<form id="memberform" method="post" action="">
						<input type="hidden" name="act" id="act" value="">
						
						<div class="form-group" align="left">
							<label for="">변경할 비밀번호를 입력해 주세요</label> <input type="password"
								class="form-control" id="userpwd" name="userpwd" placeholder="">
						</div>
						
						<div class="form-group" align="center">
							<button type="button" class="btn btn-primary" id="registerBtn">비밀번호 변경</button>
							<button type="reset" class="btn btn-warning">초기화</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div> -->




	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
</body>
</html>
