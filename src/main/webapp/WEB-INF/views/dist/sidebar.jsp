<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}'
	scope="session" />
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">Core</div>
			<a class="nav-link" href="${root }/map/index">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div> Dashboard
			</a>
			<div class="sb-sidenav-menu-heading">Interface</div>
			<a class="nav-link collapsed" href="#" data-toggle="collapse"
				data-target="#collapseLayouts" aria-expanded="false"
				aria-controls="collapseLayouts">
				<div class="sb-nav-link-icon">
					<i class="fas fa-columns"></i>
				</div> 동네 정보
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseLayouts"
				aria-labelledby="headingOne" data-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="${root }/map/APTmeme">APT 매매</a> <a
						class="nav-link" href="${root }/map/APTRent">APT 전월세</a> <a
						class="nav-link" href="${root }/map/Jumeme">주택 매매</a> <a
						class="nav-link" href="${root }/map/JuRent">주택 전월세</a> <a
						class="nav-link" href="${root }/map/searchRoad">길 찾기</a> <a
						class="nav-link" href="${root }/pollution/PollutionMap">환경정보
						표시</a> <a class="nav-link" href="${root }/map/test1">로드뷰</a> <a
						class="nav-link" href="${root }/map/test2">교통정보</a> <a
						class="nav-link" href="${root }/map/test3">원형 거리계산</a> <a
						class="nav-link" href="#">환경 정보</a>
				</nav>
			</div>
			
			<a class="nav-link" href="searchResult.jsp">
				<div class="sb-nav-link-icon">
					<i class="fas fa-bullhorn"></i>
				</div> Q&A
			</a>
			
			<div class="sb-sidenav-menu-heading">Addons</div>
			<a class="nav-link" href="searchResult.jsp">
				<div class="sb-nav-link-icon">
					<i class="fas fa-chart-area"></i>
				</div> Search
			</a>
		</div>
	</div>
	<div class="sb-sidenav-footer">
		<div class="small">Logged in as:</div>
		${userinfo.email}
	</div>
</nav>
<!-- 
<a class="nav-link collapsed" href="#" data-toggle="collapse"
    data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
    <div class="sb-nav-link-icon">
        <i class="fas fa-book-open"></i>
    </div>
    Pages
    <div class="sb-sidenav-collapse-arrow">
        <i class="fas fa-angle-down"></i>
    </div>
</a>
<div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
    data-parent="#sidenavAccordion">
    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
        <a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#pagesCollapseAuth" aria-expanded="false"
            aria-controls="pagesCollapseAuth">
            Authentication
            <div class="sb-sidenav-collapse-arrow">
                <i class="fas fa-angle-down"></i>
            </div>
        </a>
        <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
            data-parent="#sidenavAccordionPages">
            <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="login.jsp">Login</a>
                <a class="nav-link" href="register.jsp">Register</a>
                <a class="nav-link" href="password.jsp">Forgot Password</a>
            </nav>
        </div>
        <a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#pagesCollapseError" aria-expanded="false"
            aria-controls="pagesCollapseError">
            Error
            <div class="sb-sidenav-collapse-arrow">
                <i class="fas fa-angle-down"></i>
            </div>
        </a>
        <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
            data-parent="#sidenavAccordionPages">
            <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="401.jsp">401 Page</a>
                <a class="nav-link" href="404.jsp">404 Page</a>
                <a class="nav-link" href="500.jsp">500 Page</a>
            </nav>
        </div>
    </nav>
</div>

<a class="nav-link" href="tables.jsp">
    <div class="sb-nav-link-icon">
        <i class="fas fa-table"></i>
    </div>
    Tables
</a>
-->