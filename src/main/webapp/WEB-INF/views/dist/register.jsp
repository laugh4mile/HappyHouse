<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원 정보 등록</title>
<link href="${root }/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
    crossorigin="anonymous"></script>
<script type="text/javascript">
    function insertMember() {
        if (document.getElementById("inputConfirmPassword").value != document.getElementById("inputPassword").value) {
            alert("비밀번호가 다릅니다!");
            return;
        }
        
        if (document.getElementById("inputEmailAddress").value == "") {
            alert("이메일 필수 입력!");
            return;
        } else if (document.getElementById("inputFirstName").value == "") {
            alert("First Name 필수 입력!");
            return;
        } else if (document.getElementById("inputLastName").value == "") {
            alert("Last Name 필수 입력!");
            return;
        } else {
            document.getElementById("registerform").action = "${root}/insertMember.do";
            document.getElementById("registerform").submit();
        }
    }
</script>
</head>
<body class="bg-primary">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">회원 가입</h3>
                                </div>
                                <div class="card-body">
                                    <%
                                    	String root = request.getContextPath();
                                    %>
                                    <form id="registerform" method="post" action="">
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName">First
                                                        Name</label>
                                                    <input class="form-control py-4"
                                                        id="inputFirstName" name="inputFirstName"
                                                        type="text" placeholder="Enter first name" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputLastName">Last
                                                        Name</label>
                                                    <input class="form-control py-4"
                                                        id="inputLastName" name="inputLastName"
                                                        type="text" placeholder="Enter last name" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Email</label>
                                            <input class="form-control py-4" id="inputEmailAddress"
                                                name="inputEmailAddress" type="email"
                                                aria-describedby="emailHelp"
                                                placeholder="Enter email address" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputPassword">Password</label>
                                                    <input class="form-control py-4"
                                                        id="inputPassword" name="inputPassword" type="password"
                                                        placeholder="Enter password" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1"
                                                        for="inputConfirmPassword">Confirm
                                                        Password</label>
                                                    <input class="form-control py-4"
                                                        id="inputConfirmPassword" type="password"
                                                        placeholder="Confirm password" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-4 mb-0">
                                            <button class="btn btn-primary btn-block"
                                                onclick="javascript:insertMember();">Create Account</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small">
                                        <a href="login.jsp">Have an account? Go to login</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="${root }/js/scripts.js"></script>
</body>
</html>