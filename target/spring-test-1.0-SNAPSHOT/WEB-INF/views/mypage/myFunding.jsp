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
                            <c:forEach items="${userFundProject}" var="myFund" >
                            <li class="pthumb">
                                <div class="col-sm-6 col-md-4" style="margin-top: 20px;">
                                    <figure>
                                        <div class="items over-box"><a href="javascript:void(0)">
                                            <div class="items_img"><img
                                                    src="//image-se.ycrowdy.com/logo/project-default-1.png/ycrowdy/resize/!340x!226"
                                                    class="img-responsive"> <!----> <!----></div>
                                        </a>
                                            <figcaption class="rewards-caption"><a href="javascript:void(0)">
                                                <div style="display: flex; flex-direction: column; ">
                                                    <c:if test="${myFund.fund_product_status eq 0}">
                                                    <span class="btn btn-xs btn-danger-outline" style="margin: 8px 0 8px 0;width: 80px;">

                                                            심사중
                                                    </span>
                                                    </c:if>
                                                    <c:if test="${myFund.fund_product_status eq 1}">
                                                    <span class="btn btn-xs btn-danger-outline" style="margin: 8px 0 8px 0;width: 80px;
                                                        color: green; border-color: green;">
                                                            진행중
                                                    </span>
                                                    </c:if>

                                                    <!----> <!----> <!---->
                                                    <span style="height: 80px;">${myFund.fund_product_title}</span>
                                                </div>
                                                <div class="rewards-subject"><strong></strong></div>
                                                <c:if test="${myFund.fund_product_status eq 1}">
                                                    <div class="row row-mobile-n">
                                                        <div class="col-xs-9 col-sm-8"><span class="rewards-price">
                                                            <span class="webfont2"></span>달성률</span>
                                                            <span class="rewards-percent">
                                                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${(myFund.fund_product_pr_cost / myFund.fund_product_goal_cost)* 100}"/>%
                                                            </span>
                                                        </div> <!---->
                                                    </div>
                                                </c:if>
                                                <c:if test="${myFund.fund_product_status eq 0}">
                                                    <div class="row row-mobile-n">
                                                        <div class="col-xs-9 col-sm-8"><span class="rewards-price">
                                                            <span class="webfont2"></span></span>
                                                            <span class="rewards-percent">
                                                                <fmt:formatNumber type="number" maxFractionDigits="0" value=""/>&nbsp;
                                                            </span>
                                                        </div> <!---->
                                                    </div>
                                                </c:if>
                                                <div class="progress"><!----></div>
                                                <div class="row row-mobile-n">
                                                    <div class="col-xs-8">
                                                        <div class="invest-support">목표금액 <fmt:formatNumber value="${myFund.fund_product_goal_cost}"
                                                                                                           pattern="#,###"/></div>
                                                    </div> <!----></div>
                                            </a>
                                                <div class="mp-btn">
                                                    <div class="row row-mobile-n">
                                                        <div class="col-xs-6"><a
                                                                class="btn btn-block btn-sm btn-default-outline"
                                                                onclick="deleteMyFund(${myFund.fund_product_seq});"
                                                        >삭제하기</a>
                                                        </div>
                                                    </div> <!----> <!----> <!----> <!----> <!----></div>
                                            </figcaption>
                                        </div>
                                    </figure>
                                </div>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>
    <script type="text/javascript">

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";


        function deleteMyFund(fund_product_seq){

            $.ajax({
                url:'${contextPath}/fund/delete/'+fund_product_seq,
                type:'get',
                beforeSend:function (xhr){
                    xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                },
                success:function (){
                    alert("펀딩 상품을 삭제하였습니다!");
                    location.href='${contextPath}/fund/myFunding';
                },
                error: function (request,status,error) {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }

            });

        }

    </script>
</main>