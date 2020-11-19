<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
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
<script type="text/javascript">
	let colorArr = [ 'table-primary', 'table-success', 'table-danger' ];
	$(document).ready(function() {
		$.ajax({
			url : '${pageContext.request.contextPath}/map',
			post : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			success : function(data, status) {
				console.log(document.location.href.split("/")[5]);

				$.each(data, function(index, vo) {
					$("#sido").append("<option value='"+vo.sidoCode+"'>" + vo.sidoName + "</option>");
				});//each
			}
		})
	});//ready
	$(document).ready(function() {
		$("#sido").change(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/map/' + $("#sido").val(),
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
				url : '${root}/map/' + $("#sido").val() + '/' + $("#gugun").val(),
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
				url : '${root}/map/' + $("#sido").val() + '/' + $("#gugun").val() + '/' + $("#dong").val() + '/' + document.location.href.split("/")[5],
				post : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				success : function(data, status) {
					$("#searchResult").empty();
					$.each(data, function(index, vo) {
						let str = "<tr class=" + colorArr[index % 3] + ">" + "<td>" + vo.no + "</td>" + "<td>" + vo.dong + "</td>" + "<td>" + vo.aptName + "</td>" + "<td>" + vo.jibun + "</td>" + "<td>" + vo.code + "</td>" + "<td>" + vo.dealAmount + "</td>" + "<td>" + vo.buildYear + "</td>" + "<td>" + vo.dealYear + "</td>" + "<td>" + vo.dealMonth + "</td>" + "<td>" + vo.dealDay + "</td>" + "<td>" + vo.area + "</td>" + "<td>" + vo.floor + "</td>";
						$("#searchResult").append(str);
					})
				}//function
			})
		});//change
	});//ready
	/* function geocode(jsonData) {
		let idx = 0;
		$.each(jsonData, function(index, vo) {
			let tmpLat;
			let tmpLng;
			$.get("https://maps.googleapis.com/maps/api/geocode/json", {
				key : 'AIzaSyBD6jkqOVbvgeKK3ij8y5su8_henALYfWs',
				address : vo.dong + "+" + vo.aptName + "+" + vo.jibun
			}, function(data, status) {
				tmpLat = data.results[0].geometry.location.lat;
				tmpLng = data.results[0].geometry.location.lng;
				$("#lat_" + index).text(tmpLat);
				$("#lng_" + index).text(tmpLng);
				addMarker(tmpLat, tmpLng, vo.aptName);
			}, "json");//get
		});//each
	} */

	function searchSomething() {
		if (document.getElementById("search").value == "") {
			alert("검색어 입력!!!");
			return;
		} else {
			document.getElementById("searchform").action = "${root}/map/" + +$("#sido").val() + '/' + $("#gugun").val() + '/' + $("#dong").val();
			document.getElementById("searchform").submit();
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
					<h1 class="mt-4">아파트 매매</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
						<li class="breadcrumb-item active">아파트매매</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">아파트 매매 정보를 표시한다.</div>
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> 거래 정보
							<div class="text-center">
								<div class="dropdown">
									<div class="btn-group">
										시도 : <select id="sido">
											<option value="0">선택</option>
										</select> 구군 : <select id="gugun">
											<option value="0">선택</option>
										</select> 읍면동 : <select id="dong">
											<option value="0">선택</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>번호</th>
											<th>법정동</th>
											<th>아파트이름</th>
											<th>지번</th>
											<th>지역코드</th>
											<th>가격</th>
											<th>건설연도</th>
											<th>거래연도</th>
											<th>거래월</th>
											<th>거래일</th>
											<th>면적</th>
											<th>층수</th>
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
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0f81655e444c4cae90021cdf7832a59"></script>
					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.5665734, 126.978179), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
						// 지도 타입 컨트롤을 지도에 표시합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

						/* var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
						
						var positions = [
						{
						    title: '카카오', 
						    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
						},
						{
						    title: '생태연못', 
						    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
						},
						{
						    title: '텃밭', 
						    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
						},
						{
						    title: '근린공원',
						    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
						}];

						for (var i = 0; i < positions.length; i++) {

							// 마커 이미지의 이미지 크기 입니다
							var imageSize = new kakao.maps.Size(24, 35);

							// 마커 이미지를 생성합니다    
							var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								map : map, // 마커를 표시할 지도
								position : positions[i].latlng, // 마커를 표시할 위치
								title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								image : markerImage
							// 마커 이미지 
							});
						} */
					</script>

				</div>
			</div>
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
