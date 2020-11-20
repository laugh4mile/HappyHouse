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

<link href="${root }/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />

<!-- Custom styles for this template -->
<link href="${root }/css/search.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<script src="${root }/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="${root }/assets/demo/datatables-demo.js"></script>

<script type="text/javascript">
	function searchSomething() {
		if (document.getElementById("word").value == "") {
			alert("검색어 입력!!!");
			return;
		} else {
			document.getElementById("searchform").action = "${root}/map";
			document.getElementById("searchform").submit();
		}
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div id="layoutSidenav_content">

			<div class="container-fluid">
				<h1 class="mt-4">${word}검색결과</h1>


				<!-- 검색 결과 내  검색하기 -->
				<div class="search-bar">
					<div class="button-group">
						<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
							방 종류 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" id="roomtype">
							<li><input type="checkbox" checked="checked" value="apt" id="apt" /> &nbsp;아파트</li>
							<li><input type="checkbox" checked="checked" value="ju" id="ju" /> &nbsp;주택</li>
						</ul>
					</div>
					<div class="button-group">
						<button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
							매물 종류 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" id="estatetytpe">
							<li><input type="checkbox" checked="checked" value="meme" id="meme" /> &nbsp;매매</li>
							<li><input type="checkbox" checked="checked" value="rent" id="rent" /> &nbsp;전/월세</li>
						</ul>
					</div>
				</div>
				<!-- 검색 결과 내  검색하기 -->

				<!-- 게시글 뿌리기 -->
				<div class="result-cards">
					<c:if test="${!empty AptMeme}">
						<c:forEach var="item" items="${AptMeme}">
							<div class="col-lg-3 col-sm-5 portfolio-item AptMeme">
								<div class="card h-150">
									<a href="${root}/" target="blank">
										<!-- 링크 바꾸기  -->
										<img class="card-img-top" src="https://via.placeholder.com/100X150" alt="">
									</a>
									<div class="card-body">
										<h4 class="card-title">
											<p>아마트매매</p>
											<a href="${root}/map/detailedInfo">
												<!-- 파라미터로 뭘 보내는게 좋을까?  -->
												${item.aptName}
											</a>
										</h4>
										<p class="card-text">${item.dealAmount}만원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${!empty AptRent}">
						<c:forEach var="item" items="${AptRent}">
							<div class="col-lg-3 col-sm-5 portfolio-item AptRent">
								<div class="card h-150">
									<a href="${root}/" target="blank">
										<!-- 링크 바꾸기  -->
										<img class="card-img-top" src="https://via.placeholder.com/100X150" alt="">
									</a>
									<div class="card-body">
										<h4 class="card-title">
											<p>아파트 전월세</p>
											<a href="${root}/map/detailedInfo">
												<!-- 파라미터로 뭘 보내는게 좋을까? -->
												${item.aptName}
											</a>
										</h4>
										<p class="card-text">${item.dealAmount}만원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${!empty JuMeme}">
						<c:forEach var="item" items="${JuMeme}">
							<div class="col-lg-3 col-sm-5 portfolio-item JuMeme">
								<div class="card h-150">
									<a href="${root}/" target="blank">
										<!-- 링크 바꾸기  -->
										<img class="card-img-top" src="https://via.placeholder.com/100X150" alt="">
									</a>
									<div class="card-body">
										<h4 class="card-title">
											<p>주택 매매</p>
											<a href="${root}/}">
												<!-- 링크 바꾸기  -->
												${item.aptName}
											</a>
										</h4>
										<p class="card-text">${item.dealAmount}만원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${!empty JuRent}">
						<c:forEach var="item" items="${JuRent}">
							<div class="col-lg-3 col-sm-5 portfolio-item JuRent">
								<div class="card h-150">
									<a href="${root}/" target="blank">
										<!-- 링크 바꾸기  -->
										<img class="card-img-top" src="https://via.placeholder.com/100X150" alt="">
									</a>
									<div class="card-body">
										<h4 class="card-title">
											<p>주택 전월세</p>
											<a href="${root}/}">
												<!-- 링크 바꾸기  -->
												${item.aptName}
											</a>
										</h4>
										<p class="card-text">${item.dealAmount}만원</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>


				</div>
				<!-- 게시글 뿌리기 -->

			</div>

			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#apt").change(function() {
			if ($("#apt").is(":checked")) {
				$(".AptMeme").show();
				$(".AptRent").show();

			} else {
				$(".AptMeme").hide();
				$(".AptRent").hide();
			}
		});

		$("#ju").change(function() {
			if ($("#ju").is(":checked")) {
				$(".JuMeme").show();
				$(".JuRent").show();

			} else {
				$(".JuMeme").hide();
				$(".JuRent").hide();
			}
		});

		$("#meme").change(function() {
			if ($("#meme").is(":checked")) {
				$(".AptMeme").show();
				$(".JuMeme").show();

			} else {
				$(".AptMeme").hide();
				$(".JuMeme").hide();
			}
		});

		$("#rent").change(function() {
			if ($("#rent").is(":checked")) {
				$(".AptRent").show();
				$(".JuRent").show();

			} else {
				$(".AptRent").hide();
				$(".JuRent").hide();
			}
		});
	});
</script>
</html>