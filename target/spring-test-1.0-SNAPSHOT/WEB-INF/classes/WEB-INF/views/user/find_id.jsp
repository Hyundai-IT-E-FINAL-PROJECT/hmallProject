<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/26
  Time: 8:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="cbody gird-full">
            <div class="contents w520">
                <div class="inner-box">
                    <!-- 휴대폰번호 인증으로 아이디 찾기 완료 -->
                    <div class="completed case-a">
                        <!--tit-wrap-->
                        <dl class="tit-wrap">
                            <dt class="title24">아이디 찾기</dt>
                            <dd>이름과 생년월일이 일치하는 모든 아이디가 조회됩니다.</dd>
                            <dd class="sub-txt">가려지지 않은 아이디 전체 확인이 필요하신 경우 <br>휴대폰 본인인증을 이용해 주세요.</dd>
                        </dl>
                        <!--//tit-wrap-->
                        <!-- id-inquiry -->
                        <ul class="id-inquiry">
                            <li>
                                <div class="idresult">
                                    <fmt:formatDate var="formatRegDate" value="${find.created_at}" pattern="yyyy.MM.dd"/>
                                    <strong>${find.user_id}</strong>
                                    <p>(가입일: ${formatRegDate} )</p>
                                </div>
                                <div class="btngroup">
                                </div>
                            </li>

                        </ul>
                        <!--// id-inquiry -->
                        <div class="btngroup">
                            <button class="btn btn-default medium" type="button" onclick="openLoginPopup('');return false;">
                                <span>로그인</span>
                            </button>
                        </div>
                        <div class="acc-footinfo">
                            <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                            <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의하시기 바랍니다.</p>
                            <div class="linkwrap">
                                <span class="txt">비밀번호를 찾으시나요?</span>
                                <a href="/p/cob/findPwdPupEmail.do" class="alink"><span>비밀번호 찾기</span></a>
                            </div>
                        </div>
                    </div>
                    <!--// 휴대폰번호 인증으로 아이디 찾기 완료 -->
                </div>
            </div>
        </div>
    </div>
</main>
