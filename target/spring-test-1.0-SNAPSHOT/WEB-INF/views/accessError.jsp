<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/19
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.*"%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Access Denied Page</h1>--%>
<%--<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/>--%>
<%--<h2><c:out value="${msg}"/></h2>--%>
<%--</body>--%>
<%--</html>--%>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">

        <div class="contents">
            <!-- 본문 컨텐츠 영역 시작 -->
            <div class="product-nodata">
                <div class="nodata">
                    <span class="bgcircle"><i class="icon nodata-type4"></i></span>
                    <div class="txt-wrap">
                        <strong>일시적인 오류로 요청을 처리할 수 없습니다.</strong>
                        <p>계속적인 오류가 발생할 경우<br>고객 센터 및 1:1 상담을 통해 문의 바랍니다.</p>
                    </div>
                    <div class="btngroup">
                        <button class="btn btn-linelgray medium" onclick="location.reload()"><span>새로고침</span></button>
                        <button class="btn btn-default medium" onclick="location.href='/p/index.do'"><span>홈으로 이동</span></button>
                    </div>
                    <button class="btn btn-linelgray medium mt5" onclick="location.href='/p/cca/main.do'"><span>1:1 상담</span></button>
                </div>
            </div>
            <!-- // 본문 컨텐츠 영역 끝 -->
        </div>
        <!--//contents-->
    </div>
    <!-- //.container -->
</main>
