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

<!-- Custom styles for this template -->
<link href="${root}/css/styles.css" rel="stylesheet" />
<link href="${root }/css/search.css" rel="stylesheet">

<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body class="sb-nav-fixed">
	<%@ include file="header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<h1 class="mt-4">관심목록</h1>

				<c:choose>
					<c:when test="${!empty result}">
						<!-- 게시글 뿌리기 -->
						<div class="result-cards">
							<c:forEach var="item" items="${result}">
								<div class="col-lg-3 col-sm-5 portfolio-item">
									<div class="card h-150">
										<a href="${root}/map/detailedInfo?no=${item.aptNo}" target="blank">
											<!-- 링크 바꾸기  -->
											<img class="card-img-top" src="${root }/img/2.jpg" alt="">
										</a>
										<div class="card-body">
											<h4 class="card-title">
												${item.dongName }
												<br>
												<a href="${root}/map/detailedInfo?no=${item.aptNo}"> ${item.aptName} </a>
											</h4>
											<span id="${item.no}" class="heart liked"><i class="fa fa-heart" aria-hidden="true"></i> </span>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</c:when>
					<c:otherwise>
							검색 결과가 없습니다.			
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 게시글 뿌리기 -->
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$(".heart").click(function() {
				var val = "#" + $(this).attr('id');
				console.log(val);

				if ($(val).hasClass("liked")) {
					$(val).html('<i class="far fa-heart" aria-hidden="true"></i>');
					
					$ajax({
					    type : "POST",
					    url : "${root}/interests/delete", 
					    data : {
					    	aptNo : "${aptNo}"
					    }
					    success : function() {
							console.log("success");
							$(val).removeClass("liked");
					    }
					})
				} else {
					$(val).html('<i class="fa fa-heart" aria-hidden="true"></i>');
					$(val).addClass("liked");
				}
			});
		});
	</script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${root }/assets/demo/datatables-demo.js"></script>
</body>
</html>
