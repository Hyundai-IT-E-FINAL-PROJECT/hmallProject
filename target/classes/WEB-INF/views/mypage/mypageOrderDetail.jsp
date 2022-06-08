<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-26
  Time: 오전 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<main class="cmain mypage" role="main" id="mainContents">
    <sec:authentication property="principal" var="pinfo" />
    <div class="container">
        <div class="gird-l2x">
            <!-- 비회원 주문조회 시 LNB영역 숨김 -->
            <%@ include file="mypageSide.jsp" %>


            <div class="contents">
                <div class="mypage-order-wrap">
                    <h3 class="title22">상세 주문 내역</h3>

                    <c:set var="totalCost" value="0"/>
                    <c:forEach items="${list}" var="list" varStatus="vs">
                    <!-- 주문접수/추가구상품 있는 경우 -->
                        <c:if test="${vs.index == 0}">
                    <div class="order-list">
                        <dl>
                            <dt>
                                <div class="date">
                                    <span>주문일</span>
                                    <strong><fmt:formatDate value="${list.CREATED_AT}" pattern="yyyy-MM-dd"/></strong>
                                    <span>주문번호</span>
                                    <strong>${list.ORDER_SEQ}</strong>
                                    <span style="display:none">주문매체</span>
                                    <strong style="display:none">PC주문</strong>
                                </div>

                            </dt>
                            </c:if>
                            <input type="hidden" name="lastOrdStatGbcdNm" value="배송완료">

                            <dd class="btn-col2"><!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->
                                <a href="javascript:goItemDetail('2137807436');">
                                    <span class="img"><img src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg?RS=300x300&amp;AR=0" alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')"></span>
                                    <div class="box">
                                        <c:choose>
                                            <c:when test="${list.ORDER_STATUS eq '주문취소' or list.ORDER_STATUS eq '교환접수' or list.ORDER_STATUS eq '교환완료' or list.ORDER_STATUS eq '반품접수' or list.ORDER_STATUS eq '반품완료'}">
                                                        <span class="state red">
                                                                    ${list.ORDER_STATUS}
                                                        <em class="color-999">

                                                        </em>
                                                        </span>
                                            </c:when>
                                            <c:otherwise>
                                                        <span class="state sky">
                                                                 ${list.ORDER_STATUS}
                                                        <em class="color-999">

                                                        </em>
                                                        </span>
                                            </c:otherwise>
                                        </c:choose>
                                        <span class="tit">${list.PRODUCT_NAME}</span>

                                        <!--엄지펀딩 배송예정시작일 시작-->

                                        <!--엄지펀딩 배송예정시작일 끝-->

                                        <div ttt="" class="info">
                                            <ul>
                                                <li>${list.PRODUCT_INFO}</li> <!-- 상품 정보 -->
                                                <li>${list.OP_COUNT} 개</li> <!-- 상품 수량 -->
                                            </ul>
                                        </div>

                                        <span class="price">
                                            <strong>${list.PRODUCT_COST * list.OP_COUNT}</strong>원
                                            <c:set var="totalCost" value="${totalCost + list.PRODUCT_COST * list.OP_COUNT}"/>
                                        </span>
                                    </div>
                                </a>

                               <div class="btngroup">
                                    <button class="btn btn-linelgray small30" type="button" onclick=""><span>배송조회</span></button>
<%--                                    openDlvTrcUrlPup('20220513295854', '1')--%>
                                    <button class="btn btn-linelgray small30" type="button" onclick=""><span>만족도평가</span></button>
<%--                                    openItemEvalPopup('2137807436', '00008', '20220513295854')--%>
                                </div>
                            </dd> <!-- //.btn-col2 -->
                        <c:if test="${vs.last}">
                            </dl>
                        </div> <!-- //.order-list -->
                        </c:if>
                    </c:forEach>

                    <h3 class="title22">배송지</h3>

                    <div class="address-box" data-dstnseq="0000000002">
                        <div class="top-box">

                            <p class="name" name="rcvCustNm">${pinfo.userVO.user_name}</p>
                            <!-- 일반주소 -->
                            <p class="add" name="dstnAdr">${list[0].ORDER_DELIVERY}</p>

                            <p class="tel" name="hpNo">${list[0].ORDER_USER_NUMBER}</p>
                            <!-- 전화번호2 추가[2021.01.06] -->

                            <p class="tel" name="telNo"></p>
                        </div>

                        <div class="bottom-box">
                            <dl>
                                <dt>주문자명</dt>
                                <dd name="ordCustNm">${list[0].ORDER_USER_NAME}</dd>
                            </dl>
                            <dl>
                                <dt>배송메모</dt>
                                <dd name="dsrvCoMsg">
                                    ${list[0].ORDER_MESSAGE}
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
                                        <strong><c:out value="${totalCost}"/></strong>원


                                    </dd>
                                </dl>

                                <dl class="between">
                                    <dt>주문금액</dt>
                                    <dd>

                                        <strong><c:out value="${totalCost}"/></strong>원

                                    </dd>
                                </dl>



                            </li>
                            <li>
                                <span class="minus-icon"><i class="icon"></i></span>
                                <dl class="between top">
                                    <dt>할인금액</dt>
                                    <dd><strong><c:out value="${totalCost - list[0].ORDER_TOTAL_COST}"/> </strong>원</dd>
                                </dl>

                            </li>
                            <li>
                                <span class="result-icon"><i class="icon"></i></span>
                                <dl class="between top">
                                    <dt>잔여 결제 금액</dt>
                                    <dd class="result">
                                        <strong>${list[0].ORDER_TOTAL_COST}</strong>원
                                    </dd>
                                </dl>


                                <dl class="between">
                                    <dt>결제하신 금액</dt>
                                    <dd><strong>${list[0].ORDER_TOTAL_COST}</strong>원</dd>
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
                                            <strong>${list[0].ORDER_METHOD}</strong>
                                            <span><strong>${list[0].ORDER_TOTAL_COST}</strong>원

                                                            </span>
                                        </p>
                                    </div>

<%--                                    <div class="paycase"></div> <!-- 무통장 한 건이면 div하나 추가해준다. 퍼블에서 요청 -->--%>

<%--                                    <dl class="list">--%>

<%--                                        <dt>KB국민은행</dt>--%>
<%--                                        <dd><strong>130290-71-205907</strong>--%>
<%--                                            <div class="btngroup">--%>
<%--                                                <button type="button" class="btn btn-linelgray small25" onclick=""><span>복사</span></button>--%>
<%--&lt;%&ndash;                                                copyEcrytFncIstnNo(this);&ndash;%&gt;--%>
<%--                                            </div>--%>
<%--                                        </dd>--%>
<%--                                        <dt>입금자명</dt>--%>
<%--                                        <dd>김민수</dd>--%>

<%--                                    </dl>--%>





                                </div>

                            </li>


                            <li> <!-- // 20200928 결제수단 영역 원복 -->
                                <h4 class="pay-tit">적립예정 포인트</h4>

                                <dl class="between">
                                    <dt>Point</dt>
                                    <dd><strong>${list[0].ORDER_POINT}</strong>원</dd>
                                </dl>
                            </li>

                        </ul>
                    </div>

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

                                <button type="button" class="btn btn-linelgray small25" name="pop820x685" onclick=""><span>1:1 게시판상담</span></button>
<%--                                openCnslAcptPupAll(20220513295854);--%>






                                <button type="button" class="btn btn-linelgray small25" name="pop820x685" onclick=""><span>1:1: 채팅상담</span></button>
<%--                                sellerTalkOpen('1')--%>



                            </li>
                        </ul>
                    </div>
                </div> <!-- //.mypage-order-wrap -->

            </div> <!-- // .contents -->
        </div> <!-- //.gird-l2x -->
    </div> <!-- //.container -->
</main>
