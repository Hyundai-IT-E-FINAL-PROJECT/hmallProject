<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-21
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authentication property="principal" var="pinfo" />
<html>
    <title>주문완료</title>
    <head>
        <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/od/order.css">
    </head>

    <main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
        <div class="container">
            <div class="cbody gird-full">
                <div class="contents">
                    <div class="order-wrap" id="printarea">
                        <div class="order-top">
                            <h2 class="title30">주문완료</h2>
                            <ol class="list-step">
                                <li>
                                    <strong>01</strong>
                                    <span>장바구니</span>
                                </li>
                                <li>
                                    <strong>02</strong>
                                    <span>주문서작성</span>
                                </li>
                                <li class="active">
                                    <strong>03</strong>
                                    <span>주문완료</span>
                                </li>
                            </ol>
                        </div>
                        <div class="order-info-box" style="display: flex;">

                            <div class="tit-wrap" style="width: 200px">${pinfo.userVO.user_name}고객님의 혜택 정보</div>&nbsp;&nbsp;
                            <div class="txt-wrap">
                                <p class="txt">회원등급:  ${pinfo.userVO.user_level}</p>
                            </div>&nbsp;&nbsp;
                            <div class="txt-wrap">
                                <p class="txt">적립금:  <fmt:formatNumber value="${pinfo.userVO.user_point}"
                                                                       pattern="#,###"/></p>
                            </div>&nbsp;&nbsp;
                            <div class="txt-wrap">
                                <p class="txt">쿠폰:  ${couponCount}</p>
                            </div>

                        </div>

                        <div class="order-complete-box">
                            <span class="bgcircle check-on-sm"><i class="icon check-on"></i></span>
                            <p class="tit">홈쇼핑을 이용해주셔서 감사합니다.</p>
                            <p class="txt">주문하신 내역은 마이페이지>나의 쇼핑내역> 주문/배송조회에서 확인하실 수 있습니다.</p>
                            <p class="tit">(주문번호 : <em>${historyOrder[0].ORDER_INVOICE}</em>)</p>
                        </div>

                        <h3 class="title22">주문상품 내역</h3>

                        <div class="board">
                        <div class="tblwrap">

                            <table>
                                <caption>결제 정보</caption>
                                <colgroup>
                                    <col style="width:auto">
                                    <col style="width:100px">
                                </colgroup>
                                <thead>
                                    <tr style="background-color:lightpink;">
                                        <th class="txt-center">상품정보</th>
                                        <th class="txt-center">수량</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${historyOrder}" var="history">
                                    <div class="order-list">
                                        <dl>
                                        <tr style="background-color:white;">
                                            <td>
                                                <dd>
                                                    <a href="https://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137807436&ordpreview=true">
                                                        <div style="display:flex;">
                                                            <div>
                                                                <span class="img">
                                                                    <img src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg?RS=100x100&AR=0" alt="SPC삼립" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/>
                                                                </span>
                                                            </div>
                                                            <div class="box" style="margin-left:20px; ">
                                                                <span class="tit"> ${history.PRODUCT_NAME}</span>
                                                                <div class="info">
                                                                    <ul>
                                                                        <li>
                                                                                ${history.OP_COUNT} 개
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                                <span class="price"> <strong><fmt:formatNumber value="${history.PRODUCT_COST}"
                                                                                                               pattern="#,###"/></strong>원 </span>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </dd>
                                            </td>
                                            <td class="txt-center">${history.OP_COUNT}</td>
                                        </tr>
                                        </dl>
                                    </div>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        </div>

                        <h3 class="title22">배송지 정보</h3>

                        <div class="order-info-box">
                            <ul class="list">
                                <li>
                                    <div class="tit-wrap" style="width: 200px">받으시는 분</div>
                                    <div class="txt-wrap">
                                        <p class="txt">${historyOrder[0].ORDER_RECEIVE_NAME}</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="tit-wrap" style="width: 200px">연락처</div>
                                    <div class="txt-wrap">
                                        <p class="txt">${historyOrder[0].ORDER_USER_NUMBER}</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="tit-wrap" style="width: 200px">주소</div>
                                    <div class="txt-wrap">
                                        <p class="txt">${historyOrder[0].ORDER_DELIVERY}</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="tit-wrap" style="width: 200px">남기실 말씀</div>
                                    <div class="txt-wrap">
                                        <p class="txt">${historyOrder[0].ORDER_MESSAGE}</p>
                                    </div>
                                </li>




                            </ul>
                        </div>

                        <h3 class="title22">결제 내역</h3>

                        <div class="order-info-box">
                            <ul class="list">
                                <li>
                                    <div class="tit-wrap" style="width: 200px">결제금액</div>
                                    <div class="txt-wrap">
                                        <p class="txt"><fmt:formatNumber value="${historyOrder[0].ORDER_TOTAL_COST}"
                                                                         pattern="#,###"/>원</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="tit-wrap" style="width: 200px">적립예정금액</div>
                                    <div class="txt-wrap">
                                        <p class="txt"><fmt:formatNumber value="${historyOrder[0].ORDER_POINT}"
                                                                         pattern="#,###"/>포인트</p>
                                    </div>
                                </li>
                                <li>
                                    <div class="tit-wrap" style="width: 200px">결제방법</div>
                                    <div class="txt-wrap">
                                        <p class="txt">${historyOrder[0].ORDER_METHOD}</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div style="justify-content: center; display: flex; margin-top: 30px;">
                            <button class="btn btn-linered small ui-btn-linered" style="margin:10px;" type="button" onclick="location.href='${contextPath}/mypage'" >
                                                  <span>
                                                      나의 쇼핑내역
                                                   </span>
                            </button>
                            <button class="btn btn-linered small ui-btn-linered" style="margin:10px;" type="button" onclick="window.print();" >
                                                  <span>
                                                      주문내역 인쇄
                                                   </span>
                            </button>
                            <button class="btn btn-linered small ui-btn-linered" style="margin:10px;" type="button"  onclick="location.href='${contextPath}/'">
                                                  <span>
                                                      쇼핑 계속하기
                                                   </span>
                            </button>
                        </div>

                    </div>
                    <!-- //shoppingPerInfo -->
                </div>
<%--                <div class="btngroup">--%>

            </div>
        </div>
        <!-- //container area -->

        <div class="ui-modal chanel-membership" id="pec042" tabindex="-1" role="dialog" aria-label="샤넬 멤버쉽 팝업">
            <div class="ui-modal-dialog" role="document">
                <div class="content">
                    <p class="ui-title"><img src="https://image.hmall.com/hmall/chanel/logo-chanel.png"></p>
                    <div class="content-body">
                        <img src="https://image.hmall.com/hmall/chanel/bg-chanel-popup.png">
                        <img class="mt30" src="https://image.hmall.com/hmall/chanel/txt-chanel-popup.png">
                        <p class="mt5">※ 샤넬 멤버십 관련 문의 : 샤넬 고객센터(080-332-2700)</p>
                        <p class="mt20">샤넬 멤버십 가입을 위해 필요한 정보를 아래와 같이 샤넬코리아에 제공합니다.</p>
                        <table>
                            <colgroup>
                                <col width="15">
                                <col width="35">
                                <col width="15">
                                <col width="35">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>제공 받는 자</th>
                                <th>항목</th>
                                <th>목적</th>
                                <th class="last-col">보유기간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="highlight">샤넬 코리아<br>유한회사</td>
                                <td>성명, 핸드폰번호, 생년월일, 성별, 주소,<br> 이메일 주소, 샤넬 제품 아이템명 및<br> 구매일시, 그 외 구매관련 정보</td>
                                <td>샤넬 멤버십<br> 가입 및 운영</td>
                                <td class="highlight">샤넬 멤버십 가입하는 <br>경우 멤버십 탈퇴시까지 <br>(가입하지 않는 경우에는 샤넬 멤버십 <br>가입 페이지에서 나가는 시점까지)</td>
                            </tr>
                            </tbody>
                        </table>
                        <p class="mt15">
                            위 개인정보를 제공하는데 거부할 권리가 있습니다.<br>
                            단, 동의 거부시 샤넬 멤버십 가입에 제한 받으실 수 있습니다.<br>
                            동의시 샤넬 사이트로 이동합니다.
                        </p>
                        <div class="btn_close mt20"><a href="javascript:$('#pec042').modal().hide();">닫기</a></div><a class="confirm-btn mt20" href="javascript:chanelMembershipPopup();">개인정보 제공 동의</a>
                    </div>
                    <!-- //.content-body -->

                    <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                </div>
                <!-- //.content -->
            </div>
            <!-- //.ui-modal-dialog -->
        </div>
        <!-- //.ui-modal -->

        <!-- 주문완료 팝업 -->

        <div class="ui-modal" id="smallFloatingBanner" tabindex="-1" role="dialog" aria-label="배너 팝업" style="z-index: 1031; display: none;">
            <div class="ui-modal-dialog small-floating-pop" role="document">
                <div class="content">
                    <!-- //.content-head -->
                    <div class="content-body">
                        <div class="bannerslider">
                            <div class="sliderwrap slick-initialized slick-slider slick-single" data-modules-slick="arrows:true;dots:false;autoplay:false;paging:true;infinite:true;slidesToShow:1;"><div class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 0px; transform: translate(0px, 0px);"><div class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 0px;"><div><div class="items" style="width: 100%; display: inline-block; vertical-align: top;">
                                <!-- background 관리자 설정 -->
                                <div class="banner-wrap" style="background:#2089ff;">
                                    <a href="#" onclick="urlPopup('https://www.hmall.com/mevent/eva/evntView.do?prmoNo=00058816'); GA_Event('주문완료','주문완료팝업','H.Point 신규회원 혜택');" ga-category="주문완료" ga-action="주문완료팝업" ga-label="H.Point 신규회원 혜택" tabindex="0">
                                        <div class="txt-area">
                                            <span class="main-txt">H.Point 신규회원 혜택</span>
                                            <span class="sub-txt">봄 마지막 3천P 드려봄♡</span>
                                        </div>
                                        <div class="img"><img src="https://image.hmall.com/HM/HM025/20220513/090104/0512_jm_1.jpg" onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')"></div>
                                    </a>
                                </div>
                            </div></div></div></div></div></div>
                        </div>
                    </div>
                    <!-- //.content-body -->

                    <div class="btn-area">
                        <label class="chklabel">
                            <input type="checkbox" name="" id="closeExpirePop" onclick="closeExpirePop(); GA_Event('주문완료','주문완료팝업_닫기','오늘 그만 보기');" ga-category="주문완료" ga-action="주문완료팝업_닫기" ga-label="오늘 그만 보기"><i class="icon"></i><span>오늘 그만 보기</span>
                        </label>
                        <button id="closeOrdComPup" class="btn btn-close" onclick="closePopup(); GA_Event('주문완료','주문완료팝업_닫기','닫기');" ga-category="주문완료" ga-action="주문완료팝업_닫기" ga-label="닫기" data-dismiss="modal"><span>닫기</span></button>
                    </div>
                </div>
                <!-- //.content -->
            </div>
            <!-- //.ui-modal-dialog -->
        </div>


        <form id="chanelMembershipForm" method="post" action="">
            <input type="hidden" name="vipNo" value="">
            <input type="hidden" name="vipName" value="">
            <input type="hidden" name="birthYY" value="">
            <input type="hidden" name="birthMM" value="">
            <input type="hidden" name="birthDD" value="">
            <input type="hidden" name="vipGender" value="">
            <input type="hidden" name="vipTel" value="">
            <input type="hidden" name="vipEmail" value="">
            <input type="hidden" name="zipcode" value="">
            <input type="hidden" name="vipAddr1" value="">
            <input type="hidden" name="vipAddr2" value="">
        </form>


        <div class="ui-modal" id="modalPaperGift" tabindex="-1" role="dialog" aria-label="지류상품권결제안내">
            <div class="ui-modal-dialog papergift" role="document">
                <div class="content">
                    <p class="ui-title">지류상품권 결제안내</p>
                    <!-- //.content-head -->
                    <div class="content-body">
                        <!--bg-gray-top-->
                        <div class="bg-gray-top">
                            <strong>사용가능한 상품권</strong>
                            <p class="txt">현대백화점, 삼성, 현대오일뱅크, 국민관광, GS칼텍스</p>
                        </div>
                        <!--//bg-gray-top-->
                        <!--guide-box-->
                        <div class="guide-box">
                            <ol>
                                <li>
                                    <p class="ctypo15 bold">1. 등기우편 발송 방식</p>
                                    <div class="content">
                                        <p>현대백화점, 삼성, 현대오일뱅크, 국민관광, GS칼텍스</p>
                                        <ol>
                                            <li>해당 상품권을 선택하여 주문 완료</li>
                                            <li>우편물에 상품권을 동봉하고, 주문번호, 주문고객명, 환불계좌번호/예금주명이기재된 메모와 함께 <em>유가증권 등기</em>로 발송
                                                <p class="sendmail-guide">
                                                    <span>05328 서울 강동구 올림픽로 70길 34</span>
                                                    <span>현대홈쇼핑 9층 재경팀 상품권 담당자</span>
                                                </p>
                                            </li>
                                            <li>상품권이 정상 접수된 후 주문 처리 완료</li>
                                        </ol>
                                    </div>
                                </li>
                                <li>
                                    <p class="ctypo15 bold">2. 현대백화점 방문 후 전환(현대백화점 상품권만)</p>
                                    <div class="content">
                                        <ol>
                                            <li>현대백화점 상품권 데스크 방문(상품권 , 신분증 지참)</li>
                                            <li>전환신청 및 등록(본인만 가능)</li>
                                            <li>신청/등록 후 익일 이후 전환금 부여</li>
                                        </ol>
                                    </div>
                                </li>
                            </ol>
                        </div>
                        <!--//guide-box-->
                        <!--gray-box-->
                        <div class="gray-box">
                            <p class="ctypo15 bold">등기우편 발송방식 유의사항</p>
                            <ul class="dotlist">
                                <li>유가+증권등기 발송시 주문고객과 동일한 이름으로 발송하셔야 합니다.</li>
                                <li>서로 다른 상품권과 함께 사용하실 수 없습니다.</li>
                                <li>현대백화점 상품권은 유가증권등기 수수료만큼 적립금으로 돌려드립니다. <br> (기타 상품권은 유가증권등기 수수료를 고객이 부담하셔야 합니다.)</li>
                                <li>상품권 금액의 60% 이상 결제하셔야 결제 잔액에 대해 환불이 가능합니다.</li>
                                <li>유가증권등기로 보내지 않을 경우 발생하는 문제에 대해서는 책임 지지 않습니다.</li>
                                <li>기프트 선불카드(신용카드)는 지류상품권이 아닙니다. 상기 주소로 보내셔도 결제가 불가능하니 유의하시기 바랍니다.</li>
                            </ul>
                            <p class="ctypo15 bold">백화점 방문 후 전환 방식 유의사항</p>
                            <ul class="dotlist">
                                <li>상품권으로 결제했을 경우, 반드시 1600-0000에서 예치금으로 재결제하시기 바랍니다.</li>
                                <li>현금 환불은 전환금의 60% 이상 사용해야 하며, 잔액이 5만원 미만인 경우에만 현금으로 돌려드립니다.</li>
                                <li>전환 한도는 ID 1개당 월 1천만원으로 제한됩니다.</li>
                            </ul>
                        </div>
                        <!--//gray-box-->
                        <div class="btngroup">
                            <button class="btn btn-default medium" onclick="$('#modalPaperGift').modal().hide();"><span>확인</span></button>
                        </div>
                    </div>
                    <!-- //.content-body -->

                    <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                </div>
                <!-- //.content -->
            </div>
            <!-- //.ui-modal-dialog -->
        </div>
        <!-- //.ui-modal -->

        <!-- Google 리타겟팅 스크립트
 <script type="text/javascript">
 var google_tag_params = {
 ecomm_prodid: [],
 ecomm_quantity: [],
 ecomm_pagetype: "order",
 ecomm_totalvalue: []
 };
 </script>


<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1066206974;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
var google_conversion_value = 398000;
var google_conversion_currency = "KRW";
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1066206974/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
-->

        <!--  크리태오 구매전환 트래커  ---->
        <script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
        <script type="text/javascript">
            window.criteo_q = window.criteo_q || [];
            window.criteo_q.push(
                { event: "setAccount", account: 15047 },
                { event: "setSiteType", type: "d" },
                { event: "trackTransaction" , id: "20220523316722",
                    deduplication: 0,
                    item: [

                    ]});
        </script>

        <!--
<form method='post' name='buyForm' id ='buyForm' target='buyiFrm' accept-charset='utf-8'>
	<input type='hidden' name='shopid' value='hmall01'>
	<input type='hidden' name='goodscode' value=''>
	<input type='hidden' name='mcatename' value=''>
	<input type='hidden' name='prodcnt' value=''>
	<input type='hidden' name='price' value=''>
</form>
<iframe name='buyiFrm' id='buyiFrm' width='0' height='0' style='display:none'></iframe>
<script type='text/javascript'>
var frm = document.getElementById('buyForm');

frm.action = document.location.protocol +'//adcheck.about.co.kr/mad/prd/buy';
frm.submit();
</script>
 -->

        <!-- 빅테이터 데이터 수집을 위한 스크립트 호출(Start)-->
        <script type="text/javascript" defer="defer">
            var hbdaRc_trk_data_list = [];
            var trk_index = 0;

            var hbdaRc_trk_data = {};
            hbdaRc_trk_data.itemId       = "2123487549";
            hbdaRc_trk_data.itemName = "삼성 블루스카이 공기청정기 3000 [AX40A5311WMD] 1+1 패키지";
            hbdaRc_trk_data.price = "398000.0";

            hbdaRc_trk_data.qty = "1";  //상품 상세의 경우 1
            hbdaRc_trk_data.thumb = "https://image.hmall.com/static/5/7/48/23/2123487549_0.jpg";

            hbdaRc_trk_data.cateA1Cd = "12"; // 없으면 공백
            hbdaRc_trk_data.cateA2Cd = "1201"; // 없으면 공백
            hbdaRc_trk_data.cateA3Cd = "120102"; // 없으면 공백
            hbdaRc_trk_data.cateA4Cd = "12010204"; // 없으면 공백

            var bdItemYn = "N";
            var hdptYn   = "N";
            var dtvItemYn   = "Y";
            var frstRegMdaGbcd   = "01";

            if( bdItemYn == 'Y') {
                hbdaRc_trk_data.itemType  = "C";
            } else if ( frstRegMdaGbcd == '01') {
                hbdaRc_trk_data.itemType  = "E";
            } else if ( hdptYn == 'Y') {
                hbdaRc_trk_data.itemType  = "B";
            }else if ( dtvItemYn == 'Y') {
                hbdaRc_trk_data.itemType  = "D";
            }else{
                hbdaRc_trk_data.itemType  = "A";
            }

            var tempCate1 = "";
            var tempCate2 = "";
            var tempCate3 = "";
            var tempCate4 = "";



            tempCate1 = "TV현대홈쇼핑";




            hbdaRc_trk_data.cateB1Cd = tempCate1; // 없으면 공백
            hbdaRc_trk_data.cateB2Cd = tempCate2; // 없으면 공백
            hbdaRc_trk_data.cateB3Cd = tempCate3; // 없으면 공백
            hbdaRc_trk_data.cateB4Cd = tempCate4; // 없으면 공백

            hbdaRc_trk_data.brandCd = "A00439"; // 브랜드코드

            hbdaRc_trk_data.channel       = "P";
            hbdaRc_trk_data.referrer = document.referrer;

            hbdaRc_trk_data_list [trk_index] = hbdaRc_trk_data;
            trk_index++;

            _hbdaRc_trk();

            function _hbdaRc_trk() {
                try {
                    if(typeof tagging == 'undefined'){
                        setTimeout("_hbdaRc_trk()", 1000);
                    }else{
                        for(var k = 0; k < hbdaRc_trk_data_list.length; k++ ){
                            var trk_data = hbdaRc_trk_data_list[k];
                            tagging.collector("RC_BUY",trk_data);
                        }
                    }
                } catch(e){}
            }
        </script>
        <!-- 아이앤코프(koost) 데이터 수집을 위한 스크립트 호출(End)//-->
        <!-- footer include-->




        <!-- footer -->


        <script type="text/javascript" defer="defer">
            (function() {
                function injectScript() {
                    var _TRK_InSc = document.createElement('script');
                    _TRK_InSc.type = 'text/javascript';
                    _TRK_InSc.async = true;
                    _TRK_InSc.src = '//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js';
                    document.body.appendChild(_TRK_InSc);


                    var _TRK_InTagSc = document.createElement('script');
                    _TRK_InTagSc.type = 'text/javascript';
                    _TRK_InTagSc.async = true;
                    _TRK_InTagSc.src = '//image.hmall.com/p/js/co/tagging.collector-1.3.min.js';
                    document.body.appendChild(_TRK_InTagSc);
                }
                if (window.attachEvent) {
                    window.attachEvent('onload', injectScript);
                } else {
                    window.addEventListener('load', injectScript, false);
                }
            })();
        </script>
        <script>
            function bizSpringPopTag(url, pathVal){
                try {
                    _trk_flashEnvView('_TRK_CP=' + pathVal);
                } catch(e){}

                url = url.replace(/ /g,'');
                if(url != "" && url != undefined){
                    window.open(url);
                }
            }

        </script>
        <!-- 2019.04.29 Facebook Pixel Code 삽입 -->
        <script>
            !function(f,b,e,v,n,t,s)
            {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
                n.callMethod.apply(n,arguments):n.queue.push(arguments)};
                if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
                n.queue=[];t=b.createElement(e);t.async=!0;
                t.src=v;s=b.getElementsByTagName(e)[0];
                s.parentNode.insertBefore(t,s)}(window, document,'script',
                'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '307742333494098');
            fbq('track', 'PageView');
        </script>
        <noscript><img height="1" width="1" style="display:none"
                       src="https://www.facebook.com/tr?id=307742333494098&ev=PageView&noscript=1"
        /></noscript>
        <!-- End Facebook Pixel Code -->

        <!-- Naver Premium Log -->
        <script type="text/javascript">
            var _NGUL = "wcs.naver.net/wcslog.js";
            var _NPR = location.protocol=="https:"?"https://"+_NGUL:"http://"+_NGUL;
            document.writeln("<scr"+"ipt type='text/ja"+"vascript' src='"+ _NPR +"'></scr"+"ipt>");
        </script><script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>


        <script type="text/javascript">
            if(!wcs_add) var wcs_add = {};
            wcs_add["wa"] = "s_5117770cb5ce";    // 네이버프리미엄로그 키값 변경(이호정선임) -> PC/MO 도메인 통일로 같은 값 사용(기존 : s_33f688a7b8a5)

            if (!_nasa) var _nasa={};

            wcs.inflow();
            wcs_do(_nasa);
        </script>
        <!-- End Naver Premium Log -->

        <!-- Google analytics -->
        <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052312"></script>
        <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052312"></script>

        <script type="text/javascript">


            var oneClickFlag = 0;
            function setDimension(){

                if(oneClickFlag != 0){
                    return false;
                }

                oneClickFlag = 1;

                if(location.pathname.indexOf("/p/cob/memberLogin.do") > -1){
                    return;
                }
                var GA_info = {};


                GA_info = setDimenData(GA_info);


                GA_Init(GA_info);


                if(location.pathname.replace("//", "/") == '/m/pda/smItemDetailR.do' || location.pathname.replace("//", "/") == '/p/pda/itemPtc.do' && pdaItemPtcCnt == 0){
                    pdaItemPtcCnt = 1;
                    var	product_array = [];
                    product_array.push(
                        {
                            'id':'',
                            'name':'',
                            'brand': '',
                            'category' : '',
                            'dimension51': 'default',
                            'dimension52':'',
                            'dimension53':'',
                            'dimension54':'',
                            'dimension55':'',
                            'dimension56':'',
                            'dimension57':'',
                            'dimension58':'',
                            'dimension59':'',
                            'dimension60':'',

                            'dimension62':'',
                            'dimension63':'',
                            'dimension64':''
                        }
                    );

                    var ecommerce_hit = new Object();
                    ecommerce_hit[GAHitKey.NonInteraction] = '1';
                    var action_obj = new Object();


                    GADataSend_Ecommerce(GAEcommerceStepKey.Detail, action_obj, product_array, ecommerce_hit);

                }else if(location.pathname == '/p/oda/orderComplete.do' && ordCompleteCnt == 0){
                    ordCompleteCnt = 1;
                    var	product_array = [];


















                    product_array.push(
                        {
                            'id':'2123487549',
                            'name':'삼성 블루스카이 공기청정기 3000 [AX40A5311WMD] 1+1 패키지',
                            'brand': 'A00439(삼성(SAMSUNG))',
                            'category' : '전기전자/계절가전/공기청정기/복합식(저가)',
                            'variant' : '없음',
                            'price' :
                                '398000'

                            ,
                            'quantity' : '1',
                            'coupon' : 'P202201144523|일시불할인||||||',
                            'dimension51': 'default',
                            'dimension52':'현대홈쇼핑',
                            'dimension53':'12(전기/전자)',
                            'dimension54':'1201(계절가전)',
                            'dimension55':'120102(공기청정기)',
                            'dimension56':'12010204(복합식(저가))',
                            'dimension57':'5037가전2(유민우)',
                            'dimension58':'데이터생활MD팀',
                            'dimension59':'019329(삼성전자(주))',

                            'dimension60':'default',
                            'dimension61':'인터넷>eData>방송상품 웹전시_D',
                            'dimension62':'유형상품',
                            'dimension63':'일반상품',
                            'dimension64':'2731249(공기청정기)'
                            ,'dimension65':'P202201144523_삼성 공청기 3000 자동1만'
                            ,'dimension66':'일시불할인'






                        }
                    );


                    var ecommerce_hit = new Object();
                    ecommerce_hit[GAHitKey.NonInteraction] = '1';
                    ecommerce_hit[GAHitKey.currencyCode] = 'KRW';




                    ecommerce_hit[GACustomKey.Metric1] = 0;

                    ecommerce_hit[GACustomKey.Metric2] = 0;

                    ecommerce_hit['dimension74'] = '일반구매';
                    ecommerce_hit['dimension75'] = '02 현금';



                    var action_obj = new Object();
                    action_obj[GAActionFieldKey.TransactionID]='20220523316722';
                    action_obj[GAActionFieldKey.TransactionRevenue]='398000';
                    action_obj[GAActionFieldKey.TransactionShipping]='0';

                    action_obj[GAActionFieldKey.TransactionCouponCode]='|';







                    GADataSend_Ecommerce(GAEcommerceStepKey.Purchase, action_obj, product_array, ecommerce_hit);
                    oneClickFlag = 0;
                } else if(location.pathname == '/p/cua/registMemberComplete.do') { //회원가입완료 페이지 로드

                    try {
                        if (!gaLoad.APP) {
                            var GAInfo = {};
                            GAInfo.title = "회원가입/로그인>회원가입완료";
                            GAInfo[GACustomKey.Dimension31] = "회원가입/로그인";
                            GAInfo[GACustomKey.Dimension32] = "회원가입/로그인>회원가입완료";
                            GAInfo[GACustomKey.Dimension33] = "회원가입/로그인>회원가입완료";
                            GAInfo[GACustomKey.Dimension34] = "회원가입/로그인>회원가입완료";


                            GAInfo.hitType = 'event';
                            GAInfo.eventCategory = '회원가입';
                            GAInfo.eventAction = 'Step3. 가입완료';
                            GAInfo.eventLabel = 'Hmall 간편회원가입';
                            ga('gp.send', GAInfo);
                        }else{
                            var emptyObject = JSON.parse(JSON.stringify(CustomObject));
                            emptyObject.type = 'E';
                            if(getCookieGAB('ReferCode') !== null){ emptyObject.dimension[GACustomKey.Dimension20] = getCookieGAB('ReferCode'); }
                            if(getCookieGAB('TcCode') !== null){
                                var tmpTcCode = getCookieGAB('TcCode');
                                if(tmpTcCode.split('|').length == 1){
                                    emptyObject.dimension[GACustomKey.Dimension21] = getCookieGAB('TcCode');
                                }else if(tmpTcCode.split('|').length == 2){
                                    emptyObject.dimension[GACustomKey.Dimension21] = tmpTcCode.split('|')[0];
                                }
                            }

                            emptyObject['category'] = '회원가입';
                            emptyObject['action'] = 'Step3. 가입완료';
                            emptyObject['label'] = 'Hmall 간편회원가입';


                            GAInfo.title = "회원가입/로그인>회원가입완료";
                            GAInfo[GACustomKey.Dimension31] = "회원가입/로그인";
                            GAInfo[GACustomKey.Dimension32] = "회원가입/로그인>회원가입완료";
                            GAInfo[GACustomKey.Dimension33] = "회원가입/로그인>회원가입완료";
                            GAInfo[GACustomKey.Dimension34] = "회원가입/로그인>회원가입완료";


                            if (browserInfo.indexOf(AndroidWebview) > -1 && window.AndroidJS && emptyObject['title'] !== undefined && emptyObject['title'].trim().length > 0)
                                window.AndroidJS.GA_DATA(JSON.stringify(emptyObject));
                            else if(typeof pageTemplateNm !== 'undefined' && browserInfo.indexOf(AndroidWebview) > -1 && window.AndroidJS){
                                window.AndroidJS.GA_DATA(JSON.stringify(emptyObject));
                            }
                            else if (browserInfo.indexOf(iOS_Webview_WK) > -1 && window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.gascriptCallbackHandler)
                                webkit.messageHandlers.gascriptCallbackHandler.postMessage(JSON.stringify(emptyObject));
                            else if (browserInfo.indexOf(iOS_WebView_UI) > -1) doRequest(Scheme + encodeURIComponent(JSON.stringify(emptyObject)));
                        }
                    } catch(e){

                    }
                    oneClickFlag = 0;
                }
            }


            function setDimenData(GA_info){
                var _ga = getCookieGA('_ga');
                if(_ga != null){
                    GA_info[GACustomKey.Dimension1] = _ga;
                }

                var uid = "";
                if(getCookieGA('ENCEHCustNO') != null && getCookieGA('ENCEHCustNO') != ""){
                    uid = getCookieGA('ENCEHCustNO');
                }

                if(uid == "" || uid.length != 32){

                }else{
                    GA_info[GACustomKey.Dimension2] = uid;
                    GA_info[GAHitKey.UserId] = uid;


                }

                GA_info[GACustomKey.Dimension3] = "20220513";
                GA_info[GACustomKey.Dimension4] = "일반";

                GA_info[GACustomKey.Dimension6] = "N";
                GA_info[GACustomKey.Dimension7] = "N";
                GA_info[GACustomKey.Dimension8] = "20220521";
                GA_info[GACustomKey.Dimension9] = "20220523";

                var _gaid = getCookieGA('GAID');
                if(_gaid != null){GA_info[GACustomKey.Dimension11] = _gaid;}

                GA_info[GACustomKey.Dimension12] = "Y";
                GA_info[GACustomKey.Dimension24] = "6";


                GA_info[GACustomKey.Dimension13] = "U";
                GA_info[GACustomKey.Dimension14] = "U";
                GA_info[GACustomKey.Dimension15] = "실버";

                GA_info[GACustomKey.Dimension22] = "기타";

                GA_info[GACustomKey.Dimension25] = "20220521";

                GA_info[GACustomKey.Dimension27] = "20220521";
                GA_info[GACustomKey.Dimension28] = "20220521";

                GA_info[GACustomKey.Dimension30] = "N";

                GA_info[GACustomKey.Dimension37] = "1";
                GA_info[GACustomKey.Dimension38] = "N";
                GA_info[GACustomKey.Dimension39] = "방송";
                GA_info[GACustomKey.Dimension40] = "인터넷";
                GA_info[GACustomKey.Dimension41] = "PCWEB";
                GA_info[GACustomKey.Dimension47] = "N";


                if(location.pathname == '/p/pde/search.do'){





                    GA_info[GACustomKey.Dimension19] = "N";


                }

                GA_info[GACustomKey.Dimension16] = "PCWEB";

                GA_info[GACustomKey.Dimension35] = location.href.replace("http://", "").replace("https://", "");

                return GA_info;
            }



            function setGaDataSend_Event(evntType,product_array){
                /* var product_array = [];
	if(product_array_param != null && product_array_param != undefined){
		product_array = product_array_param;
	} */
                var ecommerce_hit = new Object();
                var action_obj = new Object();


                if(location.pathname == '/m/pda/smItemDetailR.do' || location.pathname == '/p/pda/itemPtc.do'){

                    if(evntType == GAEcommerceStepKey.Checkout){
                        action_obj[GAActionFieldKey.CheckoutStep] = '1';
                        GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                    }else{
                        ecommerce_hit[GAHitKey.NonInteraction] = '1';
                        GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                    }

                }else if(location.pathname == '/p/oda/order.do'){

                    try {
                        var itemGbcd = ""; // 무형상품체크, 유/무형 상품 같이 구매 불가하므로..

                    } catch (e) {

                    }

                    if(evntType == GAEcommerceStepKey.Checkout){
                        var ecommerce_hit = new Object();
                        var action_obj = new Object();
                        action_obj[GAActionFieldKey.CheckoutStep] = '2';

                        var selOrderType = $("input[name='payType']:checked").val();

                        if(selOrderType == '10'  ){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '01 카드';
                            ecommerce_hit['dimension75'] = '01 카드';
                        }else if(selOrderType == '20'){
                            action_obj[GAActionFieldKey.CheckoutOptions] = '02 현금';
                            ecommerce_hit['dimension75'] = '02 현금';
                        }else if(selOrderType == '40'){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '12 휴대폰결제';
                            ecommerce_hit['dimension75'] = '12 휴대폰결제';
                        }else if(selOrderType == '91'){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '15 페이코';
                            ecommerce_hit['dimension75'] = '15 페이코';
                        }else if(selOrderType == '30'){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '20 현금(실시간)';
                            ecommerce_hit['dimension75'] = '20 현금(실시간)';
                        }else if(selOrderType == '95'){
                            action_obj[GAActionFieldKey.CheckoutOptions] = '21 네이버페이';
                            ecommerce_hit['dimension75'] = '21 네이버페이';
                        }else if(selOrderType == '96'){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '22 스마일페이';
                            ecommerce_hit['dimension75'] = '22 스마일페이';
                        }else if(selOrderType == '97'){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '23 카카오페이';
                            ecommerce_hit['dimension75'] = '23 카카오페이';
                        }else if(selOrderType == '81'){
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '25 토스';
                            ecommerce_hit['dimension75'] = '25 토스';
                        }else if(selOrderType == '99') {
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '24 현금간편결제';
                            ecommerce_hit['dimension75'] = '24 현금간편결제';
                        }else if(selOrderType == '50') {
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '98 카드+현금';
                            ecommerce_hit['dimension75'] = '98 카드+현금';
                        }else if(selOrderType == '93') {
                            action_obj[GAActionFieldKey.CheckoutOptions]  = '99 삼성페이';
                            ecommerce_hit['dimension75'] = '99 삼성페이';
                        }else {
                            action_obj[GAActionFieldKey.CheckoutOptions]  = 'default';
                            ecommerce_hit['dimension75'] = 'default';
                        }

                        // 무형상품이면 고정 - 이호정선임요청 2021.01.28 김기호
                        if (itemGbcd == "04") {
                            console.log("무형상품이므로 Dimension75:무형상품");
                            action_obj[GAActionFieldKey.CheckoutOptions] = '무형상품';
                            ecommerce_hit[GACustomKey.Dimension75] = '무형상품';
                        } else {

                            ecommerce_hit[GACustomKey.Dimension74] = '일반구매';

                        }
                        GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                    }
                }else{
                    GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                }

            }



            function sendSlitmClick(slitmNm, slitmCd, tabNm){

                if(slitmNm == "" || slitmCd == "" || tabNm == "")
                    return;

                var product_array = [];
                product_array.push({'id': slitmCd, 'name': slitmNm});

                var action_obj = new Object();
                action_obj[GAActionFieldKey.ProductActionList] = tabNm;

                var ecommerce_hit = new Object();
                GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);
            }



            function getParameterByName(url, name) {
                if(url == "" || name == "" || url == undefined || name == undefined){
                    return;
                }

                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(url);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }

            function setGaPromotion(title, name, position, creative, id){
                var action_obj = new Object();
                var ecommerce_hit = new Object();
                var tabNm = title;
                if (tabNm.length > 0) {
                    tabNm = tabNm.substring(tabNm.indexOf(">")+1, tabNm.length);
                }

                ecommerce_hit[GAHitKey.Title] = title;

                action_obj["promo1"] = {};
                action_obj["promo1"][GAActionFieldKey.PromotionName] = name;
                action_obj["promo1"][GAActionFieldKey.PromotionPosition] = position;
                action_obj["promo1"][GAActionFieldKey.PromotionCreative] = creative;
                action_obj["promo1"][GAActionFieldKey.PromotionID] = id;

                if(name.substring(0, name.indexOf("_")) == "메인"){
                    console.log("setGaPromotion()................4");
                    ecommerce_hit[GACustomKey.Dimension31] = '메인';
                    ecommerce_hit[GACustomKey.Dimension32] = '메인>'+ tabNm;
                    ecommerce_hit[GACustomKey.Dimension33] = '메인>'+ tabNm;
                    ecommerce_hit[GACustomKey.Dimension34] = '메인>'+ tabNm;
                }

                GADataSend_Ecommerce(GAEcommerceStepKey.PromotionClick, action_obj, null, ecommerce_hit);
            }

            function getCookieGA(name) {
                var cname = name + "=";
                var dc = document.cookie;
                if (dc.length > 0) {
                    begin = dc.indexOf(cname);
                    if (begin != -1) {
                        begin += cname.length;
                        end = dc.indexOf(";", begin);
                        if (end == -1) end = dc.length;
                        if ( "EHCustName" == name || "LAST_SECT" == name) {
                            return decodeURIComponent(dc.substring(begin, end));
                        }
                        else {
                            return unescape(dc.substring(begin, end)).replace('GA1.2.','');
                        }
                    }
                }
                return null;
            }

            function sendSlitmClickGo(slitmNm, slitmCd, tabNm,url){

                if(slitmNm == "" || slitmCd == "" || tabNm == "" || url =="")
                    return;

                var product_array = [];
                product_array.push({'id': slitmCd, 'name': slitmNm});

                var action_obj = new Object();
                action_obj[GAActionFieldKey.ProductActionList] = tabNm;

                var ecommerce_hit = new Object();
                GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);

                document.location.href = url;
            }
            function sendSlitmClickNewWin(slitmNm, slitmCd, tabNm, url){

                if(slitmNm == "" || slitmCd == "" || tabNm == "" || url =="")
                    return;

                var product_array = [];
                product_array.push({'id': slitmCd, 'name': slitmNm});

                var action_obj = new Object();
                action_obj[GAActionFieldKey.ProductActionList] = tabNm;

                var ecommerce_hit = new Object();
                GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);

                try {
                    _trk_flashEnvView('_TRK_PI=LYRNWN');
                } catch(e) {}

                try {
                    _trk_clickTrace("EVT", "상품리스트_새창");
                } catch (e) {}
                window.open(url, '_blank');
            }

            function bizSpringTagForHome(url, tag, pathVal){

                location.href = url
            }

            function gaTagging(obj_GA, msg1, msg2, msg3){
                console.log("gaTagging()................");
                var title =     $(obj_GA).attr("ga-custom-title") == undefined ? "" : $(obj_GA).attr("ga-custom-title");
                var name =      $(obj_GA).attr("ga-custom-name") == undefined ? "" : $(obj_GA).attr("ga-custom-name");
                var position =  $(obj_GA).attr("ga-custom-position") == undefined ? "" : $(obj_GA).attr("ga-custom-position");
                var creative =  $(obj_GA).attr("ga-custom-creative") == undefined ? "" : $(obj_GA).attr("ga-custom-creative");
                var id =        $(obj_GA).attr("ga-custom-id") == undefined ? "" : $(obj_GA).attr("ga-custom-id");
                var etc =       $(obj_GA).attr("ga-custom-etc") == undefined ? "" : $(obj_GA).attr("ga-custom-etc");
                var etc2 =      $(obj_GA).attr("ga-custom-etc2") == undefined ? "" : $(obj_GA).attr("ga-custom-etc2");

                setGaPromotion(title, name, position, creative, id);
                //마케팅플랫폼 전용 >>> 마케팅 플랫폼은 Tab명이 다르기 때문에 if문 처리
                /*
    if(gaForTabNm != "" && gaForTabNm != null && gaForTabNm != undefined && etc2 == "Y"){
        title = "메인>"+gaForTabNm;
        name = "메인_"+gaForTabNm+"탭";
    }

    if(etc2 == "N"){//마케팅플랫폼 전용 >>> 마케팅플랫폼 jsp가 기획전에도 쓰이기 때문에 if문 처리.(mainTabYn)
        //추후 이곳에 마케팅플랫폼 기획전일 경우 분기분 넣는다...

    }else{
        console.log("setGaPromotion()................1");
        setGaPromotion(title, name, position, creative, id);
    }
*/

                if (etc == "home"){
                    bizSpringTagForHome(msg1, msg2, msg3);
                } else {
                    if (msg1 != null && msg1 != "" && msg1.length > 0) {
                        location.href = msg1;
                    }
                }
            }



        </script> <!-- GA Custum lib -->
        <script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-1066206974"></script>
        <script>
            try{
                window.dataLayer = window.dataLayer || [];
                function gtag(){dataLayer.push(arguments);}
                gtag('js', new Date());
                gtag('config', 'AW-1066206974');
                gtag('config', 'AW-937000404');
            }catch(e){}

            //Google Analytics
            var init_Obj = new Object();

            $(window).on("load",function() {
                //GA 맞춤측정 데이터 전송 및 클릭이벤트 초기화
                console.log("setDimension and useWindload 호출");
                setDimension();
                useWinload();
            });
        </script>
        <!-- Google analytics end -->



        <script type="text/javascript" src="//image.hmall.com/p/js/co/netfunnel.js"></script>
        <script type="text/javascript">
            try{
                NetFunnel_AliveNotice({action_id:"hmall_1"});
            } catch(e) {}
            var cValue = document.cookie.match('(^|;) ?' + 'ck_nfn_p' + '=([^;]*)(;|$)');
            var ck_nfn = cValue? cValue[2] : null;
            if(ck_nfn != "" && ck_nfn != null){
                var d = new Date();
                d.setTime(d.getTime() + (3*60*1000));
                var expires = "expires=" + d.toUTCString();
                var cname = "ck_nfn_p";
                var cvalue = "check";
                document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/;domain=.hmall.com";
            }

        </script>
        <!--//footer -->
        <!-- Alert 레이어 -->
        <div class="ui-modal alert" id="pec001-01" tabindex="-1" role="dialog" aria-label="H.Point Pay 통합회원 안내">
            <div class="ui-modal-dialog" role="document">
                <div class="content">
                    <p class="ctypo15">H.Point Pay는 H.Point 통합회원만<br> 이용하실 수 있습니다.</p>
                    <p class="ctypo17 bold mt10px">H.Point 통합회원으로<br>가입하시겠습니까?</p>
                </div>
                <!-- //.content -->
                <!-- alert은 버튼 위치 변경 -->
                <div class="btngroup">
                    <button class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
                    <button class="btn btn-default" onclick="fn_upntPopupOpen();"><span>확인</span></button>
                    <!-- 데이터 전송 후 닫힘 $(element).modal().hide() -->
                </div>
                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
            </div>
            <!-- //.ui-modal-dialog -->
        </div>

        <!-- skyscraper include-->


        <!-- 스카이스크래퍼 -->








        <script type="text/javascript">

            var skySclbrodEndTime = "";
            var skyScldtvEndTime = "";

            function setOnAirSkySc(){
                try {
                    $.ajax({
                        type: "get"
                        ,url: "https://wwwca.hmall.com/p/coe/onAirList.do?time=052312"
                        ,dataType: "html"
                        ,async: true
                        ,success : function(data) {
                            $('#skyScOnAirArea').append(data);

                            if ($('#onAirHtime').length > 0) {
                                skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
                                onAirTimerSkySc();
                            }

                            if ($('#onAirHdtime').length > 0) {
                                skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

                                // TV+샵은 마직막이 '00' 으로 끝남
                                if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
                                    skyScldtvEndTime = skyScldtvEndTime.substring(0,12) + "00";

                                onAirTimer2SkySc();
                            }

                            // 카드 프로모션
                            setCardPromotion();

                        }
                        ,error : function(e) {

                            if ("https://wwwca.hmall.com" == "")
                                return;

                            $.ajax({
                                type: "get"
                                ,url: "/p/coe/onAirList.do?time=052312"
                                ,dataType: "html"
                                ,async: true
                                ,success : function(data) {
                                    $('#skyScOnAirArea').append(data);

                                    if ($('#onAirHtime').length > 0) {
                                        skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
                                        onAirTimerSkySc();
                                    }

                                    if ($('#onAirHdtime').length > 0) {
                                        skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

                                        // TV+샵은 마직막이 '00' 으로 끝남
                                        if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
                                            skyScldtvEndTime = skyScldtvEndTime.substring(0,12) + "00";

                                        onAirTimer2SkySc();
                                    }

                                    // 카드 프로모션
                                    setCardPromotion();

                                }
                                ,error : function(e) {
                                }
                            });
                        }
                    });
                } catch (err){}
            }

            function setCardPromotion() {
                try {
                    $.ajax({
                        type: "get"
                        ,url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList.do?time=052312"
                        ,dataType: "html"
                        ,async: true
                        ,success : function(data) {
                            $('#skyScCardArea').append(data);
                            $('body').commonUi('initLibrary'); //PC인경우
                        }
                        ,error : function(e) {

                            if ("https://wwwca.hmall.com" == "")
                                return;

                            $.ajax({
                                type: "get"
                                ,url: "/p/coe/onAirCardPrmoList.do?time=052312"
                                ,dataType: "html"
                                ,async: true
                                ,success : function(data) {
                                    $('#skyScCardArea').append(data);
                                    $('body').commonUi('initLibrary'); //PC인경우
                                }
                                ,error : function(e) {

                                }
                            });
                        }
                    });
                } catch (err){}
            }

            function onAirTimerSkySc(){
                var now = new Date();
                var lbrdEndTime = new Date();
                lbrdEndTime.setHours(skySclbrodEndTime.substring(8,10));
                lbrdEndTime.setMinutes(skySclbrodEndTime.substring(10,12));
                lbrdEndTime.setSeconds(skySclbrodEndTime.substring(12,14));

                var gap = (lbrdEndTime.getTime() - now.getTime())/1000;
                var leftTime = "";

                if(gap <= 0){
                    leftTime = "00:00:00";
                    $("#onAirHtime").text(leftTime);
                    return;
                }

                var hour = parseInt(gap/3600);
                var min = parseInt((gap%3600)/60);
                var sec = parseInt(gap%60);

                leftTime += ((hour < 10) ? "0":"") + hour;
                leftTime += ((min < 10) ? ":0":":") + min;
                leftTime += ((sec < 10) ? ":0":":") + sec;

                $("#onAirHtime").text(leftTime);
                setTimeout("onAirTimerSkySc()", 1000);

            }

            function onAirTimer2SkySc(){
                var now = new Date();
                var lbrdEndTime = new Date();
                lbrdEndTime.setHours(skyScldtvEndTime.substring(8,10));
                lbrdEndTime.setMinutes(skyScldtvEndTime.substring(10,12));
                lbrdEndTime.setSeconds(skyScldtvEndTime.substring(12,14));

                var gap = (lbrdEndTime.getTime() - now.getTime())/1000;
                var leftTime = "";

                if(gap <= 0){
                    leftTime = "00:00:00";
                    $("#onAirHdtime").text(leftTime);
                    return;
                }

                var hour = parseInt(gap/3600);
                var min = parseInt((gap%3600)/60);
                var sec = parseInt(gap%60);

                leftTime += ((hour < 10) ? "0":"") + hour;
                leftTime += ((min < 10) ? ":0":":") + min;
                leftTime += ((sec < 10) ? ":0":":") + sec;

                $("#onAirHdtime").text(leftTime);
                setTimeout("onAirTimer2SkySc()", 1000);
            }

        </script>


        <div class="popup shipping_productlist" style="width:550px;" id="shipping_productlist_detail"></div>



    </main></div><div id="criteo-tags-div" style="display: none;"></div><script type="text/javascript" async="" src="//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js"></script><script type="text/javascript" async="" src="//image.hmall.com/p/js/co/tagging.collector-1.3.min.js"></script><iframe src="https://bid.g.doubleclick.net/xbbe/pixel?d=KAE" style="display: none;"></iframe><iframe src="https://bid.g.doubleclick.net/xbbe/pixel?d=KAE" style="display: none;"></iframe><div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;"><div></div></div></div></body></html>

