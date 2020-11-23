<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				//회원 목록
				$.ajax({
					url : '${root}/board/boards',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(boards) {
						makeList(boards);
					},
					error : function(xhr, status, msg) {
						console.log("상태값 : " + xhr.status + " Http에러메시지 : "
								+ xhr.responseText);
					}
				});

				$("#registerBtn").click(
						function() {
							let registerinfo = JSON.stringify({
								"title" : $("#title").val(),
								"content" : $("#content").val(),
								"writer" : $("#writer").val(),
								"regtime" : $("#regtime").val(),
							});
							console.log("여기까지는 된다");
							$.ajax({
								url : '${root}/user/regi',
								type : 'POST',
								contentType : 'application/json;charset=utf-8',
								dataType : 'json',
								data : registerinfo,
								success : function(boards) {
									$("#no").val('');
									$("#writer").val('');
									$("#regtime").val('');
									$("#title").val('');
									$("#userRegModal").modal("hide");
									makeList(boards);
								},
								error : function(xhr, status, msg) {
									console.log("상태값 : " + status
											+ " Http에러메시지 : " + msg);
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
				$(document).on(
						"click",
						".modifyBtn",
						function() {
							let mid = $(this).parents("tr").attr("data-id");
							let modifyinfo = JSON.stringify({
								"no" : mid,
								"title" : $("#title" + mid).val(),
								"writer" : $("#writer" + mid).val(),
								"regtime" : $("#regtime" + mid).val()
							});
							$.ajax({
								url : '${root}/user/modi',
								type : 'PUT',
								contentType : 'application/json;charset=utf-8',
								dataType : 'json',
								data : modifyinfo,
								success : function(boards) {
									makeList(boards);
								},
								error : function(xhr, status, msg) {
									console.log("상태값 : " + status
											+ " Http에러메시지 : " + msg);
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
				$(document).on("click", ".delBtn", function() {
					if (confirm("정말 삭제?")) {
						let delid = $(this).parents("tr").attr("data-id");
						$.ajax({
							url : '${root}/user/delete/' + delid,
							type : 'DELETE',
							contentType : 'application/json;charset=utf-8',
							dataType : 'json',
							success : function(boards) {
								makeList(boards);
							},
							error : function(xhr, status, msg) {
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

	function makeList(boards) {
		$("#boardlist").empty();

		$(boards)
				.each(
						function(index, board) {
							let str = "<tr id=\"view_" + board.no + "\" class=\"view\" data-id=\"" + board.no + "\">"
									+ "	<td>"
									+ board.no
									+ "</td>"
									+ "	<td>"
									+ board.title
									+ "</td>"
									+ "	<td>"
									+ board.writer
									+ "</td>"
									+ "	<td>"
									+ board.regtime
									+ "</td>"
									+ "	<td><button type=\"button\" class=\"modiBtn btn btn-outline-primary btn-sm\">수정</button> "
									+ "		<button type=\"button\" class=\"delBtn btn btn-outline-danger btn-sm\">삭제</button></td>"
									+ "</tr>"

									+ "<tr id=\"mview_" + board.no + "\" data-id=\"" + board.no + "\" style=\"display: none;\">"
									+ "	<td>"
									+ board.no
									+ "</td>"
									+ "	<td><input type=\"text\" name=\"title\" id=\"title" + board.no + "\" value=\"" + board.title + "\"></td>"
									+ "	<td><input type=\"text\" name=\"writer\" id=\"writer" + board.no + "\" value=\"" + board.writer + "\"></td>"
									+ "	<td><input type=\"text\" name=\"regtime\" id=\"regtime" + board.no + "\" value=\"" + board.regtime + "\"></td>"
									+ "	<td><button type=\"button\" class=\"modifyBtn btn btn-primary btn-sm\">수정</button> "
									+ "		<button type=\"button\" class=\"cancelBtn btn btn-danger btn-sm\">취소</button></td>"
									+ "</tr>";

							$("#boardlist").append(str);
						});//each
	}
</script>
</head>
<body>
	<script>
		document.title = 'HAPPY HOUSE';
	</script>
	<%@ include file="header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div id="member_list_bg">
					<div class="container table-bg" align="center">
						<h1>Q&A 게시판</h1>
						<div align="right">
							<button type="button" class="btn-register">질문 등록</button>
						</div>
						<table class="table table-hover text-center table-spacing">
							<colgroup>
								<col width="15%">
								<col width="40%">
								<col width="25%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">질문 제목</th>
									<th class="text-center">질문자</th>
									<th class="text-center">날짜</th>
									
								</tr>
								<tr>
									<td>${postDetailRespDto.no }</td>
									<td>${postDetailRespDto.title }</td>
									<td>${postDetailRespDto.writer }</td>
									<td>${postDetailRespDto.regtime }</td>
									
								</tr>
								<tr>
									<td colspan="4" rowspan="2">${postDetailRespDto.content }</td>
								</tr>
								<tr>
								</tr>
							</thead>
						</table>
						
						<%-- <table class="table table-hover text-center table-spacing">
							<colgroup>
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">질문 제목</th>
									<th class="text-center">질문자</th>
									<th class="text-center">날짜</th>
									<th class="text-center">내용</th>
								</tr>
							</thead>
							<tbody>
							  <tr>
						        <td><input id="no" type="text" value="${postDetailRespDto.no }" readonly="readonly"></td>
						        <td><input id="title" type="text" value="${postDetailRespDto.title }" readonly="readonly"></td>
						        <td><input id="writer" type="text" value="${postDetailRespDto.writer}" readonly="readonly"></td>
						        <td><input id="regdate" type="text" value="${postDetailRespDto.regtime}" readonly="readonly"></td>
						        <td><input id="content" type="text" value="${postDetailRespDto.content }" readonly="readonly"></td>
						      </tr>
							</tbody>
						</table> --%>
					</div>
					<!-- container -->
				</div>

			</main>
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>


	<script src="${root }/assets/demo/datatables-demo.js"></script>
	
</body>
	</html>
</c:if>