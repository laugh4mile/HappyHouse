<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>
<link href="${root }/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
    crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
    crossorigin="anonymous"></script><script type="text/javascript">
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
<body class="sb-nav-fixed">
    <%@ include file="header.jsp"%>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <%@ include file="sidebar.jsp"%>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <h1 class="mt-4">검색 결과</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="${root }/">Dashboard</a></li>
                        <li class="breadcrumb-item active">검색결과</li>
                    </ol>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i> 검색 정보
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <c:choose>
                                    <c:when test="${!empty result}">
                                        <table class="table table-bordered" id="dataTable"
                                            width="100%" cellspacing="0">
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
                                            <tbody>
                                                <c:forEach var="item" items="${result}">
                                                    <tr>
                                                        <td>${item.getNo()}</td>
                                                        <td>${item.getDong()}</td>
                                                        <td>${item.getAptName()}</td>
                                                        <td>${item.getJibun()}</td>
                                                        <td>${item.getCode()}</td>
                                                        <td>${item.getDealAmount()}</td>
                                                        <td>${item.getBuildYear()}</td>
                                                        <td>${item.getDealYear()}</td>
                                                        <td>${item.getDealMonth()}</td>
                                                        <td>${item.getDealDay()}</td>
                                                        <td>${item.getArea()}</td>
                                                        <td>${item.getFloor()}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <div align="center">검색 결과가 없습니다.</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <%@ include file="footer.jsp"%>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="${root }/js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
        crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
        crossorigin="anonymous"></script>
    <script src="${root }/assets/demo/datatables-demo.js"></script>
</body>
</html>