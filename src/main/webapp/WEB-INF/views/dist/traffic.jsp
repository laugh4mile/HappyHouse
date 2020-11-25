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
<link href="${root}/css/roadstyle.css" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0f81655e444c4cae90021cdf7832a59"></script>
<script type="text/javascript">
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
					<p> </p>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="${root }/map/index">Dashboard</a></li>
						<li class="breadcrumb-item active">교통정보</li>
					</ol>
					<div class="card mb-4">
						<div class="card-body">원하는 위치의 교통정보를 표시하여준다.</div>
					</div>
					<div id="map" style="width: 100%; height: 500px;"></div>

					<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.5665734, 126.978179), // 지도의 중심좌표
							level : 3
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

						// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
						map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);

						// 아래 코드는 위에서 추가한 교통정보 지도타입을 제거합니다
						// map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
					</script>
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
