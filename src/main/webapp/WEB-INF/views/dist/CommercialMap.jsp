<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>
<link href="${root}/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>

<!-- 카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0f81655e444c4cae90021cdf7832a59"></script>

<script type="text/javascript">
	let colorArr = [ 'table-primary', 'table-success', 'table-danger' ];
	$(document).ready(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/commercial',
			post : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			success : function(data, status) {
				$.each(data, function(index, vo) {
					$("#sido").append("<option value='"+vo.sidoCode+"'>" + vo.sidoName + "</option>");
				});//each
			}
		})
	});//ready
	$(document).ready(function() {
		$("#sido").change(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/commercial/' + $("#sido").val(),
				post : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(data, status) {
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugunCode+"'>" + vo.gugunName + "</option>");
					});//each
				}
			})
		});//change
		$("#gugun").change(function() {
			$.ajax({
				url : '${root}/commercial/' + $("#sido").val() + '/' + $("#gugun").val(),
				post : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(data, status) {
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>" + vo.dong + "</option>");
					});//each
				}//function
			})
		});//change
		$("#dong").change(function() {
			$.ajax({
				url : '${root}/commercial/' + $("#sido").val() + '/' + $("#gugun").val() + '/' + $("#dong").val(),
				post : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(data, status) {
					initMarkers(markers);

					$("#searchResult").empty();
					$.each(data, function(index, vo) {
						
						let str = "<tr class=" + colorArr[index % 3] + ">" + "<td>" + vo.no + "</td>" + "<td>" + vo.codename3 + "</td>" + "<td>" + vo.shopname + "</td>" + "<td>" + vo.address + "</td>" + "<td>" + vo.postcode + "</td>";
						$("#searchResult").append(str);
						
						addMarker(vo.shopname, vo.lat, vo.lng);
						/* // ------------- 해당 아파트의 좌표 가져오기 --------------- //
						let tmpLat;
						let tmpLng;
						$.get("https://maps.googleapis.com/maps/api/geocode/json", {
							key : 'AIzaSyCv11tfo3HU5dxZAQ6uC5s9AeB_Ux46x7k',
							address : vo.dong + "+" + vo.Name + "+" + vo.jibun
						}, function(data, status) {
							tmpLat = data.results[0].geometry.location.lat;
							tmpLng = data.results[0].geometry.location.lng;

							console.log(tmpLat + " " + tmpLng);

							var address = new Array();
							address.title = vo.aptName;
							address.latlng = new kakao.maps.LatLng(tmpLat, tmpLng);

							addMarker(address);

						}, "json");//get
						// ------------- 해당 아파트의 좌표 가져오기 --------------- //  */

					}) //each function
				}// success function
			})
		});//change
	});//ready

	var markers = new Array();

	// 카카오 지도에 마커 찍기	
	function addMarker(name, lat, lng) {

		var latlng = new kakao.maps.LatLng(lat, lng);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

		mapOption = {
			center : latlng,
			level : 3
		// 지도의 확대 레벨
		};
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		var imageSize = new kakao.maps.Size(24, 35);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : latlng, // 마커를 표시할 위치
			title : name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		});
		map.setCenter(latlng);
		
		markers.push(marker);
	}
	
	function initMarkers(markers){
		for(var i = 0; i<markers.length; i++){
			markers[i].setMap(null);
		}
	}
</script>
</head>
<body class="sb-nav-fixed">

	<%-- title name update (anonymous character)  --%>
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
				<div class="container-fluid">
					<p> </p>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="${root }/map/index">Dashboard</a></li>
						<li class="breadcrumb-item active">상권 정보</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">주변 상권 정보를 표시한다.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 거래 정보
							<div class="text-center">
								<div class="dropdown">
									<div class="btn-group">
										시도 :
										<select id="sido">
											<option value="0">선택</option>
										</select>
										구군 :
										<select id="gugun">
											<option value="0">선택</option>
										</select>
										읍면동 :
										<select id="dong">
											<option value="0">선택</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive" >
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" >
									<thead>
										<tr >
											<th>번호</th>
											<th>상권 분류</th>
											<th>가게이름</th>
											<th>주소(신 주소)</th>
											<th>우편번호</th>
										</tr>
									</thead>
									<tbody id="searchResult">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>

			<div class="container-fluid">
				<div class="card mb-4">
					<div id="map" style="width: 1630px; height: 400px;"></div>

					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.5665734, 126.978179),
								//new kakao.maps.LatLng(tmplat, tmplng), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};
	
						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
						// 지도 타입 컨트롤을 지도에 표시합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
					</script>

				</div>
			</div>
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
