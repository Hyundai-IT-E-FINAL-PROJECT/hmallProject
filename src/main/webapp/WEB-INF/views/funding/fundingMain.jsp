<%--
Created by IntelliJ IDEA.
User: user
Date: 2022-06-08
Time: 오후 11:49
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<style>--%>
<%--    .spstart_vi_wrap1 .spstart_vi_frame {--%>
<%--        background-image: url(img/spstart_vi_img01.png);--%>
<%--        position: relative;--%>
<%--        left: -100px;--%>
<%--    }--%>
<%--</style>--%>
<main class="cmain main" role="main" id="mainContents">

    <%--    <link href="/resources/font/NotoSansCJKkr/font.min.css" rel="stylesheet">--%>

    <%--    <link rel="shortcut icon" href="//image-se.ycrowdy.com/crowdyCss/img/favicon.ico">--%>
    <%--    <link rel="icon" sizes="32x32" type="image/png" href="//image-se.ycrowdy.com/crowdyCss/img/favicon-32x32.png">--%>
    <%--    <link rel="icon" sizes="16x16" type="image/png" href="//image-se.ycrowdy.com/crowdyCss/img/favicon-16x16.png">--%>

    <%--    <link rel="apple-touch-icon" href="//image-se.ycrowdy.com/crowdyCss/img/apple-touch-icon.png">--%>
    <%--    <link rel="apple-touch-icon" sizes="57x57" href="//image-se.ycrowdy.com/crowdyCss/img/apple-touch-icon-57x57.png">--%>
    <%--    <link rel="apple-touch-icon" sizes="72x72" href="//image-se.ycrowdy.com/crowdyCss/img/apple-touch-icon-72x72.png">--%>
    <%--    <link rel="apple-touch-icon" sizes="114x114" href="//image-se.ycrowdy.com/crowdyCss/img/apple-touch-icon-114x114.png">--%>
    <%--    <link rel="apple-touch-icon" sizes="180x180" href="//image-se.ycrowdy.com/crowdyCss/img/apple-touch-icon-180x180.png">--%>

    <%--    <link href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">--%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/theme.min.css?v=20220331_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyNav.min.css?v=20220331_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/common.min.css?v=20220513_01">

    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
    <link href="/resources/css/crowdy/crowdy.css?v=20220330_01" rel="stylesheet">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
    <!--link href="/resources/css/crowdy/crowdyCardUI.css?v=20211207_01" rel="stylesheet" /-->
    <%--    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/datepickerCustom.css">--%>
    <div>
        <div id="reflashArea" style="margin-top: 68px">
            <form name="searchPageNation" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post"></form>
            <form name="pdeSearchForm" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post">
                <div class="gird-l5x" style="padding: 10px 0 50px 0;">
                    <div class="contents" id="pl_main">
                        <div>
                            <div class="spstart_vi_wrap spstart_vi_wrap1">
                                <div class="spstart_vi_frame">
                                    <div>
                                        <div class="row not-space">
                                            <div class="col-sm-3 col-md-5 col-lg-6"></div>
                                            <div class="col-sm-9 col-md-7 col-lg-6" style="margin-left: 700px;">
                                                <div class="md-ml20 m-ml15 xs-ml0">
                                                    <div class="spstart_vi_title"><strong class="webfont2" style="font-weight: bold;">크라우드 펀딩 참여하기</strong>
                                                        <span>크라우드펀딩</span>
                                                        <p>제품/서비스를 리워드로 제공하여 수익을 얻습니다.</p></div>
                                                    <div class="spstart_vi_btn">
                                                        <div class="row row-mobile-n hidden-sm hidden-md hidden-lg">
                                                            <div class="col-xs-12 mt10">
                                                                <div class="mt15 grey-800 big-hb hidden-sm hidden-md hidden-lg text-center">
                                                                    리워드 프로젝트 바로 시작은 PC에서 가능합니다.
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="hidden-xs">
                                                            <div class="btn btn-sps btn-shadow btn-primary" style="font-weight: bold;"
                                                                 onclick="location.href='${contextPath}/fund/create'">프로젝트
                                                                만들기
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mt70 m-mt50 xs-mt40">
                            <div><a>
                                <div class="crowdy-title-01">
                                    <font>
                                        리워드 프로젝트
                                        <svg width="11" height="18" viewBox="0 0 16 23" fill="none"
                                             xmlns="http://www.w3.org/2000/svg" style="margin-left: 8px;">
                                            <path d="M0.999992 22.051L13.8775 11.5255L0.999994 0.999985"
                                                  stroke="#464646"
                                                  stroke-width="2"></path>
                                        </svg>
                                    </font>
                                </div>
                            </a> <span class="crowdy-titleDesc-01 hidden-xs hidden-sm">크라우디에서 핫한 프로젝트들을 만나보세요.</span>
                            </div>
                            <div param-art-type="0">
                                <div class="card-reward-list">
                                    <div class="card-row-01">
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                    </div>
                                    <div class="card-row-01">
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                    </div>
                                    <div class="card-row-01">
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="${contextPath}/fund/fundingDetail/${fund_seq}"
                                                       class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                    <div class="card-newStatus-icon">NEW</div>
                                                    <img
                                                            src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                            alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름
                                                            페이셜 기능성크림
                                                        </div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원
                                                            펀딩
                                                        </div>
                                                        <div class="card-reward-day">D - 18
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">5,308%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- //.contents -->
        </div>
        </form>
    </div>
    </div>
</main>
<script src="/resources/js/productAll.js"></script>
