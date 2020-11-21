<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${userinfo == null}">
	<c:redirect url="/" />
</c:if>
<c:if test="${userinfo != null}">
	<!DOCTYPE html>
	<html lang="ko">
<head>
<title>SSAFY-글작성</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${root}/css/style_hyunsoo.css">
<link href="${root }/css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//회원 목록
						$.ajax({
							url : '${root}/user/users',
							type : 'GET',
							contentType : 'application/json;charset=utf-8',
							dataType : 'json',
							success : function(users) {
								makeList(users);
							},
							error : function(xhr, status, msg) {
								console.log("상태값 : " + xhr.status
										+ " Http에러메시지 : " + xhr.responseText);
							}
						});

						$("#registerBtn")
								.click(
										function() {
											let registerinfo = JSON
													.stringify({
														"email" : $("#email")
																.val(),
														"userLname" : $(
																"#userLname")
																.val(),
														"userFname" : $(
																"#userFname")
																.val(),
														"userpwd" : $(
																"#userpwd")
																.val(),
													});
											console.log("여기까지는 된다");
											$
													.ajax({
														url : '${root}/user/regi',
														type : 'POST',
														contentType : 'application/json;charset=utf-8',
														dataType : 'json',
														data : registerinfo,
														success : function(
																users) {
															$("#email").val('');
															$("#userLname")
																	.val('');
															$("#userFname")
																	.val('');
															$("#userpwd").val(
																	'');
															$("#userRegModal")
																	.modal(
																			"hide");
															makeList(users);
														},
														error : function(xhr,
																status, msg) {
															console
																	.log("상태값 : "
																			+ status
																			+ " Http에러메시지 : "
																			+ msg);
														}
													});
										});
						/*
						
						$(document).on("dblclick", "tr.view", function() {
							let vid = $(this).attr("data-id");
							$.ajax({
								url:'${root}/admin/user/' + vid,  
								type:'GET',
								contentType:'application/json;charset=utf-8',
								success:function(user) {
									$("#vid").text(user.userid);
									$("#vname").text(user.username);
									$("#vemail").text(user.email);
									$("#vaddress").text(user.address);
									$("#vjoindate").text(user.joindate);
									$("#userViewModal").modal();
								},
								error:function(xhr,status,msg){
									console.log("상태값 : " + status + " Http에러메시지 : "+msg);
								}
							});			
						});*/

						// 회원 정보 수정 보기.
						$(document).on("click", ".modiBtn", function() {
							let mid = $(this).parents("tr").attr("data-id");
							$("#view_" + mid).css("display", "none");
							$("#mview_" + mid).css("display", "");
						});

						// 회원 정보 수정 실행.
						$(document)
								.on(
										"click",
										".modifyBtn",
										function() {
											let mid = $(this).parents("tr")
													.attr("data-id");
											let modifyinfo = JSON.stringify({
												"email" : mid,
												"userpwd" : $("#userpwd" + mid)
														.val(),
												"userLname" : $(
														"#userLname" + mid)
														.val(),
												"userFname" : $(
														"#userFname" + mid)
														.val()
											});
											$
													.ajax({
														url : '${root}/user/modi',
														type : 'PUT',
														contentType : 'application/json;charset=utf-8',
														dataType : 'json',
														data : modifyinfo,
														success : function(
																users) {
															makeList(users);
														},
														error : function(xhr,
																status, msg) {
															console
																	.log("상태값 : "
																			+ status
																			+ " Http에러메시지 : "
																			+ msg);
														}
													});
										});

						// 회원 정보 수정 취소.
						$(document).on("click", ".cancelBtn", function() {
							let mid = $(this).parents("tr").attr("data-id");
							$("#view_" + mid).css("display", "");
							$("#mview_" + mid).css("display", "none");
						});
						// 회원 탈퇴.
						$(document)
								.on(
										"click",
										".delBtn",
										function() {
											if (confirm("정말 삭제?")) {
												let delid = $(this).parents(
														"tr").attr("data-id");
												$
														.ajax({
															url : '${root}/user/delete/'
																	+ delid,
															type : 'DELETE',
															contentType : 'application/json;charset=utf-8',
															dataType : 'json',
															success : function(
																	users) {
																makeList(users);
															},
															error : function(
																	xhr,
																	status, msg) {
																/* console
																		.log("상태값 : "
																				+ status
																				+ " Http에러메시지 : "
																				+ msg); */
															}
														});
											}
										});
					});

	function makeList(users) {
		$("#userlist").empty();

		$(users)
				.each(
						function(index, user) {
							let str = "<tr id=\"view_" + user.email + "\" class=\"view\" data-id=\"" + user.email + "\">"
									+ "	<td>"
									+ user.email
									+ "</td>"
									+ "	<td>"
									+ user.userpwd
									+ "</td>"
									+ "	<td>"
									+ user.userLname
									+ "</td>"
									+ "	<td>"
									+ user.userFname
									+ "</td>"
									+ "	<td><button type=\"button\" class=\"modiBtn btn btn-outline-primary btn-sm\">수정</button> "
									+ "		<button type=\"button\" class=\"delBtn btn btn-outline-danger btn-sm\">삭제</button></td>"
									+ "</tr>"

									+ "<tr id=\"mview_" + user.email + "\" data-id=\"" + user.email + "\" style=\"display: none;\">"
									+ "	<td>"
									+ user.email
									+ "</td>"
									+ "	<td><input type=\"text\" name=\"userpwd\" id=\"userpwd" + user.email + "\" value=\"" + user.userpwd + "\"></td>"
									+ "	<td><input type=\"text\" name=\"userLname\" id=\"userLname" + user.email + "\" value=\"" + user.userLname + "\"></td>"
									+ "	<td><input type=\"text\" name=\"userFname\" id=\"userFname" + user.email + "\" value=\"" + user.userFname + "\"></td>"
									+ "	<td><button type=\"button\" class=\"modifyBtn btn btn-primary btn-sm\">수정</button> "
									+ "		<button type=\"button\" class=\"cancelBtn btn btn-danger btn-sm\">취소</button></td>"
									+ "</tr>";

							$("#userlist").append(str);
						});//each
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="member_list_bg">
		<div class="container table-bg" align="center">
			<h1>회원 목록</h1>
			<div align="right">
				<button type="button" class="btn-register" data-toggle="modal"
					data-target="#userRegModal">등록</button>
			</div>
			<table class="table table-hover text-center table-spacing">
				<colgroup>
					<col width="30%">
					<col width="20%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">이메일</th>
						<th class="text-center">비밀번호</th>
						<th class="text-center">성</th>
						<th class="text-center">이름</th>
						<th class="text-center">수정/삭제</th>
					</tr>
				</thead>
				<tbody id="userlist"></tbody>
			</table>
		</div>
		<!-- container -->
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
							<label for="email">이메일</label><br> <input type="text"
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

	<!-- 회원 정보 모달 -->
	<%-- <div class="modal" id="userViewModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       	<table class="table table-bordered">
            <colgroup>
                <col width="120">
                <col width="*">
                <col width="120">
                <col width="*">
            </colgroup>
            <tbody>
            <tr>
                <th class="text-center">ID</th>
                <td class="text-left" id="vid"></td>
                <th class="text-center">회원명</th>
                <td class="text-left" id="vname"></td>
            </tr>
            <tr>
            	<th class="text-center">이메일</th>
                <td class="text-left" id="vemail"></td>
                <th class="text-center">가입일</th>
                <td class="text-left" id="vjoindate"></td>
            </tr>
            <tr>
                <th class="text-center">주소</th>
                <td class="text-left" colspan="3" id="vaddress"></td>
            </tr>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div> --%>

</body>
	</html>
</c:if>