<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main class="cmain main" role="main" id="mainContents">
    <div class="container">
        <div class="cbody gird-full">
            <div class="contents w520">
                <dl class="inner-box">
                    <!--tit-wrap-->
                    <dl class="tit-wrap">
                        <dt class="title24">인증번호 입력</dt>
                        <dd>이메일로 전송된 인증번호를 입력해 주세요</dd>
                    </dl>
                    <!-- S : 로그인 시도 의심 case 마크업 추가 09/14 -->
                    <!--아코디언-->
                    <div class="accparent" id="firstMain">
                        <div class="accordion-panel user-find-pw-email selected" role="user-find-pw-email" aria-label="이메일 입력">
                            <form action="pw_set.me" method="post">
                                <input type="hidden" name="num" value="${num}">
                                <div class="inputbox" id="divEmailId">
                                    <label class="inplabel"><input type="text" id="checking_email" name="checking_email" placeholder="인증번호를 입력하세요"></label>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <input type="submit" class="btn btn-login btn-default" id="check" value="확인">
                            </form>
                        </div>
                    </div>

                </dl>
            </div>
            <!--inner-box-->
        </div>
    </div>
</main>

