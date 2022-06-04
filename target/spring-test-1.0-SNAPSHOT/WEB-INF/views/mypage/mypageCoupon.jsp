<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">
            <!-- LNB 시작 -->
            <%@ include file="mypageSide.jsp" %>
            <!-- // LNB 끝 -->

            <c:set var = "sum" value = "0" />
            <c:forEach var="list" items="${list}">
                <c:if test="${list.lefttime <= 30}">
                    <c:set var= "sum" value="${sum + 1}"/>
                </c:if>
            </c:forEach>

            <div class="contents">
                <div class="mypage-coupon-wrap">
                    <div class="bg-gray-box">
                        <div class="top-area">
                            <h3 class="title">내 쿠폰 보기</h3>
                            <ul class="list">
                                <li>
                                    <span class="tit">사용가능 쿠폰</span>
                                    <span class="txt"><strong>${fn:length(list)}<span class="mdhTxt"></span></strong>장</span>
                                </li>
                                <li>
                                    <span class="tit">사용임박 쿠폰</span>
                                    <span class="txt"><strong><c:out value="${sum}"/><span class="mdhTxt"></span></strong>장 (30일 이내)</span>
                                </li>
                            </ul>
                        </div>

                    </div>


                    <h3 class="title22">현재 보유 쿠폰</h3>
                    <div class="coupon-list-box">
                        <ul>
                            <!-- 사용한 쿠폰은 안보이게 -->
                            <c:forEach items="${list}" var="list">
                            <li class="coupon-box">
                                <div class="coupon">
                                    <c:choose>
                                        <c:when test="${list.COUPON_COST == 0}">
                                            <p class="discount">
                                                <strong>${list.COUPON_RATIO}</strong>
                                                <b>% 할인</b>
                                            </p>
                                        </c:when>
                                        <c:when test="${list.COUPON_RATIO == 0}">
                                            <p class="discount">
                                                <strong>${list.COUPON_COST}</strong>
                                                <b>원 할인</b>
                                            </p>
                                        </c:when>
                                    </c:choose>

                                    <div class="coupon-info">
                                        <p class="title">
                                            <strong>${list.COUPON_NAME}</strong>
                                        </p>
                                        <ul class="coupon-info-list">
                                            <li> 기준금액: ${list.EXPIRED_COST}원 이상 </li>

                                            <li>기간: <fmt:formatDate value="${list.CREATED_AT}"/> ~ <fmt:formatDate value="${list.EXPIRED_DATE}"/> </li>
                                        </ul>
                                        <p class="type">
                                            남은기간 : ${list.lefttime}일
                                        </p>

                                        <button class="btn btn-linelgray small30 abs" data-modules-modal="target:#applicable-item;" onclick="doSearchSlitmPop('02683299');return false;"><span>적용상품보기</span></button><!-- 2020-09-28 마크업 추가 -->

                                    </div>
                                </div>
                                <div class="coupon-bg"><div></div><div></div></div>
                            </li>
                            </c:forEach>

                            <div class="paging">


                                <div class="page-prevarea">


                                    <strong aria-label="현재 선택페이지">1</strong>


                                </div>



                            </div>



                        </ul>
                    </div>

                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>
    <!-- //.container -->

</main>