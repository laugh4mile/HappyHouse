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
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"
        id="searchform" method="post">
        <input type="hidden" name="act" id="act" value="search">
        <div class="input-group">
            <select name='key' id='key'>
                <option value='dong'>동</option>
                <option value='apt'>이름</option>
            </select>
            <input class="form-control" id="word" name="word" type="text"
                placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
            <div class="input-group-append">
                <button class="btn btn-primary" type="button"
                    onkeydown="javascript:if(event.keyCode == 13) {console.log('wow'); searchSomething();}"
                    onclick="javascript:searchSomething();">검색</button>
            </div>
        </div>
    </form>
    <!-- Navbar-->
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