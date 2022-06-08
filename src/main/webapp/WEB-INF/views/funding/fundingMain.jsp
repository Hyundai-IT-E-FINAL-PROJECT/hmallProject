<%--
Created by IntelliJ IDEA.
User: user
Date: 2022-06-08
Time: 오후 11:49
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

<%--    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/common.min.css?v=20220513_01">--%>

    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
    <!-- link href="/resources/css/crowdy/crowdy.css?v=20220330_01" rel="stylesheet" /-->
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
    <!--link href="/resources/css/crowdy/crowdyCardUI.css?v=20211207_01" rel="stylesheet" /-->
<%--    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/datepickerCustom.css">--%>
<div>
    <div id="reflashArea" class="container" style="margin-top: 68px">
        <form name="searchPageNation" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post"></form>
        <form name="pdeSearchForm" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post">
            <div class="pdeSearchFormHiddenInput" style="display: none">
                <input type="hidden" class="nonClear" name="weightYn" value="">
                <input type="hidden" name="sectDispGbcd" value="01"> <!-- 화면에서만 사용하는 변수 -->

                <input type="hidden" name="page" value="1">
                <input type="hidden" class="nonClear" name="listSize" value="60"><!-- listSize -->
                <input type="hidden" name="sort" value="REG_DTM@DESC"><!-- sort -->

                <input type="hidden" name="itemListType" value="type1"><!-- 상품 가로[type2], 세로[type1] -->

                <input type="hidden" name="priceFlag" value="">

                <input type="hidden" name="csfLCat" value=""><!-- csfLCat -->
                <input type="hidden" name="csfMCat" value=""><!-- csfMCat -->
                <input type="hidden" name="csfSCat" value=""><!-- csfSCat -->
                <input type="hidden" name="csfDCat" value=""><!-- csfDCat -->
                <input type="hidden" name="csfNameCode" value=""><!-- csfNameCode -->
                <input type="hidden" name="csfDepth" value="A"><!-- csfDepth -->

                <!-- 매장에서 넘어오는 param -->


                <!-- //매장에서 넘어오는 param -->


                <input type="hidden" name="brodMore" value="">

                <input type="hidden" name="logYn" value="">
                <input type="hidden" name="hmPdOnly" value="N">

                <input type="hidden" name="searchTerm" value="A">
                <input type="hidden" name="autoCate" value="">
            </div>
            <div class="gird-l5x">
                <div class="contents" id="pl_main">
                    <div class="container">
                        <div class="mt70 m-mt50 xs-mt40">
                            <div><a>
                                <div class="crowdy-title-01">
                                    <font>
                                        리워드 프로젝트 <svg width="11" height="18" viewBox="0 0 16 23" fill="none"
                                                      xmlns="http://www.w3.org/2000/svg" style="margin-left: 8px;">
                                        <path d="M0.999992 22.051L13.8775 11.5255L0.999994 0.999985" stroke="#464646"
                                              stroke-width="2"></path>
                                    </svg></font>
                                </div>
                            </a> <span class="crowdy-titleDesc-01 hidden-xs hidden-sm">크라우디에서 핫한 프로젝트들을 만나보세요.</span></div>
                            <div param-art-type="0">
                                <div class="card-reward-list">
                                    <div class="card-row-01">
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="/r/wwwlalaitscom" class="card-reward-item" style="cursor: pointer;">
                                                <div class="card-reward-img">
                                                    <div class="card-newStatus-icon">NEW</div> <img
                                                        src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
                                                        alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">(주) 라라잇츠</div>
                                                        <div class="card-reward-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름 페이셜 기능성크림</div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 5,308,300원 펀딩</div>
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
                                            <figure><a href="/r/doranwon" class="card-reward-item" style="cursor: pointer;">
                                                <div class="card-reward-img">
                                                    <div class="card-newStatus-icon">NEW</div> <img
                                                        src="//image-se.ycrowdy.com/20220531/CROWDY_202205311444420998_6Ch29.png/ycrowdy/resize/!340x!226"
                                                        alt="..." class="img-responsive">
                                                    <!----> <img
                                                        src="//image-se.ycrowdy.com/crowdyCss/img/adult2.png/ycrowdy/resize/!60x!40"
                                                        style="position: absolute; top: 10px; right: 0px; width: 20%;">
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">도란원</div>
                                                        <div class="card-reward-title">[샤토미소 와인] 영동에서 직접 생산한 7가지 과일로 만든 와인!</div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 764,000원 펀딩</div>
                                                        <div class="card-reward-day">D - 17
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">764%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <div class="col-sm-4 col-xs-6">
                                            <figure><a href="/r/goodtomorrow00" class="card-reward-item" style="cursor: pointer;">
                                                <div class="card-reward-img">
                                                    <div class="card-newStatus-icon">NEW</div> <img
                                                        src="//image-se.ycrowdy.com/20220602/CROWDY_202206021600520041_fp35m.png/ycrowdy/resize/!340x!226"
                                                        alt="..." class="img-responsive">
                                                    <!---->
                                                    <!---->
                                                </div>
                                                <figcaption>
                                                    <div class="card-reward-content">
                                                        <div class="card-reward-name">농업회사법인 우포의아침 주식회사</div>
                                                        <div class="card-reward-title">우리 가족을 위한! 창녕 단감의 달달한 맛 그대로 담은 단감주스</div>
                                                    </div>
                                                    <div class="card-reward-row">
                                                        <!---->
                                                        <div class="card-reward-price crowdy-color-blue"> 569,800원 펀딩</div>
                                                        <div class="card-reward-day">D - 17
                                                            <!---->
                                                        </div>
                                                        <div class="card-reward-persent">570%</div>
                                                        <!---->
                                                        <!---->
                                                    </div>
                                                </figcaption>
                                            </a></figure>
                                        </div>
                                        <!---->
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
