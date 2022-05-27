<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-27
  Time: 오후 2:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <c:forEach items="${list}" var="list" varStatus="vs">
        <div class="order-list">
            <dl>
                <dt>
                    <div class="date">
                        <span><fmt:formatDate value="${list.CREATED_AT}" pattern="yyyy-MM-dd"/> (주문번호 : ${list.ORDER_SEQ})</span>
                    </div>
                    <div class="abs">
                        <a href="/mypageOrderDetail" class="btn alink"><span>주문/배송 상세</span></a>
                    </div>
                </dt>
                    <%--                                <input type="hidden" name="paymentYnOrdNo" value="" />--%>
                <!-- 가장최근주문 1건, 최대 10개 상품 -->
                <dd>
                    <a href="https://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137807436&ordpreview=true">
                        <input type="hidden" name="slitmCd" value="2137807436">
                        <span class="img">
	    	                                <img src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg?RS=300x300&AR=0" alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/>
	                                    </span>
                        <div class="box">
	                                        <span class="state sky">
															 ${list.ORDER_STATUS}
                                            <em class="color-999">

                                            </em>
                                            </span>
                            <span class="tit"> ${list.PRODUCT_NAME}</span>
                            <div class="info">
                                <ul>
                                    <li>product_info 자리</li>
                                    <li>
                                            ${list.OP_COUNT} 개
                                    </li>
                                </ul>
                            </div>
                            <span class="price"> <strong>15,000</strong>원 </span>
                        </div>
                    </a>

                    <div class="btngroup">
                        <button class="btn btn-linelgray small30" type="button" onclick="openCnslAcptPup('20220513295854','1','exch');" ><span>주문취소</span></button>
                        <button class="btn btn-linelgray small30" type="button" onClick="openDlvTrcUrlPup('20220513295854', '1')" ><span>배송조회</span></button>
                        <input type="hidden" name="copnStlmFixYn" value="" />
                    </div>
                </dd>
            </dl>
        </div>
    </c:forEach>
