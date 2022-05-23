<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Hi</title>
<head>
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/od/order.css">
<body>

<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="cbody gird-full">
            <div class="contents">
                <div class="order-wrap">
                    <div class="order-content">
                        <div class="order-top">
                            <h2 class="title30">주문서 작성</h2>
                            <ol class="list-step">
                                <li>
                                    <strong>01</strong>
                                    <span>장바구니</span>
                                </li>
                                <li class="active">
                                    <strong>02</strong>
                                    <span>주문서작성</span>
                                </li>
                                <li>
                                    <strong>03</strong>
                                    <span>주문완료</span>
                                </li>
                            </ol>
                        </div>

                        <h3 class="title22 selected only"><button data-modules-collapse="" class="accordion-trigger" aria-expanded="false">상품정보 <span class="num" id="ordItemCnt">1</span><i class="icon"></i></button></h3>
                        <div class="accordion-panel selected" role="region" aria-label="">
                            <div class="order-list" id="orderItems">
                                <ul>
                                    <li name="orderItem">
                                        <input type="hidden" name="slitmNm" value="[DKNY GOLF] 22SS 여성 니트 반팔 카라티 1종">
                                        <input type="hidden" name="uitmNm" value="블랙/95">
                                        <input type="hidden" name="areaDlvCostAddYn" value="N">
                                        <input type="hidden" name="jejuAddDlvCost" value="0">
                                        <input type="hidden" name="irgnAddDlvCost" value="0">
                                        <input type="hidden" name="bndlItemCnt" value="1">
                                        <input type="hidden" name="grpItemNum" value="0">
                                        <input type="hidden" name="ItemNum" value="0">
                                        <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137171063&amp;sectId=2731506" target="_blank">
                                            <span class="img"><img src="https://image.hmall.com/static/0/1/17/37/2137171063_0.jpg?RS=140x140&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')"></span>
                                            <div class="box">
                                                <span class="tit">[DKNY GOLF] 22SS 여성 니트 반팔 카라티 1종</span>
                                                <div class="info">
                                                    <ul>
                                                        <li>블랙/95</li>
                                                        <li>1개<input type="hidden" name="ordQty" value="1" readonly="readonly"></li>
                                                    </ul>
                                                </div>
                                                <span class="price"><strong>99,000</strong>원</span>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- chkStlmType() 2번째 시작 -->
                        <div>
                            <h3 class="title22">할인/포인트 적용</h3>
                            <div class="discount-box">
                                <div class="coupon-area">
                                    <ul class="row-list">
                                        <li>
                                            <div class="row-title _txt-benefit">
                                                <label class="chklabel">
                                                    <input type="checkbox" id="plcc-hcard" value="">
                                                    <i class="icon"></i>
                                                    <span>현대홈쇼핑 현대카드 첫 결제 <em>3만원</em> 할인 받기
                                                                                                <br><sub>2022.05.01 ~ 2022.05.31</sub></span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="point-area">
                                    <ul class="row-list">
                                        <li>
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="checkbox" name="gcCheck" onclick="useGc()">
                                                    <i class="icon"></i>
                                                    <span class="hiding"></span>
                                                </label>
                                                <div class="selectwrap"><div class="custom-selectbox sm disabled" data-modules-selectbox="">
                                                    <select id="subpayToken" onchange="selectGcKind(this);" disabled="">
                                                        <option value="0" selected="selected">쿠폰 선택</option>
                                                        <option value="1">현대백화점</option>
                                                        <option value="1">삼성</option>
                                                        <option value="1">현대오일뱅크</option>
                                                        <option value="1">국민관광</option>
                                                        <option value="1">GS칼텍스</option>
                                                    </select>
                                                    <div class="ui-label"><a href="#1">상품권 선택</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">상품권 선택</a></li><li><a href="#2">현대백화점</a></li><li><a href="#3">삼성</a></li><li><a href="#4">현대오일뱅크</a></li><li><a href="#5">국민관광</a></li><li><a href="#6">GS칼텍스</a></li></ul></div></div></div></div>
                                            </div>
                                            <div class="row-value">
                                                <div class="inputbox sm">
                                                    <label class="inplabel"><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');" name="useGcAmt" value="" placeholder="0" onchange="directInsertGc(this);" disabled="disabled"></label>
                                                    <span class="unit">원</span>
                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                </div>
                                            </div>
                                        </li>
                                        <li id="hpointUseLi">
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="checkbox" name="upointCheck" onclick="useUpoint()">
                                                    <i class="icon"></i>
                                                    <span>적립금 <em class="num">99,000</em></span>
                                                    <input type="hidden" name="uPoint" value="">
                                                </label>
                                                <button type="button" class="btn-tooltip" onclick="$('#pec009').modal().show();"><i class="icon que-mark"></i><span class="hiding">툴팁</span></button>
                                            </div>
                                            <div class="row-value">
                                                <div class="inputbox sm">
                                                    <label class="inplabel"><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g, '$1');" name="useUPoint" value="" placeholder="0" onchange="directInsertUPoint(this);"></label>
                                                    <span class="unit point">P</span>
                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="checkbox" name="hanamoneyCheck" onclick="checkUseHanaMoney()">
                                                    <i class="icon"></i>
                                                    <span>하나머니</span>
                                                </label>
                                                <button class="btn btn-linelgray small34" onclick="useHanaMoneyPop()"><span>조회/변경</span></button>
                                            </div>
                                            <div class="row-value">
                                                <div class="inputbox sm">
                                                    <label class="inplabel"><input type="text" name="useHanamoneyAmt" value="" placeholder="0" readonly=""></label>
                                                    <span class="unit">원</span>
                                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>


                        </div> <!-- chkStlmType() 2번째 종료 -->
                        <h3 class="title22" id="dlvTitleH3">
                            <span id="dlvTypeTitle">주문고객/배송지 정보 입력</span>
                            <span class="txt">배송/결제 정보를 정확히 입력해주세요.</span>
                        </h3>

                        <div class="tab-content" style="padding: 10px;">
                            <div role="tabpanel" class="tab-pane" id="addresslist">

                                <div class="nodata"><span class="bgcircle"><i class="icon nodata-type15"></i></span><p>지정된 배송지가 없습니다.</p></div><div class="btngroup">
                                <button type="button" class="btn btn-default" onclick="selectDstnAddr();"><span>확인</span></button>
                                <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                            </div>
                            </div>
                            <%--                                test중--%>
                            <input type="hidden" name="order_point" value="200" id="order_point">
                            <input type="hidden" name="order_status" value="준비중" id="order_status">
                            <input type="hidden" name="order_invoice" value=2 id="order_invoice">
                            <input type="hidden" name="user_seq" value=19 id="user_seq">

                            <div role="tabpanel" class="tab-pane ui-active" id="addressadd" style="padding: 10px;">
                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="adrKndGbcd">
                                    <input type="hidden" name="" value="" id="dlvType">
                                    <input type="hidden" name="" value="" id="selectedDstnSeq">
                                    <label class="inplabel"><input type="text"  name="order_user_name" value="" placeholder="받으실 분" id="order_user_name" maxlength="25"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>

                                <div class="inputbox">
                                    <input type="hidden" name="" value="" id="selectedPost">
                                    <input type="hidden" name="" value="" id="selectedJibunAddr">
                                    <label class="inplabel btnlabel"><input type="text"  value="" placeholder="주소"></label>
                                    <button type="button" class="btn btn-lineblack btn-confirm"><span>우편번호 찾기</span></button>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>

                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" name="order_delivery" value="" placeholder="상세 주소를 입력해주세요." id="order_delivery" maxlength="100"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" class="onlyNumber" name="order_user_number" value="" placeholder="연락처(필수입력) (예 : 01012345678)" id="order_user_number" maxlength="12"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" class="onlyNumber" name="" value="" placeholder="휴대폰 (예 : 01012345678)" id="selectedDstnTel2" maxlength="12"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <div class="inputbox">
                                    <label class="inplabel"><input type="text" name="" value="" placeholder="남기실 말씀을 입력해주세요." id="" maxlength="100"></label>
                                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <label class="chklabel">
                                    <input type="checkbox" name="" id="selectedBaseYn" value="Y">
                                    <i class="icon"></i>
                                    <span>기본배송지로 지정</span>
                                </label>
                                <div class="btngroup">
                                    <button class="btn btn-linelgray" onclick="$('#pec003').modal().hide();"><span>취소</span></button>
                                    <button class="btn btn-default" onclick="modifyAddr('', $(this).parent().parent().find('#dlvType').val(), '');"><span>확인</span></button>
                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                </div>
                            </div>
                        </div>

                        <div id="cost">

                            <h3 class="title22">결제 정보 선택</h3>

                            <div class="discount-box">
                                <div class="point-area">
                                    <ul class="row-list">




                                        <li>
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="checkbox" name="creditCard" onclick="checkUseHanaMoney()">
                                                    <i class="icon"></i>
                                                    <span>신용카드</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="checkbox" name="bankBook" onclick="checkUseHanaMoney()">
                                                    <i class="icon"></i>
                                                    <span>무통장입금</span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div> <!-- chkStlmType() 2번째 종료 -->

                        <div class="box-toggle">
                            <h3>
                                <button data-modules-collapse="" class="accordion-trigger" aria-expanded="false">
                                    <span class="row-title">총 결제금액</span>
                                    <span class="row-value color-ff5340">
		                                            <em class="tag" id="main_totDiscountRate" style="display: none;"></em>
		                                            <strong id="main_totPayAmt">99,000</strong>원
		                                        </span>
                                    <i class="icon"></i>
                                </button>
                            </h3>
                            <div class="accordion-panel" role="region" aria-label="">
                                <ul class="row-list">
                                    <li>
                                        <div class="row-title">
                                            <p class="tit">주문금액</p>
                                        </div>
                                        <div class="row-value">
                                            <p class="price"><strong id="main_orderAmt">99,000</strong>원</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row-title">
                                            <p class="tit">할인금액</p>
                                        </div>
                                        <div class="row-value">
                                            <p class="price"><strong id="main_discountAmt">0</strong>원</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row-title">
                                            <p class="tit">배송비</p>
                                        </div>
                                        <div class="row-value">
                                            <p class="price"><strong id="main_dlvcAmt">0</strong>원</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="row-title">
                                            <p class="tit">배송비 할인</p>
                                        </div>
                                        <div class="row-value">
                                            <p class="price"><strong id="main_discountDlvcAmt">0</strong>원</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="notice-box-container" id="order2016Alert" style="display:none;">
                        </div>
                        <div class="guarantee-box">
                            <p class="tit">채무지급 보증안내 <a href="http://www.hmall.com/static/html/popup/2013/11/woori_escrow.html" target="_blank" class="abtn"><span>서비스가입사실 확인</span></a></p>
                            <ul class="dotlist">
                                <li>고객님의 안전거래를 위해 현금 결제의 모든 금액에 대해 우리은행과 채무지급 보증 계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</li>
                            </ul>
                        </div>

                        <div class="sticky-ui-wrapper util-option-sticky"><div class="sticky-placeholder" style=""></div><div class="util-option sticky" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;" style="">
                            <div class="sticky-inner">
                                <h4 class="title20">총 결제금액</h4>
                                <ul class="payment-list">
                                    <li>
                                        <div id="orderAmt">
                                            <span class="tit">총 판매금액</span>
                                            <span class="txt"><strong>99,000</strong>원</span>
                                        </div>
                                        <div id="copnDcAmtDiv" class="hidden">
                                            <span class="tit">적립금 사용</span>
                                            <span class="txt"><strong>0</strong>원</span>
                                        </div>

                                        <div class="hidden" id="alliDcAmtDiv">
                                            <span class="tit">예치금 사용</span>
                                            <span class="txt"><strong>0</strong>원</span>
                                        </div>
                                        <div class="hidden" id="stlmDcAmtDiv" style="display: none;">
                                            <span class="tit">결제할인</span>
                                            <span class="txt"><strong>0</strong>원</span>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="total">
                                            <span class="tit">최종 결제금액</span>
                                            <span class="txt" id="lastStlmAmtDd"><strong>99,000</strong>원</span>
                                        </div>

                                    </li>
                                </ul>

                                <div class="btngroup">
                                    <button type="button"  class="btn btn-default medium"><span>결제</span></button>
                                </div>
                            </div>
                        </div></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //.container -->
    </div>
</main>
<%--주문 상세 내역--%>
<script type="text/javascript">
    $(".medium").click(function (){
        console.log("실행중");

        var orderVO={
            seq:$("#order_seq").val(),
            user_seq: 19,
            point:$("#order_point").val(),
            status:$("#order_status").val(),
            userName:$("#order_user_name").val(),
            userNumber:$("#order_user_number").val(),
            delivery:$("#order_delivery").val(),
            invoice:$("#order_invoice").val(),
        };
        var data=JSON.stringify(orderVO);
        console.log(orderVO);
        $.ajax({
            url:"/order/orderComplete",
            data:data,
            type:"post",
            contentType: 'application/json',
            dataType:"json",
            async: false,
            success: function(data){
                location.href='/order/orderComplete';
                alert("success"+data);
            },
            error:function(){
                alert("error");
            }
        })
    })
</script>
    </body>
</html>
