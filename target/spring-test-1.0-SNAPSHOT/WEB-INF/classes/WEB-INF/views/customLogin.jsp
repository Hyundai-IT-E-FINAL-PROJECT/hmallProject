<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/22
  Time: 2:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page import="org.springframework.security.core.Authentication" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/login.css">
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
</head>
<body>
<div class="popup-win wp-log-hmall">
    <div class="pop-wrap" tabindex="0">
        <div class="pop-content-wrap">
            <strong class="pop-title">Hmall 로그인</strong>
            <div class="pop-content">
                <div class="tabgroup bdline">
                    <!-- Tab panes -->
                    <div class="tab tab-default">
                        <ul class="tabmenu ui-tab" role="tablist">
                            <li role="presentation" id="originTab" class="ui-active" onclick="orginLogin();">Hmall 로그인</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane ui-active" id="hmallLogin">
                            <%--                            <h2><c:out value="${error}"/></h2>--%>
                            <%--                            <h2><c:out value="${logout}"/></h2>--%>
                            <form method="post" action="/login">

                                <div role="tabpanel" class="tab-pane ui-active" id="hmall">
                                    <div class="login-form">
                                        <div class="inputbox xl">
                                            <label class="inplabel">
                                                <input type="text" maxlength="30" tabindex="1" name="username" placeholder="아이디 입력">
                                            </label>
                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                            <i class="icon person"></i>
                                        </div>
                                        <div class="inputbox xl">
                                            <label class="inplabel">
                                                <input type="password" tabindex="2" size="30" maxlength="30" name="password" placeholder="비밀번호">
                                            </label>
                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                            <i class="icon lock"></i>
                                        </div>


                                        <div class="toast arrtl" style="display: none;" id="alertCapsLock">
                                            <p><i class="icon"></i> <strong>&lt;Caps Lock&gt;</strong>이 켜져 있습니다.</p>
                                        </div>

                                        <!-- 입력 실패 메세지 -->
                                        <p class="failed-msg" style="display: none;" id="alertMember">
                                            <i class="icon error"></i>
                                            <span>아이디를 입력해 주세요.</span>
                                        </p>
                                        <p class="failed-msg" style="display: none;" id="alertHpoint">
                                            <i class="icon error"></i>
                                            <span>H.Point 통합회원이시면 상단의 'H.Point 통합회원'을 선택해 주세요.</span>
                                        </p>
                                        <!-- <p class="failed-msg">아이디를 입력해 주세요.</p> -->
                                        <!-- <p class="failed-msg">비밀번호를 입력해 주세요.</p> -->
                                        <!-- <p class="failed-msg">아이디 또는 비밀번호를 다시 확인해 주세요<br>H.Point 회원이시면 상단의 'H.Point 아이디'를 선택하세요.</p> -->
                                    </div>
                                    <!-- //.login-form -->

                                    <div class="login-relate">
                                        <div class="checkbox-wrap">
                                            <div class="checkbox">
                                                <label class="chklabel">
                                                    <input type="checkbox" name="idSaveYn">
                                                    <i class="icon"></i>
                                                    <span>아이디 저장</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //.login-relate -->
                                    <!-- <div class="btngroup btnlen1"> -->
                                    <button id="loginCheck" class="btn btn-login btn-default" onclick="memberLogin('ajax');return false;" tabindex="3"><span>로그인</span></button>
                                    <!-- </div> -->

                                    <ul class="login-find">
                                        <li><a href="${contextPath}/user/finduser_info" onclick="findId(); return false;">아이디 찾기</a></li>
                                        <li><a href="javascript:;" onclick="findPwd(); return false;">비밀번호 찾기</a></li>
                                        <li><a href="javascript:;" onclick="goRegistMember()">회원가입</a></li>
                                    </ul>

                                    <!-- Hmall 아이디 로그인에서만 노출 -->

                                    <div class="btngroup btnlen2">
                                        <button type="button" class="btn btn-naver" onclick="naverLogin();"><i class="icon"></i><span>네이버 로그인</span></button>
                                        <button type="button" class="btn btn-kakao" onclick="kakaoLogin();"><i class="icon"></i><span>카카오톡 로그인</span></button>
                                    </div>


                                    <div class="login-ad">
                                        <a href="#" onclick="GA_Event('로그인' , '휴대폰 번호로 로그인' , '');loginPlus();">
                                            <img src="//image.hmall.com/p/img/co/sample/img-login-ad-2x.png" alt="휴대폰 번호로 로그인">
                                        </a>
                                    </div>

                                    <div class="btngroup btnlen1">
                                        <button class="btn btn-linelgray" onclick="GA_Event('로그인' , '비회원 주문조회' , '');nonMemberOrderLookup(); return false;"><span>비회원 주문조회</span></button>
                                    </div>
                                    <div class="login-help-wrap">
                                        <span class="txt">회원가입이 어려우시다면?</span>
                                        <div class="btn btn-round xs">
                                            <span class="bold">080-077-0000</span>
                                        </div>
                                    </div>

                                    <!-- //Hmall 아이디 로그인에서만 노출 -->

                                </div>
                                <div>
                                    <input type="submit" value="로그인">
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            </form>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="hpointLogin">
                            <div class="login-form">

                                <div class="inputbox xl">
                                    <label class="inplabel">

                                        <input type="text" name="hpointId" id="hpointId" placeholder="H.Point 통합회원 아이디" title="H.Point 통합회원 아이디">

                                    </label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    <i class="icon person"></i>
                                </div>


                                <div class="inputbox xl">
                                    <label class="inplabel">
                                        <input type="password" name="hpointPwd" onkeypress="javascript:capslockByhpoint(event);" id="hpointPwd" placeholder="비밀번호" title="비밀번호 입력" onkeydown="javascript:if(event.keyCode==13){$('#hpointLoginCheck').click(); return false;}"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    <i class="icon lock"></i>
                                </div>

                                <div class="toast arrtl" style="display: none;" id="alertCapsLockByHpoint">
                                    <p><i class="icon"></i> <strong>&lt;Caps Lock&gt;</strong>이 켜져 있습니다.</p>
                                </div>

                                <!-- 입력 실패 메세지 -->
                                <p class="failed-msg" style="display:none;" id="alertByHpointLogin">
                                    <i class="icon error"></i>
                                    <span>아이디를 입력해 주세요.</span>
                                    <!--<span>비밀번호를 입력해 주세요.</span>-->
                                    <!--<span>아이디 또는 비밀번호를 다시 확인해 주세요<br>Hmall 간편회원이시면 상단의 'Hmall 간편회원'을 선택해 주세요.</span>-->
                                </p>
                            </div>

                            <div class="login-relate">
                                <div class="checkbox-wrap">
                                    <div class="checkbox">
                                        <label class="chklabel">
                                            <input type="checkbox" name="save_id_hp" id="idSaveYn1">
                                            <i class="icon"></i><span>아이디 저장</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <button id="hpointLoginCheck" class="btn btn-login btn-default" onclick="memberLoginByHpoint('ajax');return false;"><span>로그인</span></button>

                            <ul class="login-find">
                                <li><a href="https://www.h-point.co.kr/cu/config/findCustId.nhd">아이디 찾기</a></li>
                                <li><a href="https://www.h-point.co.kr/cu/config/findCustPwd.nhd">비밀번호 찾기</a></li>
                                <li><a href="javascript:;" class="btn alink" onclick="doSearchUPntRegPop();">회원가입</a></li>
                            </ul>

                            <div class="login-btn">
                                <a href="javascript:;" class="btn alink" onclick="otpLogin();"><span>OTP 인증번호 로그인</span></a>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="hpoint-otp">
                            <div class="login-form">

                                <div class="inputbox xl">
                                    <label class="inplabel"><input type="text" maxlength="8" id="otpNum" name="otpNum" placeholder="OTP 인증번호 입력" title="OTP 인증번호 입력"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    <i class="icon person"></i>
                                </div>

                                <p class="otp-txt">H.Point 앱을 실행하여, 설정 메뉴의 로그인/회원 설정 항목에서 ‘OTP 인증번호 발급’을 누른 후 발급되는 일회용 인증번호를 입력해 주세요.</p>

                                <!-- 입력 실패 메세지 -->
                                <p class="failed-msg" style="display: none;" id="alertByOtp">
                                    <i class="icon error"></i>
                                    <span>OTP 인증번호를 입력해 주세요.</span>
                                    <!--<span>OTP 인증번호를 다시 확인해 주세요.</span>-->
                                </p>
                            </div>

                            <button class="btn btn-login btn-default" onclick="memberLoginByOtp('ajax');return false;"><span>로그인</span></button>

                            <div class="login-btn">
                                <a href="javascript:;" class="btn alink" onclick="hpointLogin()"><span>아이디/비밀번호 로그인</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //.tabgroup -->
            </div>
        </div>

    </div>
</div>
</body>
</html>