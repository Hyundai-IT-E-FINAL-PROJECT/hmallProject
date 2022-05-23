<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/19
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Logout Page</h1>
<form action="/customLogout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <button>로그아웃</button>
</form>
</body>
</html>
