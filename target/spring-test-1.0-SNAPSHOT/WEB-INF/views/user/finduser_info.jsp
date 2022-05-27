<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<body>
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
                    <form id="findIdForm" name="findIdForm" method="post" action="">
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
                                        <input type="text" id="personName" name="personName" placeholder="이름">
                                    </label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox" id="divBirthday">
                                    <label class="inplabel">
                                        <input type="text" id="birthday" name="birthday" placeholder="생년월일 (예 : 19900822)" maxlength="8" onkeyup="this.value = this.value.replace(/[^0-9]/g,'');">
                                    </label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <!-- fail일 경우 메세지 출력-->
                                <p class="failed-msg" id="alertPerson" style="display:none;">
                                    <i class="icon error"></i>
                                    <span>숫자 외에 다른 문자는 입력하실 수 없습니다.</span>
                                </p>
                                <button class="btn btn-default medium" type="button" onclick="cert_person(); return false;"><span>인증하기</span></button>
                            </div>


                            <!--등록된휴대폰번호로찾기--> <!--h3/accordion-panel에 selected 시 열림-->
                            <h3>
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="true">
                                    <span><span class="bgcircle"><i class="icon user-phone"></i></span>등록된 휴대폰번호로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-id-email" role="user-find-id-email" aria-label="등록된 이메일로 찾기">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <div class="inputbox" id="divName">
                                    <label class="inplabel"><input type="text" id="name" name="name" placeholder="이름"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox" id="divTel">
                                    <label class="inplabel">
                                        <input type="text" id="tel" name="tel" placeholder="휴대폰 번호 (예:01012345678)" maxlength="11" onkeyup="this.value = this.value.replace(/[^0-9]/g,'');">
                                    </label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <!-- fail일 경우 메세지 출력 alertTel alertName 합침 -->
                                <p class="failed-msg" id="alertRegistPhone" style="display:none;">
                                    <i class="icon error"></i>
                                    <span>휴대폰 번호를 입력해주세요.</span>
                                </p>
                                <button class="btn btn-linered medium" type="button" id="authStep1Div" onclick="authStart();">
                                    <span>인증번호 발송</span>
                                </button>
                                <div class="inputbox" id="divCertNo" style="display: none">
                                    <label class="inplabel btnlabel">
                                        <input type="text" id="certNo" name="certNo" maxlength="6" placeholder="인증번호 6자리" title="인증번호 6자리 입력">
                                    </label>
                                    <button class="btn btn-lineblack btn-confirm" type="button" onclick="authStart();"><span>인증번호 재발송</span></button>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>                                <!-- fail일 경우 메세지 출력 -->
                                <p class="failed-msg" id="alertCertNo" style="display:none;">
                                    <i class="icon error"></i>
                                    <span>인증번호를 입력해 주세요.</span>
                                </p>
                                <button class="btn btn-default medium" type="button" id="authStep2Div" style="display: none" onclick="smsConfirm();">
                                    <span>인증하기</span>
                                </button>
                            </div>


                            <!--등록된 이메일로 찾기-->  <!--h3/accordion-panel에 selected 시 열림-->
                            <h3>
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false">
                                    <span><span class="bgcircle"><i class="icon user-email"></i></span>등록된 이메일로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-id-email" role="user-find-id-email" aria-label="등록된 이메일로 찾기">
                                <!--inputbox fail일 경우 class="failed" 붙여줘야함-->
                                <div class="inputbox" id="divEmailName">
                                    <label class="inplabel">
                                        <input type="text" id="emailName" name="emailName" placeholder="이름">
                                    </label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox" id="divEmailId">
                                    <label class="inplabel"><input type="text" id="email" name="email" placeholder="이메일"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <!-- fail일 경우 메세지 출력 alertEmailName alertEmail 합침-->
                                <p class="failed-msg" id="alertEmail" style="display:none;">
                                    <i class="icon error"></i>
                                    <span>이메일을 입력해주세요.</span>
                                </p>
                                <button class="btn btn-linered medium" type="button" onclick="sendEmail();"><span>인증메일 발송</span></button>
                            </div>


                            <!--휴대폰본인인증으로찾기-->  <!--h3/accordion-panel에 selected 시 열림-->
                            <h3>
                                <button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false">
                                    <span><span class="bgcircle"><i class="icon user-myphone"></i></span>휴대폰 본인인증으로 찾기</span><i class="icon acc-arrow"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel user-find-id-myphone" role="user-find-id-myphone" aria-label="휴대폰본인인증으로찾기">
                                <button class="btn btn-default medium" type="button" onclick="certHphone();"><span>인증하기</span></button>
                                <div class="noti-wrap">
                                    <div class="noti-tit-wrap">
                                        <strong class="ctypo14"><i class="icon noti"></i>본인인증에 실패하셨나요?</strong>
                                        <a href="#acc_native" onclick="certByMobile2('certByMobileForm2')">
                                            <span>타 기관 인증하기<i class="icon btn-arrow"></i></span> <!--pc공통 레이아웃 작업 받은 후 클래스명 변경 될 수 있음-->
                                        </a>
                                    </div>
                                    <p class="caption13">회원님의 정보가 해당 인증기관에 등록되어 있지 않거나 기타 다른 이유로<br>실패한 경우일수 있습니다. </p>
                                </div>
                            </div>
                            <!--//휴대폰본인인증으로찾기-->
                        </div>
                    </form>
                    <!--//아코디언-->

                    <!--아코디언 footer-->
                    <div class="acc-footinfo">
                        <p class="text-msg">아이디/패스워드 찾기가 안될 경우,</p>
                        <p class="text-msg">고객센터 <a href="tel:1600-0000" class="tel">1600-0000</a>으로 문의하시기 바랍니다.</p>
                        <div class="linkwrap">
                            <span class="txt">비밀번호를 찾으시나요?</span>
                            <a href="#" onclick="findPwd();" class="alink"><span>비밀번호 찾기</span></a>
                        </div>
                    </div>
                    <!--//아코디언 footer-->
                </div>
                <!--inner-box-->
            </div>
        </div>
    </div>
    <!-- //.container -->
</main>
</body>
