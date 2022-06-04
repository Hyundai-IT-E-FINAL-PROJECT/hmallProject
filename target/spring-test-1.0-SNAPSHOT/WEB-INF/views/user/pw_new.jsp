<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/27
  Time: 6:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="cbody gird-full">
            <div class="contents w520">
                <div class="inner-box">
                    <!--tit-wrap-->
                    <dl class="tit-wrap">
                        <dt class="title24">비밀번호 변경</dt>
                    </dl>
                    <!--//tit-wrap-->
                    <!--아코디언-->
                    <form method="post" action="newPassWord">
                        <div class="accparent">
                            <!--회원정보로찾기-->   <!--h3/accordion-panel에 selected 시 열림-->
                            <div class="accordion-panel user-find-id-info selected" role="user-find-id-info" aria-label="회원정보로찾기">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <div class="inputbox" id="divPersonName">
                                    <label class="inplabel">
                                        <input type="password" id="user_password" name="user_pw" placeholder="비밀번호 입력">
                                    </label>
                                </div>
                                <div class="inputbox" id="divPersonEmail">
                                    <label class="inplabel">
                                        <input type="password" id="user_password2" name="user_pw2" placeholder="비밀번호 확인">
                                    </label>
                                </div>
                                <!-- fail일 경우 메세지 출력-->
                                <p class="failed-msg" id="alertPerson" style="display:none;">
                                    <i class="icon error"></i>
                                </p>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="submit" id="check" value="비밀번호변경"/>
                                <input type="hidden" name="user_email" value="${email}"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>