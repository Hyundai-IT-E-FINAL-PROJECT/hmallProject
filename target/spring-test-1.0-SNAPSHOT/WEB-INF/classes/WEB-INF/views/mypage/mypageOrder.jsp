<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오후 3:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">
            <%@ include file="mypageSide.jsp" %>
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
                            <input type="hidden" id="searchType" name="searchType" value="2"/>
                            <input type="hidden" class="from" name="strtDt" id="txtOrdStrtDt" maxlength="8" value=""/>
                            <input type="hidden" class="to" name="endDt" id="txtOrdEndDt" maxlength="8" value=""/>

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


                    <div class="order-list">

                        <dl>

                            <!--  2020.07.31 박민성 묶음상품 조건 추가  -->
                            <!-- 각 상품들이 배송비비용발생번호가 같지 않을 경우 (묶음 상품)-->

                            <!-- 묶음 상품일 경우 배송비비용발생번호와 같은 상품들끼리 카운트 및 추가 배송비를 합한다. -->


                            <!-- 결제완료 -->


                            <dt>
                                <div class="date">
                                    <span>2022-05-13 (주문번호 : 20220513295854)</span>
                                </div>

                                <div class="abs">
                                    <a href="/p/mpa/selectOrdPTCPup.do?ordNo=20220513295854" class="btn alink"><span>주문/배송 상세</span></a>
                                </div>

                            </dt>


                            <dd class="btn-col2"><!-- 버튼 1개일경우 class="btn-col" 추가, 버튼 2개 이상일경우 class="btn-col2" 추가 -->


                                <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137807436&ordpreview=true">
                                    <span class="img"><img
                                            src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg?RS=300x300&AR=0"
                                            alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)"
                                            onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/></span>


                                    <div class="box">
	                                            <span class="state sky">





				                                                배송완료



	                                            <em class="color-999">

	                                            </em>
	                                            </span>
                                        <span class="tit">SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)</span>
                                        <div class="info">


                                            <ul>

                                                <li>10봉 랜덤구성</li>


                                                <li>1개</li>

                                            </ul>


                                        </div>
                                        <span class="price">


					                                    	<strong>15,000</strong>원


	                                            </span>
                                    </div>
                                </a>

                                <div class="btngroup">


                                    <!-- 20180626_특화배송조유진 -->


                                    <button class="btn btn-linelgray small30" type="button"
                                            onclick="openCnslAcptPup('20220513295854','1','rtp');"><span>반품신청</span>
                                    </button>


                                    <button class="btn btn-linelgray small30" type="button"
                                            onclick="openCnslAcptPup('20220513295854','1','exch');"><span>교환신청</span>
                                    </button>


                                    <button class="btn btn-linelgray small30" type="button"
                                            onClick="openDlvTrcUrlPup('20220513295854', '1')"><span>배송조회</span></button>


                                    <button class="btn btn-linelgray small30" type="button"
                                            onClick="openItemEvalPopup('2137807436', '00008', '20220513295854')"><span>만족도평가</span>

                                    </button>


                                </div>

                                <!--[10/16] 사은품/hpoint 영역 추가-->

                                <!--//[10/16] 사은품/hpoint 영역 추가-->
                            </dd>
                            <!-- // 결제완료 -->

                        </dl>


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
    <!-- //.container -->

</main>
<!-- //.cmain -->
</body>
</html>
