<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-19
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authentication property="principal" var="pinfo" />
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">

            <!--20170816 박승택 추가 -->
            <form name="upntLeftForm" method="post" target="uPnt">
                <input type="hidden" name="mcustNo" value=""/>
            </form>
            <!-- 마이페이지 사이드바 있던 곳-->

            <%@ include file="mypageSide.jsp" %>


            <div class="contents">
                <div class="mypage-order-wrap zzim">
                    <!--
                    * 회원등급 지정 클래스
                        - TOP CLASS 등급 : topclass-lv
                        - DIAMOND 등급 : diamond-lv
                        - PLATINUM 등급 : platinum-lv
                        - GOLD 등급 : gold-lv
                        - SILVER 등급 : silver-lv
                    -->


                    <div class="myinfo-area






		                                silver-lv


                    ">
                        <div>
                            <p class="myname"><a href="/mypageUpdate"
                                                 class="btn-link"><em>${pinfo.userVO.user_name}님</em></a></p>
                            <div class="rating">


                                <span class="silver-lv"><i class="icon"></i><em>${pinfo.userVO.user_level}</em></span>


                                <div class="btngroup">
                                    <a href="/level"
                                       class="btn btn-benefit sm"><span>혜택보기</span></a>
                                </div>
                            </div>
                            <!-- //.rating -->
                        </div>

                        <ul class="infowrap">
                            <li>
                                <a href="/mypageCoupon">
                                    <span class="link"><b>${couponCount}</b>장</span>
                                    <span class="txt">보유 쿠폰</span>
                                </a>
                            </li>
                            <li>
                                <a href="/mypagePoint" onclick="doSearchUPntMainPop()">
                                <%--<a href="javascript://" onclick="doSearchUPntMainPop()">--%>
                                    <span class="link">
                                    <b><fmt:formatNumber  value="${userVO.user_point}" pattern="#,###"/></b>P</span>
                                    <span class="txt">포인트</span>
                                </a>
                            </li>
                            <li>
                                <a href="/mypageDeposit">
                                    <span class="link"><b><fmt:formatNumber  value="${userVO.user_deposit}" pattern="#,###"/></b>원</span>
                                    <span class="txt">예치금</span>
                                </a>
                            </li>
                           <%-- <li>
                                <a href="https://www.hmall.com/p/mpb/selectItemEvalAtclListPagingByCondtion.do">
                                    <span class="link"><b>1</b>건</span>
                                    <span class="txt">작성 가능한 상품평</span>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.hmall.com/p/mpe/evntEntryDtl.do">
                                    <span class="link"><b>0</b>건</span>
                                    <span class="txt">참여한 이벤트</span>
                                </a>
                            </li>--%>
                        </ul>
                        <!-- //.infowrap -->

                    </div>
                    <!-- //.myinfo-area -->

                    <div id="bannerWrap" class="banner-template">
                        <!--배너의 경우 관리자에서 등록 // bg칼러와 이미지가 들어간 배너만 등록-->
                        <a href="javascript:;" data-background="#F2EDF8|#EFF6FC|#F8F8EA|#F9F2ED|#FFF2F4|#F3EBEA|#F0F6EA"
                           style="display:none" id="mktgBanner" onClick="bannerClick()">
                            <div class="banner" id="bannerImg">
                            </div>
                            <div class="banner-txt">
                                <p class="tit" id="sogu1"></p>
                                <p class="txt" id="sogu2"></p>
                            </div>
                        </a>
                    </div>

                    <h3 class="title22">
                        최근 주문/배송 현황
                        <div class="btngroup abs">
                            <a href="/mypageOrder?type=all" class="btn atext"><span>전체보기</span><i
                                    class="arrow right"></i></a>
                        </div>
                    </h3>


                    <c:forEach items="${list}" var="odlist" varStatus="vs">
                        <c:if test="${vs.index == 0}">
                            <div class="order-list">
                            <dl>
                            <dt>
                                <div class="date">
                                    <span><fmt:formatDate value="${odlist.CREATED_AT}" pattern="yyyy-MM-dd"/> (주문번호 : ${odlist.ORDER_SEQ})</span>
                                </div>
                                <div class="abs">
                                    <a href="/mypageOrderDetail/${odlist.ORDER_SEQ}" class="btn alink"><span>주문/배송 상세</span></a>
                                </div>
                            </dt>
                        </c:if>
                        <c:if test="${vs.index != 0}">
                            <c:if test="${vs.current.ORDER_SEQ != list[vs.index-1].ORDER_SEQ}">
                                <div class="order-list">
                                <dl>
                                <dt>
                                    <div class="date">
                                        <span><fmt:formatDate value="${odlist.CREATED_AT}" pattern="yyyy-MM-dd"/> (주문번호 : ${odlist.ORDER_SEQ})</span>
                                    </div>
                                    <div class="abs">
                                        <a href="/mypageOrderDetail/${odlist.ORDER_SEQ}" class="btn alink"><span>주문/배송 상세</span></a>
                                    </div>
                                </dt>
                            </c:if>
                        </c:if>
                        <%--                                <input type="hidden" name="paymentYnOrdNo" value="" />--%>
                        <!-- 가장최근주문 1건, 최대 10개 상품 -->
                        <dd>
                            <a href="product/detail?product_seq=${odlist.PRODUCT_SEQ}">
                                <input type="hidden" name="slitmCd" value="2137807436">
                                <span class="img">
                                                <img src="/resources/img/${odlist.IMAGE_NAME}.jpg" alt="${odlist.PRODUCT_NAME}"/>
                                            </span>
                                <div class="box">
                                    <c:choose>
                                        <c:when test="${odlist.ORDER_STATUS eq '주문취소' or odlist.ORDER_STATUS eq '교환접수' or odlist.ORDER_STATUS eq '교환완료' or odlist.ORDER_STATUS eq '반품접수' or odlist.ORDER_STATUS eq '반품완료'}">
                                                        <span class="state red">
                                                                    ${odlist.ORDER_STATUS}
                                                        <em class="color-999">

                                                        </em>
                                                        </span>
                                        </c:when>
                                        <c:otherwise>
                                                        <span class="state sky">
                                                                 ${odlist.ORDER_STATUS}
                                                        <em class="color-999">

                                                        </em>
                                                        </span>
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="tit"> ${odlist.PRODUCT_NAME}</span>
                                    <div class="info">
                                        <ul>
                                            <li>${odlist.PRODUCT_INFO}</li>
                                            <li>
                                                    ${odlist.OP_COUNT} 개
                                            </li>
                                        </ul>
                                    </div>
                                    <span class="price"> <strong><fmt:formatNumber  value="${odlist.PRODUCT_COST * odlist.OP_COUNT}" pattern="#,###"/></strong>원 </span>
                                </div>
                            </a>

                        </dd>
                        <c:if test="${vs.index != 0 or vs.last}">
                            <c:if test="${vs.last or vs.current.ORDER_SEQ != list[vs.index+1].ORDER_SEQ}">
<%--                                        <dd>--%>
<%--                                            <div class="btngroup">--%>
<%--                                                <c:if test="${odlist.ORDER_STATUS eq '주문접수'}">--%>
<%--                                                    <button class="btn btn-linelgray small30" type="button" onclick="location.href='${contextPath}/mypageOrderCancel?order_seq=${odlist.ORDER_SEQ}'"><span>주문취소</span></button>--%>
<%--                                                </c:if>--%>
<%--                                                <c:if test="${odlist.ORDER_STATUS eq '상품발송' or odlist.ORDER_STATUS eq '배송완료'}">--%>
<%--                                                    <button class="btn btn-linelgray small30" type="button" onclick=""><span>배송조회</span></button>--%>
<%--                                                    &lt;%&ndash;                                    openDlvTrcUrlPup('20220513295854', '1')&ndash;%&gt;--%>
<%--                                                    <button class="btn btn-linelgray small30" type="button" onclick=""><span>만족도평가</span></button>--%>
<%--                                                    &lt;%&ndash;                                    openItemEvalPopup('2137807436', '00008', '20220513295854')&ndash;%&gt;--%>
<%--                                                </c:if>--%>
<%--                                            </div>--%>
<%--                                        </dd>--%>
                                    </dl>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${vs.index == 0 and !vs.last and vs.current.ORDER_SEQ != list[vs.index+1].ORDER_SEQ}">
<%--                                    <dd>--%>
<%--                                        <div class="btngroup">--%>
<%--                                            <c:if test="${odlist.ORDER_STATUS eq '주문접수'}">--%>
<%--                                                <button class="btn btn-linelgray small30" type="button" onclick="location.href='${contextPath}/mypageOrderCancel?order_seq=${odlist.ORDER_SEQ}'"><span>주문취소</span></button>--%>
<%--                                            </c:if>--%>
<%--                                            <c:if test="${odlist.ORDER_STATUS eq '상품발송' or odlist.ORDER_STATUS eq '배송완료'}">--%>
<%--                                                <button class="btn btn-linelgray small30" type="button" onclick=""><span>배송조회</span></button>--%>
<%--                                                &lt;%&ndash;                                    openDlvTrcUrlPup('20220513295854', '1')&ndash;%&gt;--%>
<%--                                                <button class="btn btn-linelgray small30" type="button" onclick=""><span>만족도평가</span></button>--%>
<%--                                                &lt;%&ndash;                                    openItemEvalPopup('2137807436', '00008', '20220513295854')&ndash;%&gt;--%>
<%--                                            </c:if>--%>
<%--                                        </div>--%>
<%--                                    </dd>--%>
                                </dl>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:if test="${list.size() == 0}">
                        <div class="nodata">
                            <span class="bgcircle"><i class="icon nodata-type7"></i></span>
                            <p>최근 14일간의 주문한 상품이 없습니다.</p>
                        </div>
                    </c:if>
                    <!-- 추후 상품전시 레이아웃 마크업으로 변경 필요 -->


<%--                    <h3 class="title22">--%>
<%--                        최근 상담내역--%>
<%--                        <div class="btngroup abs">--%>
<%--                            <a href="/customer/myInquiryPage" class="btn atext" onclick="gaTagging(this, '', '', '');"--%>
<%--                               ga-custom-name="마이페이지" ga-custom-position="최근 상담내역" ga-custom-creative="전체보기"--%>
<%--                               ga-custom-title="마이페이지>메인" ga-custom-etc="urlAction"><span>전체보기</span><i--%>
<%--                                    class="arrow right"></i></a>--%>
<%--                        </div>--%>
<%--                    </h3>--%>
<%--                    <div class="pdlist-wrap col4"> <!--// 4xn class="col4" 추가 -->--%>

<%--                        <!-- [12/08]_수정(위키 342 관련 내용 수정 - 찜한 상품이 없을 경우 추가) -->--%>
<%--                        <div class="nodata">--%>
<%--                            <p>찜한 상품이 없습니다.</p>--%>
<%--                        </div>--%>


                    </div>

                </div>
            </div>
            <!-- // .contents -->


        </div>
    </div>
</main>
<%--<script>--%>
<%--    function orderCancel(productSeq) {--%>
<%--        $.ajax({--%>
<%--            url: "mypageOrderCancel/" + ${productSeq},--%>
<%--            method: "get", // 요청방식은 post--%>
<%--            // beforeSend: function(xhr) {--%>
<%--            //     xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)--%>
<%--            // },--%>
<%--            success: function (result) {--%>
<%--                if (result === "1") {--%>
<%--                    // 비밀번호 입력 상단부 숨기고, 회원정보 수정 폼 보여주기--%>
<%--                    document.getElementById("headerSection").style.display = "none";--%>
<%--                    document.getElementById("bottomSection").style.display = "";--%>
<%--                } else {--%>
<%--                    // 비밀번호가 회원 정보와 일치하지 않는 경우 초기화 후 alert창 띄워주기--%>
<%--                    $("div#divPassword").addClass("failed");--%>
<%--                    $("i#alterPasswordIcon").addClass("error");--%>
<%--                    $("span#alterPassword").text("비밀번호가 맞지 않습니다. 다시 확인하여 입력해주세요").show();--%>
<%--                    //alert("비밀번호를 입력해 주세요.");--%>
<%--                    $("input[name='pwd']").focus();--%>
<%--                    $('#inputpwd').val('');--%>
<%--                }--%>
<%--            }, error: function (error) {--%>
<%--                alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인--%>
<%--            }--%>
<%--        })--%>
<%--    }--%>
<%--</script>--%>