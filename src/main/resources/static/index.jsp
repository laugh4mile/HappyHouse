<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value='${pageContext.request.contextPath}' />
<!DOCTYPE html>
<html>
<head>
<!--  <meta http-equiv="refresh" content="0;url=dist/index.jsp"> -->
<title>SB Admin</title>
<script language="javascript">
    window.location.href = "dist/login.jsp"
</script>
</head>
<body>
    Go to
    <a href="${root}/login.do">로그인</a>
</body>
</html>
