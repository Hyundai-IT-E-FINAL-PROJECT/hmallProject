<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/27
  Time: 10:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<main class="cmain main" role="main" id="mainContents">
    <div class="container">
        <div class="cbody gird-full">
            <div class="contents w520">
                <dl class="inner-box">
                    <!--tit-wrap-->
                    <dl class="tit-wrap">
                        <dt class="title24">비밀번호 찾기</dt>
                        <dd>아이디를 입력해 주세요.<br>본인확인 후 비밀번호를 다시 설정할 수 있습니다.</dd>
                    </dl>
                    <!-- S : 로그인 시도 의심 case 마크업 추가 09/14 -->
                    <!--아코디언-->
                    <div class="accparent" id="firstMain" style="display: none;">
                        <div class="accordion-panel user-find-pw-email selected" role="user-find-pw-email" aria-label="아이디 또는 이메일 아이디 입력">
                            <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                            <div class="inputbox" id="divEmailId">
                                <label class="inplabel"><input type="text" id="emailId" name="emailId" placeholder="아이디 또는 이메일 아이디 입력" maxlength="30"></label>
                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                            </div>
                            <p class="failed-msg" id="alertEmailId" style="display: none;">
                                <i class="icon error"></i>
                                <span>아이디 또는 이메일 아이디를 입력해 주세요.</span>
                            </p>
                            <button class="btn btn-default medium" onclick="findCertInfoById();"><span>다음</span></button>
                        </div>
                    </div>
                    <div class="accparent" id="nextMain" style="">
                        <!--등록된 이메일로 찾기-->  <!--h3/accordion-panel에 selected 시 열림-->
                        <div id="accEmail">
                            <h3 id="findIdByEmail" class="selected">
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="true">
                                    <span><span class="bgcircle"><i class="icon user-email"></i></span>등록된 이메일로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-pw-email selected" role="user-find-pw-email" aria-label="등록된 이메일로 찾기" id="findIdByMyEmail">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <form action="find_pw_email_check" method="post">
                                    <div class="inputbox" id="divEmailName">
                                        <label class="inplabel"><input type="text" id="user_name" name="user_name" placeholder="이름"></label>
                                    </div>

                                    <div class="inputbox" id="divEmail">
                                        <label class="inplabel"><input type="email" id="user_email" name="user_email" placeholder="이메일" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" ></label>
                                    </div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input id="sendEmail" class="btn btn-linered medium" type="submit" value="인증메일 발송" style="color: orangered">
                                </form>
                            </div>
                        </div>
                        <!--//등록된 이메일로 찾기-->
                        <!--휴대폰본인인증으로찾기-->  <!--h3/accordion-panel에 selected 시 열림-->
                        <div id="accPhone" style="display: none;">
                            <h3 id="findIdByCi">
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false">
                                    <span><span class="bgcircle"><i class="icon user-myphone"></i></span>휴대폰 본인인증으로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-id-myphone" role="user-find-id-myphone" aria-label="휴대폰본인인증으로찾기" id="findIdMyPhone">
                                <button class="btn btn-default medium" type="button" onclick="certHphone();"><span>인증하기</span></button>
                                <div class="noti-wrap">
                                    <div class="noti-tit-wrap">
                                        <strong class="ctypo14"><i class="icon noti"></i>본인인증에 실패하셨나요?</strong>
                                        <a href="#" onclick="certHphoneSci();">
                                            <span>타 기관 인증하기<i class="icon btn-arrow"></i></span>
                                        </a>
                                    </div>
                                    <p class="caption13">회원님의 정보가 해당 인증기관에 등록되어 있지 않거나 기타 다른 이유로<br>실패한 경우일수 있습니다. </p>
                                </div>
                            </div>
                        </div>
                        <!--//휴대폰본인인증으로찾기-->
                    </div>
                    <!--//아코디언-->
                    <div class="acc-footinfo">
                        <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                        <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의해주세요.</p>
                        <div class="linkwrap">
                            <span class="txt">아이디를 찾으시나요?</span>
                            <a href="#" class="alink" onclick="findId();"><span>아이디 찾기</span></a>
                        </div>
                    </div>
                </dl>
            </div>
            <!--inner-box-->
        </div>
    </div>
</main>