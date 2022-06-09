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

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/login.css">
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
<link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="cbody gird-full">
            <div class="contents w520">
                <div class="inner-box">
                    <div class="tabgroup bdline">
                        <div class="tab tab-default">
                            <ul class="tabmenu ui-tab" role="tablist">
                                <li role="presentation" id="originTab" class="ui-active" onclick="orginLogin();"><a href="#hmall" aria-controls="#hmall" role="hmall" data-modules-tab="">Hmall 간편회원</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane ui-active" id="hmallLogin">
                                <form action="/login" method="post">
                                    <div role="tabpanel" class="tab-pane ui-active" id="hmall">
                                        <div class="login-form">
                                            <div class="inputbox xl">
                                                <label class="inplabel">
                                                    <input type="text" id="username" maxlength="30" tabindex="1" name="username" placeholder="아이디 입력">
                                                </label>
                                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                <i class="icon person"></i>
                                            </div>
                                            <div class="inputbox xl">
                                                <label class="inplabel">
                                                    <input type="password" id="password" tabindex="2" size="30" maxlength="30" name="password" placeholder="비밀번호">
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
                                                        <span>
                                                            <c:if test="${LoginFailMessage!=null}">
                                                                <p><c:out value="${LoginFailMessage}"/> </p>
                                                            </c:if>
                                                        </span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- //.login-relate -->
                                        <!-- <div class="btngroup btnlen1"> -->
                                        <button id="loginCheck" class="btn btn-login btn-default" tabindex="3" onclick="close_popup()"><span>로그인</span></button>
                                        <!-- </div> -->

                                        <ul class="login-find">
                                            <li><a href="${contextPath}/user/finduser_info" onclick="findId(); return false;">아이디 찾기</a></li>
                                            <li><a href="${contextPath}/user/find_pw" onclick="findPwd(); return false;">비밀번호 찾기</a></li>
                                            <li><a href="${contextPath}/user/user_agree" onclick="goRegistMember()">회원가입</a></li>
                                        </ul>

                                        <div class="login-help-wrap">
                                            <span class="txt">회원가입이 어려우시다면?</span>
                                            <div class="btn btn-round xs">
                                                <span class="bold">080-077-0000</span>
                                            </div>
                                        </div>

                                        <!-- //Hmall 아이디 로그인에서만 노출 -->

                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<<<<<<< HEAD
</main>
=======
</main>
>>>>>>> minsu
