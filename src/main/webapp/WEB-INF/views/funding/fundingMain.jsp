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
<main class="cmain main" role="main" id="mainContents">
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/theme.min.css?v=20220331_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyNav.min.css?v=20220331_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/common.min.css?v=20220513_01">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
    <link href="/resources/css/crowdy/crowdy.css?v=20220330_01" rel="stylesheet">
    <link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
    <div>
        <div id="reflashArea" style="margin-top: 68px">
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
                            </a> <span class="crowdy-titleDesc-01 hidden-xs hidden-sm">FUNTHING에서 핫한 프로젝트들을 만나보세요.</span>
                            </div>
                            <div param-art-type="0">
                                <div class="card-reward-list">
                                        <ul>
                                            <c:forEach items="${list}" var="fund" varStatus="status">
                                                <input id="fileName" type="hidden" value="${fund.FILENAME}">
                                                <input id="uploadPath" type="hidden" value="${fund.UPLOADPATH}">
                                                <input id="uuid" type="hidden" value="${fund.UUID}">
                                                <li class="pthumb">
                                                    <div class="col-sm-4 col-xs-6">
                                                        <figure>
                                                            <a href="${contextPath}/fund/detail/${fund.FUND_PRODUCT_SEQ}" class="card-reward-item" style="cursor: pointer; border-radius: 10px 10px 0 0;">
                                                                <div class="card-reward-img" style="border-radius: 10px 10px 0 0;">
                                                                    <div class="card-newStatus-icon">NEW</div>
                                                                    <img class="img-responsive" src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${fund.FUND_PRODUCT_MAIN_IMG}" alt="..."
                                                                    style="width: 220px; margin: 0 auto; height: 220px;">
<%--                                                                    <img src="${contextPath}/resources/img/2022/06/14/34d8707e-be99-42e8-883a-45b0962b283c_ping.jpeg">--%>
                                                                </div>
                                                            <figcaption>
                                                                <div class="card-reward-content">
                                                                    <div class="card-reward-name">${fund.USER_NAME}</div>
                                                                    <div class="card-reward-title">${fund.FUND_PRODUCT_TITLE}
                                                                    </div>
                                                                </div>
                                                                <div class="card-reward-row">
                                                                    <!---->
                                                                    <div class="card-reward-price crowdy-color-blue"> <fmt:formatNumber type="number" maxFractionDigits="0" value="${fund.FUND_PRODUCT_PR_COST}"/>원
                                                                        펀딩
                                                                    </div>
                                                                    <div class="card-reward-day">종료일자 <fmt:formatDate value="${fund.FUND_PRODUCT_END_DATE}" pattern="yyyy-MM-dd"/>
                                                                    </div>
                                                                    <div class="card-reward-persent">
                                                                        <fmt:formatNumber type="number" maxFractionDigits="0" value="${fund.FUND_PRODUCT_PR_COST * 100 / fund.FUND_PRODUCT_GOAL_COST}"/>% &nbsp;</span>
                                                                </div>
                                                            </figcaption>
                                                        </a></figure>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="/resources/js/productAll.js"></script>
<script>
    window.onload=function(){
        var fileName = document.getElementById('fileName').value;
        var uploadPath = document.getElementById('uploadPath').value;
        var uuid = document.getElementById('uuid').value;
        console.log(fileName);
        console.log(uploadPath);
        console.log(uuid);
        var fileCallPath = encodeURIComponent(fileNameuuid+"_"+fileName);
        console.log(fileCallPath);
        $(".card-reward-img *").remove();
        $(".card-reward-img").append(
            `
            <div class="card-newStatus-icon">NEW</div>
            <img class="img-responsive" src="/resources/img/2022/06/14/`+fileCallPath+`" alt="...">
            `
        );
    }
</script>
