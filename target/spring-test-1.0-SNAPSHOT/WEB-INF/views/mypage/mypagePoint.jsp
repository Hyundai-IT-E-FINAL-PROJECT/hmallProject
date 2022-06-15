<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script>
    $(document).ready(function () {
        let searchType = '${searchType}';

        let ccid = $('input[name="order"]:checked').val();


        if(searchType != "") {
            $(":radio[name='order']").each(function () {
                    var $this = $(this);
                    if ($this.val() == ccid)
                        $this.attr('checked', false);
                }
            );

            $(":radio[name='order']").each(function () {
                    var $this = $(this);
                    if ($this.val() == searchType)
                        $this.attr('checked', true);
                }
            );
            ccid = $('input[name="order"]:checked').attr('id');
            console.log("ccid : " + ccid);
        }
    });
</script>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <sec:authentication property="principal" var="pinfo" />
    <div class="container">
        <div class="gird-l2x">
            <%@ include file="mypageSide.jsp" %>
            <div class="contents">
                <div class="hpoint-wrap">
                    <h2 class="hiding">포인트</h2>
                    <div class="point-head">
                        <p>${pinfo.userVO.user_name}님의 포인트</p>
                    </div>
                    <!--tabgroup-->
                    <div class="tabgroup point-tab">
                        <!--ui-tab-->
                        <ul class="ui-tab" role="tablist">

                            <li role="presentation" class="ui-active"><a href="/mypagePoint" role="tab" aria-controls="viewReserve"><span>적립금 <em><fmt:formatNumber  value="${userVO.user_point}" pattern="#,###"/>원</em></span></a></li>
                            <li role="presentation"><a href="/mypageDeposit" role="tab" aria-controls="viewDeposit"><span>예치금 <em><fmt:formatNumber  value="${userVO.user_deposit}" pattern="#,###"/>원</em></span></a></li>
                        </ul>
                        <!--//ui-tab-->
                        <!--Tab panes-->
                        <div class="tab-content">
                            <!--viewHpoint-->
                            <div role="tabpanel" class="tab-pane ui-active" id="viewReserve">
                                <!--boxtbl-->
                                <div class="boxtbl">
                                    <div class="point-wrap">
                                        <div class="point-fl">
                                            <span class="ctypo17 bold"><em class="name">${pinfo.userVO.user_name}</em>님의 적립금</span>
                                            <span class="txt-point"><em class="myreserve"></em><fmt:formatNumber  value="${userVO.user_point}" pattern="#,###"/>원</span>
                                        </div>
                                        <div class="point-fr">
                                            <dl>
                                                <dt>적립예정</dt>
                                                <dd>
                                                    <span>
                                                        <em class="prepoint" id="totPromoExpectSvmt">
                                                            <c:if test="${prepoint == null}">
                                                                0
                                                            </c:if>
                                                            <c:if test="${prepoint != null}">
                                                                ${prepoint}
                                                            </c:if>
                                                        </em>P
                                                    </span>
                                                </dd>
                                                <dt>당월 소멸예정</dt>
                                                <dd>
                                                    <span><em class="delpoint" id="thisMonSumEndSvmt">0</em>P</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <!--//boxtbl-->

                                <!--point-progresstxt-->
                                <div class="point-progresstxt">
                                    <div class="tit-wrap btn-with"> <!--버튼과 함께 사용될 경우 class="btn-with" 추가-->
                                        <h3>적립금 보유 &amp; 사용 현황</h3>
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small34" data-modules-modal="target:.pop-phc038;" onclick="javascript:openHPntVlidTermPup();return false;"><span>적립금 유효기간 조회</span></button>
                                        </div>
                                    </div>
                                </div>
                                <!--//point-progresstxt-->

                                <!--filter-box-->
                                <div class="filter-box">
                                    <div class="search-filter">
                                        <ul class="radiolist">
                                            <li>
                                                <input type="radio" name="order" id="order01" value="2" aria-checked=&#034;true&#034; checked=&#034;&#034;>
                                                <label for="order01" onclick="setPeriod(2);">최근 14일</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="order" id="order02" value="3" aria-checked=&#034;false&#034;>
                                                <label for="order02" onclick="setPeriod(3);">최근 3개월</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="order" id="order03" value="6" aria-checked=&#034;false&#034;>
                                                <label for="order03" onclick="setPeriod(6);">최근 6개월</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="order" id="order04" value="0" aria-checked=&#034;false&#034;>
                                                <label for="order04" onclick="setPeriod(0);">2022년</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="order" id="order05" value="-1" aria-checked=&#034;false&#034;>
                                                <label for="order05" onclick="setPeriod(-1);">2021년</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="order" id="order06" value="-2" aria-checked=&#034;false&#034;>
                                                <label for="order06" onclick="setPeriod(-2);">2020년</label>
                                            </li>
                                            <li>
                                                <input type="radio" name="order" id="order07" value="-3" aria-checked=&#034;false&#034;>
                                                <label for="order07" onclick="setPeriod(-3);">전체</label>
                                            </li>
                                        </ul>
                                        <form id="serachForm" action="/mypagePoint" method="get">
                                            <input type="hidden" id="searchType" name="searchType" value=""/>
                                            <input type="hidden" class="from" name="strtDt" id="txtOrdStrtDt" maxlength="8" value="" />
                                            <input type="hidden" class="to" name="endDt" id="txtOrdEndDt" maxlength="8" value=""/>
                                        </form>
                                    </div>
                                </div>
                                <!--//filter-box-->

                                <!--유효한 적립금만 보기-->
<%--                                <div class="checkbox" id="checkbox_view_valid">--%>

<%--                                    <label class="chklabel">--%>
<%--                                        <input id="checkbox_valid_yn" type="checkbox">--%>
<%--                                        <i class="icon"></i>--%>
<%--                                        <span>유효한 적립금만 보기</span>--%>
<%--                                    </label>--%>

<%--                                </div>--%>

                                <!--//유효한 적립금만보기-->
                                <c:if test="${list.size() != 0}">
                                <c:forEach items="${list}" var="polist" varStatus="vs">
                                    <c:if test="${list[vs.index-1].COSTORDER != polist.COSTORDER}">
                                        <div class="list-wrap" style="margin-top: 10px">
                                            <ul class="list">

                                                <li>

                                                    <div class="cell">
                                                        <p>
                                                            <span class="date"><fmt:formatDate value="${polist.CREATED_AT}" pattern="yyyy-MM-dd"/></span>

                                                            <c:if test="${polist.POINT_COST > 0 and polist.ORDER_STATUS eq '배송완료'}">
                                                                <strong class="accu">적립</strong>
                                                            </c:if>
                                                            <c:if test="${polist.POINT_COST < 0 and polist.ORDER_STATUS eq '주문접수'}">
                                                                <strong class="exp-accu">사용 완료</strong>
                                                            </c:if>
                                                            <c:if test="${polist.POINT_COST < 0 and polist.ORDER_STATUS eq '배송완료'}">
                                                                <strong class="exp-accu">사용 완료</strong>
                                                            </c:if>
                                                            <c:if test="${polist.POINT_COST < 0 and polist.ORDER_STATUS eq '주문취소'}">
                                                                <strong class="exp-accu">사용 완료</strong>
                                                            </c:if>
                                                            <c:if test="${polist.POINT_COST > 0 and polist.ORDER_STATUS eq '주문취소'}">
                                                                <strong class="exp">사용 취소</strong>
                                                            </c:if>

                                                        </p>


                                                        <p class="pdname nowrap">${polist.PRODUCT_NAME}
                                                            <c:if test="${polist.COUNT > 1}">
                                                                외 ${polist.COUNT -1}건
                                                            </c:if>
                                                        </p>

                                                        <p>주문번호 : ${polist.ORDER_SEQ}</p>

                                                    </div>
                                                    <div class="cell">
                                                        <c:if test="${polist.POINT_COST > 0}">
                                                            <span class="point-up">+<fmt:formatNumber  value="${polist.POINT_COST}" pattern="#,###"/>p</span>
                                                        </c:if>
                                                        <c:if test="${polist.POINT_COST < 0}">
                                                            <span class="point-down"><fmt:formatNumber  value="${polist.POINT_COST}" pattern="#,###"/>p</span>
                                                        </c:if>
                                                        <sub></sub>


                                                    </div>
                                                </li>


                                            </ul>



                                        </div>
                                    </c:if>
                                </c:forEach>
                                <!--hpoint list-->
                                <!--paging-->
                                <div class="paging">





                                    <div class="page-prevarea">






                                        <strong aria-label="현재 선택페이지">1</strong>






                                    </div>



                                </div>
                                </c:if>
                                <!--//paging-->
                                <c:if test="${list.size() == 0}">
                                <div class="list-wrap">
                                    <!--내역이 없을 경우-->
                                    <div class="nodata">
                                        <span class="bgcircle"><i class="icon nodata-type18"></i></span>
                                        <p>사용 가능한 적립금 내역이 없습니다.</p>
                                    </div>
                                    <!--//내역이 없을 경우-->
                                </div>
                                </c:if>

                                <!--hpoint list-->

                            </div>
                    </div>
                    <!--//tabgroup-->
                </div>
            </div>
            <!-- // .contents -->
        </div>
</main>
<script>
    function setPeriod(period) {
        var d = new Date();
        var endDateStr = getDateStr(d);
        var dt ,startDateStr;

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


        $("#txtOrdStrtDt").val(startDateStr);
        $("#txtOrdEndDt").val(endDateStr);
        $("#searchType").val(period);

        document.getElementById('serachForm').submit();

    }

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
