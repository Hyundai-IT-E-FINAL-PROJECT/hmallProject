<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오후 5:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
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
                <div class="mypage-coupon-wrap">
                    <div class="bg-gray-box">
                        <div class="top-area">
                            <h3 class="title">내 쿠폰 보기</h3>
                            <ul class="list">
                                <li>
                                    <span class="tit">사용가능 쿠폰</span>
                                    <span class="txt"><strong>2<span class="mdhTxt"></span></strong>장</span>
                                </li>
                                <li>
                                    <span class="tit">사용임박 쿠폰</span>
                                    <span class="txt"><strong>2<span class="mdhTxt"></span></strong>장 (30일 이내)</span>
                                </li>
                                <li>
                                    <span class="tit">사용한 쿠폰</span>
                                    <span class="txt"><strong>0</strong>장</span>
                                </li>
                            </ul>
                        </div>
                        <div class="bottom-area">
                            <p class="ctypo14">메일, 모바일 등에서 받은 <span class="color-ff5340">쿠폰 번호</span>를 입력해주세요.</p>
                            <div class="coupon-down-input">
                                <div class="field">
                                    <div id="number-box" class="inputbox">
                                        <label class="inplabel"><input type="text" id="first-copNum" name="rndma" value="" placeholder="00000000" onkeydown="fn_press_han(this);"></label>
                                        <span class="hyphen">-</span>
                                        <label class="inplabel"><input type="text" id="last-copNum" name="rndmb" value="" placeholder="00000" maxlength="5" onkeydown="fn_press_han(this);"></label>
                                        <button class="btn btn-dbcheck btn-lineblack" onclick="doEvntPtcp();return false;"><span>쿠폰받기</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <h3 class="title22">현재 보유 쿠폰</h3>
                    <div class="coupon-list-box">
                        <ul>

                            <!-- 사용한 쿠폰은 안보이게 -->
                            <li class="coupon-box">
                                <div class="coupon">
                                    <p class="discount">



                                        <strong>5,000</strong>

                                        <b>원 할인</b>


                                    </p>
                                    <div class="coupon-info">
                                        <p class="title">
                                            <strong>혜택채움 5천원 선착순 쿠폰</strong>
                                        </p>
                                        <ul class="coupon-info-list">




                                            <li> 기준금액:

                                                50,000원
                                                이상

                                                <!-- 황기성선임 요청 삭제:INTA_6.3.9_001
                                                정액/정률구분코드가 정률(1)일 경우(2:정액)

                                                 -->
                                            </li>



                                            <li>기간: 2022.05.20 ~ 2022.05.23</li>

                                            <li>조건 :
                                                바로접속 ON


                                            </li>

                                        </ul>

                                        <p class="type">



                                            남은기간 : 3일



                                        </p>

                                        <button class="btn btn-linelgray small30 abs" data-modules-modal="target:#applicable-item;" onclick="doSearchSlitmPop('02683299');return false;"><span>적용상품보기</span></button><!-- 2020-09-28 마크업 추가 -->

                                    </div>
                                </div>
                                <div class="coupon-bg"><div></div><div></div></div>
                            </li>


                            <!-- 사용한 쿠폰은 안보이게 -->
                            <li class="coupon-box">
                                <div class="coupon">
                                    <p class="discount">



                                        <strong>10,000</strong>

                                        <b>원 할인</b>


                                    </p>
                                    <div class="coupon-info">
                                        <p class="title">
                                            <strong>혜택채움 1만원 선착순 쿠폰</strong>
                                        </p>
                                        <ul class="coupon-info-list">




                                            <li> 기준금액:

                                                100,000원
                                                이상

                                                <!-- 황기성선임 요청 삭제:INTA_6.3.9_001
                                                정액/정률구분코드가 정률(1)일 경우(2:정액)

                                                 -->
                                            </li>



                                            <li>기간: 2022.05.20 ~ 2022.05.23</li>

                                            <li>조건 :
                                                바로접속 ON


                                            </li>

                                        </ul>

                                        <p class="type">



                                            남은기간 : 3일



                                        </p>

                                        <button class="btn btn-linelgray small30 abs" data-modules-modal="target:#applicable-item;" onclick="doSearchSlitmPop('02682809');return false;"><span>적용상품보기</span></button><!-- 2020-09-28 마크업 추가 -->

                                    </div>
                                </div>
                                <div class="coupon-bg"><div></div><div></div></div>
                            </li>


                            <div class="paging">





                                <div class="page-prevarea">






                                    <strong aria-label="현재 선택페이지">1</strong>






                                </div>



                            </div>



                        </ul>
                    </div>

                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>
    <!-- //.container -->

</main>
</body>
</html>
