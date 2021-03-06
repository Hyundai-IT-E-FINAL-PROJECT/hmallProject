<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title><tiles:getAsString name="title"/></title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/layout.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/popup.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/search.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css">
    <c:forEach items="${cssFileList}" var="styleFile">
        <link rel="stylesheet" type="text/css" href="/resources/css/${styleFile}.css">
    </c:forEach>

    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="/resources/js/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="/resources/js/index.js"></script>
    <script src="/resources/js/commonFunction.js"></script>
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->
    <script src="/resources/js/script-for-Top2.js"></script>
    <script src="/resources/js/script-for-Top1.js"></script>
    <script type="text/javascript" src="/js/jquery.ajax-cross-origin.min.js"></script>

    </style>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/jquery.form.js"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/pd/product.js"></script>
    <link href="//image.hmall.com/p/css/co/video-js.css?ver=053015" rel="stylesheet">
    <script src="//image.hmall.com/p/js/co/video.js?ver=053015"></script>
    <script src="//image.hmall.com/p/js/co/videojs-http-streaming.js?ver=053015"></script>
</head>
<body>
<div class="${className}">
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>