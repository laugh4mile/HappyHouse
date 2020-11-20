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
<link href="${root }/css/styles.css" rel="stylesheet" />
<link href="${root }/css/search.css" rel="stylesheet">
<link href="${root }/css/detailedInfo.css" rel="stylesheet">

<link href="${root}/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>

<!-- 카카오 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0f81655e444c4cae90021cdf7832a59&libraries=services"></script>

</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="sidebar.jsp"%>
		</div>
		<div id="layoutSidenav_content">

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
							<img class="card-img" src="${root }/img/1.jpg" alt="">
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
										<div class="map_wrap">
											<div id="map" style="width: 100%; height: 400px; margin: auto;"></div>


											<ul id="category">
												<li id="BK9" data-order="0"><span class="category_bg bank"></span> 은행</li>
												<li id="MT1" data-order="1"><span class="category_bg mart"></span> 마트</li>
												<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span> 약국</li>
												<li id="OL7" data-order="3"><span class="category_bg oil"></span> 주유소</li>
												<li id="CE7" data-order="4"><span class="category_bg cafe"></span> 카페</li>
												<li id="CS2" data-order="5"><span class="category_bg store"></span> 편의점</li>
											</ul>
										</div>
									</div>
								</div>
							</section>
							<%-- ===================================시구군읍면동구글맵================================== --%>
							<!-- 							<div>
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
							</div> -->
						</div>
					</div>
				</div>
			</section>

			<%@ include file="footer.jsp"%>
			<div style="display: none">wirestock - kr.freepik.com가 제작함</div>
		</div>
	</div>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${root }/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${root }/assets/demo/datatables-demo.js"></script>
</body>
<script>
	//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({
		zIndex : 1
	}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	markers = [], // 마커를 담을 배열입니다
	currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.5665734, 126.978179), // 지도의 중심좌표
		level : 5
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map);

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
		if (target.addEventListener) {
			target.addEventListener(type, callback);
		} else {
			target.attachEvent('on' + type, callback);
		}
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
		if (!currCategory) {
			return;
		}

		// 커스텀 오버레이를 숨깁니다 
		placeOverlay.setMap(null);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		ps.categorySearch(currCategory, placesSearchCB, {
			useMapBounds : true
		});
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
			displayPlaces(data);
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		} else if (status === kakao.maps.services.Status.ERROR) {
			// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

		}
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		var order = document.getElementById(currCategory).getAttribute('data-order');

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

			// 마커와 검색결과 항목을 클릭 했을 때
			// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			(function(marker, place) {
				kakao.maps.event.addListener(marker, 'click', function() {
					displayPlaceInfo(place);
				});
			})(marker, places[i]);
		}
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(11, 28)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo(place) {
		var content = '<div class="placeinfo">' + '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

		if (place.road_address_name) {
			content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' + '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		} else {
			content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		}

		content += '    <span class="tel">' + place.phone + '</span>' + '</div>' + '<div class="after"></div>';

		contentNode.innerHTML = content;
		placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		placeOverlay.setMap(map);
	}

	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
		var category = document.getElementById('category'), children = category.children;

		for (var i = 0; i < children.length; i++) {
			children[i].onclick = onClickCategory;
		}
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
		var id = this.id, className = this.className;

		placeOverlay.setMap(null);

		if (className === 'on') {
			currCategory = '';
			changeCategoryClass();
			removeMarker();
		} else {
			currCategory = id;
			changeCategoryClass(this);
			searchPlaces();
		}
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
		var category = document.getElementById('category'), children = category.children, i;

		for (i = 0; i < children.length; i++) {
			children[i].className = '';
		}

		if (el) {
			el.className = 'on';
		}
	}

	//======================================  맵 스크립트 ====================// 	
	$(document).ready(function() { //페이지 생성시 실행
		geocode(); //해당 아파트 위도 경도 찾기
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

			console.log(tmpLat + " " + tmpLng);

			var address = new Array();
			address.title = aptName;
			address.latlng = new kakao.maps.LatLng(tmpLat, tmpLng);

			addMarker(address); //마커 찍기
		}, "json");//get
	}

	// 카카오 지도에 마커 찍기
	function addMarker(positions) {

		mapContainer = document.getElementById('map'), // 지도를 표시할 div 

		mapOption = {
			center : positions.latlng, // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		console.log(positions);

		map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		var imageSize = new kakao.maps.Size(24, 35);
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions.latlng, // 마커를 표시할 위치
			title : positions.title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage
		});

		marker.setMap(map);
	}
</script>
</html>