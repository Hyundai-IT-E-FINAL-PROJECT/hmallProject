<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
<head>
    <title><tiles:getAsString name="title"/></title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/layout.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/popup.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/video-js.css"><!-- 공통 css -->
    <link rel="stylesheet" href="<tiles:getAsString name = "dynamic_css"/>"/>

    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
    <script src="/resources/js/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="/resources/js/index.js"></script>
    <script src="/resources/js/commonFunction.js"></script>
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->
    <script src="/resources/js/script-for-Top2.js"></script>
    <script src="/resources/js/script-for-Top1.js"></script>
    <style>
        .container {
            margin-top: 10px;
        }
        .container.footer {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="${divclassname}">
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>