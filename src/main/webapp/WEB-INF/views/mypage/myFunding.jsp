<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-11
  Time: 오전 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<style>
    .gird-l2x .contents {
        width: 765px;
    }
    .col-md-4 {
        width: 32%;
    }

</style>
<sec:authentication property="principal" var="pinfo" />
<main class="cmain mypage" role="main" id="mainContents">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/theme.min.css?v=20220331_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/common.min.css?v=20220513_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyNav.min.css?v=20220331_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
    <link href="/resources/css/crowdy/crowdy.css?v=20220330_01" rel="stylesheet">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
    <div class="container">
        <div class="gird-l2x">
            <%@ include file="mypageSide.jsp" %>
            <div class="contents">
                <div class="mypage-order-wrap">
                    <div class="card-reward-list">
                        <ul>
                            <% for(int i=0; i<10; i++){  %>
                            <li class="pthumb">
                                <div class="col-sm-6 col-md-4" style="margin-top: 20px;">
                                    <figure>
                                        <div class="items over-box"><a href="javascript:void(0)">
                                            <div class="items_img"><img
                                                    src="//image-se.ycrowdy.com/logo/project-default-1.png/ycrowdy/resize/!340x!226"
                                                    class="img-responsive"> <!----> <!----></div>
                                        </a>
                                            <figcaption class="rewards-caption"><a href="javascript:void(0)"><span
                                                    class="btn btn-xs btn-danger-outline">제작중</span> <!----> <!---->
                                                <!----> <!----> <!---->
                                                <div class="rewards-subject"><strong></strong></div>
                                                <div class="row row-mobile-n">
                                                    <div class="col-xs-9 col-sm-8"><span class="rewards-price"><span
                                                            class="webfont2"></span>0</span> <span
                                                            class="rewards-percent">0%</span></div> <!----></div>
                                                <div class="progress"><!----></div>
                                                <div class="row row-mobile-n">
                                                    <div class="col-xs-8">
                                                        <div class="invest-support">목표금액 0</div>
                                                    </div> <!----></div>
                                            </a>
                                                <div class="mp-btn">
                                                    <div class="row row-mobile-n">
                                                        <div class="col-xs-6"><a
                                                                class="btn btn-block btn-sm btn-default-outline">삭제하기</a>
                                                        </div>
                                                        <div class="col-xs-6 hidden-sm hidden-md hidden-lg"><a
                                                                class="btn btn-block btn-sm btn-primary-outline">수정하기</a>
                                                        </div>
                                                        <div class="col-xs-6 hidden-xs"><a
                                                                class="btn btn-block btn-sm btn-primary-outline">수정하기</a>
                                                        </div>
                                                    </div> <!----> <!----> <!----> <!----> <!----></div>
                                            </figcaption>
                                        </div>
                                    </figure>
                                </div>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>
</main>