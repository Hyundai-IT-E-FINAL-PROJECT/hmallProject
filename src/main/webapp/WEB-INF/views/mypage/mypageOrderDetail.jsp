<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-26
  Time: 오전 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<main class="cmain mypage" role="main" id="mainContents">
    <div class="container">
        <div class="gird-l2x">
            <!-- 비회원 주문조회 시 LNB영역 숨김 -->
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
            <div class="contents">
                <div class="mypage-order-wrap">
                    <h3 class="title22">상세 주문 내역</h3>

                    <!-- 주문접수/추가구상품 있는 경우 -->
                    <div class="order-list">
                        <dl>
                            <dt>
                                <div class="date">
                                    <span>주문일</span>
                                    <strong>2022-05-13</strong>
                                    <span>주문번호</span>
                                    <strong>20220513295854</strong>
                                    <span style="display:none">주문매체</span>
                                    <strong style="display:none">PC주문</strong>
                                </div>

                            </dt>


                            <!--상품 및 배송지 정보 그룹-->


                            <!--상품정보 테이블 컨테이너-->


                            <!-- 주소정보 시작 -------------------------------------------------------- -->






                            <!-- 주소정보 종료 -------------------------------------------------------- -->



                            <!--  2020.07.31 박민성 묶음상품 조건 추가  -->


                            <!-- 상품정보 시작 -------------------------------------------------------- -->

                            <input type="hidden" name="lastOrdStatGbcdNm" value="배송완료">






                            <!-- 20201230 날짜 조건추가  -->



                            <!-- 배송비 변경 버튼 제어 조건  -->
                            <!-- 묶음 상품일 경우 배송비비용발생번호와 같은 상품들끼리 카운트 및 추가 배송비를 합한다. -->







                            <!-- 배송사 코드  -->


                            <!-- 상품정보 세팅 -->
                            <dd class="btn-col2"><!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->
                                <a href="javascript:goItemDetail('2137807436');">
                                    <span class="img"><img src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg?RS=300x300&amp;AR=0" alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')"></span>
                                    <div class="box">
                                                        <span class="state sky">









                                                                            배송완료





                                                            <em class="color-999">

                                                            </em>
                                                        </span>

                                        <span class="tit">SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)</span>

                                        <!--엄지펀딩 배송예정시작일 시작-->

                                        <!--엄지펀딩 배송예정시작일 끝-->

                                        <div ttt="" class="info">
                                            <ul>


                                                <li>10봉 랜덤구성</li>



                                                <li>



                                                    1개


                                                </li>
                                            </ul>
                                        </div>

                                        <span class="price">













                                                                    <strong>15,000</strong>원


                                                        </span>


                                        <!-- 2017.11.07 최연태 설치상품 배송예정일 노출 -->

                                    </div>
                                </a>

                                <!-- [01/04]_수정(마크업 추가) -->








                                <!-- [01/04]_수정(마크업 추가) -->












                                <!-- asis테이블 항목 중 tobe에서 제외된 항목 시작 -->



                                <!-- asis테이블 항목 중 tobe에서 제외된 항목 종료 -->




                                <div class="btngroup">























                                    <!-- 20180626_특화배송조유진 -->




















                                    <button class="btn btn-linelgray small30" type="button" onclick="openDlvTrcUrlPup('20220513295854', '1')"><span>배송조회</span></button>







                                    <button class="btn btn-linelgray small30" type="button" onclick="openItemEvalPopup('2137807436', '00008', '20220513295854')"><span>만족도평가</span></button>



































                                </div>



                            </dd> <!-- //.btn-col2 -->

                            <!-- 선물하기 합주문 - 배송정보 나뉘는것 방지 -->







                            <!-- 2020.12.21 선물하기 케이스 UI변경(상단 주소지 정보에서 보여주던 방식에서 스토어픽 형태로 보여주는 방식으로 변경한다.) -->




                        </dl>
                    </div> <!-- //.order-list -->
                    <!-- // 주문접수/추가구상품 있는 경우 -->

                    <!-- 스토어픽 조건이 아닌경우 처리한다. -->


                    <h3 class="title22">배송지</h3>





                    <div class="address-box" data-dstnseq="0000000002">
                        <form name="updateDstnAdr" method="post">
                            <input type="hidden" name="ordNo" value="20220513295854">
                            <input type="hidden" name="dstnSeq" value="0000000002">
                            <input type="hidden" name="rcvCustNm">
                            <!-- 같은 배송지에 여러 상품이 있는 경우 주소변경 시 같이 변경되도록... 2020.12.30 김기호 -->

                            <!-- as-is와 동일하게 주문취소 건은 주소지 변경에서 제외 [2021.01.20 추가] -->
                            <input type="hidden" name="ordPtcSeqArr" value="1">


                            <input type="hidden" name="adrKndGbcd">
                            <input type="hidden" name="dstnPostNo">
                            <input type="hidden" name="dstnPostNoSum">
                            <input type="hidden" name="dstnBaseAdr">
                            <input type="hidden" name="dstnPtcAdr">
                            <input type="hidden" name="dstnTela">
                            <input type="hidden" name="dstnTels">
                            <input type="hidden" name="dstnTeli">
                            <input type="hidden" name="dstnHpIdntNo">
                            <input type="hidden" name="dstnHpIntmNo">
                            <input type="hidden" name="dstnHpBckNo">
                            <input type="hidden" name="dawnDlvYn" value="N">
                            <input type="hidden" name="dsrvCoMsg">
                            <input type="hidden" name="halfDlvYn" value="N">
                        </form>
                        <div class="top-box">

                            <p class="name" name="rcvCustNm">김민수
                                <!-- span class="tag red">기본 배송지</span 2020.12.09 Hmall기획에서 제거 요청 -->
                            </p>
                            <!-- 일반주소 -->
                            <!-- <p class="add" name="dstnAdr">서울특별시 중랑구  망우로71가길 11-5(망우동, 어반캐슬) 203호</p> -->
                            <p class="add" name="dstnAdr">(02060) 서울특별시 중랑구  망우로71가길 11-5(망우동, 어반캐슬)<br>203호</p>


                            <p class="tel" name="hpNo">010-9398-9130</p>
                            <!-- 전화번호2 추가[2021.01.06] -->



                            <p class="tel" name="telNo"></p>



                            <!-- 주소 변경 버튼 조회 기준 변경[2021.01.20] -->














                        </div>

                        <div class="bottom-box">
                            <dl>
                                <dt>주문자명</dt>
                                <dd name="ordCustNm">김민수</dd>
                            </dl>



                            <dl>
                                <dt>배송메모</dt>
                                <dd name="dsrvCoMsg">


                                </dd>
                            </dl>


                        </div>
                    </div> <!-- //.address-box -->












                    <h3 class="title22">결제 정보</h3>
                    <div class="pay-info-box">
                        <ul>
                            <li>
                                <dl class="between top">
                                    <dt>총 주문금액</dt>
                                    <dd>





                                        <strong>15,000</strong>원


                                    </dd>
                                </dl>

                                <dl class="between">
                                    <dt>주문금액</dt>
                                    <dd>





                                        <strong>15,000</strong>원


                                    </dd>
                                </dl>



                            </li>
                            <li>
                                <span class="minus-icon"><i class="icon"></i></span>
                                <dl class="between top">
                                    <dt>할인금액</dt>
                                    <dd><strong><span class="sumjH">0</span></strong>원</dd>
                                </dl>

                            </li>
                            <li>
                                <span class="result-icon"><i class="icon"></i></span>
                                <dl class="between top">
                                    <dt>잔여 결제 금액</dt>
                                    <dd class="result">





                                        <strong>15,000</strong>원


                                    </dd>
                                </dl>





                                <dl class="between">
                                    <dt>결제하신 금액</dt>
                                    <dd><strong>15,000</strong>원</dd>
                                </dl>


                                <dl class="between">
                                    <dt>결제하실 금액</dt>
                                    <dd>





                                        <strong>0</strong>원


                                    </dd>
                                </dl>





                                <div class="detail-info">
                                    <!-- 클래스 sumj3Tip 와 sumj3Tip2는 상항에 따라서 보여줬다가 숨겨줬다가 하시면 됩니다.SB 99, 133페이지참고. -->


                                </div> <!-- //.detail-info -->


                            </li>
                        </ul>



                        <ul class="col">









                            <li> <!-- 20200928 결제수단 영역 원복 -->
                                <h4 class="pay-tit">결제 수단</h4>




                                <div class="paytype">
                                    <!-- [kdh : 부분취소 적용] 20160108 s ========================================-->

                                    <!-- [kdh : 부분취소 적용] 20160108 e ========================================-->

                                    <div class="paycase">
                                        <p class="case-tit">
                                            <strong>무통장입금</strong>
                                            <span><strong>15,000</strong>원

                                                            </span>
                                        </p>
                                    </div>

                                    <div class="paycase"></div> <!-- 무통장 한 건이면 div하나 추가해준다. 퍼블에서 요청 -->

                                    <dl class="list">



                                        <dt>KB국민은행</dt>
                                        <dd><strong>130290-71-205907</strong>
                                            <div class="btngroup">
                                                <button type="button" class="btn btn-linelgray small25" onclick="copyEcrytFncIstnNo(this);"><span>복사</span></button>
                                            </div>
                                        </dd>
                                        <dt>입금자명</dt>
                                        <dd>김민수</dd>



                                    </dl>






                                    <!-- TODO 곽희섭 20170328 통합포인트 추가 시작 -->

                                    <!-- TODO 곽희섭 20170328 통합포인트 추가 끝 -->

















                                </div>

                            </li>



                            <!-- 20140306 - 적립예정 포인트 -->
                            <!-- TODO 곽희섭 20170511 H포인트를 적립금으로 수정 -->

                            <li> <!-- // 20200928 결제수단 영역 원복 -->
                                <h4 class="pay-tit">적립예정 포인트</h4>

                                <dl class="between">
                                    <dt>H.Point</dt>
                                    <dd><strong>10</strong>원</dd>
                                </dl>


                            </li>

                        </ul>
                    </div> <!-- //.pay-info-box -->




                    <h3 class="title22">결제/취소 내역
                        <div class="btngroup abs">

                            <button id="btnCashReceipt" class="btn btn-linelgray small34" onclick="openCashRcptPrntInfPop(&quot;2022.05.13&quot;,&quot;2022.05.13&quot;,&quot;&quot;,&quot;&quot;,&quot;20220513295854&quot;,&quot;소득공제&quot;)" data-delyhopeyn="자진발급신청가능"><span>현금영수증 조회</span></button>




                        </div>
                    </h3>








                    <div class="history-box">
                        <p class="ctypo15 bold">[결제] 2022. 05. 13</p>
                        <ul>





                            <li>
                                <div class="tit-wrap">무통장입금&nbsp;[입금계좌 KB국민은행 : 130290-71-205907]</div>
                                <div class="txt-wrap"><strong>15,000</strong>원</div>
                            </li>





                            <!-- TODO 곽희섭 20170328 통합포인트 추가 시작 -->

                            <!-- TODO 곽희섭 20170328 통합포인트 추가 시작 -->


























                        </ul>
                    </div>








                    <!-- [2020.12.09] 기획에서 서비스 안내 영역 제거 요청
                    <div class="guide-box">
                        <h4 class="ctypo18">서비스 안내</h4>
                        <ul class="dotlist">
                            <li>반품, 교환 신청은 배송 완료 후 7일 이내에만 가능합니다. 16:00 이전 접수 문의는 당일 처리/답변을 원칙으로 하며, 16:00이후 접수문의는 익일 처리됩니다.</li>
                            <li>반품 후 환불은 결제 수단에 따라 회수완료 시점으로부터 최대 7일 내 처리됩니다.</li>
                            <li>현금결제수단(무통장, 실시간 계좌이체 등) 환불은 예치금으로 환불됩니다.</li>
                            <li>주말이나 휴일 접수건의 경우 월요일 또는 익영업일에 처리 되오니 시간 양해 부탁드립니다.</li>
                            <li>취소 신청은 주문 완료 후 주문 당일 24시까지만 가능합니다.</li>
                        </ul>
                    </div>
                    -->

                    <div class="guide-box">
                        <h4 class="ctypo18">청약 철회 청구 안내</h4>
                        <ul class="dotlist">
                            <li>상품을 인도받은 날로부터 7일 이내에 대해 계약에 대한 청약철회가 가능합니다.<br>(상품명 주변에 TV쇼핑이 표시된 상품은 상품 인도일 이후 30일/의류,보석,핸드백,슈즈,선글라스 15일/농산물,수산물,축산물 등 신선식품 7일 이내 교환 및 반품가능)</li>
                        </ul>
                    </div>

                    <!-- 2020-09-03 텍스트 수정 -->
                    <div class="guide-box">
                        <h4 class="ctypo18">꼭 읽어보세요! Notice</h4>
                        <ul class="dotlist">
                            <li>주문상태가 '상품발송'인 경우 배송조회가 가능합니다. 단 주문하신 상품을 업체에서 직접 배송하는 경우 배송조회가 이루어지지 않을 수 있습니다.</li>
                            <li>결제수단을 무통장 입금이나 상품권으로 선택한 경우, 주문일로부터 <strong class="color-666">7일 이내 입금 및 접수확인이 되지 않으면 주문이 취소</strong>됩니다.</li>
                            <li>복합결제 후 일부 금액만 결제한 경우 주문일로부터 7일 후 주문이 취소되며, 결제한 금액은 환불처리됩니다. 단, 현금 결제는 예치금으로 환불됩니다.</li>
                            <li><strong class="color-666">반품 및 교환 신청은 상품발송 후 7일 이내</strong>에 가능합니다.</li>
                            <li>반품 신청 시 반품상품이 도착한 후 상품 상태를 점검한 다음에 결제가 취소됩니다. 단, 상품 점검 시 반품 불가 사유에 해당하는 경우 고객님께 통보 후 상품을 다시 발송해 드립니다.</li>
                            <li>주문과 관련하여 문의사항이 있으실 경우 고객센터(1600-0000) 혹은 Hmall 1:1상담신청을 통해 문의 바랍니다.</li>
                            <li class="non-dot">
                                <strong class="title16 color-666">1:1상담신청</strong>

                                <button type="button" class="btn btn-linelgray small25" name="pop820x685" onclick="openCnslAcptPupAll(20220513295854);"><span>1:1 게시판상담</span></button>







                                <button type="button" class="btn btn-linelgray small25" name="pop820x685" onclick="sellerTalkOpen('1')"><span>1:1: 채팅상담</span></button>




                            </li>
                        </ul>
                    </div>
                </div> <!-- //.mypage-order-wrap -->

            </div> <!-- // .contents -->
        </div> <!-- //.gird-l2x -->
    </div> <!-- //.container -->

</main>
</body>
</html>
