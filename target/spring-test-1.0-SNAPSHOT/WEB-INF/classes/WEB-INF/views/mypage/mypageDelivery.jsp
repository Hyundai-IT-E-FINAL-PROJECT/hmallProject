<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="passwordCheck.jsp" %>
<section id="bottomSection">
    <main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
        <div class="container">
            <div class="gird-l2x">
                <!-- LNB 시작 -->


                <%@ include file="mypageSide.jsp" %>


                <script type="text/javascript">
                    var upntCustYn = "N";
                    $(document).ready(function () {
                        $.ajax({
                            type: "get"
                            , url: "/p/mpf/chkUpntCustYn.do"
                            , dataType: "json"
                            , async: false
                            , success: function (data) {
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
                        } catch (e) {
                        }

                        openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());
                    }

                    //H.Point Pay 관리 통합회원 확인 후 후 화면 분기
                    function fn_HppManage() {
                        if (upntCustYn == "Y") {
                            location.href = "https://www.hmall.com/p/mpd/hhpPmntManage.do";
                        } else {
                            $("#pec001-01").modal().show();
                        }
                    }

                    function fn_upntPopupOpen() {
                        location.href = '/p/cua/registUpnt.do';
                    }

                    function fn_upntPopupClose() {
                        $("#pec001-01").modal().hide();
                    }
                </script>
                <!--20170816 박승택 추가 -->
                <form name="upntLeftForm" method="post" target="uPnt">
                    <input type="hidden" name="mcustNo" value="">
                </form>


                <!-- // LNB 끝 -->

                <div class="contents">
                    <div class="mypage-delivery-wrap">
                        <h3 class="title22">
                            배송지 리스트
                            <button id="addDstnAdr" class="btn btn-lineblack small34 abs"><span>배송지 추가</span></button>
                        </h3>


                        <div class="delivery-box">
                            <ul class="list">

                                <li>
                                    <input type="hidden" name="dstnSeq" value="0000000002">
                                    <input type="hidden" id="baseYn" name="baseYn" value="Y">
                                    <input type="hidden" id="rcvCustNm" name="rcvCustNm" value="김민수">
                                    <input type="hidden" id="dstnPostNo" name="dstnPostNo" value="02060">
                                    <input type="hidden" id="dstnBaseAdr" name="dstnBaseAdr"
                                           value="서울특별시 중랑구  망우로71가길 11-5(망우동, 어반캐슬)">
                                    <input type="hidden" id="dstnPtcAdr" name="dstnPtcAdr" value="203호">
                                    <input type="hidden" id="dstnHpIdntNo" name="dstnHpIdntNo" value="010">
                                    <input type="hidden" id="dstnHpIntmNo" name="dstnHpIntmNo" value="9398">
                                    <input type="hidden" id="dstnHpBckNo" name="dstnHpBckNo" value="9130">
                                    <input type="hidden" id="dstnTela" name="dstnTela" value="">
                                    <input type="hidden" id="dstnTels" name="dstnTels" value="">
                                    <input type="hidden" id="dstnTeli" name="dstnTeli" value="">

                                    <input type="hidden" id="adrKndGbcd" name="adrKndGbcd" value="2">
                                    <input type="hidden" id="dstnPostNoSum" name="dstnPostNoSum" value="02060">
                                    <input type="hidden" id="dstnNknm" name="dstnNknm" value="김민수">

                                    <p class="name">김민수

                                        <span class="tag red">기본 배송지</span>

                                    </p>
                                    <p class="add">(02060) 서울특별시 중랑구 망우로71가길 11-5(망우동, 어반캐슬) 203호</p>

                                    <p class="tel" id="mobile">01093989130</p>


                                    <div class="btngroup abs">
                                        <button id="modifyDstnAdr" name="modifyDstnAdr"
                                                class="btn btn-linelgray small30"><span>수정</span></button>

                                    </div>
                                </li>

                                <li>
                                    <input type="hidden" name="dstnSeq" value="0000000001">
                                    <input type="hidden" id="baseYn" name="baseYn" value="N">
                                    <input type="hidden" id="rcvCustNm" name="rcvCustNm" value="김민수">
                                    <input type="hidden" id="dstnPostNo" name="dstnPostNo" value="24340">
                                    <input type="hidden" id="dstnBaseAdr" name="dstnBaseAdr"
                                           value="강원도 춘천시  백령로61번길 16-5 (효자동 168-79)">
                                    <input type="hidden" id="dstnPtcAdr" name="dstnPtcAdr" value="별하랑 204호">
                                    <input type="hidden" id="dstnHpIdntNo" name="dstnHpIdntNo" value="010">
                                    <input type="hidden" id="dstnHpIntmNo" name="dstnHpIntmNo" value="9398">
                                    <input type="hidden" id="dstnHpBckNo" name="dstnHpBckNo" value="9130">
                                    <input type="hidden" id="dstnTela" name="dstnTela" value="">
                                    <input type="hidden" id="dstnTels" name="dstnTels" value="">
                                    <input type="hidden" id="dstnTeli" name="dstnTeli" value="">

                                    <input type="hidden" id="adrKndGbcd" name="adrKndGbcd" value="2">
                                    <input type="hidden" id="dstnPostNoSum" name="dstnPostNoSum" value="24340">
                                    <input type="hidden" id="dstnNknm" name="dstnNknm" value="김민수">

                                    <p class="name">김민수

                                    </p>
                                    <p class="add">(24340) 강원도 춘천시 백령로61번길 16-5 (효자동 168-79) 별하랑 204호</p>

                                    <p class="tel" id="mobile">01093989130</p>


                                    <button name="setBaseDstnAdr" class="btn btn-linelgray small30"
                                            data-dstnseq="0000000001"><span>기본배송지로</span></button>

                                    <div class="btngroup abs">
                                        <button id="modifyDstnAdr" name="modifyDstnAdr"
                                                class="btn btn-linelgray small30"><span>수정</span></button>

                                        <button id="deleteDstnAdr" name="deleteDstnAdr"
                                                class="btn btn-linelgray small30"><span>삭제</span></button>

                                    </div>
                                </li>

                            </ul>
                        </div>
                        <div class="paging">


                            <div class="page-prevarea">


                                <strong aria-label="현재 선택페이지">1</strong>


                            </div>


                        </div>


                    </div>
                </div>
                <!-- // .contents -->
            </div>
        </div>
        <!-- //.container -->

    </main>
</section>
