<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-06-04
  Time: 오후 5:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
  <div class="container">

    <div class="gird-l2x">

      <%@ include file="mypageSide.jsp" %>

      <div class="contents">
<%--        <form id="orderDataForm" name="orderDataForm" method="post">--%>
<%--          <input type="hidden" name="ordNo" value="20220604346763">--%>
<%--          <input type="hidden" name="custNo" value="202007162286">--%>
<%--          <input type="hidden" name="reqCntn">--%>
<%--          <input type="hidden" name="payWayGbcd" value="02">--%>
<%--          <input type="hidden" name="imdtCncYn" value="Y">--%>
<%--          <input type="hidden" name="dlvcStlmYn" value="N">--%>
<%--          <input type="hidden" name="alliRefCd" value="404">--%>
<%--          <input type="hidden" name="ieYn" value="N">--%>
<%--          <input type="hidden" name="isEmergency" value="false">--%>
<%--          <input type="hidden" name="viewSource" value="ADD">    <!-- 추가결제 , 재결제 구분 -->--%>
<%--          <input type="hidden" name="allCnclYn" value="N">--%>

<%--          <input type="hidden" id="select02" name="select02">--%>
<%--          <input type="hidden" id="select01" name="select01">--%>
<%--          <!-- 배송비결제 관련 파라메터 -->--%>
<%--          <input type="hidden" name="orderAmt" value="0">--%>
<%--          <input type="hidden" name="totStlmAmt" value="0">--%>
<%--          <input type="hidden" name="stlmCrdAmt" value="0">--%>
<%--          <input type="hidden" name="stlmAcntAmt" value="0">--%>
<%--          <input type="hidden" name="stlmWibkAmt" value="0">--%>
<%--          <input type="hidden" name="stlmHppayAmt" value="0">--%>
<%--          <input type="hidden" name="stlmHPointAmt" value="0">--%>
<%--          <input type="hidden" name="stlmWPointAmt" value="0">--%>
<%--          <input type="hidden" name="stlmCdpstAmt" value="0">--%>
<%--          <input type="hidden" name="stlmOnlnGcAmt" value="0">--%>
<%--          <input type="hidden" name="stlmPaperGcAmt" value="0">--%>
<%--          <input type="hidden" name="hppayPrice" value="0">--%>
<%--          <input type="hidden" name="hppayTradeid" value="">--%>
<%--          <input type="hidden" name="hppayPrdtnm" value="">--%>
<%--          <input type="hidden" name="hppayMobilid" value="">--%>
<%--          <input type="hidden" name="hppayNo" value="">--%>
<%--          <input type="hidden" name="hppayUserkey" value="">--%>
<%--          <input type="hidden" name="hppayResultCd" value="">--%>
<%--          <input type="hidden" name="hppayResultmsg" value="">--%>
<%--          <input type="hidden" name="receiptYn" value="">--%>
<%--          <input type="hidden" name="cashRcptSendAmt" value="">--%>
<%--          <input type="hidden" name="cashRcptCustIdntVal" value="">--%>
<%--          <input type="hidden" name="cashRcptRcptTskGbcd" value="">--%>
<%--          <input type="hidden" name="okCashCrdNo" value="">--%>
<%--          <input type="hidden" name="asianaId" value="">--%>
<%--          <input type="hidden" name="wibkBankCd" value="">--%>
<%--          <input type="hidden" name="wibkAccountSmsYn" value="">--%>
<%--          <input type="hidden" name="wibkAcntSmsYn" value="">--%>
<%--          <input type="hidden" name="wibkIamtInfSmsYn" value="">--%>
<%--          <input type="hidden" name="wibkCustNm" value="">--%>
<%--          <input type="hidden" name="cardSelect" value="">--%>
<%--          <input type="hidden" name="cmCrdcCd" value="">--%>
<%--          <input type="hidden" name="cardXid" value="">--%>
<%--          <input type="hidden" name="cardEci" value="">--%>
<%--          <input type="hidden" name="cardCavv" value="">--%>
<%--          <input type="hidden" name="cardCardno" value="">--%>
<%--          <input type="hidden" name="cardAllotMonth" value="0">--%>
<%--          <input type="hidden" name="crdStlmType" value="">--%>
<%--          <input type="hidden" name="upopTid" value="">--%>
<%--          <input type="hidden" name="cardProcess" value="">--%>
<%--          <input type="hidden" name="kTCardNo" value="">--%>
<%--          <input type="hidden" name="kTPassword" value="">--%>
<%--          <input type="hidden" name="cardPointUseYn" value="">--%>
<%--          <input type="hidden" name="saveServiceCode" value="">--%>
<%--          <input type="hidden" name="acntSmTid" value="">--%>
<%--          <input type="hidden" name="acntAmt" value="">--%>
<%--          <input type="hidden" name="acntBankCode" value="">--%>
<%--          <input type="hidden" name="acntAccOwner" value="">--%>
<%--          <input type="hidden" name="rempEmno" value="">--%>

<%--          <input type="hidden" name="copnDcAmt" value="0">--%>
<%--          <input type="hidden" name="alliCrdNo" value="">--%>
<%--          <input type="hidden" name="alliCrdDcYn" value="">--%>
<%--          <input type="hidden" name="empDcYn" value="">--%>
<%--          <input type="hidden" name="empDcAmt" value="0">--%>
<%--          <input type="hidden" name="alliRefDcYn" value="">--%>
<%--          <input type="hidden" name="alliRefDcAmt" value="0">--%>
<%--          <input type="hidden" name="spdcYn" value="0">--%>
<%--          <input type="hidden" name="spdcAmt" value="0">--%>
<%--          <input type="hidden" name="spymDcYn" value="">--%>
<%--          <input type="hidden" name="spymDcAmt" value="0">--%>
<%--          <input type="hidden" name="directDcHPointAmt" value="0">--%>
<%--          <input type="hidden" name="onlnGcGbcd" value="">--%>
<%--          <input type="hidden" name="happymoneySessionId" value="">--%>
<%--          <input type="hidden" name="culturelandHashNo" value="">--%>
<%--          <input type="hidden" name="culturelandCustId" value="">--%>
<%--          <input type="hidden" name="onlnGcId" value="">--%>
<%--          <input type="hidden" name="onlnGcPw" value="">--%>
<%--          <input type="hidden" name="orderHDAff" value="00">--%>

<%--          <input type="hidden" name="mltiDlvYn" value="N">--%>
<%--          <input type="hidden" name="mmsMsgTitl" value="">--%>
<%--          <input type="hidden" name="mmsMsgCntn" value="">--%>

<%--          <input type="hidden" name="dlvHopeDt" value="">--%>
<%--          <input type="hidden" name="gcItemYn" value="">--%>
<%--          <input type="hidden" name="slitmNm" value="">--%>
<%--          <input type="hidden" name="stlmWayScopGbcd" value="">--%>
<%--          <input type="hidden" name="wintInsmMths" value="">--%>

<%--          <input type="hidden" name="mobileYn" value="">--%>

<%--          <input type="hidden" name="KVP_SESSIONKEY" value="">--%>
<%--          <input type="hidden" name="KVP_CURRENCY" value="">--%>
<%--          <input type="hidden" name="KVP_PGID" value="">--%>
<%--          <input type="hidden" name="KVP_ENCDATA" value="">--%>
<%--          <input type="hidden" name="KVP_NOINT" value="">--%>
<%--          <input type="hidden" name="KVP_QUOTA" value="">--%>
<%--          <input type="hidden" name="KVP_CARDCODE" value="">--%>
<%--          <input type="hidden" name="KVP_CONAME" value="">--%>
<%--          <input type="hidden" name="KVP_RESERVED1" value="">--%>
<%--          <input type="hidden" name="KVP_RESERVED2" value="">--%>
<%--          <input type="hidden" name="KVP_RESERVED3" value="">--%>
<%--          <input type="hidden" name="KVP_IMGURL" value="">--%>
<%--          <input type="hidden" name="storeid" value="">--%>
<%--          <input type="hidden" name="ordnm" value="">--%>
<%--          <input type="hidden" name="KVP_GOODNAME" value="">--%>
<%--          <input type="hidden" name="socid" value="">--%>
<%--          <input type="hidden" name="KVP_PRICE" value="">--%>
<%--          <input type="hidden" name="reply" value="">--%>
<%--          <input type="hidden" name="KVP_NOINT_INF" value="">--%>
<%--          <input type="hidden" name="KVP_QUOTA_INF" value="">--%>
<%--          <input type="hidden" name="success" value="">--%>
<%--          <input type="hidden" name="fail" value="">--%>
<%--          <input type="hidden" name="VP_RET_SAVEPOINT" value="">--%>
<%--          <input type="hidden" name="KVP_CARD_PREFIX" value="">--%>

<%--          <input type="hidden" name="partCnclAmt" value="0">--%>
<%--          <input type="hidden" name="stlmNo" value="2022060400754044">--%>
<%--          <input type="hidden" name="dlvPrcInfoArr">--%>
<%--          <input type="hidden" name="cnclQty">--%>
<%--          <input type="hidden" name="cnclInfArr">--%>

<%--          <input type="hidden" name="oriBankCd">--%>
<%--          <input type="hidden" name="oriBnkac">--%>
<%--          <input type="hidden" name="oriDpsr">--%>

<%--          <input type="hidden" name="viewSource" value="PC">    <!-- 부분취소 -->--%>
<%--          <input type="hidden" name="totStlmReAmt" value="0">    <!-- 재결제 총금액 -->--%>
<%--          <input type="hidden" name="totDlvcReAmt" value="0">    <!-- 재결제 총배송비 -->--%>
<%--          <input type="hidden" name="totDCAmt" value="0">    <!-- 재결제 총 할인액 -->--%>
<%--          <input type="hidden" name="totStlmRepyPossAmt" value="0">    <!-- 재결제 총 할인액 -->--%>
<%--          <input type="hidden" name="cancelReason" value="">--%>

<%--          <input type="hidden" name="dawnDlvYn" value=""><!-- 20180622 조상열. 새벽배송여부 추가 -->--%>


<%--          <input type="hidden" name="senderName" value="김민수">--%>




<%--          <input type="hidden" id="stlm02" value="0" vangbcd="">--%>


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

                <c:set var="totalCost" value="0"/>
                <c:forEach items="${list}" var="list">
                <li class="chk-form">

<%--                  <input type="hidden" name="ordItemNm" value="[바닐라코] 클린 잇 제로 클렌징밤 대용량 180ml">--%>
<%--                  <input type="hidden" name="ordQty" value="1">--%>
<%--                  <input type="hidden" name="stlmAmt" value="">--%>
<%--                  <input type="hidden" name="dmndAmt" value="">--%>
<%--                  <input type="hidden" name="ordPtcSeq" value="1">--%>




<%--                  <input type="hidden" name="rmndQty" value="1">--%>
<%--                  <input type="hidden" name="sellUprc" value="25000">--%>
<%--                  <input type="hidden" name="frstDcRate" value="10">--%>
<%--                  <input type="hidden" name="rtpDlvCost" value="5000">--%>
<%--                  <input type="hidden" name="lastAplyAmt" value="0">--%>
<%--                  <input type="hidden" name="addDlvCost" value="2500">--%>
<%--                  <input type="hidden" name="minStlmAmt" value="15000">--%>
<%--                  <input type="hidden" name="slitmCd" value="2068386470">--%>
<%--                  <input type="hidden" name="venCd" value="016449">--%>
<%--                  <input type="hidden" name="venAdrSeq" value="3">--%>
<%--                  <input type="hidden" name="gubunCd" value="A">--%>
<%--                  <input type="hidden" name="basktGrpDivRnm" value="EMT">--%>


<%--                  <!-- 재계산에 필요 파라미터세팅 -->--%>
<%--                  <input type="hidden" name="ordNos" value="20220604346763">--%>
<%--                  <input type="hidden" name="ordPtcSeqs" value="1">--%>
<%--                  <input type="hidden" name="slitmCds" value="2068386470">--%>
<%--                  <input type="hidden" name="dlvcPayGbcds" value="10">--%>
<%--                  <input type="hidden" name="dcAmts" value="2500">--%>
<%--                  <input type="hidden" name="payedYns" value="0">--%>
<%--                  <input type="hidden" name="prpyDlvCosts" value="2500">--%>
<%--                  <input type="hidden" name="minStlmAmts" value="15000">--%>
<%--                  <input type="hidden" name="sellUprcs" value="25000">--%>
<%--                  <input type="hidden" name="rmndQtys" value="1">--%>
<%--                  <input type="hidden" name="acptQtys" value="1">--%>
<%--                  <input type="hidden" name="partCnclYns" value="Y">--%>
<%--                  <input type="hidden" name="imdtCnclPossYns" value="Y">--%>
<%--                  <input type="hidden" name="gubunCds" value="A">--%>
<%--                  <input type="hidden" name="venCds" value="016449">--%>
<%--                  <input type="hidden" name="venAdrSeqs" value="0003">--%>
<%--                  <input type="hidden" name="payedDlvCosts" value="0">--%>
<%--                  <input type="hidden" name="basktGrpDivRnms" value="EMT">--%>
<%--                  <input type="hidden" name="lastOrdStatGbcdNm" value="주문접수">--%>

<%--                  <input type="hidden" name="ordGbcds" value="01">--%>

<%--                  <input type="hidden" name="ordItemNm" value="[바닐라코] 클린 잇 제로 클렌징밤 대용량 180ml">--%>

<%--                  <input type="hidden" name="prpyDlvCost" value="2500">--%>
<%--                  <input type="hidden" name="dlvCost" value="0">--%>
<%--                  <input type="hidden" name="addIrgnCost" value="0">--%>



                      <a href="product/detail?product_seq=${list.PRODUCT_SEQ}&page_num=1">
                      <span class="img"><img src="/resources/img/${list.IMAGE_NAME}.jpg" alt="${list.PRODUCT_NAME}"/></span>
                      <div class="box">
                        <span class="tit">${list.PRODUCT_NAME}</span>
                        <div class="info">
                          <ul>
                            <li>${list.PRODUCT_INFO}</li>
                            <li>${list.OP_COUNT}개</li>
                            <!-- >li></li -->
                          </ul>

                          <!-- 케이스 찾아서 퍼블 요청 필요....---------------------- -->



                          <!-- 케이스 찾아서 퍼블 요청 필요....---------------------- -->

                        </div>
                        <span class="price">
                                                      <strong>



                                                               ${list.PRODUCT_COST}

                                                      </strong>원
                                                  </span>
                      </div>
                    </a>

                    <!-- 상품품절 아닌 제품이 하나라도 존재했을때 체크 -->


<%--                    <div class="count">--%>
<%--                      <span class="txt">취소수량</span>--%>

<%--                      <button type="button" class="btn btn-minus" aria-label="수량 감소" onclick="multiDlvItemMinus(this);return false;"><i class="icon btn-prev"></i><span class="hiding">감소</span></button>--%>

<%--                      <span id="maxRmndQty" style="display:none">1</span>--%>
<%--                      <div class="inputbox">--%>
<%--                        <label class="inplabel">--%>



<%--                          <input type="number" name="partCnclCnts" value="0" title="수량" onkeydown="onkeydownOnlyNumInput(event)" onchange="removeZero(this);" maxlength="4">--%>



<%--                        </label>--%>
<%--                      </div>--%>

<%--                      <button type="button" class="btn btn-plus" aria-label="수량 증가" onclick="multiDlvItemPlus(this, 1);return false;"><i class="icon btn-next"></i><span class="hiding">증가</span></button>--%>

<%--                    </div>--%>


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
                  <c:set var="totalCost" value="${totalCost + list.PRODUCT_COST * list.OP_COUNT}"/>
                </c:forEach>

              </ul></div> <!-- //.order-list -->

            <!-- [12/17]_수정(위키 402 내용 - 취소,반품,교환 사유 부분 위치 조절로 마크업 구조 변경) -->
            <div class="reason-area">
              <h3 class="title22">취소사유</h3>
              <div class="textform">

                <div class="textareabox">
                  <label class="txtlabel">
                    <textarea id="viewPartCnclRsnDtls" cols="48" rows="7" placeholder="상세 사유를 입력해주세요" aria-placeholder="상세 사유를 입력해주세요"></textarea>
                  </label>
                </div>
                <input type="hidden" name="statusAddIrgnCost" value="0">
                <div class="confirm-area">
                  <span class="txt">취소할 상품의 수량을 확인하신 후 버튼을 눌러주세요.</span>
                  <button type="button" class="btn btn-default small30" onclick="saveCnclQty();"><span>취소 정보반영</span></button>
                </div>
              </div>
            </div>

            <div class="saveCnclConfirm" id="saveCnclConfirm" style="display: none">
              <h3 class="title22">결제금액 정보</h3>
              <div class="pay-info-box type-toggle">
                <h3 class=""><button type="button" data-modules-collapse="" class="accordion-trigger" aria-expanded="false"><span>자세히보기</span><i class="icon updown"></i></button></h3>
                <div class="accordion-panel" role="region" aria-label="결제금액/취소예정금액/잔여결제금액">
                  <ul>
                    <li>
                      <dl class="between top">
                        <dt>결제금액</dt>


                        <dd><strong id="orgStlmAmt"><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>
                      <dl class="between">
                        <dt>원 주문금액</dt>
                        <input type="hidden" name="frstOrdAmt" id="frstOrdAmt" value="<fmt:formatNumber  value="${totalCost}" pattern="#,###"/>">
                        <dd><strong><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>

                      <dl class="between">
                        <dt>배송비</dt>
                        <dd><strong>0</strong>원</dd>
                      </dl>

                      <div class="btm">


                        <dl class="between">
                          <dt>할인금액</dt>
                          <dd><strong><fmt:formatNumber  value="${totalCost - list[0].ORDER_TOTAL_COST}" pattern="#,###"/></strong>원</dd>
                        </dl>



                        <dl class="between">
                          <dt>${list[0].ORDER_METHOD}</dt>
                          <dd><strong><fmt:formatNumber  value="${list[0].ORDER_TOTAL_COST}" pattern="#,###"/></strong>원</dd>
                        </dl>

                      </div>

                    </li>
                    <li>
                      <span class="minus-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>취소예정금액</dt>
                        <dd><strong id="schdCnclAmt"><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>
                      <dl class="between">
                        <dt>주문금액</dt>
                        <dd><strong id="stlmOrdAmt"><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddDlvcAmtTr2" style="display: none;">
                        <dt>배송비</dt>
                        <dd><strong id="dtlAddDlvcAmt2">0</strong>원</dd>
                      </dl>
                    </li>
                    <li>
                      <span class="result-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>잔여 결제 금액</dt>
                        <dd class="result"><strong id="rmndStlmAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddIrgnDlvcAmtTr2">
                        <dt>주문금액</dt>
                        <dd><strong id="stlmRepyPossAmt">0</strong>원</dd>
                        <input type="hidden" id="repyPossAmt" value="21000">
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
                        <dd><strong id="dtlCnclAmt"><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>
                      <dl class="between">
                        <dt>원 주문금액</dt>
                        <dd><strong id="dtlOrgOrdAmt"><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>

                    </li>
                    <li>
                      <span class="minus-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>차감금액</dt>
                        <dd><strong id="dtlCalcAmt">0</strong>원</dd>
                      </dl>
                      <dl class="between" id="dtlAddDlvcAmtTr" style="display: none;">
                        <dt>추가배송비</dt>
                        <dd><strong id="dtlAddDlvcAmt">0</strong>원</dd>
                      </dl>
                    </li>
                    <li>
                      <span class="result-icon"><i class="icon"></i></span>
                      <dl class="between top">
                        <dt>환불 예정 금액</dt>
                        <dd class="result"><strong id="dtlRepySchdAmt"><fmt:formatNumber  value="${totalCost}" pattern="#,###"/></strong>원</dd>
                      </dl>


                      <dl class="between" name="paywayTr">
                        <dt id="stlmPayWayGbcd_0">${list[0].ORDER_METHOD}</dt>
                        <dd><strong id="stlmRtpAmt_0" name="stlmRtpAmt"><fmt:formatNumber  value="${list[0].ORDER_TOTAL_COST}" pattern="#,###"/></strong><span id="stlmRtpWon_0">원</span></dd>
                      </dl>



                      <dl class="between" name="paywayTr">
                        <dt id="stlmPayWayGbcd_1">할인금액</dt>
                        <dd><strong id="stlmRtpAmt_1" name="stlmRtpAmt"><fmt:formatNumber  value="${totalCost - list[0].ORDER_TOTAL_COST}" pattern="#,###"/></strong><span id="stlmRtpWon_1"> 원</span></dd>
                      </dl>

                    </li>
                  </ul>
                </div>
              </div>

              <div class="guide-box">
                <h4 class="ctypo18">주문 취소 안내</h4>
                <ul class="dotlist">
                  <li>장바구니 주문 부분 취소 시 추가 배송비가 발생할 수 있습니다.</li>
                  <li>특정 상품(식품, 주문제작)의 경우에는 고객센터(1600-0009)나 1:1상담신청을 통해 접수해 주시기 바랍니다.</li>
                  <li>부분취소가 되지 않는 결제수단(지류상품권 등)으로 결제하신 경우에는 전체 금액 취소 후 재결제됩니다.</li>
                </ul>
              </div>

<%--              <label class="chklabel mt_20" id="lblOrdCnclOrg">--%>
<%--                <input type="checkbox" name="agreeYn">--%>
<%--                <i class="icon"></i>--%>
<%--                <span class="ctypo14">위 내용을 확인하였습니다.</span>--%>
<%--              </label>--%>

              <div class="btngroup w_510" id="ordCnclOrg">
                <button type="button" class="btn btn-linelgray medium" onclick="backCncl();"><span>취소</span></button>
                <button type="button" class="btn btn-default medium" name="submit_btn");"><span>취소 신청</span></button>
              </div>
            </div>

          </div> <!--  //.mypage-order-wrap -->
        </form>
      </div> <!-- //.contents -->

    </div> <!-- //.gird-l2x -->
  </div> <!-- //.container -->
</main>
<script type="text/javascript">
  var csrfHeaderName = "${_csrf.headerName}";
  var csrfTokenValue = "${_csrf.token}";

  function saveCnclQty() {
    document.getElementById("saveCnclConfirm").style.display = "";
  }

  $(document).on('click', 'button[name=submit_btn]',function() {
        if (confirm("주문을 취소하시겠습니까?")) {
              $.ajax({
                url: "orderCancel?order_seq=" + "${list[0].ORDER_SEQ}",
                method: "GET", // 요청방식은 post
                // beforeSend:function (xhr){
                //   xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                // },
                success: function (result) {
                  if (result === "1") {
                      alert("주문이 취소되었습니다.");
                      location.href = "mypageOrder"
                  }
                }, error: function (error) {
                  alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인
                }
              });
        }
  });
</script>
