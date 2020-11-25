<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
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

<!-- 카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0f81655e444c4cae90021cdf7832a59"></script>

</head>
<body class="sb-nav-fixed">
	<%@ include file="header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<div class="container-fluid">
				<h1 class="mt-4" style="position: fixed;">${word}검색결과</h1>

				<c:choose>
					<c:when test="${!empty result}">
						<div style="float: left; position: fixed; width: 50%; margin-top: 100px;">
							<div id="map" style="width: 800px; height: 700px;"></div>
						</div>

						<div style="float: right; width: 50%;">
							<!-- 검색 결과 내  검색하기 -->
							<div class="searchResult-bar" style="margin-top: 50px;">
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


								<c:forEach var="item" items="${result}">
									<!-- 아파트 매매 / 아파트 전월세 / 주택 매매 / 주택 전월세를  type을 통해 구별해내기 -->

									<%
										//1~8까지의 등급을 랜덤으로 발생시킴								
									int ranSu = (new Random().nextInt(8)) + 1;
									%>

									<c:choose>
										<c:when test="${item.type == 1}">
											<div class="col-lg-6 col-sm-5 portfolio-item AptMeme">
												<div class="card h-150">
													<a href="${root}/map/detailedInfo?no=${item.no}">
														<!-- 링크 바꾸기  -->
														<img class="card-img-top" src="<%=request.getContextPath()%>/img/<%=ranSu%>.jpg" alt="">
													</a>
													<div class="card-body">
														<h4 class="card-title">
															아마트매매
															<br>
															<a href="${root}/map/detailedInfo?no=${item.no}">
																<!-- 파라미터로 뭘 보내는게 좋을까?  -->
																${item.aptName}
															</a>
														</h4>
														<p class="card-text">${item.dealAmount}만원</p>
														<div id="email_${item.no}" style="display: none;">${userinfo.email}</div>
														<div id="aptNo_${item.no}" style="display: none;">${item.no}</div>
														<span id="${item.no}" class="heart"><i class="far fa-heart" aria-hidden="true"></i> </span>
													</div>
												</div>
											</div>
										</c:when>

										<c:when test="${item.type == 3}">
											<div class="col-lg-6 col-sm-5 portfolio-item AptRent">
												<div class="card h-150">
													<a href="${root}/map/detailedInfo?no=${item.no}">
														<!-- 링크 바꾸기  -->
														<img class="card-img-top" src="<%=request.getContextPath()%>/img/<%=ranSu%>.jpg" alt="">
													</a>
													<div class="card-body">
														<h4 class="card-title">
															아파트 전/월세
															<br>
															<a href="${root}/map/detailedInfo?no=${item.no}">
																<!-- 파라미터로 뭘 보내는게 좋을까?  -->
																${item.aptName}
															</a>
														</h4>
														<p class="card-text">${item.dealAmount}만원</p>
														<div id="email_${item.no}" style="display: none;">${userinfo.email}</div>
														<div id="aptNo_${item.no}" style="display: none;">${item.no}</div>
														<span id="${item.no}" class="heart"><i class="far fa-heart" aria-hidden="true"></i> </span>
													</div>
												</div>
											</div>
										</c:when>

										<c:when test="${item.type == 2}">
											<div class="col-lg-6 col-sm-5 portfolio-item JuMeme">
												<div class="card h-150">
													<a href="${root}/map/detailedInfo?no=${item.no}">
														<!-- 링크 바꾸기  -->
														<img class="card-img-top" src="<%=request.getContextPath()%>/img/<%=ranSu%>.jpg" alt="">
													</a>
													<div class="card-body">
														<h4 class="card-title">
															주택 매매
															<br>
															<a href="${root}/map/detailedInfo?no=${item.no}">
																<!-- 파라미터로 뭘 보내는게 좋을까?  -->
																${item.aptName}
															</a>
														</h4>
														<p class="card-text">${item.dealAmount}만원</p>
														<div id="email_${item.no}" style="display: none;">${userinfo.email}</div>
														<div id="aptNo_${item.no}" style="display: none;">${item.no}</div>
														<span id="${item.no}" class="heart"><i class="far fa-heart" aria-hidden="true"></i> </span>
													</div>
												</div>
											</div>
										</c:when>

										<c:when test="${item.type == 4}">
											<div class="col-lg-6 col-sm-5 portfolio-item JuRent">
												<div class="card h-150">
													<a href="${root}/map/detailedInfo?no=${item.no}">
														<!-- 링크 바꾸기  -->
														<img class="card-img-top" src="<%=request.getContextPath()%>/img/<%=ranSu%>.jpg" alt="">
													</a>
													<div class="card-body">
														<h4 class="card-title">
															주택 전/월세
															<br>
															<a href="${root}/map/detailedInfo?no=${item.no}">
																<!-- 파라미터로 뭘 보내는게 좋을까?  -->
																${item.aptName}
															</a>
														</h4>
														<p class="card-text">${item.dealAmount}만원</p>
														<div id="email_${item.no}" style="display: none;">${userinfo.email}</div>
														<div id="aptNo_${item.no}" style="display: none;">${item.no}</div>
														<span id="${item.no}" class="heart"><i class="far fa-heart" aria-hidden="true"></i> </span>
													</div>
												</div>
											</div>
										</c:when>

									</c:choose>
								</c:forEach>

							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div style="margin-top: 100px;">검색 결과가 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 게시글 뿌리기 -->
			<%@ include file="footer.jsp"%>
		</div>
	</div>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${root }/assets/demo/datatables-demo.js"></script>
</body>
<script>
	var mapContainer;
	var mapOption;
	var map;
	var link;
	
	let tmpLat;
	let tmpLng;

	<c:if test="${!empty result}">
		$.get("https://maps.googleapis.com/maps/api/geocode/json", {
			key : 'AIzaSyCv11tfo3HU5dxZAQ6uC5s9AeB_Ux46x7k',
			address : "${result[0].dong}+${result[0].aptName}+${result[0].jibun}"
		}, function(data, status) {
			
			tmpLat = data.results[0].geometry.location.lat;
			tmpLng = data.results[0].geometry.location.lng;

			mapContainer = document.getElementById('map'); // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(tmpLat, tmpLng), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};			
			
			map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		}, "json");//get
		
		<c:forEach var="item" items="${result}">
		link = "${item.no}";
		$.get("https://maps.googleapis.com/maps/api/geocode/json", {
			key : 'AIzaSyCv11tfo3HU5dxZAQ6uC5s9AeB_Ux46x7k',
			address : "${item.dong}+${item.aptName}+${item.jibun}"
		}, function(data, status) {
			tmpLat = data.results[0].geometry.location.lat;
			tmpLng = data.results[0].geometry.location.lng;

			var address = new Array();
			address.title = "${item.aptName}";
			address.latlng = new kakao.maps.LatLng(tmpLat, tmpLng);

			addMarker(address);
		}, "json");//get
		</c:forEach>		
	</c:if>

	// 카카오 지도에 마커 찍기
	function addMarker(positions) {
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		var imageSize = new kakao.maps.Size(24, 35);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions.latlng, // 마커를 표시할 위치
			title : positions.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		});
		
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
			location.href="${root}/map/detailedInfo?no="+link;
		});
	}

	//-------------------아파트/주택, 매매/전월세 별로 보기 ---------------------//

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
	
	//-------------------아파트/주택, 매매/전월세 별로 보기 ---------------------//
	
	//------------------- 관심목록 등록/해제 ---------------------//
	
		$(document).ready(function() {
			$(".heart").click(function() {
				var no = $(this).attr('id');
				var val = "#" + $(this).attr('id');
				var email = $("#email_" + no).text();
				var aptNo = $("#aptNo_" + no).text();

				console.log(val);
				console.log(email);
				console.log(aptNo);

				if ($(val).hasClass("liked")) {
					var del;
					del=confirm("관심목록에서 삭제할까요?");
					if(del){
						$.ajax({
							type : "delete",
							url : "${root}/interests/delete/",
							data : {
								"email" : email,
								"aptNo" : aptNo,
							},
							success : function(response) {
								$(val).html('<i class="far fa-heart" aria-hidden="true"></i>');
								$(val).removeClass("liked");
								alert("관심목록에서 삭제했습니다.");
							}
						})
					}
				} else {
					$.ajax({
						type : "post",
						url : "${root}/interests/insert",
						data : {
							"email" : email,
							"aptNo" : aptNo,
						},
						success : function(response) {
							$(val).html('<i class="fa fa-heart" aria-hidden="true"></i>');
							$(val).addClass("liked");
							alert("관심목록에 추가해습니다.\n 관심목록은 마이페이지>관심목록 조회로 찾아볼 수 있습니다.");
						}
					})
				}
			});
		});
	
	//------------------- 관심목록 등록/해제 ---------------------//

	
</script>
</html>