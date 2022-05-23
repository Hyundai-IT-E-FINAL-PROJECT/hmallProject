<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오전 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<div class="side-content">
    <h3 class="side-menu-title"><a href="/mypage">마이페이지</a></h3>
    <div class="side-menu-list">
        <ul>
            <li>
                <a href="javascript:;">나의 쇼핑내역</a>
                <ul class="sub-list">
                    <li><a href="/mypageOrder">주문/배송조회</a></li>
                    <li><a href="/mypageOrder">취소/교환/반품</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">나의 혜택</a>
                <ul class="sub-list">
                    <li><a href="/mypagePoint">적립금</a></li>
                    <li><a href="/mypagePoint">예치금</a></li>
                    <li><a href="/mypageCoupon">쿠폰</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">나의 정보</a>
                <ul class="sub-list">
                    <li><a href="/passwordCheck/mypageUpdate">회원정보 변경</a></li>
                    <li><a href="/passwordCheck/mypageDelivery">배송지 관리</a></li>
                    <li><a href="/passwordCheck/mypageLeave">회원 탈퇴</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript:;">고객센터</a>
                <ul class="sub-list">
                    <li><a href="https://www.hmall.com/p/ccd/selectCnslOrdReqDtl.do">1:1 상담</a></li>
                    <li><a href="https://www.hmall.com/p/mpb/selectItemQNAPagingByCondition.do">상품 Q&A</a></li>
                </ul>
            </li>

        </ul>
    </div>
</div>
</body>
</html>
