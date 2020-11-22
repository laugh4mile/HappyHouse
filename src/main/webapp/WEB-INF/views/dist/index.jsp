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

<link href="${root}/css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
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