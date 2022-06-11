<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오전 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="side-content">
    <sec:authentication property="principal" var="pinfo" />
    <h3 class="side-menu-title"><a href="/mypage">마이페이지</a></h3>
    <div class="side-menu-list">
        <ul>
            <li>
                <a href="javascript:;">주문관리</a>
                <ul class="sub-list">
                    <li><a href="/mypageOrder">주문접수</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">고객센터</a>
                <ul class="sub-list">
                    <li><a href="/customer/inquiryPage">1:1 상담</a></li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">크라우드 펀딩</a>
                <ul class="sub-list">
                    <li><a href="/fund/myFunding">펀딩 상품 보러가기</a></li>
                </ul>
            </li>

        </ul>
    </div>
</div>
