<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>
<link href="${root }/css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
    crossorigin="anonymous"></script>

<script type="text/javascript">
    function update() {
        if (document.getElementById("inputNewFirstName").value == "") {
            alert("NewFirstName 입력!!!");
            return;
        } else if (document.getElementById("inputNewLastname").value == "") {
            alert("NewLastName 입력!!!");
            return;
        } else if (document.getElementById("inputNewPassword").value == "") {
            alert("NewPassword 입력!!!");
            return;
        } else {
            document.getElementById("updateform").action = "${root}/updateMember.do";
            document.getElementById("updateform").submit();
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
                                    <h3 class="text-center font-weight-light my-4">회원정보 수정</h3>
                                </div>
                                <div class="card-body">
                                	<form id="updateform" method="post" action="${root }/login.log">
	                                        <div class="form-group">
	                                            <label class="small mb-1" for="inputNewFirstName">New First name</label>
	                                            <input class="form-control py-4" id="inputNewFirstName"
	                                                name="inputNewFirstName" type="text"
	                                                placeholder="Enter New First name" />
	                                        </div>
	                                        <div class="form-group">
	                                            <label class="small mb-1" for="inputNewLastname">New Last name</label>
	                                            <input class="form-control py-4" id="inputNewLastname"
	                                                name="inputNewLastname" type="text"
	                                                placeholder="Enter New Last name" />
	                                        </div>
	                                        <div class="form-group">
	                                            <label class="small mb-1" for="inputNewPassword">New Password</label>
	                                            <input class="form-control py-4" id="inputNewPassword"
	                                                name="inputNewPassword" type="password"
	                                                placeholder="Enter new password" />
	                                        </div>
	                                        
	                                        <div>
	                                            
	                                            <button type="button" class="btn btn-primary"
	                                                onclick="javascript:update();">Update</button>
	                                        </div>
	                                    </form>
                                    <form>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputFirstName">First
                                                        Name</label>
                                                    <input class="form-control py-4"
                                                        id="inputFirstName" type="text"
                                                        placeholder="Enter first name" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputLastName">Last
                                                        Name</label>
                                                    <input class="form-control py-4"
                                                        id="inputLastName" type="text"
                                                        placeholder="Enter last name" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Email</label>
                                            <input class="form-control py-4" id="inputEmailAddress"
                                                type="email" aria-describedby="emailHelp"
                                                placeholder="Enter email address" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="small mb-1" for="inputPassword">Password</label>
                                                    <input class="form-control py-4"
                                                        id="inputPassword" type="password"
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
                                            <a class="btn btn-primary btn-block" href="login.jsp">회원정보 수정하기</a>
                                        </div>
                                    </form>
                                </div>
                                <!--                                     <div class="card-footer text-center"> -->
                                <!--                                         <div class="small"><a href="login.jsp">Have an account? Go to login</a></div> -->
                                <!--                                     </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Your Website 2020</div>
                        <div>
                            <a href="#">Privacy Policy</a>
                            &middot;
                            <a href="#">Terms &amp; Conditions</a>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="${root }/js/scripts.js"></script>
</body>
</html>