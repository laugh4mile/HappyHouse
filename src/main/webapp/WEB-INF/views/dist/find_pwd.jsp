<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${root }/css/styles.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script>
	$(function(){
		$("#loginBtn").click(function(){
			location.href='../dist/password';
		})
	})
</script> -->
<title>아이디 찾기</title>
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
									<h1 align="center">${ pwd }</h1>
										
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

</body>
</html>
