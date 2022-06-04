<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-06-04
  Time: 오후 5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
  <div class="container">

    <div class="gird-l2x">

      <%@ include file="mypageSide.jsp" %>

      <div class="contents">
        <form id="orderDataForm" name="orderDataForm" method="post">
          <input type="hidden" name="ordNo" value="20220604346763">
          <input type="hidden" name="custNo" value="202007162286">
          <input type="hidden" name="reqCntn">
          <input type="hidden" name="payWayGbcd" value="02">
          <input type="hidden" name="imdtCncYn" value="Y">
          <input type="hidden" name="dlvcStlmYn" value="N">
          <input type="hidden" name="alliRefCd" value="404">
          <input type="hidden" name="ieYn" value="N">
          <input type="hidden" name="isEmergency" value="false">
          <input type="hidden" name="viewSource" value="ADD">    <!-- 추가결제 , 재결제 구분 -->
          <input type="hidden" name="allCnclYn" value="N">

          <input type="hidden" id="select02" name="select02">
          <input type="hidden" id="select01" name="select01">
          <!-- 배송비결제 관련 파라메터 -->
          <input type="hidden" name="orderAmt" value="0">
          <input type="hidden" name="totStlmAmt" value="0">
          <input type="hidden" name="stlmCrdAmt" value="0">
          <input type="hidden" name="stlmAcntAmt" value="0">
          <input type="hidden" name="stlmWibkAmt" value="0">
          <input type="hidden" name="stlmHppayAmt" value="0">
          <input type="hidden" name="stlmHPointAmt" value="0">
          <input type="hidden" name="stlmWPointAmt" value="0">
          <input type="hidden" name="stlmCdpstAmt" value="0">
          <input type="hidden" name="stlmOnlnGcAmt" value="0">
          <input type="hidden" name="stlmPaperGcAmt" value="0">
          <input type="hidden" name="hppayPrice" value="0">
          <input type="hidden" name="hppayTradeid" value="">
          <input type="hidden" name="hppayPrdtnm" value="">
          <input type="hidden" name="hppayMobilid" value="">
          <input type="hidden" name="hppayNo" value="">
          <input type="hidden" name="hppayUserkey" value="">
          <input type="hidden" name="hppayResultCd" value="">
          <input type="hidden" name="hppayResultmsg" value="">
          <input type="hidden" name="receiptYn" value="">
          <input type="hidden" name="cashRcptSendAmt" value="">
          <input type="hidden" name="cashRcptCustIdntVal" value="">
          <input type="hidden" name="cashRcptRcptTskGbcd" value="">
          <input type="hidden" name="okCashCrdNo" value="">
          <input type="hidden" name="asianaId" value="">
          <input type="hidden" name="wibkBankCd" value="">
          <input type="hidden" name="wibkAccountSmsYn" value="">
          <input type="hidden" name="wibkAcntSmsYn" value="">
          <input type="hidden" name="wibkIamtInfSmsYn" value="">
          <input type="hidden" name="wibkCustNm" value="">
          <input type="hidden" name="cardSelect" value="">
          <input type="hidden" name="cmCrdcCd" value="">
          <input type="hidden" name="cardXid" value="">
          <input type="hidden" name="cardEci" value="">
          <input type="hidden" name="cardCavv" value="">
          <input type="hidden" name="cardCardno" value="">
          <input type="hidden" name="cardAllotMonth" value="0">
          <input type="hidden" name="crdStlmType" value="">
          <input type="hidden" name="upopTid" value="">
          <input type="hidden" name="cardProcess" value="">
          <input type="hidden" name="kTCardNo" value="">
          <input type="hidden" name="kTPassword" value="">
          <input type="hidden" name="cardPointUseYn" value="">
          <input type="hidden" name="saveServiceCode" value="">
          <input type="hidden" name="acntSmTid" value="">
          <input type="hidden" name="acntAmt" value="">
          <input type="hidden" name="acntBankCode" value="">
          <input type="hidden" name="acntAccOwner" value="">
          <input type="hidden" name="rempEmno" value="">

          <input type="hidden" name="copnDcAmt" value="0">
          <input type="hidden" name="alliCrdNo" value="">
          <input type="hidden" name="alliCrdDcYn" value="">
          <input type="hidden" name="empDcYn" value="">
          <input type="hidden" name="empDcAmt" value="0">
          <input type="hidden" name="alliRefDcYn" value="">
          <input type="hidden" name="alliRefDcAmt" value="0">
          <input type="hidden" name="spdcYn" value="0">
          <input type="hidden" name="spdcAmt" value="0">
          <input type="hidden" name="spymDcYn" value="">
          <input type="hidden" name="spymDcAmt" value="0">
          <input type="hidden" name="directDcHPointAmt" value="0">
          <input type="hidden" name="onlnGcGbcd" value="">
          <input type="hidden" name="happymoneySessionId" value="">
          <input type="hidden" name="culturelandHashNo" value="">
          <input type="hidden" name="culturelandCustId" value="">
          <input type="hidden" name="onlnGcId" value="">
          <input type="hidden" name="onlnGcPw" value="">
          <input type="hidden" name="orderHDAff" value="00">

          <input type="hidden" name="mltiDlvYn" value="N">
          <input type="hidden" name="mmsMsgTitl" value="">
          <input type="hidden" name="mmsMsgCntn" value="">

          <input type="hidden" name="dlvHopeDt" value="">
          <input type="hidden" name="gcItemYn" value="">
          <input type="hidden" name="slitmNm" value="">
          <input type="hidden" name="stlmWayScopGbcd" value="">
          <input type="hidden" name="wintInsmMths" value="">

          <input type="hidden" name="mobileYn" value="">

          <input type="hidden" name="KVP_SESSIONKEY" value="">
          <input type="hidden" name="KVP_CURRENCY" value="">
          <input type="hidden" name="KVP_PGID" value="">
          <input type="hidden" name="KVP_ENCDATA" value="">
          <input type="hidden" name="KVP_NOINT" value="">
          <input type="hidden" name="KVP_QUOTA" value="">
          <input type="hidden" name="KVP_CARDCODE" value="">
          <input type="hidden" name="KVP_CONAME" value="">
          <input type="hidden" name="KVP_RESERVED1" value="">
          <input type="hidden" name="KVP_RESERVED2" value="">
          <input type="hidden" name="KVP_RESERVED3" value="">
          <input type="hidden" name="KVP_IMGURL" value="">
          <input type="hidden" name="storeid" value="">
          <input type="hidden" name="ordnm" value="">
          <input type="hidden" name="KVP_GOODNAME" value="">
          <input type="hidden" name="socid" value="">
          <input type="hidden" name="KVP_PRICE" value="">
          <input type="hidden" name="reply" value="">
          <input type="hidden" name="KVP_NOINT_INF" value="">
          <input type="hidden" name="KVP_QUOTA_INF" value="">
          <input type="hidden" name="success" value="">
          <input type="hidden" name="fail" value="">
          <input type="hidden" name="VP_RET_SAVEPOINT" value="">
          <input type="hidden" name="KVP_CARD_PREFIX" value="">

          <input type="hidden" name="partCnclAmt" value="0">
          <input type="hidden" name="stlmNo" value="2022060400754044">
          <input type="hidden" name="dlvPrcInfoArr">
          <input type="hidden" name="cnclQty">
          <input type="hidden" name="cnclInfArr">

          <input type="hidden" name="oriBankCd">
          <input type="hidden" name="oriBnkac">
          <input type="hidden" name="oriDpsr">

          <input type="hidden" name="viewSource" value="PC">    <!-- 부분취소 -->
          <input type="hidden" name="totStlmReAmt" value="0">    <!-- 재결제 총금액 -->
          <input type="hidden" name="totDlvcReAmt" value="0">    <!-- 재결제 총배송비 -->
          <input type="hidden" name="totDCAmt" value="0">    <!-- 재결제 총 할인액 -->
          <input type="hidden" name="totStlmRepyPossAmt" value="0">    <!-- 재결제 총 할인액 -->
          <input type="hidden" name="cancelReason" value="">

          <input type="hidden" name="dawnDlvYn" value=""><!-- 20180622 조상열. 새벽배송여부 추가 -->


          <input type="hidden" name="senderName" value="김민수">




          <input type="hidden" id="stlm02" value="0" vangbcd="">


          <div class="mypage-order-wrap">
            <h3 class="title22">주문취소 <span class="num">20220604346763</span></h3>


            <div class="order-list">
              <ul id="ordInfoTbody">
                <li>
                  <label class="chklabel">
                    <input type="checkbox" name="allChk">
                    <i class="icon"></i>
                    <span>전체선택 <em class="num">1<!--1--></em></span>
                  </label>
                </li>



                <li class="chk-form">

                  <input type="hidden" name="ordItemNm" value="[바닐라코] 클린 잇 제로 클렌징밤 대용량 180ml">
                  <input type="hidden" name="ordQty" value="1">
                  <input type="hidden" name="stlmAmt" value="">
                  <input type="hidden" name="dmndAmt" value="">
                  <input type="hidden" name="ordPtcSeq" value="1">




                  <input type="hidden" name="rmndQty" value="1">
                  <input type="hidden" name="sellUprc" value="25000">
                  <input type="hidden" name="frstDcRate" value="10">
                  <input type="hidden" name="rtpDlvCost" value="5000">
                  <input type="hidden" name="lastAplyAmt" value="0">
                  <input type="hidden" name="addDlvCost" value="2500">
                  <input type="hidden" name="minStlmAmt" value="15000">
                  <input type="hidden" name="slitmCd" value="2068386470">
                  <input type="hidden" name="venCd" value="016449">
                  <input type="hidden" name="venAdrSeq" value="3">
                  <input type="hidden" name="gubunCd" value="A">
                  <input type="hidden" name="basktGrpDivRnm" value="EMT">


                  <!-- 재계산에 필요 파라미터세팅 -->
                  <input type="hidden" name="ordNos" value="20220604346763">
                  <input type="hidden" name="ordPtcSeqs" value="1">
                  <input type="hidden" name="slitmCds" value="2068386470">
                  <input type="hidden" name="dlvcPayGbcds" value="10">
                  <input type="hidden" name="dcAmts" value="2500">
                  <input type="hidden" name="payedYns" value="0">
                  <input type="hidden" name="prpyDlvCosts" value="2500">
                  <input type="hidden" name="minStlmAmts" value="15000">
                  <input type="hidden" name="sellUprcs" value="25000">
                  <input type="hidden" name="rmndQtys" value="1">
                  <input type="hidden" name="acptQtys" value="1">
                  <input type="hidden" name="partCnclYns" value="Y">
                  <input type="hidden" name="imdtCnclPossYns" value="Y">
                  <input type="hidden" name="gubunCds" value="A">
                  <input type="hidden" name="venCds" value="016449">
                  <input type="hidden" name="venAdrSeqs" value="0003">
                  <input type="hidden" name="payedDlvCosts" value="0">
                  <input type="hidden" name="basktGrpDivRnms" value="EMT">
                  <input type="hidden" name="lastOrdStatGbcdNm" value="주문접수">

                  <input type="hidden" name="ordGbcds" value="01">

                  <input type="hidden" name="ordItemNm" value="[바닐라코] 클린 잇 제로 클렌징밤 대용량 180ml">

                  <input type="hidden" name="prpyDlvCost" value="2500">
                  <input type="hidden" name="dlvCost" value="0">
                  <input type="hidden" name="addIrgnCost" value="0">


                  <label class="chklabel"><!-- 체크박스 -------------------------- -->



                    <input type="checkbox" name="ordChk" id="ordChk" checked="checked">




                    <i class="icon"></i><span class="hiding">선택</span>
                  </label>

                  <a href="/p/pda/itemPtc.do?slitmCd=2068386470" target="_blank">
                    <span class="img"><img src="https://image.hmall.com/static/4/6/38/68/2068386470_0.jpg?RS=300x300&amp;AR=0" alt="[바닐라코] 클린 잇 제로 클렌징밤 대용량 180ml" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')"></span>
                    <div class="box">
                      <span class="tit">[바닐라코] 클린 잇 제로 클렌징밤 대용량 180ml</span>
                      <div class="info">
                        <ul>
                          <li>단일상품</li>
                          <li>1개</li>
                          <!-- >li></li -->
                        </ul>

                        <!-- 케이스 찾아서 퍼블 요청 필요....---------------------- -->



                        <!-- 케이스 찾아서 퍼블 요청 필요....---------------------- -->

                      </div>
                      <span class="price">
                                                    <strong>



                                                             25,000

                                                    </strong>원
                                                </span>
                    </div>
                  </a>

                  <!-- 상품품절 아닌 제품이 하나라도 존재했을때 체크 -->


                  <div class="count">
                    <span class="txt">취소수량</span>

                    <button type="button" class="btn btn-minus" aria-label="수량 감소" onclick="multiDlvItemMinus(this);return false;"><i class="icon btn-prev"></i><span class="hiding">감소</span></button>

                    <span id="maxRmndQty" style="display:none">1</span>
                    <div class="inputbox">
                      <label class="inplabel">



                        <input type="number" name="partCnclCnts" value="0" title="수량" onkeydown="onkeydownOnlyNumInput(event)" onchange="removeZero(this);" maxlength="4">



                      </label>
                    </div>

                    <button type="button" class="btn btn-plus" aria-label="수량 증가" onclick="multiDlvItemPlus(this, 1);return false;"><i class="icon btn-next"></i><span class="hiding">증가</span></button>

                  </div>

                  <!-- 취소사유 -->
                  <div style="display:none;">


                    <select name="partCnclRsns">
                      <option value="000000" selected="selected">취소 사유를 선택해 주세요</option>
                      <option value="010110">가격부담</option>
                      <option value="020401">가격불만</option>
                      <option value="010102">유사상품 구입</option>
                      <option value="010105">충동구매</option>
                      <option value="070701">상담원, 직원 불친절</option>
                      <option value="070112">정보전달오류</option>
                    </select>



                    <textarea name="partCnclRsnDtls"></textarea>
                  </div>
                </li>


              </ul></div> <!-- //.order-list -->

            <!-- [12/17]_수정(위키 402 내용 - 취소,반품,교환 사유 부분 위치 조절로 마크업 구조 변경) -->
            <div class="reason-area">
              <h3 class="title22">취소사유</h3>
              <div class="textform">


                <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                  <select id="viewPartCnclRsns" onchange="chkconfirm();">
                    <option value="000000">취소 사유를 선택해 주세요</option>
                    <option value="010110" selected="selected">가격부담</option>
                    <option value="020401">가격불만</option>
                    <option value="010102">유사상품 구입</option>
                    <option value="010105">충동구매</option>
                    <option value="070701">상담원, 직원 불친절</option>
                    <option value="070112">정보전달오류</option>
                  </select>
                  <div class="ui-label"><a href="#2">가격부담</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">취소 사유를 선택해 주세요</a></li><li><a href="#2">가격부담</a></li><li><a href="#3">가격불만</a></li><li><a href="#4">유사상품 구입</a></li><li><a href="#5">충동구매</a></li><li><a href="#6">상담원, 직원 불친절</a></li><li><a href="#7">정보전달오류</a></li></ul></div></div></div></div>



                <div class="textareabox">
                  <label class="txtlabel">
                    <textarea id="viewPartCnclRsnDtls" cols="48" rows="7" placeholder="상세 사유를 입력해주세요" aria-placeholder="상세 사유를 입력해주세요"></textarea>
                  </label>
                </div>
                <!-- as-is, 기획에 없는 내용. 주석처리
                <div class="formarea">
                    <span class="ctypo17 bold">사용여부</span>
                    <label class="radlabel sm">
                        <input type="radio" name="rad1" checked>
                        <i class="icon"></i>
                        <span>사용전</span>
                    </label>
                    <label class="radlabel sm">
                        <input type="radio" name="rad1">
                        <i class="icon"></i>
                        <span>사용후</span>
                    </label>
                </div>
                 -->
                <input type="hidden" name="statusAddIrgnCost" value="0">
                <div class="confirm-area">
                  <span class="txt">취소할 상품의 수량을 확인하신 후 버튼을 눌러주세요.</span>
                  <button type="button" class="btn btn-default small30" onclick="saveCnclQty();"><span>취소 정보반영</span></button>
                </div>
              </div>
            </div>
            <!-- //.reason-area -->
            <!-- [12/17]_수정(위키 402 내용 - 취소,반품,교환 사유 부분 위치 조절로 마크업 구조 변경) -->
            <!--
                                        <li class="textform">
                                            <div class="custom-selectbox md" data-modules-selectbox>
                                                <select name="partCnclRsns" onchange="chkconfirm();">
                                                    <option value="000000" selected='selected'>취소 사유를 선택해 주세요</option>
                                                    <option value='010110'>가격부담</option>
                                                    <option value='020401'>가격불만</option>
                                                    <option value='010102'>유사상품 구입</option>
                                                    <option value='010105'>충동구매</option>
                                                    <option value='070701'>상담원, 직원 불친절</option>
                                                    <option value='070112'>정보전달오류</option>
                                                </select>
                                            </div>
                                            <div class="textareabox">
                                                <label class="txtlabel">
                                                    <textarea name="partCnclRsnDtls" cols="48" rows="7" placeholder="상세 사유를 입력해주세요." aria-placeholder="상세 사유를 입력해주세요."></textarea>
                                                </label>
                                            </div>
                                             [11/26]_수정(작업리뷰 수정 - 취소 정보 반영 케이스 추가)
                                            <div class="confirm-area">
                                                <span class="txt">취소할 상품의 수량을 확인하신 후 버튼을 눌러주세요.</span>
                                                <button type="button" class="btn btn-default small30" onclick="saveCnclQty();"><span>취소 정보반영</span></button>
                                            </div>
                                        </li>
                                    </ul>
            -->

            <div class="saveCnclConfirm" style="display:none">
              <h3 class="title22">결제금액 정보</h3>
              <div class="pay-info-box type-toggle">
                <h3><button type="button" data-modules-collapse="" class="accordion-trigger" aria-expanded="false"><span>자세히보기</span><i class="icon updown"></i></button></h3>
                <div class="accordion-panel" role="region" aria-label="결제금액/취소예정금액/잔여결제금액">
                  <ul>
                    <li>
                      <dl class="between top">
                        <dt>결제금액</dt>




                        <dd><strong id="orgStlmAmt">22,500</strong>원</dd>
                      </dl>
                      <dl class="between">
                        <dt>원 주문금액</dt>
                        <input type="hidden" name="frstOrdAmt" id="frstOrdAmt" value="25000">
                        <dd><strong>25,000</strong>원</dd>
                      </dl>

                      <dl class="between">
                        <dt>쿠폰/할인</dt>
                        <dd><strong>- 2,500</strong>원</dd>
                      </dl>


                      <!-- 2020.09.02 도서지역별 추가 배송비 -->

                      <dl class="between" style="display:none">
                        <dt>세부내역 퍼블필요</dt>


                        <dd>현금
                          <strong>22,500</strong>
                          원
                        </dd>


                      </dl>
                      <!-- [12/10]_수정(위키 356 관련 내용 마크업 추가) -->

                      <div class="btm">


                        <dl class="between">
                          <dt>현금</dt>
                          <dd><strong>22,500</strong>원</dd>
                        </dl>


                      </div>

                    </li>
                    <li>
                      <span class="minus-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>취소예정금액</dt>
                        <dd><strong id="schdCnclAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between">
                        <dt>주문금액</dt>
                        <dd><strong id="stlmOrdAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddDlvcAmtTr2" style="display: none;">
                        <dt>배송비</dt>
                        <dd><strong id="dtlAddDlvcAmt2">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddIrgnDlvcAmtTr2" style="display: none;">
                        <dt>추가배송비</dt>
                        <dd><strong id="dtlAddIrgnDlvcAmt2">0</strong>원</dd>
                      </dl>
                    </li>
                    <li>
                      <span class="result-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>잔여 결제 금액</dt>
                        <dd class="result"><strong id="rmndStlmAmt">22,500</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddIrgnDlvcAmtTr2">
                        <dt>주문금액</dt>
                        <dd><strong id="stlmRepyPossAmt">25,000</strong>원</dd>
                        <input type="hidden" id="repyPossAmt" value="22500">
                      </dl>

                      <dl class="between">
                        <dt>쿠폰/할인</dt>
                        <dd><strong id="cpDcAmt">2,500</strong>원</dd>
                      </dl>

                      <dl class="between" id="dsrvAmtTr1" style="display: none;">
                        <dt>배송비</dt>
                        <dd><strong id="dsrvAmt1">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="doseDsrvAmtTr1">
                        <dt>추가배송비</dt>
                        <dd><strong id="doseDsrvAmt1">0</strong>원</dd>
                      </dl>
                    </li>
                  </ul>
                </div>
              </div>

              <h3 class="title22">환불금액 정보
                <p class="ctypo15">환불금액보다 차감금액이 큰 경우에는 추가비용 결제를 하셔야 주문취소가 접수됩니다.</p>
              </h3>
              <div class="pay-info-box type-toggle">
                <h3><button type="button" data-modules-collapse="" class="accordion-trigger" aria-expanded="false"><span>자세히보기</span><i class="icon updown"></i></button></h3>
                <div class="accordion-panel" role="region" aria-label="결제금액/차감금액/환불예정금액">
                  <ul>
                    <li>
                      <dl class="between top">
                        <dt>취소금액</dt>
                        <dd><strong id="dtlCnclAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between">
                        <dt>원 주문금액</dt>
                        <dd><strong id="dtlOrgOrdAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlCpDcAmtTr">
                        <dt>쿠폰/할인</dt>
                        <dd><strong id="dtlCpDcAmt">- 0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddDlvcAmtTr3" style="display: none;">
                        <dt>배송비</dt>
                        <dd><strong id="dtlAddDlvcAmt3">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddIrgnDlvcAmtTr3">
                        <dt>추가배송비</dt>
                        <dd><strong id="dtlAddIrgnDlvcAmt3">0</strong>원</dd>
                      </dl>
                    </li>
                    <li>
                      <span class="minus-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>차감금액</dt>
                        <dd><strong id="dtlCalcAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddDlvcAmtTr">
                        <dt>추가배송비</dt>
                        <dd><strong id="dtlAddDlvcAmt">- 0</strong>원</dd>
                      </dl>
                    </li>
                    <li>
                      <span class="result-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>환불 예정 금액</dt>
                        <dd class="result"><strong id="dtlRepySchdAmt">0</strong>원</dd>
                      </dl>


                      <dl class="between" name="paywayTr">
                        <dt id="stlmPayWayGbcd_0">현금</dt>
                        <dd><strong id="stlmRtpAmt_0" name="stlmRtpAmt">0</strong><span id="stlmRtpWon_0">원</span></dd>
                      </dl>


                      <dl class="between" id="stlmRtpAddIrgnAmtTr">
                        <dt>추가배송비</dt>
                        <dd><strong id="stlmRtpAddIrgnAmt">0</strong>원</dd>
                      </dl>
                    </li>
                  </ul>
                </div>
              </div>

              <h3 class="title22" style="display:none">환불계좌입력</h3>
              <div class="return-radiobox" style="display:none">
                <label class="radlabel sm">
                  <input type="radio" id="acnt" name="bankInfSelect" value="acnt" selected=""><i class="icon"></i><span>계좌환불</span>
                </label>
                <label class="radlabel sm">
                  <input type="radio" id="cdpst" name="bankInfSelect" value="cdpst">
                  <i class="icon"></i>
                  <span>예치금환불</span>
                </label>
              </div>
              <ul class="return-list" style="display:none" id="bankInf">
                <li>
                  <div class="l-wrap">
                    <p class="text">은행</p>
                    <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                      <select name="bankCd">
                        <option value="" selected="selected">선택하세요</option>

                        <option value="002">한국산업은행</option>

                        <option value="003">IBK기업은행</option>

                        <option value="004">KB국민은행</option>

                        <option value="005">KEB하나은행(구.외환)</option>

                        <option value="007">수협</option>

                        <option value="071">우체국</option>

                        <option value="087">한미(타행)</option>

                        <option value="011">NH농협</option>

                        <option value="012">단위농협</option>

                        <option value="020">우리은행</option>

                        <option value="021">조흥은행</option>

                        <option value="023">SC제일은행</option>

                        <option value="026">신한은행</option>

                        <option value="027">씨티은행</option>

                        <option value="031">대구은행</option>

                        <option value="032">부산은행</option>

                        <option value="034">광주은행</option>

                        <option value="035">제주은행</option>

                        <option value="037">전북은행</option>

                        <option value="039">경남은행</option>

                        <option value="081">KEB하나은행</option>

                        <option value="090">카카오뱅크</option>

                        <option value="083">평화은행</option>

                        <option value="050">상호저축은행</option>

                        <option value="045">새마을금고</option>

                        <option value="048">신용협동조합</option>

                        <option value="088">신한은행(통합)</option>

                        <option value="089">케이뱅크은행</option>

                        <option value="998">예약상품</option>

                        <option value="064">홍콩상하이은행</option>

                        <option value="996">카드분할결제</option>

                        <option value="093">토스뱅크</option>

                        <option value="096">산림조합은행</option>

                        <option value="997">상담원결제</option>

                        <option value="999">무형상품</option>

                      </select>
                      <div class="ui-label"><a href="#1">선택하세요</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">선택하세요</a></li><li><a href="#2">한국산업은행</a></li><li><a href="#3">IBK기업은행</a></li><li><a href="#4">KB국민은행</a></li><li><a href="#5">KEB하나은행(구.외환)</a></li><li><a href="#6">수협</a></li><li><a href="#7">우체국</a></li><li><a href="#8">한미(타행)</a></li><li><a href="#9">NH농협</a></li><li><a href="#10">단위농협</a></li><li><a href="#11">우리은행</a></li><li><a href="#12">조흥은행</a></li><li><a href="#13">SC제일은행</a></li><li><a href="#14">신한은행</a></li><li><a href="#15">씨티은행</a></li><li><a href="#16">대구은행</a></li><li><a href="#17">부산은행</a></li><li><a href="#18">광주은행</a></li><li><a href="#19">제주은행</a></li><li><a href="#20">전북은행</a></li><li><a href="#21">경남은행</a></li><li><a href="#22">KEB하나은행</a></li><li><a href="#23">카카오뱅크</a></li><li><a href="#24">평화은행</a></li><li><a href="#25">상호저축은행</a></li><li><a href="#26">새마을금고</a></li><li><a href="#27">신용협동조합</a></li><li><a href="#28">신한은행(통합)</a></li><li><a href="#29">케이뱅크은행</a></li><li><a href="#30">예약상품</a></li><li><a href="#31">홍콩상하이은행</a></li><li><a href="#32">카드분할결제</a></li><li><a href="#33">토스뱅크</a></li><li><a href="#34">산림조합은행</a></li><li><a href="#35">상담원결제</a></li><li><a href="#36">무형상품</a></li></ul></div></div></div></div>
                  </div>
                </li>
                <li>
                  <div class="l-wrap">
                    <p class="text">예금주</p>
                    <div class="inputbox sm">
                      <label class="inplabel"><input type="text" name="accntNm" placeholder="예금주명을 입력하세요." maxlength="30"></label>
                      <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                    </div>
                  </div>
                  <div class="r-wrap">
                    <p class="text">계좌번호</p>
                    <div class="inputbox sm">
                      <label class="inplabel btnlabel"><input type="text" name="accntNo" value="" placeholder="계좌번호를 입력하세요." maxlength="15"></label>
                      <button type="button" class="btn btn-lineblack btn-confirm" onclick="checkBankNo();"><span>계좌확인</span></button>
                      <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                    </div>
                  </div>
                </li>
              </ul>

              <!-- 추가 결제금액 있는 경우 -->
              <h3 class="title22" style="display: none;">배송비 결제</h3>
              <div class="pay-change-box" style="display: none;">
                <dl>
                  <dt>추가 결제 금액</dt>
                  <dd><strong id="dlvCost3">0</strong>원</dd>
                </dl>
              </div>

              <h3 class="title22" style="display: none;">결제수단 선택</h3>
              <div class="pay-type-box type2" style="display: none;">
                <ul class="box-list">
                  <li>
                    <!-- 2020.12.22 적립금 결제 제거 요청 -->



                    <div class="radio-box">
                                        <span>
                                            <input type="radio" name="box-rad1" checked="" aria-checked="true" id="rad1-3">
                                            <label for="rad1-3"><span class="text">신용카드</span></label>
                                        </span>

                      <span style="display: none">
                                            <input type="radio" name="box-rad1" aria-checked="false" id="rad1-2">
                                            <label for="rad1-2"><span class="text">적립금</span></label>
                                        </span>
                    </div>
                  </li>

                  <li style="display:none">
                    <span class="tlt">결제금액</span><span id="dlvCost2">0</span>
                    <input type="hidden" id="creditCard" name="creditCard">
                    <span class="tlt">추가 배송비</span><span id="minusAddDlvcAmt">0</span>
                    <span class="tlt">적립금 사용</span><span id="dlvCost3_1">0</span>
                    <span class="tlt">예치금 사용</span><span id="dlvCost3_2">0</span>
                    <span class="tlt">카드 결제금액</span><span id="dlvCost3_3">0</span>
                  </li>

                  <!-- 예치금 체크시 노출 -->
                  <li style="display:none" id="boxRad1-1">
                    <ul class="type-between-box">
                      <li>
                        <div class="l-wrap">
                          <p class="text">(사용할 수 있는 예치금 <strong id="balanceRmndAmt">0</strong>원)</p>
                          <!-- [2021.01.19 RENEWAL]
                              as-is : 결제금액을 예치금으로 사용할 경우 사용할 수 있는 예치금(balanceRmndAmt)에 결제금액을 뺀 나머지를 계산 적용하는 방식
                              to-bi : 기획팀 요청으로 사용할 수 있는 예치금(balanceRmndAmt)에 보유한 금액을 보여주고 자동 계산 적용하는 방식은 제거
                          -->
                        </div>
                        <div class="r-wrap">
                          <p class="text">사용할 예치금</p>
                          <div class="inputbox sm w_120">
                            <label class="inplabel disabled"><input type="text" id="balance" name="balance" placeholder="0" onkeydown="chkProp('balance');" disabled=""></label>
                            <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                          </div>
                          <p class="text">원</p>
                        </div>
                      </li>
                    </ul>
                  </li>

                  <!-- 적립금 체크시 노출 -->
                  <li style="display:none" id="boxRad1-2">
                    <ul class="type-between-box">
                      <li>
                        <div class="l-wrap">
                          <p class="text">(사용할 수 있는 적립금 <strong id="hPointRmndAmt">0</strong>원)</p>
                        </div>
                        <div class="r-wrap">
                          <p class="text">사용할 적립금</p>
                          <div class="inputbox sm w_120">
                            <label class="inplabel disabled"><input type="text" id="hPoint" name="hPoint" placeholder="0" onkeydown="chkProp('hpoint');" disabled=""></label>
                            <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                          </div>
                          <p class="text">원</p>
                        </div>
                      </li>
                    </ul>
                  </li>

                  <!-- 신용카드 체크시 노출 -->
                  <li id="boxRad1-3">
                    <ul class="type-between-box">
                      <input type="hidden" id="creditCard" name="creditCard">
                      <li>
                        <div class="l-wrap">
                          <p class="text">카드선택</p>
                          <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                            <select name="stlmCrdInf" onchange="selectCrdcCd(this);">
                              <option value="">카드종류를 선택해 주세요.</option>

                              <!-- 현대스마일카드 노출제외 -->
                              <option value="04|N|4">현대카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="02|N|2">삼성카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="03|I|">KB국민카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="07|N|6">신한카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="01|I|">비씨카드(페이북)</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="08|N|5">롯데카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="40|N|14">농협NH카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="10|N|11">하나카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="06|N|1">하나카드(구.외환)</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="20|N|7">씨티카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="99|I|">우리카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="16|I|">카카오뱅크</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="90|I|">케이뱅크</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="15|I|9">광주카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="13|I|10">전북VISA</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="11|I|8">수협VISA</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="12|I|6">제주VISA</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="42|I|">MG새마을금고</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="41|I|">우체국체크카드</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="43|I|">SC은행카드(리워드플러스)</option>


                              <!-- 현대스마일카드 노출제외 -->
                              <option value="44|I|">산림조합카드</option>




                              <!-- 현대스마일카드 노출제외 -->
                              <option value="17|N|4">현대홈쇼핑 현대카드</option>


                            </select>
                            <div class="ui-label"><a href="#1">카드종류를 선택해 주세요.</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">카드종류를 선택해 주세요.</a></li><li><a href="#2">현대카드</a></li><li><a href="#3">삼성카드</a></li><li><a href="#4">KB국민카드</a></li><li><a href="#5">신한카드</a></li><li><a href="#6">비씨카드(페이북)</a></li><li><a href="#7">롯데카드</a></li><li><a href="#8">농협NH카드</a></li><li><a href="#9">하나카드</a></li><li><a href="#10">하나카드(구.외환)</a></li><li><a href="#11">씨티카드</a></li><li><a href="#12">우리카드</a></li><li><a href="#13">카카오뱅크</a></li><li><a href="#14">케이뱅크</a></li><li><a href="#15">광주카드</a></li><li><a href="#16">전북VISA</a></li><li><a href="#17">수협VISA</a></li><li><a href="#18">제주VISA</a></li><li><a href="#19">MG새마을금고</a></li><li><a href="#20">우체국체크카드</a></li><li><a href="#21">SC은행카드(리워드플러스)</a></li><li><a href="#22">산림조합카드</a></li><li><a href="#23">현대홈쇼핑 현대카드</a></li></ul></div></div></div></div>
                        </div>
                        <div class="r-wrap">
                          <p class="text">할부기간 선택</p>
                          <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                            <select>
                              <option selected="selected">일시불</option>
                            </select>
                            <div class="ui-label"><a href="#1">일시불</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">일시불</a></li></ul></div></div></div></div>
                        </div>
                      </li>
                    </ul>
                  </li>

                </ul>
              </div>

              <div class="guide-box">
                <h4 class="ctypo18">주문 취소 안내</h4>
                <ul class="dotlist">
                  <li>장바구니 주문 부분 취소 시 추가 배송비가 발생할 수 있습니다.</li>
                  <li>특정 상품(식품, 주문제작)의 경우에는 고객센터(1600-0009)나 1:1상담신청을 통해 접수해 주시기 바랍니다.</li>
                  <li>부분취소가 되지 않는 결제수단(지류상품권 등)으로 결제하신 경우에는 전체 금액 취소 후 재결제됩니다.</li>
                </ul>
              </div>

              <label class="chklabel mt_20" id="lblOrdCnclOrg">
                <input type="checkbox" name="agreeYn">
                <i class="icon"></i>
                <span class="ctypo14">위 내용을 확인하였습니다.</span>
              </label>

              <div class="btngroup w_510" id="ordCnclOrg">
                <button type="button" class="btn btn-linelgray medium" onclick="backCncl();"><span>취소</span></button>
                <button type="button" class="btn btn-default medium" name="submit_btn" onclick="insertOrdCncl(this.form);return false;"><span>취소 신청</span></button>
              </div>

              <label class="chklabel type-agree inline mt_10" id="lblOrdCnclAdd" style="display: none;">
                <input type="checkbox" name="agreeYn2">
                <i class="icon"></i>
                <span>주문취소 및 추가결제에 동의하시겠습니까?
                                <em>(전자상거래법 제8조 제2항)</em>
                            </span>
              </label>
              <!-- // 20200915 체크박스 위치 수정 (시안 09/11 기준) -->

              <div class="btngroup w_510" id="ordCnclAdd" style="display: none;">
                <button type="button" class="btn btn-linelgray medium" onclick="backCncl();"><span>취소</span></button>
                <button type="button" class="btn btn-default medium" name="submit_btn" onclick="insertOrdCncl(this.form);return false;"><span>결제하고 취소 신청</span></button>
              </div>

              <div class="guide-box">
                <h4 class="ctypo18">꼭 읽어보세요! Notice</h4>
                <ul class="dotlist">
                  <li>환불은 결제하셨던 결제 수단으로 환불됩니다.</li>
                  <li>일부결제수단은 직접 주문취소가 불가하며, 고객센터(1600-0000) 혹은 Hmall 1:1상담신청을 통해 환불 가능합니다.</li>
                  <li>부분취소가 되지 않는 결제수단(지류상품권 등)으로 결제하신 경우에는 전체 금액 취소 후 재결제됩니다.</li>
                  <li>신용카드 결제 후 부분취소 시 카드사 매입취소까지 1~2주 이상 소요될 수 있습니다. 관련 문의는 각 카드사로 문의 바랍니다.</li>
                </ul>
              </div>
            </div> <!-- //.saveCnclConfirm -->
          </div> <!--  //.mypage-order-wrap -->
        </form>
      </div> <!-- //.contents -->

    </div> <!-- //.gird-l2x -->
  </div> <!-- //.container -->
</main>