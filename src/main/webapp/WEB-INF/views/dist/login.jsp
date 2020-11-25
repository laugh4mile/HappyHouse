<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<!-- kakao login JavaScript SDK-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		var noData = '${msg}';
		if(noData != ''){
			alert(noData);
		}
		$("#loginBtn").click(function() {

			if ($("#inputEmailAddress").val() == "") {
				alert("아이디 입력!!!");
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

		$("#registerBtn").click(function() {
			let registerinfo = JSON.stringify({
				"email" : $("#email").val(),
				"userLname" : $("#userLname").val(),
				"userFname" : $("#userFname").val(),
				"userpwd" : $("#userpwd").val(),
			});
			console.log("여기까지는 된다");
			$.ajax({
				url : '${root}/user/regi',
				type : 'POST',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				data : registerinfo,
				success : function(users) {
					$("#email").val('');
					$("#userLname").val('');
					$("#userFname").val('');
					$("#userpwd").val('');
					$("#userRegModal").modal("hide");
					makeList(users);
				},
				error : function(xhr, status, msg) {
					console.log("상태값 : " + status + " Http에러메시지 : " + msg);
				}
			});
		});

		$("#find_pw_btn").click(function() {
			location.href = '../user/find_pw_form';
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
<link href="${root }/css/style_hyunsoo.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>

<!--kakao login api -->
<!-- <script type="text/javascript">

    document.addEventListener("DOMContentLoaded", function() {
        Kakao.init( "d0f81655e444c4cae90021cdf7832a59" );
        Kakao.Auth.createLoginButton({
              container : "#custom-login-btn"
            , success : function( authObj ) {
                Kakao.API.request({
                      url : "/v1/user/me"
                    , success : function( res ) {
                        document.getElementById( "kakaoIdentity" ).innerHTML = res.id;
                        document.getElementById( "kakaoNickName" ).innerHTML = res.properties.nickname;
                        document.getElementById( "kakaoProfileImg" ).src = res.properties.profile_image;
                        document.getElementById( "kakaoThumbnailImg" ).src = res.properties.thumbnail_image;
                    }, fail : function( error ) {
                        alert( JSON.stringify( error ) );
                    }
                });
            }
            , fail : function( error ) {
                alert( JSON.stringify( error ));
            }
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
										<!-- <div class="form-group">
											<div class="custom-control custom-checkbox">
												<input class="custom-control-input"
													id="rememberPasswordCheck" type="checkbox" /> <label
													class="custom-control-label" for="rememberPasswordCheck">Remember
													password</label>
											</div>
										</div> -->
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">

											</span> <a class="small" href="${root}/user/find_pw_form">Forgot
												Password?</a>

											<!-- <button type="button" class="btn btn-primary" onclick="javascript:login();">Login</button> -->
											<button type="button" id="loginBtn" class="btn btn-primary">Login</button>
										</div>
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<!-- <a href="register.jsp">Need an account? Sign up!</a> -->

										<button type="button" class="btn_signup" data-toggle="modal"
											data-target="#userRegModal">회원가입 하기</button>
											<%-- kakao login btn --%>
										<%-- <a id="custom-login-btn" class="btn_kakaoLogin"
											href="javascript:loginWithKakao()"> <img
											src="${root}/img/kakao_login_medium_narrow.png" width="" />
										</a>
										<p id="token-result"></p>
 --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- 회원 등록 모달 -->
	<div class="modal" id="userRegModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">회원등록</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">
					<form id="memberform" method="post" action="">
						<input type="hidden" name="act" id="act" value="">
						<div class="form-group" align="left">
							<label for="email">아이디</label><br> <input type="text"
								class="form-control" id="email" name="email" placeholder="">
						</div>
						<div class="form-group" align="left">
							<label for="">비밀번호</label> <input type="password"
								class="form-control" id="userpwd" name="userpwd" placeholder="">
						</div>
						<div class="form-group" align="left">
							<label for="">성</label> <input type="text" class="form-control"
								id="userLname" name="userLname" placeholder="">
						</div>
						<div class="form-group" align="left">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="userFname" name="userFname"
								placeholder="">
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
							<button type="reset" class="btn btn-warning">초기화</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
</body>
</html>
