<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand" href="/happyhouse">HappyHouse </a>
    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>
	<!-- nav search bar 부분 수정 : jh -->
	<form class="ml-auto mr-0 mr-md-3 my-2 my-md-0" id="searchform" method="get" action="${root}/map/searchResult">
		<div class="form-row">
			<select class="col-12 col-md-3 form-control" name="key" id="key">
				<option value="dong" selected="selected">동 이름 검색</option>
				<option value="name">아파트/주택 이름 검색</option>
			</select>
			<div class="col-12 col-md-6 mb-2 mb-md-0">
				<input type="text" name="word" class="form-control form-control-lg"
					placeholder="">
			</div>
			<div class="col-12 col-md-3">
				<button type="submit" class="btn btn-block btn-lg btn-primary">Search!</button>
			</div>
		</div>
	</form>
	<!-- nav search bar 부분 수정 : jh -->
	
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="userDropdown"
                href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">
                <i class="fas fa-user fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <%-- <a class="dropdown-item" href="${root}/lookup.do">My page</a>
                <a class="dropdown-item" href="settings.jsp">Settings</a> --%>
                <a class="dropdown-item" href="${root}/user/list">UserList</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${root}/user/logout">Logout</a>
            </div></li>
    </ul>
</nav>