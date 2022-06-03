<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<main class="cmain bgcmain" role="main" id="mainContents">
    <div class="container">
        <input type="hidden" name="giftOrderYn">
        <div class="cbody">
            <div class="contents">
                <div class="csection">
                    <div class="cart-area">
                        <div class="cart-head">
                            <div class="cart-top">
                                <div class="cart-all">
                                    <strong>장바구니</strong> <span>(<em class="cart-count">3</em>)</span>
                                </div>
                                <ol class="cart-list-num">
                                    <li class="active"> <!-- active일 경우 style 변경 -->
                                        <strong>01</strong>
                                        <span>장바구니</span>
                                    </li>
                                    <li>
                                        <strong>02</strong>
                                        <span>주문서작성</span>
                                    </li>
                                    <li>
                                        <strong>03</strong>
                                        <span>주문완료</span>
                                    </li>
                                </ol>
                                <!-- 가격이 내려간 상품이 있을 경우 노출 -->
                                <div class="toast arrtl bgc" style="display:none;">
                                    <p>가격이 내려간 상품이 있습니다</p>
                                    <button type="button" class="btn-close"><i class="icon"></i><span
                                            class="hiding">닫기</span></button>
                                </div>
                            </div>
                            <div class="cart-bottom">
                                <div class="btngroup">
                                    <button type="button" class="btn btn-cart-del" onclick="deleteBasktAll();"><i
                                            class="icon cart-del"></i><span>장바구니 비우기</span></button>
                                    <button type="button" class="btn btn-cart-set lyopen"
                                            data-modules-modal="target:#cartAlarm;"><i
                                            class="icon cart-set"></i><span>알림설정</span></button>
                                </div>
                            </div>
                        </div>
                        <!-- //.cart-head -->

                        <div class="cart-body">
                            <form action="#" name="totBasktForm" method="post" onsubmit="return false;">

                                <!-- 일반상품 -->
                                <div class="shipping-listwrap" aria-label="일반상품">
                                    <div class="cart-check">
                                        <div class="checkbox">
                                            <label class="chklabel"><input type="checkbox" name="all" id="gen"
                                                                           onclick="check(this, 'gen', 'all', '');"><i
                                                    class="icon"></i><span>일반상품</span></label>
                                            <span class="cart-count">(<strong>2</strong>/<em>2</em>)</span>
                                        </div>
                                        <button type="button" class="btn btn-linelgray sm"
                                                onclick="deleteBasktItem(this)"><span>선택삭제</span></button>
                                    </div>
                                    <div class="shipping-list" id="gen">
                                        <div class="pdwrap pdlist ml" style="display:none;" id="007818_000000_314">
                                            <input type="hidden" id="exclItemTrgtGbcd_2122712699" name="exclItemTrgtGbcd" value="">
                                            <input type="hidden" id="slitmNm_2122712699" name="slitmNm" value="[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )">
                                            <input type="hidden" name="slitmCd" value="2122712699">
                                            <input type="hidden" name="ordAgreeInf" value="N|N|N|N|[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )|6kg(3kg * 2박스)|00002|0">
                                            <input type="hidden" name="uitmCdInfPup" value="[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )$6kg(3kg * 2박스)$12$358800$2122712699_0_100.jpg$2122712699$bask">
                                            <input type="hidden" name="dawnDlvYn" value="N">
                                            <input type="hidden" name="freshFoodYn" value="N">
                                            <input type="hidden" name="sectId" value="2731643">
                                            <input type="hidden" name="stlmWayScopGbcd" value="10">
                                            <input type="hidden" name="venCd" value="007818">
                                            <input type="hidden" name="cardEventYn" value="">
                                            <input type="hidden" name="basktGbcd" value="02">
                                            <input type="hidden" name="brand" value="209964(아이사랑)">
                                            <input type="hidden" name="gaCategory" value="식품/농산물/국내청과/사과">
                                            <input type="hidden" name="basktVenCdVal" id="basktVenCdVal" value="007818">
                                            <input type="hidden" name="basktVen2CdVal" id="basktVen2CdVal" value="000000">
                                            <input type="hidden" name="basktOshpVenAdrSeqVal" id="basktOshpVenAdrSeqVal" value="314">
                                            <input type="hidden" name="basktGrpDivRnm" id="basktGrpDivRnm" value="EMT">
                                            <input type="hidden" name="sdlvcVenSeq" id="sdlvcVenSeq" value="">
                                            <input type="hidden" name="dlvcPayGbcdVal" id="dlvcPayGbcdVal" value="00">
                                            <input type="hidden" name="dlvHopeOverYn" value="Y">
                                            <input type="hidden" name="basktDlvCostVal" id="basktDlvCostVal" value="0">
                                            <input type="hidden" name="basktVenCdGatherVal" id="basktVenCdGatherVal" value="007818|000000||EMT">
                                            <input type="hidden" name="basktGiftOrderYn" value="Y">
                                            <input type="hidden" name="basktTotalGiftOrderYn" value="Y">
                                            <input type="hidden" name="bsicAmt" value="0">

                                            <div class="checkbox">
                                                <label class="chklabel"><input type="checkbox" name="basktInf" value="2122712699|00002|0|12|29900" onclick="check(this, 'gen', '2122712699', '00002');"><i class="icon"></i><span>[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )</span></label>
                                            </div>
                                            <button type="button" class="btn btn-cart-del" onclick="deleteBasktSlitem('2122712699|00002|0|12|29900');"><i class="icon cart-del"></i><span class="hiding">삭제</span></button>
                                            <div class="pdlist-wrap">
                                                <div class="pditem">
                                                    <figure class="pdthumb">
                                                        <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2122712699&amp;sectId=2731643">
                                                            <div class="thumb">
                                                                <img src="https://image.hmall.com/static/6/2/71/22/2122712699_0.jpg?RS=120x120&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
                                                            </div>
                                                        </a>
                                                        <figcaption>
                                                            <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2122712699&amp;sectId=2731643">
                                                                <div class="pdprice">







                                                                    <!-- TODO 곽희섭 20170608 통합포인트 추가 -->


                                                                    <input type="hidden" name="sellPrc" value="30900">
                                                                    <input type="hidden" name="bbprc" value="29900">

                                                                    <ins class="normal" aria-label="정상가"><em>358,800</em><b>원</b></ins>


                                                                </div>
                                                                <div class="benefits">











                                                                    <!-- 카드즉시할인KJH -->

                                                                </div>



                                                                <div class="pdoption" aria-label="옵션/수량">
                                                                    <span class="option">옵션: <em>6kg(3kg * 2박스)</em></span>
                                                                    <span class="count">수량: <em>12개</em></span>
                                                                </div>
                                                            </a>
                                                        </figcaption>
                                                        <div class="pdlike">
                                                            <a href="javascript:;" onclick="zzimItem(this, '2122712699', '00002');" class="btn btn-like" id="zzim_2122712699:00002"><i class="icon"></i><span class="hiding">찜</span></a>
                                                        </div>
                                                    </figure>
                                                </div>
                                                <!-- //.pditem -->

                                                <!-- gifts-area : 필수사은품 -->

                                                <!-- //.gifts-area -->

                                                <!-- btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->
                                                <div class="btngroup">


                                                    <div class="pdfunc">
                                                        <button type="button" class="btn btn-linelgray sm btn-prop" id="optBtn_2122712699_00002" onclick="showChgUitmPup(this, '2122712699', '00002', 0, 30900, '');"><span>수량/속성변경</span><i class="icon"></i></button>
                                                    </div>






                                                    <button type="button" class="btn btn-linelgray" onclick="setGiftOrder('Y');buyDirect(this);" id="buyDirectBtn_2122712699"><span>선물하기</span></button>








                                                    <button type="button" class="btn btn-default" onclick="setGiftOrder('N');buyDirect(this);" id="buyDirectBtn_2122712699"><span>바로구매</span></button>





                                                </div>
                                                <!-- // btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->

                                                <!-- 속성변경 옵션 class=selected 추가하면 활성화 됨 -->
                                                <div class="prop-change" id="chgUitmLayer_2122712699_00002">
                                                </div>
                                                <!-- //.prop-change -->


                                            </div>
                                            <!-- //.pdlist-wrap -->
                                        </div>
                                        <!-- //.pdwrap -->
                                    </div>
                                    <!-- //.cart-check -->
                                    <script type="text/javascript">
                                        console.log("${basketVOList}")
                                    </script>
                                    <c:forEach items="${basketVOList}" var="basketVO">
                                        <div class="shipping-list" id="gen">
                                            <!-- .pdwrap -->
                                            <div class="pdwrap pdlist ml" style="display:;" id="013817_000000_9">
                                                <input type="hidden" id="exclItemTrgtGbcd_2101560521" name="exclItemTrgtGbcd" value="">
                                                <input type="hidden" id="slitmNm_2101560521" name="slitmNm" value="SPC삼립 필라프 5종(총15팩) + 비프 함박스테이크 2종(총15장)">
                                                <input type="hidden" name="slitmCd" value="2101560521">
                                                <input type="hidden" name="ordAgreeInf" value="N|N|N|N|SPC삼립 필라프 5종(총15팩) + 비프 함박스테이크 2종(총15장)|없음|00001|3">
                                                <input type="hidden" name="uitmCdInfPup" value="SPC삼립 필라프 5종(총15팩) + 비프 함박스테이크 2종(총15장)$없음$2$115800$2101560521_0_100.jpg$2101560521$bask">
                                                <input type="hidden" name="dawnDlvYn" value="N">
                                                <input type="hidden" name="freshFoodYn" value="N">
                                                <input type="hidden" name="sectId" value="920435">
                                                <input type="hidden" name="stlmWayScopGbcd" value="10">
                                                <input type="hidden" name="venCd" value="013817">
                                                <input type="hidden" name="cardEventYn" value="">
                                                <input type="hidden" name="basktGbcd" value="02">
                                                <input type="hidden" name="brand" value="A03306(삼립식품)">
                                                <input type="hidden" name="gaCategory" value="식품/가공식품/밥류/볶음밥">
                                                <input type="hidden" name="basktVenCdVal" id="basktVenCdVal" value="013817">
                                                <input type="hidden" name="basktVen2CdVal" id="basktVen2CdVal" value="000000">
                                                <input type="hidden" name="basktOshpVenAdrSeqVal" id="basktOshpVenAdrSeqVal" value="9">
                                                <input type="hidden" name="basktGrpDivRnm" id="basktGrpDivRnm" value="EMT">
                                                <input type="hidden" name="sdlvcVenSeq" id="sdlvcVenSeq" value="">
                                                <input type="hidden" name="dlvcPayGbcdVal" id="dlvcPayGbcdVal" value="00">
                                                <input type="hidden" name="dlvHopeOverYn" value="Y">
                                                <input type="hidden" name="basktDlvCostVal" id="basktDlvCostVal" value="0">
                                                <input type="hidden" name="basktVenCdGatherVal" id="basktVenCdGatherVal" value="013817|000000||EMT">
                                                <input type="hidden" name="basktGiftOrderYn" value="Y">
                                                <input type="hidden" name="basktTotalGiftOrderYn" value="Y">
                                                <input type="hidden" name="bsicAmt" value="0">

                                                <div class="checkbox">
                                                    <label class="chklabel"><input type="checkbox" name="basktInf" value="2101560521|00001|0|2|57900" onclick="check(this, 'gen', '2101560521', '00001');"><i class="icon"></i><span>${basketVO.productVO.product_name}</span></label>
                                                </div>
                                                <button type="button" class="btn btn-cart-del" onclick="deleteBasktSlitem('2101560521|00001|0|2|57900');"><i class="icon cart-del"></i><span class="hiding">삭제</span></button>
                                                <div class="pdlist-wrap">
                                                    <div class="pditem">
                                                        <figure class="pdthumb">
                                                            <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2101560521&amp;sectId=920435">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/5/0/56/01/2101560521_0.jpg?RS=120x120&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
                                                                </div>
                                                            </a>
                                                            <figcaption>
                                                                <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2101560521&amp;sectId=920435">
                                                                    <div class="pdprice">
                                                                        <input type="hidden" name="sellPrc" value="59900">
                                                                        <input type="hidden" name="bbprc" value="57900">
                                                                        <ins class="normal" aria-label="정상가"><em><fmt:formatNumber value="${basketVO.productVO.product_cost}" pattern="#,###"/></em><b>원</b></ins>
                                                                    </div>
                                                                    <div class="pdoption" aria-label="옵션/수량">
                                                                        <span class="count">수량: <em><fmt:formatNumber value="${basketVO.productVO.product_count}" pattern="#,###"/>개</em></span>
                                                                    </div>
                                                                </a>
                                                            </figcaption>
                                                            <div class="pdlike">
                                                                <a href="javascript:;" onclick="zzimItem(this, '2101560521', '00001');" class="btn btn-like" id="zzim_2101560521:00001"><i class="icon"></i><span class="hiding">찜</span></a>
                                                            </div>
                                                        </figure>
                                                    </div>
                                                    <div class="btngroup">
                                                        <div class="pdfunc">
                                                            <button type="button" class="btn btn-linelgray sm btn-prop" id="optBtn_2101560521_00001" onclick="showChgUitmPup(this, '2101560521', '00001', 0, 59900, '');"><span>수량/속성변경</span><i class="icon"></i></button>
                                                        </div>
                                                        <button type="button" class="btn btn-linelgray" onclick="setGiftOrder('Y');buyDirect(this);" id="buyDirectBtn_2101560521"><span>선물하기</span></button>
                                                        <button type="button" class="btn btn-default" onclick="setGiftOrder('N');buyDirect(this);" id="buyDirectBtn_2101560521"><span>바로구매</span></button>
                                                    </div>
                                                    <div class="prop-change" id="chgUitmLayer_2101560521_00001">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="sticky-ui-wrapper util-option-sticky">
                    <div class="sticky-placeholder" style=""></div>
                    <div class="util-option sticky"
                         data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;"
                         style="">
                        <div class="sticky-inner">
                            <div class="result">
                                <p class="sel-tit">선택한 상품<span>(<em id="selCnt">2</em>)</span></p>
                                <p><strong>상품금액</strong>
                                    <ins><em id="selSlitmAmt">164,800</em><b>원</b></ins>
                                </p>
                                <!-- <p class="sale"><strong>할인</strong><ins><em class="off">0</em><b>원</b></ins></p>-->
                                <p class="ship-fee"><strong>배송비</strong>
                                    <ins><em id="selDlvAmt">0</em><b>원</b></ins>
                                </p>  <!-- 선택한 상품이 없을 경우 em에 class="off" 붙여주세요.  -->
                            </div>
                            <div class="total-price">
                                <a href="javascript:;" class="btn-total"><span>총 주문 금액</span></a>
                                <ins><em id="selOrdAmt">164,800</em><b>원</b></ins>
                            </div>
                            <div id="uobtnprsnbox" class="btngroup _gift" style="">
                                <button class="btn btn-linelgray" onclick="setGiftOrder('Y');orderSelect();"><span>선물하기</span>
                                </button>
                                <button class="btn btn-purchase" onclick="setGiftOrder('N');orderSelect();"><span>바로구매</span>
                                </button>
                            </div>
                            <div id="uobtnbox" class="btngroup" style="display: none;">
                                <button type="button" class="btn btn-purchase"
                                        onclick="setGiftOrder('N');orderSelect();"><span>선택상품 구매하기</span></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //.util-option -->
            </div>
            <!-- //.contents -->

            <!--product-content-->
            <div class="product-content">
                <div class="product-area">


                    <!-- 오늘의 추천상품 : 메인 내 오늘추천 탭의 전체 카테고리 상품  -->

                    <div class="article produt-slide">
                        <h3 class="major-headings">오늘의 추천 상품</h3>
                        <div class="pdwrap xllist">
                            <div class="pdlist-wrap">


                                <figure class="pdthumb">
                                    <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2028027962&amp;SectID="
                                       onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니"
                                       ga-custom-position="오늘의 추천 상품"
                                       ga-custom-creative="2028027962_만쥬/찰밥바/경주빵/찰보리빵/아이스크림 모음"
                                       ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
                                        <!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
                                        <div class="thumb">
                                            <img src="https://image.hmall.com/static/9/7/02/28/2028027962_0.jpg?RS=185x185&amp;AR=0"
                                                 onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
                                        </div>
                                        <figcaption>
                                            <div class="pdname" aria-label="제품명">만쥬/찰밥바/경주빵/찰보리빵/아이스크림 모음</div>

                                            <div class="pdprice">
                                                <span aria-label="판매가"><em>10,500</em><b>원</b></span>
                                            </div>

                                        </figcaption>
                                    </a>
                                </figure>


                                <figure class="pdthumb">
                                    <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2138230755&amp;SectID="
                                       onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니"
                                       ga-custom-position="오늘의 추천 상품"
                                       ga-custom-creative="2138230755_[착한떡][금주 특별 가격]쑥인절미,영양찰떡,쑥개떡,우유백설기"
                                       ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
                                        <!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
                                        <div class="thumb">
                                            <img src="https://image.hmall.com/static/7/0/23/38/2138230755_0.jpg?RS=185x185&amp;AR=0"
                                                 onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
                                        </div>
                                        <figcaption>
                                            <div class="pdname" aria-label="제품명">[착한떡][금주 특별
                                                가격]쑥인절미,영양찰떡,쑥개떡,우유백설기
                                            </div>

                                            <div class="pdprice">
                                                <span aria-label="판매가"><em>9,900</em><b>원</b></span>
                                            </div>

                                        </figcaption>
                                    </a>
                                </figure>


                                <figure class="pdthumb">
                                    <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2124583587&amp;SectID="
                                       onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니"
                                       ga-custom-position="오늘의 추천 상품"
                                       ga-custom-creative="2124583587_[댄케이크]포르투갈 버터쿠키 / 포미 토마토 주스 외"
                                       ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
                                        <!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
                                        <div class="thumb">
                                            <img src="https://image.hmall.com/static/5/3/58/24/2124583587_0.jpg?RS=185x185&amp;AR=0"
                                                 onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
                                        </div>
                                        <figcaption>
                                            <div class="pdname" aria-label="제품명">[댄케이크]포르투갈 버터쿠키 / 포미 토마토 주스 외</div>

                                            <div class="pdprice">
                                                <span aria-label="판매가"><em>13,900</em><b>원</b></span>
                                            </div>

                                        </figcaption>
                                    </a>
                                </figure>


                                <figure class="pdthumb">
                                    <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139463828&amp;SectID="
                                       onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니"
                                       ga-custom-position="오늘의 추천 상품"
                                       ga-custom-creative="2139463828_[오트리][5% 다운쿠폰]견과류 원물 / 하루견과 / 선물세트"
                                       ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
                                        <!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
                                        <div class="thumb">
                                            <img src="https://image.hmall.com/static/8/3/46/39/2139463828_0.jpg?RS=185x185&amp;AR=0"
                                                 onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
                                        </div>
                                        <figcaption>
                                            <div class="pdname" aria-label="제품명">[오트리][5% 다운쿠폰]견과류 원물 / 하루견과 /
                                                선물세트
                                            </div>

                                            <div class="pdprice">
                                                <span aria-label="판매가"><em>32,400</em><b>원</b></span>
                                            </div>

                                        </figcaption>
                                    </a>
                                </figure>


                            </div>
                            <!-- //.pdlist-wrap -->
                        </div>
                        <!-- //.pdwrap -->
                    </div>

                    <!-- //오늘의 추천상품 : 메인 내 오늘추천 탭의 전체 카테고리 상품  -->

                    <!-- .produt-slide : 내 장바구니와 유사한 장바구니에 담긴 다른 상품 -->
                    <div class="article produt-slide hidden" id="rcmm1">
                        <h3 class="major-headings">내 장바구니와 유사한 장바구니에 담긴 다른 상품</h3>
                        <!-- 장바구니에 담긴 상품이 없을 시 텍스트 변경 : 이 상품 지금 딱!-->
                        <div class="pdwrap xllist">
                        </div>
                        <!-- //.pdwrap -->
                    </div>
                    <!-- //.produt-slide : 내 장바구니와 유사한 장바구니에 담긴 다른 상품 -->

                    <!-- .produt-slide :  장바구니 상품과 동일한 카테고리 베스트 셀러 -->
                    <div class="article produt-slide hidden" id="rcmm2">
                        <h3 class="major-headings">함께 구매하면 좋은 상품</h3>
                        <!-- 장바구니에 담긴 상품이 없을 시 텍스트 변경 : 지금 인기 많은 상품 -->
                        <div class="pdwrap xllist">
                        </div>
                        <!-- //.pdwrap -->
                    </div>
                    <!-- //.produt-slide : 장바구니 상품과 동일한 카테고리 베스트 셀러 -->
                </div>
            </div>
            <!--product-cotent-->
        </div>
        <div class="cfoot">
            <div class="contents">
                <div class="cart-info">
                    <h3 class="major-headings">장바구니 이용안내</h3>
                    <div class="cart-infocnt" role="region" aria-label="장바구니 이용안내">
                        <h4 class="subheadings">장바구니 보관 안내</h4>
                        <ul class="dotlist">
                            <li>장바구니에 담긴 상품은 1달 동안 보관됩니다. 더 오래 보관 하시려면 "찜"에 저장해 주시기 바랍니다.</li>
                            <li>장바구니에 보관 된 상품이라 해도, 가격이나 혜택이 변동 될 수 있으니 주문하시기 전에 다시 한번 확인하시기 바랍니다.</li>
                            <li>상품에 따라 반품이나 교환 시 별도로 배송비가 청구되는 경우가 있습니다.</li>
                        </ul>
                        <h4 class="subheadings">무이자 할부 이용 안내</h4>
                        <ul class="dotlist">
                            <li>상품상세 페이지나 장바구니에 기재된 무이자할부 개월수는 해당상품을 단독 구매할 경우 적용되는 조건입니다.</li>
                            <li>여러종류의 상품을 함께 구매 할 경우, 보다 낮은 개월 수 의 무이자 할부가 적용됩니다.</li>
                            <li>무이자할부 대상이 아닌 상품을 함께 구매 할 경우, 무이자 할부가 적용되지 않습니다.</li>
                            <li>일부 특가상품은 무이자 할부 대상에서 제외되며 또한 각 상품별로 무이자 할부 개월수가 상이하오니, 최종 결제 페이지에서 무이자 할부 개월수를 다시 한번
                                확인하시기 바랍니다.
                            </li>
                            <li>상품별로 무이자할부 혜택을 받고 싶으시다면, 개별 주문 부탁드립니다.</li>
                        </ul>
                    </div>
                    <!-- //.cart-infocnt -->

                </div>
                <!-- //.cart-info -->
            </div>
        </div>
    </div>
</main>
<script src="/resources/js/basket.js"></script>