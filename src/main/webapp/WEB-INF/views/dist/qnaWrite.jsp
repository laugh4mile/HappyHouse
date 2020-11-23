<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Happy House</title>

<link rel="stylesheet" href="${root}/css/style_hyunsoo.css">
<link href="${root}/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
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
					<div id="member_list_bg">
						<div class="container table-bg" align="center">
							<h1>질문 등록</h1>
							<div class="col-md-10 col-lg-8 col-xl-7 mx-auto search-bar">
								<form id="memberform" method="post" action="">
									<input type="hidden" name="act" id="act" value="">
									<div class="form-group" align="left">
										<label for="title">제목</label> <input type="text" class="form-control" id="title" name="title" placeholder="">
									</div>
									<div class="form-group" align="left">
										<label for="content">내용</label>
									</div>
											<textarea rows="100%" cols="100%" id="content" name="content" placeholder="" style="padding: 0; border: "></textarea> 
									<div class="form-group" align="center">
										<button type="button" class="btn btn-primary" id="registerBtn">등록하기</button>
										<button type="reset" class="btn btn-warning">초기화</button>
									</div>
								</form>
							</div>
						</div>
						<!-- container -->
					</div>
					<!-- nav search bar 부분 수정 : jh -->

					<!-- nav search bar 부분 수정 : jh -->

				</div>
			</main>
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${root }/assets/demo/datatables-demo.js"></script>

</body>
</html>