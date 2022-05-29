<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/26
  Time: 6:54 PM
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
                        <dt class="title24">아이디 찾기</dt>
                        <dd>본인확인 방법을 선택하세요.</dd>
                    </dl>
                    <!--//tit-wrap-->
                    <!--아코디언-->

                    <form id="findIdForm" name="findIdForm" method="post" action="find_id">
                        <div class="accparent">
                            <!--회원정보로찾기-->   <!--h3/accordion-panel에 selected 시 열림-->
                            <h3 class="selected">
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="true"><span><span class="bgcircle"><i class="icon user-person"></i></span>회원정보로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-id-info selected" role="user-find-id-info" aria-label="회원정보로찾기">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <div class="inputbox" id="divPersonName">
                                    <label class="inplabel">
                                        <input type="text" id="user_name" name="user_name" placeholder="이름">
                                    </label>
                                </div>
                                <div class="inputbox" id="divPersonEmail">
                                    <label class="inplabel">
                                        <input type="text" id="user_email" name="user_email" placeholder="이메일">
                                    </label>
                                </div>
                                <!-- fail일 경우 메세지 출력-->
                                <p class="failed-msg" id="alertPerson" style="display:none;">
                                    <i class="icon error"></i>

                                </p>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        <input type="submit" id="find_id_with_birth" class="btn btn-default medium" onclick="location.href='${contextPath}/user/find_id'"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- //.container -->
</main>
<script>
    <%--$(function (){--%>
    <%--    $("#find_id_with_birth").click(function (){--%>
    <%--        location.href='${contextPath}/user/'--%>
    <%--    })--%>
    <%--})--%>
</script>

