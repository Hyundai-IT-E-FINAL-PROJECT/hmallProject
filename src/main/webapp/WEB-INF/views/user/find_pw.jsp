<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/27
  Time: 10:13 AM
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
                    <div class="accparent" id="firstMain">
                        <div class="accordion-panel user-find-pw-email selected" role="user-find-pw-email" aria-label="이메일 입력">
                            <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
<%--                            <form id="findPwForm" name="findPwForm" method="post" action="/user/find_pw_with_email">--%>
                                <div class="inputbox" id="divEmailId">
                                    <label class="inplabel"><input type="text" id="user_email" name="user_email" placeholder="이메일 입력" maxlength="30" value=""></label>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                <button class="btn btn-login btn-default" onclick="email_check();"><span>다음</span></button>
<%--                            </form>--%>
                        </div>
                    </div>


                    <div class="accparent" id="nextMain" style="display:none">
                        <!--등록된 이메일로 찾기-->  <!--h3/accordion-panel에 selected 시 열림-->
                        <div id="accEmail">
                            <h3 id="findIdByEmail">
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="true">
                                    <span><span class="bgcircle"><i class="icon user-email"></i></span>등록된 이메일로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-pw-email" role="user-find-pw-email" aria-label="등록된 이메일로 찾기" id="findIdByMyEmail">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <div class="inputbox" id="divEmailName">
                                    <label class="inplabel"><input type="text" id="emailName" name="emailName" placeholder="이름"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <p class="failed-msg" id="alertEmailName" style="display: none;">
                                    <i class="icon error"></i>
                                    <span>이름을 입력해 주세요.</span>
                                </p>

                                <div class="inputbox" id="divEmail">
                                    <label class="inplabel"><input type="text" id="email" name="email" placeholder="이메일"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <p class="failed-msg" id="alertEmail" style="display:none;">
                                    <i class="icon error"></i>
                                    <span>이메일을 입력해 주세요.</span>
                                </p>
                                <button class="btn btn-linered medium" type="button" onclick="sendEmail();"><span>인증메일 발송</span></button>
                            </div>
                        </div>
                        <!--//등록된 이메일로 찾기-->
                    </div>



                        <!--//휴대폰본인인증으로찾기-->
                    <!--//아코디언-->
                    <div class="acc-footinfo">
                        <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                        <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의해주세요.</p>
                        <div class="linkwrap">
                            <span class="txt">아이디를 찾으시나요?</span>
                            <a href="#" class="alink" onclick="findId();"><span>아이디 찾기</span></a>
                        </div>
                    </div>
                </dl></div>
            <!--inner-box-->
        </div>
    </div>
</main>
<script>
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}"
    function email_check(){
        console.log("이메일 체크");
        var user_email = document.getElementById("user_email").value;
        console.log(user_email);

        $.ajax({
            url: "${contextPath}/user/find_email",
            method: "post",
            data: {"user_email":user_email},
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },
            success: function (result){
                console.log(result);
                if(result === "1"){
                    console.log("회원가입 기록 있음");
                    alert("인증된 이메일 입니다! ");
                    location.href = '${ContextPath}/user/find_pw_with_email';
                }else{
                    console.log("회원가입 기록 없음");
                }
            }
        })
    }
</script>