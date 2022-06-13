<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 5:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css"  href="/resources/css/order.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/layout.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/popup.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/video-js.css"><!-- 공통 css -->

    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->

</head>
<body>
<tiles:insertAttribute name="content"/>
</body>
</html>