<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Happy House</title>

<link rel="stylesheet" href="${root}/css/style_hyunsoo.css">
<link href="${root}/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
	
<script type="text/javascript">
	$(document).ready(
			function() {
				//회원 목록
				$.ajax({
					url : '${root}/notice/boards',
					type : 'GET',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					success : function(boards) {
						makeList(boards);
					},
					error : function(xhr, status, msg) {
						/* console.log("상태값 : " + xhr.status + " Http에러메시지 : "
								+ xhr.responseText); */
					}
				});

				
				
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

		$(boards).each(function(index, board) {
			let str = "<tr id=\"view_" + board.no + "\" class=\"view\" data-id=\"" + board.no + "\">"
					+ "	<td>"
					+ board.no
					+ "</td>"
					+ "	<td> <a href=\"${root}/notice/"+board.no+"\" >"
					+ board.title
					+ "</a> </td>"
					+ "	<td>"
					+ board.writer
					+ "</td>"
					+ "	<td>"
					+ board.regtime
					+ "</td>"
					/* + "	<td><button type=\"button\" class=\"modiBtn btn btn-outline-primary btn-sm\">수정</button> "
					+ "		<button type=\"button\" class=\"delBtn btn btn-outline-danger btn-sm\">삭제</button></td>"
					+ "</tr>" */
	
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
<body class="sb-nav-fixed">
	<%-- title name update (anonymous character)  --%>
	<script>
		document.title = 'HAPPY HOUSE';
	</script>
	<%-- <jsp:include page="header.jsp"/> --%>
	<%@ include file="header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid">
					<h1 class="mt-4"
						style="color: white; font-size: 6em; text-align: center">Happy
						House</h1>

					<!-- nav search bar 부분 수정 : jh -->
					<div class="col-md-10 col-lg-8 col-xl-7 mx-auto search-bar">
						<form class="ml-auto mr-0 mr-md-3 my-2 my-md-0" id="searchform"
							method="get" action="${root}/map/searchResult">
							<div class="form-row">
								<select class="col-12 col-md-3 form-control" name="key" id="key">
									<option value="dong" selected="selected">동 이름 검색</option>
									<option value="name">아파트/주택 이름 검색</option>
								</select>
								<div class="col-12 col-md-6 mb-2 mb-md-0">
									<input type="text" name="word"
										class="form-control form-control-lg" placeholder="">
								</div>
								<div class="col-12 col-md-3">
									<button type="submit" class="btn btn-block btn-lg btn-primary">Search!</button>
								</div>
							</div>
						</form>
					</div>
					<!-- nav search bar 부분 수정 : jh -->
					<div id="member_list_bg">
					<div class="container table-bg" align="center">
						<h1>공지 사항</h1>
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
									<th class="text-center">제목</th>
									<th class="text-center">작성자</th>
									<th class="text-center">날짜</th>
								</tr>
							</thead>
							<tbody id="boardlist"></tbody>
						</table>
						<div align="right">
							<button type="button" class="btn-register" onclick="location.href='${root}/notice/goWrite'">등록</button>
						</div>
					</div>
					<!-- container -->
				</div>
				</div>
			</main>
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
	<script src="${root }/assets/demo/datatables-demo.js"></script>

</body>
</html>