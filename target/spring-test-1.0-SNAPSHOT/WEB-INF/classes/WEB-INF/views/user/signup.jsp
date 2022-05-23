<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
    <meta charset="utf-8" />
    <title>현대백화점그룹 통합멤버십 | H.Point</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Pragma"        content="no-Cache" />
    <meta http-equiv="Cache-Control" content="no-Cache" />
    <meta name="viewport"    content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, target-densitydpi=medium-dpi" />
    <meta name="keywords"    content="H.Point,현대백화점,통합멤버십,h포인트,hpoint" />
    <meta name="description" content="현대백화점그룹 통합멤버십 H.Point! 쇼핑부터 여행/문화 혜택까지 고객님의 라이프스타일을 케어합니다." />
    <meta name="name" content="현대백화점그룹 통합 멤버십" />
    <meta name="format-detection" content = "telephone=no"/>
    <meta property="og:type"      content="article" />
    <meta property="og:site_name" content="현대백화점그룹 통합 멤버십" />
    <meta property="og:title"     content="현대백화점그룹 통합 멤버십" />
    <meta property="og:description" content="현대백화점그룹 통합 멤버십" />
    <meta property="og:image"       content="https://www.h-point.co.kr/images_customer/logo/invite_201127.png" />

    <link rel="stylesheet" href="${contextPath}/resources/css/join.css">
    <link rel="stylesheet" href="/assets/app/css/swiper.min.css"><!-- RENEWAL 2021 -->
    <link rel="stylesheet" href="/assets/app/css/screen.ui.css?version=202202170001" /><!-- RENEWAL 2021 -->

    <link rel="shortcut icon" href="https://www.h-point.co.kr/favicon.png">

    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">

    <script type="text/javascript" src="/assets/app/js/jquery-3.3.1.min.js"></script><!-- RENEWAL 2021 -->
    <script type="text/javascript" src="/assets/app/js/jquery-migrate-1.4.1.js"></script><!-- RENEWAL 2021 -->
    <script type="text/javascript" src="/assets/app/js/gsap.min.js"></script><!-- RENEWAL 2021 -->
    <script type="text/javascript" src="/assets/app/js/ScrollTrigger.min.js"></script><!-- RENEWAL 2021 -->
    <script type="text/javascript" src="/js/jquery/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/js/jquery/prefixfree.min.js"></script>
    <script type="text/javascript" src="/js/jquery/TweenMax.js"></script>
    <script type="text/javascript" src="/js/jquery/EasePack.js"></script>
    <script type="text/javascript" src="/js/common.js?ver=1"></script><!-- [18.03.12][wool][추가]:웹접근성 대응(0-9) -->
    <script type="text/javascript" src="/js/jquery/jquery.touchSlider.js"></script>
    <script type="text/javascript" src="/js/hdgm/init.js"></script>
    <script type="text/javascript" src="/js/hdgm/util.js"></script>
    <script type="text/javascript" src="/js/hdgm/str_lib.js"></script>
    <script type="text/javascript" src="/js/sso/SsoAjax.js"></script>
    <script type="text/javascript" src="/js/sso/SsoHttpRequest.js"></script>
    <script type="text/javascript" src="/js/hdgm/cookie.js"></script>
    <script type="text/javascript" src="/js/hdgm/validation.js?ver=211202"></script><!-- 유효성체크 -->
    <script type="text/javascript" src="/js/hdgm/message.js"></script>
    <script type="text/javascript" src="/assets/app/js/swiper.min.js"></script><!-- RENEWAL 2021 -->
    <script type="text/javascript" src="/assets/app/js/common-pub.js"></script><!-- RENEWAL 2021 -->
    <script type="text/javascript" src="/assets/app/js/page-pub.js"></script><!-- RENEWAL 2021 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%--    <script type="text/javascript">--%>
<%--        function idCheck() {--%>

<%--            var memberId = $("#id").val();--%>

<%--            if(memberId.search(/\s/) != -1) {--%>
<%--                alert("아이디에는 공백이 들어갈 수 없습니다.");--%>
<%--            } else {--%>
<%--                if(memberId.trim().length != 0) {--%>
<%--                    $.ajax({--%>
<%--                        async : true,--%>
<%--                        type : 'POST',--%>
<%--                        data: memberId,--%>
<%--                        url: "user/idCheck",--%>
<%--                        dataType: "json",--%>
<%--                        contentType: "application/json; charset=UTF-8",--%>
<%--                        success: function(count) {--%>
<%--                            if(count > 0) {--%>
<%--                                alert("해당 아이디 존재");--%>
<%--                                $("#submit").attr("disabled", "disabled");--%>
<%--                                window.location.reload();--%>
<%--                            } else {--%>
<%--                                alert("사용가능 아이디");--%>
<%--                                $("#submit").removeAttr("disabled");--%>
<%--                            }--%>
<%--                        },--%>
<%--                        error: function(error) {--%>
<%--                            alert("아이디를 입력해주세요.");--%>
<%--                        }--%>
<%--                    });--%>
<%--                } else {--%>
<%--                    alert("아이디를 입력해주세요.");--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>

<%--    </script>--%>







    <!-- INDEX : RjHViaNnYjFlSsStHYFs52vQD8ANJ7h7MmliFHOtn10= -->



    <script type="text/javascript" src="/js/jquery/jquery.form.min.js"></script>
    <script type="text/javascript" src="/js/hdgm/validation.js?ver=200401"></script><!-- 유효성체크 -->
    <script type="text/javascript" src="/js/hdgm/str_lib.js"></script>

    <script type="text/javascript" src="/js/etc/flatpickr.js"></script>
    <link rel="stylesheet" href="/css/flatpickr.min.css" />

    <!-- <link rel="stylesheet" href="/css/jquery-ui.css" />
    <script type="text/javascript" src="/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="/css/customer.css?ver=4" />  -->


</head>
    <div id="contents" class="subPage">
        <div id="sign">

            <!--[S] 서브컨텐츠 -->
            <article class="sign_up">

                <!-- pageTitle -->
                <div class="pageTitle">
                    <div class="layout1">
                        <h2 class="tit">회원가입</h2>
                        <p class="desc">간편하게 신규가입하고 다양한 혜택을 누려보세요!</p>
                    </div>
                </div>
                <!--// pageTitle -->


                <!-- 정보입력 -->
                <section class="step3_container">
                    <div class="layout1">
                        <div class="wrap_box">
                            <form name="joinForm" id="mainCustForm" method="post" action="insertUser" accept-charset="UTF-8">

                                    <!-- 개인정보입력 -->
                                    <div class="input_infomation">
                                        <h3 class="t_tit1">개인정보입력 <em class="nec">(* 필수입력)</em></h3>

                                            <fieldset class="divider">
                                                <legend>개인정보입력</legend>
                                                <!-- 아이디 -->
                                                <div class="wrap_inp">
                                                    <label for="id" class="inp_tit">아이디<span class="nec">*</span></label>
                                                    <!-- input에 값을 잘 못 입력하면 .inp_bundle에 클래스 "error" 추가해주세요. (포커스되고 값이 입력되면 "focus" 클래스가 붙음) -->
                                                    <div class="inp_bundle registerCustId">
                                                        <input type="text" title="아이디 입력" id="id" name="user_id" maxlength="20" class="inp flex" placeholder="아이디" oninput="checkId()" />
                                                        <!-- <button type="button" class="btn_right btn_typeC2" onclick="checkDuplicateId();"><span>중복확인</span></button> -->
                                                        <span class="id_ok" style="color:#008000; display: none;">사용 가능한 아이디 입니다.</span>
                                                        <span class="id_already" style="color:#008000; display: none;">누군가 이 아이디를 사용하고 있어요.</span>
<%--                                                        <button class="idCheck" type="button" id="idCheck" onclick="checkId();" value="N">중복확인</button>--%>
                                                        <!-- oninput은 사용자의 입력을 받으면 실행되는 이벤트이다. 즉 커서를 다른 곳으로 옮기지 않아도 입력 즉시 DB에서 id를 비교할 수 있다.-->
                                                    </div>
                                                </div>
                                                <!--// 아이디 -->

                                                <!-- 비밀번호 -->
                                                <div class="wrap_inp">
                                                    <label for="password" class="inp_tit">비밀번호<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="password" title="비밀번호 입력" id="pw1" name="user_pw" maxlength="30" class="inp flex" placeholder="비밀번호" onchange="check_pw()" />
                                                    </div>
                                                    <p class="t_error" id="pwdCheckMsg1" style="display:none">패스워드는 8자리 ~ 30자리로 입력해주세요.</p>
                                                    <p class="cmt_guide1 mark1 inp_mt">영문, 숫자, 특수문자를 포함 8~30 자리로 입력해주세요.</p>
                                                </div>
                                                <!--// 비밀번호 -->

                                                <!-- 비밀번호 확인 -->
                                                <div class="wrap_inp">
                                                    <label for="password" class="inp_tit">비밀번호 확인<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="password" title="비밀번호 입력" id="pw2" maxlength="30" class="inp flex" placeholder="비밀번호" onchange="check_pw()" />&nbsp;<span id="check"></span>

<%--                                                        <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>--%>
<%--                                                        <span class="pwck_input_re_1" style="color:#008000; display: none;">비밀번호가 일치합니다.</span>--%>
<%--                                                        <span class="pwck_input_re_2" style="color:#008000; display: none;">비밀번호가 일치하지 않습니다.</span>--%>
                                                    </div>
                                                </div>
                                                <!--// 비밀번호 확인 -->

                                                <!--// 이름-->
                                                <div class="wrap_inp">
                                                    <label for="name" class="inp_tit">이름<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="name" title="이름 입력" id="registerName1" name="user_name" maxlength="30" class="inp flex" placeholder="이름" />
                                                    </div>
                                                </div>

                                                <!--// 핸드폰 번호-->
                                                <div class="wrap_inp">
                                                    <label for="phone_number" class="inp_tit">휴대폰 번호<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="number" title="휴대폰 번호 입력" id="registerPnum1" name="user_phone" maxlength="30" class="inp flex" placeholder="휴대폰 번호" />
                                                    </div>
                                                </div>

                                                <!-- 이메일 -->
                                                <div class="wrap_inp">
                                                    <label for="email" class="inp_tit">이메일<span class="nec">*</span></label>
                                                    <div class="inp_bundle email_bundle emailCheckMsg">
                                                        <input type="email" title="이메일 아이디 입력" id="registerEmail" name="user_email" value="" maxlength="80" class="inp flex" placeholder="이메일" />
                                                        <select class="select flex" id="registerWrite3_3" title="이메일 도메인 선택">
                                                            <option value="00">직접입력</option>
                                                            <option value="01">@naver.com</option>
                                                            <option value="02">@hanmail.net</option>
                                                            <option value="03">@daum.net</option>
                                                            <option value="04">@gmail.com</option>
                                                            <option value="05">@nate.com</option>
                                                        </select>
                                                    </div>
                                                    <p class="cmt_guide1 mark1 inp_mt">특수문자[-], [_]만 사용 가능합니다.</p>
                                                </div>

                                                <!--// 생일-->
                                                <div class="wrap_inp">
                                                    <label for="birth" class="inp_tit">생년월일<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="text" title="생년월일 입력" id="registerBirth" name="user_birth" maxlength="30" class="inp flex" placeholder="생년월일" />
                                                    </div>
                                                </div>

                                                <!--// 성별-->
                                                <div class="wrap_inp">
                                                    <label for="gender" class="inp_tit">성별<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="text" title="성별 입력" id="registerGender" name="user_gender" maxlength="30" class="inp flex" placeholder="성별" />
                                                    </div>
                                                </div>

                                                <!--// 이메일 수신여부 테스트-->
                                                <div class="wrap_inp">
                                                    <label for="email_test" class="inp_tit">이메일 수신 여부<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="text" title="이메일 수신 여부 입력" id="registerEmail_test" name="user_email_receive" maxlength="30" class="inp flex" placeholder="이메일 테스트" />
                                                    </div>
                                                </div>

                                                <!--// sms 수신 여부 테스트-->
                                                <div class="wrap_inp">
                                                    <label for="sms_test" class="inp_tit">sms 수신 여부 테스트<span class="nec">*</span></label>
                                                    <div class="inp_bundle registerPwd1">
                                                        <input type="text" title="sms 수신 여부 입력" id="registerSms_test" name="user_sms_receive" maxlength="30" class="inp flex" placeholder="sms 테스트" />
                                                    </div>
                                                </div>

                                            </fieldset>
                                    </div>
                                <input type="submit" value="회원가입">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </form>
                        </div>
                    </div>
                </section>
                <!--// 정보입력 -->

                <div class="sub_bottom_blank1"></div>
            </article>
            <!--[E] 서브컨텐츠 -->

        </div>
    </div>

    <script type="text/javascript">
        function checkId(){
            var id = $('#id').val();
            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue = "${_csrf.token}";
            $.ajax({
                url:'${contextPath}/user/idCheck' , //Controller 에서 인식할 주소
                type:'POST',
                data: {id:id},
                dataType:'text',
                beforeSend:function (xhr){
                    xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                },
                success:function (cnt){
                    console.log(cnt);
                    //console.log(count);
                    if(cnt == '<Integer>0</Integer>') {
                        $('.id_ok').css("display", "inline-block");
                        $('.id_already').css("display", "none")
                    }else if(cnt == '<Integer>1</Integer>'){
                        $('.id_already').css("display","inline-block");
                        $('.id_ok').css("display","none");
                    }
                },
                error:function (){
                    alert("에러입니다.");
                }
            });
        };

        function check_pw(){
            var pw = document.getElementById('pw1').value;
            console.log(pw);
            if(document.getElementById('pw1').value == document.getElementById('pw2').value){
                document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
                document.getElementById('check').style.color='blue';
            } else{
                document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
                document.getElementById('check').style.color='red';
            }
        }

    </script>

    <!-- 팝업 : 마케팅 수신 동의 -->
    <div class="popup_ui type_modal pop_marketing_agree" style="display: none;">
        <div class="dim_full"></div>
        <div class="pop_container">
            <div class="pop_layer">
                <div class="pop_tit2">마케팅 수신 동의</div>
                <div class="pop_body">
                    <p class="txt">
                        “마케팅 정보(SMS,E-mail) 미수신시 <br>
                        신규회원을 위한 포인트 적립 혜택을 안내드릴 수 없습니다.<br>
                        그대로 진행하시겠습니까?”
                    </p>

                    <p class="box_tit">관련 약관</p>
                    <div class="box box_type2" id="hdgmTermPop" style="display:none">
                        <a href="#">마케팅을 위한 개인정보 수집.이용 동의</a>
                    </div>
                    <div class="box box_type2" id="partnerTermPop" style="display:none">
                        <a href="#">마케팅을 위한 개인정보 수집.이용 동의</a>
                    </div>
                    <p class="txt">관련 선택 약관에 동의하시겠습니까?<br>취소 시, 선택된 마케팅 정보 수신동의가 취소됩니다.</p>

                    <div class="btn_ac">
                        <button type="button" class="btn_typeA1"
                                onclick="disAgreeMktTcm(this);"><span>미동의 가입</span></button>
                        <button type="button" class="btn_typeA2" onclick="agreeMktTcm(this)"><span>동의</span></button>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--// 팝업 : 마케팅 수신 동의 -->

    <!-- 팝업 : 약관동의 -->
    <div class="popup_ui type_modal pop_terms" style="display: none;">
        <div class="dim_full"></div>
        <div class="pop_container">
            <div class="pop_layer">
                <div class="pop_tit2" id="termsTitle">H.Point 이용약관</div>
                <div class="pop_body">

                    <!-- 약관 내용 -->
                    <div class="terms_cont pop_inner_scroll" id="termsContent">

                    </div>

                    <div class="btn_ac">
                        <button type="button" class="btn_typeA2" onclick="commonPub.layerPopClose(this);"><span>확인</span></button>
                    </div>

                </div>
                <button class="btn_pop_close" type="button" onclick="commonPub.layerPopClose(this);"><span class="hidden">레이어 닫기</span></button>
            </div>
        </div>
    </div>
