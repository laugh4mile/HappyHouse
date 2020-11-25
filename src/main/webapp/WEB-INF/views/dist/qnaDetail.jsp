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
/* 									makeList(boards);
 */								},
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
					console.log("수정까진 오나?");
					console.log(${postDetailRespDto.no});
					$("#view_" + ${postDetailRespDto.no}).css("display", "none");
					$("#view_" + ${postDetailRespDto.no}+"_content").css("display", "none");
					$("#mview_" + ${postDetailRespDto.no}).css("display", "");
					$("#mview_" + ${postDetailRespDto.no}+"_content").css("display", "");
				});

				// 회원 정보 수정 실행.
				$(document).on(
						"click",
						".modifyBtn",
						function() {
							let mid = ${postDetailRespDto.no};
							let modifyinfo = JSON.stringify({
								"no" : ${postDetailRespDto.no},
								"title" : $("#title" + mid).val(),
								/* "writer" : $("#writer" + mid).val(), */
								"writer" : "${userinfo.email}",
								"content" : $("#content" + mid).val(),
							});
							console.log(mid);
							console.log($("#title" + mid).val());
							console.log($("#writer" + mid).val());
							console.log($("#content" + mid).val());
							console.log(modifyinfo);
							$.ajax({
								url : '${root}/board/modi',
								type : 'PUT',
								contentType : 'application/json;charset=utf-8',
								dataType : 'json',
								data : modifyinfo,
								success : function(boards) {
									location.href = '${root}/board/'+mid;
								},
								error : function(xhr, status, msg) {
									console.log("상태값 : " + status
											+ " Http에러메시지 : " + msg);
								}
							});
						});
				// 회원 정보 수정 취소.
				$(document).on("click", ".cancelBtn", function() {
					$("#view_" + ${postDetailRespDto.no}).css("display", "");
					$("#view_" + ${postDetailRespDto.no}+"_content").css("display", "");
					$("#mview_" + ${postDetailRespDto.no}).css("display", "none");
					$("#mview_" + ${postDetailRespDto.no}+"_content").css("display", "none");
				});
				// 회원 탈퇴.
				$(document).on("click", ".delBtn", function() {
					if (confirm("정말 삭제?")) {
						let delid = ${postDetailRespDto.no};
						$.ajax({
							url : '${root}/board/delete/' + delid,
							type : 'DELETE',
							contentType : 'application/json;charset=utf-8',
							dataType : 'json',
							success : function(boards) {
								location.href = '${root}/board/list';
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
							<button type="button" class="modiBtn btn btn-outline-primary btn-sm">수정</button>
							<button type="button" class="delBtn btn btn-outline-danger btn-sm">삭제</button>
						</div>
						<table class="table table-hover text-center table-spacing">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">번호</th>
									<th class="text-center">제목</th>
									<th class="text-center">작성자</th>
									<th class="text-center">날짜</th>
									<th class="text-center">수정/삭제</th>
									
								</tr>
								<tr id="view_${postDetailRespDto.no}" class="view" data-id="${postDetailRespDto.no}">
									<td>${postDetailRespDto.no }</td>
									<td>${postDetailRespDto.title }</td>
									<td>${postDetailRespDto.writer }</td>
									<td>${postDetailRespDto.regtime }</td>
								</tr>
								<tr id="view_${postDetailRespDto.no}_content" class="view" data-id="${postDetailRespDto.no}">
									<td colspan="4">${postDetailRespDto.content }</td>
								</tr>
								
								
								<tr id="mview_${postDetailRespDto.no}" data-id="${postDetailRespDto.no}" style="display: none;">
									<!-- <td><input type=\"text\" name=\"title\" id=\"title" + board.no + "\" value=\"" + board.title + "\"></td> -->
									<td>${postDetailRespDto.no }</td>
									<td> <input type="text" name="title${postDetailRespDto.no}" id="title${postDetailRespDto.no}" value="${postDetailRespDto.title}"></td>
									<td>${postDetailRespDto.writer }</td>
									<td>${postDetailRespDto.regtime }</td>
									<td>
										<button type="button" class="modifyBtn btn btn-primary btn-sm">수정</button> 
										<button type="button" class="cancelBtn btn btn-danger btn-sm">취소</button>
									</td>
									
								</tr>
								<tr id="mview_${postDetailRespDto.no}_content" data-id="${postDetailRespDto.no}" style="display: none;">
									<td colspan="4"> <textarea rows="10%" cols="60%" id="content${postDetailRespDto.no}" name="content${postDetailRespDto.no}" placeholder="$" style="padding: 0;">${postDetailRespDto.content }</textarea>
									</td>
								</tr>
								
								
								<tr>
								</tr>
							</thead>
						</table>
						
					</div>
					<!-- container -->
					<!--  댓글  -->
					<div class="container">
						<label for="content">comment</label>
						<form name="commentInsertForm">
							<div class="input-group">
								<input type="hidden" name="bno" value="${postDetailRespDto.no}" /> 
								<input type="hidden" name="writer" value="${postDetailRespDto.writer}" /> 
								<input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."> <span class="input-group-btn">
									<button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
								</span>
							</div>
						</form>
					</div>

					<div class="container">
				        <div class="commentList"></div>
				    </div>


				</div>
				<%@ include file="commentS.jsp" %>
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