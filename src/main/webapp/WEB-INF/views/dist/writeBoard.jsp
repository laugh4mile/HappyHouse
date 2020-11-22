<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="">
		<div class="form-group" align="left">
			<label for="name">이름</label> <input type="text" class="form-control" id="username" name="username" placeholder="">
		</div>
		<div class="form-group" align="left">
			<label for="">아이디</label> <input type="text" class="form-control" id="userid" name="userid" placeholder="">
		</div>
		<div class="form-group" align="left">
			<label for="">비밀번호</label> <input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="">
		</div>
		<div class="form-group" align="left">
			<label for="email">이메일</label><br> <input type="text" class="form-control" id="email" name="email" placeholder="">
		</div>
		<div class="form-group" align="left">
			<label for="">주소</label> <input type="text" class="form-control" id="address" name="address" placeholder="">
		</div>
		<div class="form-group" align="center">
			<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
			<button type="reset" class="btn btn-warning">초기화</button>
		</div>
	</form>
</body>
</html>