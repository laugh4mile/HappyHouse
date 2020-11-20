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

			<!-- Navigation -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
				<div class="container">
					<a class="navbar-brand js-scroll-trigger" href="./index.jsp">Home</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">상세정보</a></li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">위치 및 주변 시설</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<header class="bg-primary text-white">
				<div class="container text-center">

					<h1>${info.aptName}</h1>
					<p class="lead" id="dong">${info.dong}</p>
					<p class="lead"></p>
				</div>
			</header>

			<section id="about">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<h2>상세정보</h2>
							<img class="card-img" src="./res/img/숭인동숭인한양LEEPS.jfif" alt="">
							<table class="table">
								<tbody>
									<tr>
										<th>아파트명</th>
										<td id="aptName">${info.aptName}</td>
										<th>건축년도</th>
										<td>${info.buildYear}</td>
									</tr>
									<tr>
										<th>전용면적</th>
										<td>${info.area}</td>
										<th>지번</th>
										<td id="jibun">${info.jibun}</td>
									</tr>
									<tr>
										<th>거래금액</th>
										<td>${info.dealAmount}</td>
										<th>계약일</th>
										<td>${info.dealYear}.${info.dealMonth}.${info.dealDay}</td>
									</tr>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</section>

			<section id="contact">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 mx-auto">
							<h2>위치 및 주변 시설</h2>
							<%-- ===================================시구군읍면동구글맵================================== --%>
							<section id="index_section">
								<div class="card col-sm-12 mt-1" style="min-height: 400px;">
									<div class="card-body">
										<div id="map" style="width: 100%; height: 400px; margin: auto;"></div>
										<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>

										<!-- googlemap -->
										<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCv11tfo3HU5dxZAQ6uC5s9AeB_Ux46x7k&callback=initMap"></script>
										<script>
											
										</script>
									</div>
								</div>
							</section>
							<%-- ===================================시구군읍면동구글맵================================== --%>
							<div>
								<ul class="nav nav-pills">
									<li class="active"><a class="nav-link active" data-toggle="pill" href="#menu1">편의시설</a></li>
									<li><a class="nav-link" data-toggle="pill" href="#menu2">안전시설</a></li>
									<li><a class="nav-link" data-toggle="pill" href="#menu3">학군정보</a></li>
								</ul>
								<div class="tab-content">
									<div id="menu1" class="tab-pane active">
										<h3>편의시설</h3>
										<ul class="tap-item">
											<li>지하철역</li>
											<li>마트</li>
											<li>편의점</li>
											<li>은행</li>
											<li>약국</li>
										</ul>
									</div>
									<div id="menu2" class="tab-pane fade">
										<h3>안전시설</h3>
										<ul class="tap-item">
											<li>경찰서/파출소</li>
											<li>CCTV</li>
										</ul>
									</div>
									<div id="menu3" class="tab-pane fade">
										<h3>학군정보</h3>
										<ul class="tap-item">
											<li>어린이집</li>
											<li>유치원</li>
											<li>초등학교</li>
											<li>중학교</li>
											<li>고등학교</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
<script>
	var map;

	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 12
		});
	}

	$(document).ready(function() {
		$("#signBtn").click(function() {
			$("#loggedout").css("display", "none");
			$("#loggedin").css("display", "block");
		});

		//======================================  맵 스크립트 ====================// 	
		$(document).ready(function() {
			//marker 생성

			geocode();
		});//ready

		function geocode() {
			let idx = 0;
			let tmpLat;
			let tmpLng;
			var dong = document.getElementById("dong").innerText
			var aptName = document.getElementById("aptName").innerText
			var jibun = document.getElementById("jibun").innerText

			$.get("https://maps.googleapis.com/maps/api/geocode/json", {
				key : 'AIzaSyCv11tfo3HU5dxZAQ6uC5s9AeB_Ux46x7k',
				address : dong + "+" + aptName + "+" + jibun
			}, function(data, status) {
				tmpLat = data.results[0].geometry.location.lat;
				tmpLng = data.results[0].geometry.location.lng;

				//지도에 marker 추가
				addMarker(tmpLat, tmpLng, aptName);
			}, "json");//get
		}
	})

	function addMarker(tmpLat, tmpLng, aptName) {
		var multi = {
			lat : parseFloat(tmpLat),
			lng : parseFloat(tmpLng)
		};

		map = new google.maps.Map(document.getElementById('map'), {
			center : multi,
			zoom : 12
		});

		var marker = new google.maps.Marker({
			position : new google.maps.LatLng(parseFloat(tmpLat),
					parseFloat(tmpLng)),
			label : aptName,
			title : aptName
		});

		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			callHouseDealInfo();
		});
		marker.setMap(map);
	}
</script>
</html>