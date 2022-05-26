<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="passwordCheck.jsp" %>
<section id="bottomSection">
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">
            <!-- LNB 시작 -->

            <%@ include file="mypageSide.jsp" %>

            <script type="text/javascript">
                var upntCustYn = "N";
                $(document).ready(function() {
                    $.ajax({
                        type: "get"
                        ,url: "/p/mpf/chkUpntCustYn.do"
                        ,dataType: "json"
                        ,async: false
                        ,success : function(data) {
                            upntCustYn = data.upntCustYn;
                        }
                        , error: function (data) {
                            console.log("chkUpntCustYn_error", data);
                        }
                    });
                });

                <!--HPAY임대진 추가 -->
                function openHPayTag(pathVal) {
                    var url = "http://" + location.host + "/p/mpf/hpayManage.do";
                    try {
                        _trk_flashEnvView('_TRK_CP=' + pathVal);
                    } catch(e){}

                    openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());
                }

                //H.Point Pay 관리 통합회원 확인 후 후 화면 분기
                function fn_HppManage(){
                    if(upntCustYn == "Y"){
                        location.href = "https://www.hmall.com/p/mpd/hhpPmntManage.do";
                    }else{
                        $("#pec001-01").modal().show();
                    }
                }

                function fn_upntPopupOpen(){
                    location.href='/p/cua/registUpnt.do';
                }

                function fn_upntPopupClose(){
                    $("#pec001-01").modal().hide();
                }
            </script>
            <!--20170816 박승택 추가 -->
            <form name="upntLeftForm" method="post" target="uPnt">
                <input type="hidden" name="mcustNo" value="">
            </form>

            <!-- // LNB 끝 -->

            <div class="contents">

                <div class="mypage-info-wrap">
                    <h3 class="title22">회원탈퇴</h3>
                    <div class="bg-gray-box">
                        <p class="ctypo15">그동안 현대Hmall을 이용해주셔서 감사합니다. 현대Hmall을 이용하시면서 불만족스러웠던 점을 지적해주시면 <br><span class="color-ff5340">서비스 개선</span>에 참고하겠습니다.</p>
                    </div>

                    <p class="ctypo17 bold">회원탈퇴 확인사항</p>
                    <p class="ctypo15">현대Hmall 회원탈퇴 시 확인하셔야 할 사항을 반드시 체크하시기 바랍니다.</p>
                    <div class="border-gray-box">
                        <ol class="num-list">
                            <li>
                                <span class="tit">재가입하셔도 개인정보가 복원되지 않습니다.</span>
                                <span class="txt">현대Hmall에 가지고 계신 적립금, 쿠폰 등의 혜택이 모두 삭제되며 재가입하여도 복원되지 않습니다.</span>
                            </li>
                            <li>
                                <span class="tit">아이디를 재사용할 수 없습니다.</span>
                                <span class="txt">기존에 사용하셨던 아이디는 재가입 시 사용할 수 없습니다.</span>
                            </li>
                            <li>
                                <span class="tit">일부 정보는 법정 보유기간동안 보유됩니다.</span>
                                <span class="txt">전자상거래 등에서의 소비자보호에 관한 법률 등 관련법령의 규정에 의하여 일부 정보는 일정 기간동안 보유합니다. 자세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.</span>
                            </li>
                        </ol>
                    </div>

                    <p class="ctypo17 bold">회원 설문조사</p>
                    <p class="ctypo15">현대Hmall을 이용하시면서 어떤 점이 불편하셨나요? <span class="color-ff5340">(1개 항목만 선택해 주세요.)</span></p>
                    <div class="border-gray-box">
                        <div class="radio-list">
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire1" name="rad1" checked="" value="11">
                                <i class="icon"></i>
                                <span>상품 다양성/가격/품질 불만</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire2" name="rad1" value="12">
                                <i class="icon"></i>
                                <span>시스템 에러/속도 등 불만</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire3" name="rad1" value="13">
                                <i class="icon"></i>
                                <span>상품 선택, 주문 등 사용이 어려움</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire4" name="rad1" value="14">
                                <i class="icon"></i>
                                <span>개인정보 유출 우려</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire5" name="rad1" value="15">
                                <i class="icon"></i>
                                <span>회원 특혜/쇼핑 혜택 부족</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire6" name="rad1" value="16">
                                <i class="icon"></i>
                                <span>현대Hmall을 자주 사용하지 않음</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire7" name="rad1" value="17">
                                <i class="icon"></i>
                                <span>주문취소/반품/교환/AS 불만</span>
                            </label>
                            <label class="radlabel sm">
                                <input type="radio" id="questionnaire8" name="rad1" value="18">
                                <i class="icon"></i>
                                <span>배송서비스 불만</span>
                            </label>
                        </div>
                        <div class="textareabox">
                            <label class="txtlabel">
                                <textarea id="drotRsnMemo" cols="48" rows="7" placeholder="위의 항목 이외에 기타 불만사항이나 의견이 있으시면 기재 해주세요." aria-placeholder="위의 항목 이외에 기타 불만사항이나 의견이 있으시면 기재 해주세요."></textarea>
                            </label>
                            <span class="txtcount"><em id="textByte">0</em><b>1000</b></span>
                        </div>
                        <ul class="dotlist">
                            <li>진행 중인 주문, 교환, 반품, A/S가 있을 시 탈퇴가 불가능합니다. 해당사항 진행 완료 후 탈퇴를 하실 수 있습니다.</li>
                        </ul>
                    </div>

                    <div class="btngroup w_510">
                        <button class="btn btn-linelgray medium" onclick="goMypage();"><span>취소</span></button>
                        <button class="btn btn-default medium" onclick="openLeaveMemberPup(); return false;"><span>회원탈퇴</span></button>
                    </div>
                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>
    <!-- //.container -->

</main>
</section>
</body>
</html>
