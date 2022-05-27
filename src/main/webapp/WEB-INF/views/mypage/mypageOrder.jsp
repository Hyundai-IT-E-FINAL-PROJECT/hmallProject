<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">
            <%@ include file="mypageSide.jsp" %>
            <sec:authentication property="principal" var="pinfo" />
<%--            <form id="searchForm" name="searchForm" action="${contextPath}/mypageOrderPeriod/" method="get">--%>
<%--                <input type='hidden' name='searchType' 		id='searchType' 		value="" />--%>
<%--                <input type='hidden' name='ordStrtDt' 		id='ordStrtDt'			value="" />--%>
<%--                <input type='hidden' name='ordEndDt' 		id='ordEndDt' 			value="" />--%>
<%--&lt;%&ndash;                <input type='hidden' name='selectTypeGbcd' 	id='selectTypeGbcd' 	value="" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type='hidden' name='itemNm' 			id='itemNm'				value="" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type='hidden' name='listSize' 		id='listSize'			value="20" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type='hidden' name='selectListSize'  id='selectListSize'     value="20" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                <input type='hidden' name='pageType'        id='pageType'           value="ALL" />&ndash;%&gt;--%>
<%--            </form>--%>
            <div class="contents">
                <div class="mypage-order-wrap">
                    <h3 class="title22">주문/배송 현황</h3>
                    <div class="order-step">
                        <p class="txt-right">(최근 2개월)</p>
                        <!-- [02/04]_수정(작성가능한 상품평 제외 a태그 -> div태그로 수정) -->
                        <ul>
                            <li>
                                <div>
                                    <strong class="num">0</strong>
                                    <span class="txt">주문접수</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <strong class="num">0</strong>
                                    <span class="txt">결제완료</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <strong class="num">0</strong>
                                    <span class="txt">상품준비중</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <strong class="num">0</strong>
                                    <span class="txt">상품발송</span>
                                </div>
                            </li>
                            <li>
                                <a href="https://www.hmall.com/p/mpb/selectItemEvalAtclListPagingByCondtion.do">
                                    <strong class="num">1</strong>
                                    <span class="txt">작성 가능한 상품평</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <ul class="dotlist">
                        <li>구매확정이 완료된 주문은 진행중인 주문에 포함되지 않으며, 진행상태에 따라 배송지 변경, 취소, 교환, 반품신청이 가능합니다.</li>
                        <li>가전, 가구 등 설치 상품은 물류 이동으로 인해 상품발송 후 설치 방문까지 2~3일 정도 기간이 추가될 수 있습니다.</li>
                    </ul>


                    <div class="filter-box">
                        <div class="search-filter">
                            <ul class="radiolist">
                                <li>
                                    <input type="radio" name="order" id="order01" value="2"
                                           aria-checked=&#034;true&#034; checked=&#034;&#034;>
                                    <label for="order01" onclick="setPeriod(2);">최근 14일</label>
                                </li>
                                <li>
                                    <input type="radio" name="order" id="order02" value="3"
                                           aria-checked=&#034;false&#034;>
                                    <label for="order02" onclick="setPeriod(3);">최근 3개월</label>
                                </li>
                                <li>
                                    <input type="radio" name="order" id="order03" value="6"
                                           aria-checked=&#034;false&#034;>
                                    <label for="order03" onclick="setPeriod(6);">최근 6개월</label>
                                </li>
                                <li>
                                    <input type="radio" name="order" id="order04" value="0"
                                           aria-checked=&#034;false&#034;>
                                    <label for="order04" onclick="setPeriod(0);">2022년</label>
                                </li>
                                <li>
                                    <input type="radio" name="order" id="order05" value="-1"
                                           aria-checked=&#034;false&#034;>
                                    <label for="order05" onclick="setPeriod(-1);">2021년</label>
                                </li>
                                <li>
                                    <input type="radio" name="order" id="order06" value="-2"
                                           aria-checked=&#034;false&#034;>
                                    <label for="order06" onclick="setPeriod(-2);">2020년</label>
                                </li>
                                <li>
                                    <input type="radio" name="order" id="order07" value="-3"
                                           aria-checked=&#034;false&#034;>
                                    <label for="order07" onclick="setPeriod(-3);">전체</label>
                                </li>
                            </ul>
                            <div class="inputbox sm">
                                <label class="inplabel icon-find"><input type="text" name="txtItemNm" id="txtItemNm"
                                                                         value="" placeholder="상품명 검색"></label>
                                <button class="btn btn-find" type="button" id="serach"><i class="icon find"></i><span
                                        class="hiding">검색</span></button>
                                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="order-list-load">
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
                    </div>
                    <div class="paging">


                        <div class="page-prevarea">


                            <strong aria-label="현재 선택페이지">1</strong>


                        </div>


                    </div>
                    <div class="tblwrap">
                        <h4 class="ctypo17">주문상태 안내</h4>
                        <table>
                            <caption>테이블 제목</caption>
                            <colgroup>
                                <col style="width:140px">
                                <col style="width:160px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row" rowspan="6">접수 → 배송완료</th>
                                <td>주문접수</td>
                                <td>주문접수 후 입금을 확인하는 단계 입니다.</td>
                            </tr>
                            <tr>
                                <td>결제완료</td>
                                <td>주문/결제가 완료되었거나 입금확인이 완료된 단계입니다.</td>
                            </tr>
                            <tr>
                                <td>상품 준비중</td>
                                <td>주문하신 상품을 발송하기 위해 상품을 준비하는 단계입니다.</td>
                            </tr>
                            <tr>
                                <td>발송 준비중</td>
                                <td>주문하신 상품을 택배사로 전달하는 단계입니다.</td>
                            </tr>
                            <tr>
                                <td>상품 발송</td>
                                <td>택배사를 통해 상품발송이 완료되어 배송추적이 가능한 단계입니다. <br>(H.Point는 상품발송 단계에서만 내려받으실 수 있습니다.)</td>
                            </tr>
                            <tr>
                                <td>배송 완료</td>
                                <td>택배 송장 조회결과 배송완료된 단계입니다.</td>
                            </tr>
                            <tr>
                                <th scope="row">주문취소</th>
                                <td>주문취소</td>
                                <td>주문취소 처리가 완료된 단계입니다.</td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="5">반품</th>
                                <td>반품접수</td>
                                <td>반품신청이 접수되어 처리중인 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>상품 회수중</td>
                                <td>반품접수된 상품이 택배사를 통해 회수중인 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>상품 확인중</td>
                                <td>당사 물류센터로 상품도착 후 백화점 매장으로 상품 이동중인 단계입니다. <br>(백화점 상품에 한함)</td>
                            </tr>
                            <tr>
                                <td>반품완료</td>
                                <td>반품처리가 완료된 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>반품취소</td>
                                <td>반품취소가 완료된 상태입니다.</td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="6">교환</th>
                                <td>교환접수</td>
                                <td>교환신청이 접수되어 처리중인 상태입니다. (해외배송 제외)</td>
                            </tr>
                            <tr>
                                <td>교환상품 준비중</td>
                                <td>교환상품을 발송하기 위해 상품을 준비하는 단계입니다.</td>
                            </tr>
                            <tr>
                                <td>교환상품발송 준비중</td>
                                <td>교환 상품을 택배사로 전달하는 단계입니다. (해외배송 제외)</td>
                            </tr>
                            <tr>
                                <td>교환상품발송</td>
                                <td>교환 상품이 택배사를 통해 발송이 완료되어 배송추적이 가능한 단계입니다.</td>
                            </tr>
                            <tr>
                                <td>교환완료</td>
                                <td>교환처리가 완료된 상태입니다. (해외배송 제외)</td>
                            </tr>
                            <tr>
                                <td>교환취소</td>
                                <td>교환취소가 완료된 상태입니다.</td>
                            </tr>
                            <tr>
                                <th scope="row" rowspan="7">A/S</th>
                                <td>A/S 접수</td>
                                <td>A/S 신청이 접수되어 처리중인 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>A/S 상품 회수 중</td>
                                <td>A/S 접수된 상품이 택배사를 통해 회수중인 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>A/S 상품 회수 완료</td>
                                <td>A/S 상품이 회수된 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>A/S 상품 준비 중</td>
                                <td>A/S 상품을 발송하기 위해 상품을 준비하는 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>A/S 상품 발송</td>
                                <td>A/S 상품이 택배사를 통해 발송된 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>A/S 완료</td>
                                <td>A/S 처리가 완료된 상태입니다.</td>
                            </tr>
                            <tr>
                                <td>A/S 취소</td>
                                <td>A/S 접수가 취소된 상태입니다.</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 2020-09-03 텍스트 수정 -->
                    <div class="guide-box">
                        <h4 class="ctypo18">꼭 읽어보세요! Notice</h4>
                        <ul class="dotlist">
                            <li>주문상태가 '상품발송'인 경우 배송조회가 가능합니다. 단 주문하신 상품을 업체에서 직접 배송하는 경우 배송조회가 이루어지지 않을 수 있습니다.</li>
                            <li>결제수단을 무통장 입금이나 상품권으로 선택한 경우, 주문일로부터 <strong class="color-666">7일 이내 입금 및 접수확인이 되지 않으면
                                주문이 취소</strong>됩니다.
                            </li>
                            <li>복합결제 후 일부 금액만 결제한 경우 주문일로부터 7일 후 주문이 취소되며, 결제한 금액은 환불처리됩니다. 단, 현금 결제는 예치금으로 환불됩니다.</li>
                            <li><strong class="color-666">반품 및 교환 신청은 상품발송 후 7일 이내</strong>에 가능합니다.</li>
                            <li>반품 신청 시 반품상품이 도착한 후 상품 상태를 점검한 다음에 결제가 취소됩니다. 단, 상품 점검 시 반품 불가 사유에 해당하는 경우 고객님께 통보 후 상품을
                                다시 발송해 드립니다.
                            </li>
                            <li>주문과 관련하여 문의사항이 있으실 경우 고객센터(1600-0000) 혹은 Hmall 1:1상담신청을 통해 문의 바랍니다.</li>
                        </ul>
                    </div>
                    <!-- // 2020-09-03 텍스트 수정 -->
                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>

    <script>

        // let startDateStr, endDateStr;
        const csrfHeaderName = "${_csrf.headerName}";
        const csrfTokenValue = "${_csrf.token}";

        function setPeriod(period) {

            var d = new Date();
            var dt, startDateStr;
            var endDateStr = getDateStr(d);

            if (period == 2){
                dt = new Date(d.setDate(d.getDate() - 14));
                startDateStr = getDateStr(dt);
            } else if (period == 3){
                dt = new Date(d.setMonth(d.getMonth() - 3));
                startDateStr = getDateStr(dt);
            } else if (period == 6) {
                dt = new Date(d.setMonth(d.getMonth() - 6));
                startDateStr = getDateStr(dt);
            } else if (period == 0) {
                startDateStr = endDateStr.substr(0,4)+"0101";
                endDateStr = endDateStr.substr(0,4)+"1231";
            } else if (period == -1) {
                d.setFullYear(new Date().getFullYear() - 1);
                startDateStr = getDateStr(d).substr(0,4)+"0101";
                endDateStr = startDateStr.substr(0,4)+"1231";
            } else if (period == -2) {
                d.setFullYear(new Date().getFullYear() - 2);
                startDateStr = getDateStr(d).substr(0,4)+"0101";
                endDateStr = startDateStr.substr(0,4)+"1231";
            } else { // 전체
                startDateStr = "";
                endDateStr = "";
            }

            // $("#txtOrdStrtDt").val(startDateStr);
            // $("#txtOrdEndDt").val(endDateStr);
            // $("#searchType").val(period);
            // $("input[name=listSize]").val('20');
            // $("input[name=selectListSize]").val('20');

            $.ajax({
                url: "${contextPath}/mypageOrderPeriod/${pinfo.userVO.no}",
                method: "post", // 요청방식은 post
                data: { "startDateStr": startDateStr , "endDateStr" : endDateStr, "period" : period},
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
                },
                success: function (result) {
                    console.log("실행중");

                    var html = jQuery('<div>').html(result);
                    var contents = html.find("div.order-list-load").html();

                    $(".order-list-load").html(contents);


                },
                error: function (error) {
                    alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인
                }
            });

        }

        <%--// 댓글 목록을 불러오는 함수--%>
        <%--function getOrders() {--%>
        <%--    $.getJSON("${contextPath}/replyList/" + ${boardDTO.no}, function (data) {--%>
        <%--        console.log(data);--%>
        <%--        var str = "";--%>


        <%--        $(data).each(function () {--%>
        <%--            if(this.writer === replyer) {--%>
        <%--                str += "<li data-reply_no='" + this.rno + "' class='replyLi'>"--%>
        <%--                    + "<p class='reply_text'>" + this.content + "</p>"--%>
        <%--                    + "<p class='reply_writer'> 작성자 : " + this.writer + "</p>"--%>
        <%--                    + "<button type='button' class='btn btn-xs btn-info' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"--%>
        <%--                    + "</li>"--%>
        <%--                    + "<hr/>";--%>
        <%--            }--%>
        <%--            else {--%>
        <%--                str += "<li data-reply_no='" + this.rno + "' class='replyLi'>"--%>
        <%--                    + "<p class='reply_text'>" + this.content + "</p>"--%>
        <%--                    + "<p class='reply_writer'> 작성자 : " + this.writer + "</p>"--%>
        <%--                    + "</li>"--%>
        <%--                    + "<hr/>";--%>
        <%--            }--%>
        <%--        });--%>
        <%--        $("#replies").html(str);--%>
        <%--    });--%>
        <%--}--%>

        function getDateStr(dt){
            var year = dt.getFullYear();
            var month = dt.getMonth();
            month++;
            if( month < 10 ){
                month = "0" + month;
            }
            var date = dt.getDate();
            if( date < 10){
                date = "0" + date;
            }
            return year + "" +  month + "" + date;
        }


    </script>
</main>
<!-- //.cmain -->