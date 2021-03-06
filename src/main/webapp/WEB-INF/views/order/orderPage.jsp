<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="/resources/js/addressapi.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<%--    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>--%>
<%--    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>--%>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<%--    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script>--%>
</head>
<sec:authentication property="principal" var="pinfo" />
<script type="text/javascript">
    function selectCopn(objName, aplyCopn_yn) {
        console.log("objName", objName);
        console.log("aplyCopn_yn", aplyCopn_yn);
        // renew2020 금액 reset
        $("#"+objName).val("0원");
        var selectedAlliCrd = isEmpty($("input[name=discountType1]:checked").val()) ? "N" : "Y";
        if ( $("input[name="+objName+"]:checked").val() == undefined ) {
            return;
        }
        var selectedCopnVal = $("input[name="+objName+"]:checked").val().split("|");
        var copnNo = selectedCopnVal[0];
        var copnTypeGbcd = selectedCopnVal[10];
        var prchMdaGbcd = selectedCopnVal[11];
        var dtvItemYn = selectedCopnVal[12];
        var copnPblcNo = selectedCopnVal[8];
        if(isEmpty(copnNo)) {
            $("#pec007 #"+objName).parent().parent().find("input[name='copnInf']").val("");
            // 일반쿠폰 취소할 경우 플러스쿠폰 존재하는 경우 초기화 시킴
            if(copnTypeGbcd == "02") {
                var plusObjName = objName.replace("gnrl", "plus");
                if ( !isEmpty($("#pec007 #"+plusObjName).val()) ) {
                    //$("#pec007 #"+plusObjName).parent().parent().find("input[name='copnInf']").val("");
                    //$("#"+plusObjName+"_layer").find("input[type=radio]").eq(0).prop("checked", true);
                    //selectCopn($("#"+plusObjName+"_layer").find("input[type=radio]").eq(0).parents("div.coupon-list").find("input[name=copnInf]").attr("id"));
                    $("input[name="+plusObjName+"]").eq(0).prop("checked", true);
                    selectCopn(plusObjName);
                }
            }
        } else {
            var kind = selectedAlliCrd == "Y" ? $("input[name=discountType1]:checked").attr("kind") : -1;
            if(copnTypeGbcd == "02") {  // 플러스쿠폰 (일반쿠폰 선택 후 선택 가능, 한주문에 한개만 사용 가능)
                if(kind == '3') {
                    var tcCd = $("input[name=discountType1]:checked").val();
                    if (!isEmpty(tcCd) && tcCd != '0000000704' && tcCd != '0000000172' && tcCd != '0000000559' && tcCd != '0000000171') {
                        if(tcCd == '0000002991'){
                            alert("임직원 할인 시 플러스쿠폰/무적쿠폰/무료배송쿠폰 사용이 불가능합니다.");
                        }else{
                            alert("추가할인 시 플러스쿠폰/무적쿠폰/무료배송쿠폰 사용이 불가능합니다.");
                        }
                        $("input[name="+objName+"]").eq(0).prop("checked", true);
                        $("#"+objName+"_layer").modal().hide();
                        //return;
                    }
                }
                var gnrlObjName = objName.replace("plus", "gnrl");
                if ( $("#pec007 #"+gnrlObjName).val() == "0원" ) {
                    alert("플러스쿠폰은 일반쿠폰과 같이 사용하셔야합니다.");
                    $("input[name="+objName+"]").eq(0).prop("checked", true);
                    $("#"+objName+"_layer").modal().hide();
                    //return;
                }
            }
            var tcDcType = isEmpty($("input[name=discountType1]:checked").attr("tcDcType")) ? "03" : $("input[name=discountType1]:checked").attr("tcDcType");
            if(tcDcType == "04") {
                if((prchMdaGbcd == "20" || dtvItemYn == "Y") && (copnTypeGbcd == "03" || copnTypeGbcd == "04" || copnTypeGbcd == "05")) {  // 바로사용 쿠폰사용시 임직원 할인 사용 불가
                    alert("방송상품은 홈쇼핑 임직원할인시 바로사용 쿠폰 사용이 불가 합니다.");
                    $("input[name="+objName+"]").eq(0).prop("checked", true);
                    $("#"+objName+"_layer").modal().hide();
                    return;
                }
                for(var i = 0; i < afcoDcVenCopnList.length; i++){
                    if(afcoDcVenCopnList[i] == copnNo){
                        alert("방송상품은 홈쇼핑 임직원할인시 VIP쿠폰 사용이 불가합니다.");
                        $("input[name="+objName+"]").eq(0).prop("checked", true);
                        $("#"+objName+"_layer").modal().hide();
                        return;
                    }
                }
            }
            if(copnTypeGbcd == "07") {  // 무적할인
                if(kind == '3') {
                    var tcCd = $("input[name=discountType1]:checked").val();
                    if(tcCd != '0000000704' && tcCd != '0000000172' && tcCd != '0000000559' && tcCd != '0000000171') {
                        alert("제휴 할인 시\n플러스 쿠폰/무적쿠폰/무료배송 쿠폰 사용이 불가능합니다.");
                        $("input[name="+objName+"]").eq(0).prop("checked", true);
                        $("#"+objName+"_layer").modal().hide();
                        return;
                    }
                }
            }
            if(copnTypeGbcd != "03" && copnTypeGbcd != "04") {
                // 중복체크
                var dupYn = false;
                $("#pec007 input[name='copnInf']").each(function(index) {
                    //var copnInfIdx = $("input[name='copnInf']").index(this);
                    //console.log("copnInfIdx:"+copnInfIdx+":"+index);
                    if(!dupYn && !isEmpty($(this).val()) ) {//}&& copnInfIdx != index) {
                        var copnInfArr = $(this).val().split("|");
                        //console.log("copnNo:"+copnNo+":"+copnPblcNo);
                        if ( copnTypeGbcd == "05" ) {
                            if(copnNo != "" && copnInfArr[0] == copnNo && copnInfArr[8] == copnPblcNo) {
                                alert("이미 사용중인 쿠폰입니다.");
                                dupYn = true;
                            }
                        } else {
                            if(copnNo != "" && copnPblcNo != "" && copnInfArr[0] == copnNo && copnInfArr[8] == copnPblcNo) {
                                alert("이미 사용중인 쿠폰입니다.");
                                dupYn = true;
                            }
                        }
                    }
                });
                if(dupYn) {
                    $("input[name="+objName+"]").eq(0).prop("checked", true);
                    //return;
                }
            }
            $("#pec007 #"+objName).parent().parent().find("input[name='copnInf']").val($("input[name="+objName+"]:checked").val());
        }
        // 쿠폰이름 셋팅
        // renew2020 $("p.couponUse:eq(" + idx + ")").text($(obj).siblings("input[name='copnNm']").val());
        // 플러스 쿠폰 금액 초기화
        /* renew2020 구조변경으로 삭제. plus쿠폰은 쿠폰 적용시 reset한다.
$("td.expiryDate:eq(" + tdIdx + ")").find("div.plusCopnSelectDiv tr").each(function() {
    var dcPrice = $(this).find("input[name='dcPrice']").val();
    $(this).find(".copnDcPriceTd").text(gfn_appendComma(dcPrice));
});
*/
        // 할인 금액 계산
        var dcPrice = 0;
        var gnrlCopnDcPrice = 0;
        var plusCopnDcPrice = 0;
        var sellPrcForCopn = $("#"+objName+"_layer").find("input[name='sellPrcForCopn']").val();
        var exstCopnDcAmt = $("#"+objName+"_layer").find("input[name='exstCopnDcAmt']").val();
        sellPrcForCopn = isEmpty(sellPrcForCopn) ? 0 : Number(sellPrcForCopn);
        exstCopnDcAmt = isEmpty(exstCopnDcAmt) ? 0 : Number(exstCopnDcAmt);
        // renew2020 $("td.expiryDate:eq(" + tdIdx + ") p.couponUse").each(function() {
        // renew2020    var copnUseIdx = $("p.couponUse").index(this);
        // renew2020    var copnInf = $("#cuponSearch input[name='copnInf']:eq(" + copnUseIdx + ")").val();
        var copnInf = $("#"+objName+"_layer input[name="+objName+"]:checked").val();
        var copnGb = "";
        if(!isEmpty(copnInf)) {
            var famtFxrtGbcd = copnInf.split("|")[4];
            var famtFxrtVal = copnInf.split("|")[5];
            var maxDcPossAmt = copnInf.split("|")[9];
            copnGb = copnInf.split("|")[6];
            // renew2020 plus일때 gnrl 금액을 빼고 계산한다.
            if(copnGb != "1") {
                dcPrice = $("#"+objName.replace("plus", "gnrl")).parent().parent().find("input[name=copnDcAmt]").val();
            }
            if(famtFxrtGbcd == "1") {   // 정률
                var dcAmt = Math.floor(Number((sellPrcForCopn - exstCopnDcAmt - dcPrice) * famtFxrtVal) / 1000) * 10;
                if(maxDcPossAmt > 0 && dcAmt > maxDcPossAmt) {
                    dcAmt = Number(maxDcPossAmt);
                }
                dcPrice += dcAmt;
                if(copnGb == "1") {
                    gnrlCopnDcPrice += dcAmt;
                } else {
                    plusCopnDcPrice += dcAmt;
                }
            } else {    // 정액
                var dcAmt = Number(famtFxrtVal);
                if(maxDcPossAmt > 0 && dcAmt > maxDcPossAmt) {
                    dcAmt = Number(maxDcPossAmt);
                }
                dcPrice += dcAmt;
                if(copnGb == "1") {
                    gnrlCopnDcPrice += dcAmt;
                } else {
                    plusCopnDcPrice += dcAmt;
                }
            }
            // renew2020 plus쿠폰 선택 후 일반쿠폰이 변경되었을때 plus쿠폰을 재계산한다.
            if(copnGb == "1") { // 일반쿠폰
                $("input[name="+objName.replace("gnrl", "plus")+"]").eq(0).prop("checked", true);
                selectCopn(objName.replace("gnrl", "plus"));
                /*
        $("td.expiryDate:eq(" + tdIdx + ")").find("div.plusCopnSelectDiv tr").each(function() {
            var famtFxrtGbcdPlus = $(this).find("input[name='famtFxrtGbcd']").val();
            var famtFxrtValPlus = $(this).find("input[name='famtFxrtVal']").val();
            var maxDcPossAmtPlus = $(this).find("input[name='maxDcPossAmt']").val();
            if(famtFxrtGbcdPlus == "1") {   // 정률
                var dcAmt = Math.floor(Number((sellPrcForCopn - exstCopnDcAmt - dcPrice) * famtFxrtValPlus) / 1000) * 10;
                if(maxDcPossAmtPlus > 0 && dcAmt > maxDcPossAmtPlus) {
                    dcAmt = Number(maxDcPossAmtPlus);
                }
                $(this).find(".copnDcPriceTd").text(gfn_appendComma(dcAmt));
            } else {    // 정액
                var dcAmt = Number(famtFxrtValPlus);
                if(maxDcPossAmtPlus > 0 && dcAmt > maxDcPossAmtPlus) {
                    dcAmt = Number(maxDcPossAmtPlus);
                }
                $(this).find(".copnDcPriceTd").text(gfn_appendComma(dcAmt));
            }
        });
        */
            }
        }
        /* renew2020 금액표시 삭제... 계산하는놈으로 이동!!!
if ( copnGb== "1" ) {
    $("#"+objName).val(gfn_appendComma(Number(gnrlCopnDcPrice)));
} else {
    $("#"+objName).val(gfn_appendComma(Number(plusCopnDcPrice)));
}
$("#"+objName).parent().siblings("input[name='copnDcAmt']").val(Number(dcPrice));
}
/* renew2020
var copnDcAmt = 0;
$("#pec007 input[name='copnDcAmt']").each(function() {
    copnDcAmt += Number($(this).val());
});
// 2019.10.08 HMALL개선이주형 무료배송비쿠폰 멀티사용처리
var freeDlvCopnDcAmt = 0;
$(".cuponInqTable2 tbody .freeDlvRow").each(function() {
    freeDlvAmt = Number($(this).find("input[name='aplyFreeDlvAmt']").val());
    freeDlvCopnDcAmt += freeDlvAmt;
});
*/
        // renew2020 $(".cuponInqTable1 tfoot span").text(gfn_appendComma(copnDcAmt));
        // renew2020 $(".cuponInqTable2 tfoot p span").text(gfn_appendComma(Number(copnDcAmt) + Number(freeDlvCopnDcAmt)));
        // renew2020 hideListLayer($(obj).parent().parent().parent().parent().parent().parent().parent().parent().find("p.couponUse"));
        if(aplyCopn_yn != "N"){
            aplyCopn();
        }
        $("#"+objName+"_layer").modal().hide();
    }
    function aplyCopn() {
        $("form[name='orderDataForm'] input[name='copnInf'], form[name='orderDataForm'] input[name='freeDlvCopnInf'], form[name='orderDataForm'] input[name=paymentCopnInf]").remove();
        // renew2020 $(".dcPriceTd input[name='copnDcAmt']").remove();
        $("#pec007 input[name='freeDlvCopnInf']").each(function(){
            if ( $(this).val() != "" ) {
                $("form[name='orderDataForm']").append($(this).clone());
            }
        });
        $("#pec007 input[name='copnInf']").each(function() {
            if(!isEmpty($(this).val())) {
                $("form[name='orderDataForm']").append($(this).clone());
            }
        });
        // renew2020 $("#discountType1 option:first").attr("selected", true);
        // TODO : 제휴할인 선택되었을 경우 플러스 쿠폰 사용시 초기화 시켜야함
        // 쿠폰 선택 시 결제수단 선택 초기화
        //TODO 곽희섭 20170529 통합포인트 추가
        // $("input[name='useDeposit'], input[name='useHPoint'], input[name='useUPoint'], input[name='useWPoint'], input[name='useGcAmt']").val("");
        // $("input[name='depositCheck'], input[name='hpointCheck'], input[name='upointCheck'], input[name='wpointCheck'], input[name='gcCheck']").prop("checked", false);
        $("select#subpayToken option:first").attr("selected", true);
        $("input[name=useGcAmt]").attr("disabled", true);
        $("#allDeposit, #all1, #all2, #all3").attr("checked", false);
        clearPayTypeArea();
        $("input[name='payType']").attr("checked", false);
        //관세 금액 초기화 및 버튼 제어
        // renew2020 해외배송? checkFrgnDuteInfo();
        // 금액계산
        calculateOrderAmt();
        // hppMethodReset();
        // renew2020 closeModalLayerPopup('cuponSearch');
        //if ( $("#pec007").modal() != undefined ) {
        //    //$("#pec007").modal().hide();
        //}
        checkStlmWaySave("Y");
        if(!isEmpty($("input[name='selPaymentCopn']:checked").val())){
            setPayCopnPayType($("input[name='selPaymentCopn']:checked").val().split("|")[9]);
            if($("input[name='payment-type']:checked").val() == "31"){
                setTimeout(gotoPlcc,500);
            }
        }
        cardCalculate();
        // gotoPlcc();
        if($("#payment-type-1").prop("checked")){
            hppCardMsg();
        }
        if($("#payment-type-2").prop("checked")){
            hppAccountMsg();
        }
        function fn_specialCardCheck(){
            var kind = $("input[name='discountType1']:checked").attr("kind");
            var alliCrdCd = $("input[name='discountType1']:checked").attr("crdCd");
            if(kind == "1" || kind == "2") {
                if (!isEmpty(alliCrdCd)) {
                    if (alliCrdCd != "99") { // 무통장
                        return false;
                    }
                }
            }
            return true;
        }
        var nonMember = "N";
        function hppAccountReceiptInit() {
            $("#hpp-account-receipt").removeClass("ui-active");
            $("input[name='receipt-option2']").attr("disabled", true);
            $("#hpp-account-receipt .receiptType").hide();
            $("#hpp-account-receipt div.selectwrap").addClass("hidden");
            $("input[name='receipt-option2']").prop("checked", false);
            if(nonMember == "Y") {
                $("#chk14_1").prop("checked",false);
            }
            $("#hppAccountCashRcpt_so_hp").addClass("hidden");
            $("#hppAccountCashRcpt_so_credit").addClass("hidden");
            $("#hppAccountCashRcpt_so_cash").addClass("hidden");
            $("#hppAccountCashRcpt_ji").addClass("hidden");
            $("select[name='receipt-option3'] option:eq(0)").attr("selected", true);
            $("input[name='hppAccountRgno1'], input[name='hppAccountRgno2'], input[name='hppAccountRgno3']").val("");
            $("input[name='HPPAccountCashRcptCreditCrdNum1'], input[name='HPPAccountCashRcptCreditCrdNum2'], input[name='HPPAccountCashRcptCreditCrdNum3'], input[name='HPPAccountCashRcptCreditCrdNum4']").val("");
            $("input[name='HPPAccountCashRcptCrdNum1'], input[name='HPPAccountCashRcptCrdNum2'], input[name='HPPAccountCashRcptCrdNum3'], input[name='HPPAccountCashRcptCrdNum4']").val("");
            $("input[name='HPAccountCashRcptHpNum']").val("");
            $("#receipt-option-hpay").prop("checked", false);
            $("#hpp-account-receipt .receipt-content").removeClass("_active");
            $("#hpp-account-receipt .pay-subcase").hide();
        }
        /**
         * 결제수단 선택 영역 초기화
         */
        var hppPlccExist = "N";
        function clearPayTypeArea() {
            $("#order2016Alert, #order2016Alert div[name^='crdcCd']").hide();
            if(hppPlccExist == "Y"){
                $(".hpp-carditem .ca-plcc").prev().hide();
            }
            if(!fn_specialCardCheck()) return false;
            $("input[name='multiStlmCrdAmt']").val("");     // 복합결제 카드 결제 금액 초기화
            if ( !isEmpty($("select[name='stlmCrdInf']").parent().selectbox()) ) {
                $("select[name='stlmCrdInf']").parent().selectbox().selected(''); // 카드목록 초기화
            }
            $("select[name='allotMonth']").children().remove();                                 // 할부 목록 제거
            $("select[name='allotMonth']").parent().addClass("disabled");
            $("select[name='allotMonth']").parent().addClass("hidden");
            $("input[name='payType'], input[name='cardPoint'], input[name='saveService']").attr("checked", false);  // 결제방식 초기화, 포인트 사용 초기화
            $("input[name='payType']").filter("input[value='safeClck']").attr("checked", true);
            $("input[name='cardPoint']:eq(1)").prop("checked", true);
            var payType = "";
            if($("input[name='payment-type']:checked").val() == "3"){
                payType = $("input[name='payType']:checked").val();
            }else{
                payType = $("input[name='payment-type']:checked").val();
            }
            // 신용카드 분할결제 영역 초기화
            if(payType != '11' && typeof payType != 'undefined'){
                // 신용카드 분할결제 1번째 영역 초기화
                $("input[name='multiStlmCrdAmtDiv1']").val("");
                if ( !isEmpty($("select[name='stlmCrdInfDiv1']").parent().selectbox()) ) {
                    $("select[name='stlmCrdInfDiv1']").parent().selectbox().selected(''); // 카드목록 초기화
                }
                $("select[name='allotMonthDiv1']").children().remove();                                 // 할부 목록 제거
                $("select[name='allotMonthDiv1']").parent().addClass("disabled");
                $("select[name='allotMonthDiv1']").parent().addClass("hidden");
                //$("input[name='paymentTypeDiv1'], input[name='cardPointDiv1'], input[name='saveServiceDiv1']").prop("checked", false);
                $("input[name='paymentTypeDiv1']").filter("input[value='safeClckDiv1']").prop("checked", true);
                $("input[name='cardPointDiv1']:eq(1)").prop("checked", true);
                // 신용카드 분할결제 2번째 영역 초기화
                $("input[name='multiStlmCrdAmtDiv2']").val("");
                if ( !isEmpty($("select[name='stlmCrdInfDiv2']").parent().selectbox()) ) {
                    $("select[name='stlmCrdInfDiv2']").parent().selectbox().selected(''); // 카드목록 초기화
                }
                $("select[name='allotMonthDiv2']").children().remove();                                 // 할부 목록 제거
                $("select[name='allotMonthDiv2']").parent().addClass("disabled");
                $("select[name='allotMonthDiv2']").parent().addClass("hidden");
                //$("input[name='paymentTypeDiv2'], input[name='cardPointDiv2'], input[name='saveServiceDiv2']").prop("checked", false);
                $("input[name='paymentTypeDiv2']").filter("input[value='safeClckDiv2']").prop("checked", true);
                $("input[name='cardPointDiv2']:eq(1)").prop("checked", true);
            }
            if(payType != 12){
                $("form[name='orderDataForm'] input[name='hdPlccCrdPrmoAplyYn']").val("");
                $("form[name='orderDataForm'] input[name='hdPlccCrdPrmoYn']").val("N"); //제외여부체크
                $("form[name='orderDataForm'] input[name='hdPlccCrdStlmYn']").val("N");
            }
            $(".crdKndExposureArea").addClass("hidden");
            // H.Point Pay 추가 Plcc 데이터 초기화 by j.b.w
            $("form[name='orderDataForm'] input[name='hdPlccCrdPrmoAplyYn']").val("");
            $("form[name='orderDataForm'] input[name='hdPlccCrdPrmoYn']").val("N");
            $("form[name='orderDataForm'] input[name='hdPlccCrdStlmYn']").val("N");
            hppAccountReceiptInit();
            $(".smileCrdArea").addClass("hidden");
            $("input[name='multiStlmWibkAmt']").val("");                    // 복합결제 무통장 금액 초기화
            $("select[name='wibkBankCd'] option").attr("selected", false);  // 입금은행 초기화
            $("select[name='wibkBankCd'] option:first").attr("selected", true);
            $("form[name='paymentForm'] input[name='wibkCustNm']").val($("input.rcvCustNm").val());   // 입금자명 초기화
            //$("input[name='wibkAcntSmsYn']:first, input[name='wibkIamtInfSmsYn']:first").attr("checked", true);
            $("input[name='multiStlmAcntAmt']").val("");    // 복합결제 실시간계좌이체 금액 초기화
            $("input[name='receiptYn']").prop("checked", false);    // 현금영수증 초기화
            $("#cashRcptArea .receiptType").hide();
            $("#stlmCrdAmtDl strong").html("");
            $("#stlmAlliDcAmtDl strong").html("");
            $("#stlmCrdAmtDl strong").html("");
            $("#stlmCrdAmtDlDiv1 strong").html("");
            $("#stlmCrdAmtDlDiv2 strong").html("");
            $(".stlmDpArea").addClass("hidden");
            // 신용카드 분할결제
            if(payType == '11'){
                var multiStlmCrdAmt = isEmpty($("input[name='multiStlmCrdAmtDiv1']").val()) ? 0 : Number(removeComma($("input[name='multiStlmCrdAmtDiv1']").val()));
                $("#stlmCrdAmtDlDiv1 strong").html(gfn_appendComma(multiStlmCrdAmt));  // 초기셋팅, 1차 결제금액 입력
                $("#stlmCrdAmtDlDiv2 strong").html("0");
                $("#stlmCrdAmtDlDiv1").removeClass("hidden");
                $("#stlmCrdAmtDlDiv2").removeClass("hidden");
            }
            // renew2020 아래로 변경. $(".payTypeBox").not("#psnCucrInntCodePayTypeBox, #asianaPayTypeBox, #okcashbagPayTypeBox, #cardTypeArea1, #cardTypeArea2").hide();
            $(".pay-case-content, .payTypeBox").not("#psnCucrInntCodePayTypeBox, #asianaPayTypeBox, #okcashbagPayTypeBox").hide();
            $(".split-payments-wrap").hide();
            $("#stlmDcAmtDiv").hide();
            $("input[name=stlmDcPrmoNo]").val("");
            $("input[name=stlmDcAmt]").val("0");
            if($("input[name='payment-type']:checked").val() != "3"){
                $(".hpp").show();
            }else{
                $(".hpp").hide();
            }
            var drctVstLimitYn = 'N';
            if(drctVstLimitYn== 'Y'){
                $("#order2016Alert").show();
            }
        }
    }
</script>

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

                        <div class="order-info-box" style="display: flex;">

                            <div class="tit-wrap" style="width: 200px">${pinfo.userVO.user_name}고객님의 혜택 정보</div>&nbsp;&nbsp;
                            <div class="txt-wrap">
                                <p class="txt">회원등급:  ${pinfo.userVO.user_level}</p>
                            </div>&nbsp;&nbsp;
                            <div class="txt-wrap">
                                <p class="txt">적립금: <fmt:formatNumber value="${pinfo.userVO.user_point}"
                                                                       pattern="#,###"/></p>
                            </div>&nbsp;&nbsp;
                        </div>

                        <h3 class="title22 selected only"><button data-modules-collapse="" class="accordion-trigger" aria-expanded="false">상품정보 <span class="num" id="ordItemCnt">${fn:length(basketList)}</span><i class="icon"></i></button></h3>
                        <div class="accordion-panel selected" role="region" aria-label="">
                            <div class="order-list" id="orderItems">
                                <c:set var="total_price" value="0"/>
                                <input type="hidden" name="basketListLength" value="${fn:length(basketList)}" />
                                <ul>
                                    <c:forEach items="${basketList}" var="basket" varStatus="status">
                                        <input type="hidden" name="prSeq${status.index}" value="${basket.productVO.product_seq}" />
                                        <input type="hidden" name="baCount${status.index}" value="${basket.basket_count}" />
                                        <li name="orderItem">
                                            <input type="hidden" value="${basket.productVO.product_seq}" name="product_seq" id="product_seq"/>
                                            <%--                                        상품에 관한 정보들--%>
    <%--                                        <input type="hidden" name="totalPrice" id="totalPrice" value="${basket.productVO.product_cost * basket.basket_count}">--%>


                                            <a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137171063&amp;sectId=2731506" target="_blank">
                                                <span class="img">
                                                    <img src="/resources/img/thumb/${basket.productVO.image_name}.jpg" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')"></span>
                                                <div class="box">
                                                    <input type="hidden" name="product_name" id="product_name" value="${basket.productVO.product_name}" />
                                                    <span class="tit">${basket.productVO.product_name}</span>
                                                    <div class="info">
                                                        <ul>
                                                            <li><fmt:formatNumber value="${basket.productVO.product_cost}"
                                                                                  pattern="#,###"/>원</li>
                                                            <li>${basket.basket_count}개<input type="hidden" name="ordQty" value="1" readonly="readonly"></li>
                                                        </ul>
                                                    </div>
                                                    <%--                                                상품 값 받아와 함--%>
                                                    <span class="price"><strong><fmt:formatNumber value="${basket.productVO.product_cost * basket.basket_count}"
                                                                                                  pattern="#,###"/></strong>원</span>
                                                    <c:set var="total_price" value="${total_price+(basket.productVO.product_cost * basket.basket_count)}" />
                                                </div>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>


                        <!-- chkStlmType() 2번째 시작 -->
                        <div>
                            <h3 class="title22">할인/포인트 적용</h3>
                            <div class="discount-box">
                                <div class="coupon-area">
                                    <ul class="row-list">
                                        <li id="copnSaleDiv" 1:0:="">
                                            <div class="row-title">
                                                <button class="btn btn-linelgray small34" onclick="$('#pec007').modal().show();"><span>쿠폰 조회 및 변경</span></button>
                                                <label class="chklabel">
                                                    <span><input name="couponDiscount" id="couponDiscount" value="" style="border: none; text-align: left;"/></span>
                                                </label>
                                            </div>
                                            <%--                                            <div class="row-value">--%>
                                            <%--                                                <p class="price"><strong id="copnDcAplyAmt">-4,900</strong>원</p>--%>
                                            <%--                                            </div>--%>
                                        </li>
                                    </ul>
                                </div>
                                <div class="ui-modal" id="pec007" tabindex="-1" role="dialog" aria-label="쿠폰 할인" style="z-index: 1031; display: none;">
                                    <div class="ui-modal-dialog" role="document">
                                        <div class="content">
                                            <p class="ui-title">쿠폰 할인</p>
                                            <div class="content-body">
                                                <c:forEach items="${couponList}" var="coupon">

                                                    <div class="discount-box">
                                                        <div class="row-wrap">
                                                            <input type="radio" id="discount2" style="display:none;">
                                                            <label class="chklabel">
                                                                <input type="radio" id="discount2Tmp" name="couponName" value="${coupon.coupon_seq}">
                                                                    <%--                                                                <i class="icon"></i>--%>
                                                                <span>${coupon.coupon_name}</span>
                                                                <input type="hidden" name="coupon_ratio" value=${coupon.coupon_ratio}>
                                                                <input type="hidden" name="coupon_cost" value=${coupon.coupon_cost}>
                                                                <input type="hidden" name="coupon_ratio" value=${coupon.expired_at}>
                                                            </label>
                                                                <%--                                                        <input type="hidden" name="totPrmoDcAmt" value="175800">--%>

                                                        </div>
                                                    </div>
                                                </c:forEach>

                                                <div class="btngroup">
                                                    <button class="btn btn-default" id="couponSelectorBtn"><span>적용하기</span></button>
                                                    <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                                </div>

                                            </div>
                                            <!-- //.content-body -->
                                            <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                                        </div>
                                        <!-- //.content -->
                                    </div>
                                    <!-- //.ui-modal-dialog -->
                                </div>
                                <script type="text/javascript">
                                    // function checkOnlyOne(){
                                    //     const checkboxes=document.getElementById("discount2Tmp");
                                    //     checkboxes.forEach((cb)=>{
                                    //         cb.checked=false;
                                    //     })
                                    //     element.checked=true;
                                    // }
                                </script>
                                <div class="point-area">
                                    <ul class="row-list">
                                        <li id="hpointUseLi">
                                    <%--
                                                                        <ul class="row-list">
                                                                            <li id="hpointUseLi">
                                                                                <%--                                            TODO: 적립금, 예치금 DB에서 가져온 값으로 갱신--%>
                                    <div class="row-title">
                                        <label class="chklabel">
                                            <%--                                                    <input type="checkbox" name="resPoint" onclick="useUpoint()">--%>
                                            <%--                                                    <i class="icon"></i>--%>
                                            <span style="width: 100px">적립금</span>
                                            <c:set var="userPoint" value="${userPoint}"/>
                                            <input type="number" value="0" placeholder="0" name="userPoint" id="userPoint" style="width: 100px; text-align: right;">
                                            <span class="unit point">P</span>
                                            <button class="btn btn-linelgray small34" onclick="useUserPoint();"><span>사용하기</span></button>
                                            <button class="btn btn-linelgray small34" onclick="cancelPoint();" style="margin-right: 10px;"><span>사용취소</span></button>
                                            <span style="width: 300px">[보유 적립금 : <em class="num"><fmt:formatNumber value="${userPoint}" pattern="#,###"/></em> ]</span>
                                        </label>
                                    </div>
                                    </li>
                                    <li id="depositLi">
                                        <div class="row-title">
                                            <label class="chklabel">
                                                <span style="width: 100px">예치금</span>
                                                <input type="number" value="0" placeholder="0" name="depositPoint" id="depositPoint" style="width: 100px; text-align: right;">
                                                <span class="unit point">P</span>
                                                <button class="btn btn-linelgray small34" onclick="useDepositPoint();"><span>사용하기</span></button>
                                                <button class="btn btn-linelgray small34" onclick="cancelDepositPoint();" style="margin-right: 10px;"><span>사용취소</span></button>
                                                <span style="width: 300px">[보유 예치금 : <em class="num"><fmt:formatNumber value="${depositPoint}" pattern="#,###"/></em> ]</span>
                                            </label>
                                        </div>
                                    </li>
                                    </ul>
                                </div>
                            </div>
                            <script type="text/javascript">
                                //화면에서는 적용되게 보이고 최종적으로 결제됐을 때 user의 point와 deposit를 바꿔준다.
                                function useUserPoint(){
                                    var willUse=$("input[name='userPoint']").val();
                                    if (willUse>${userPoint}) {
                                        alert("보유 적립금보다 금액이 큽니다!");
                                        $("#userPoint").val(0);
                                    }else{
                                        $("#totalUserPoint").val(willUse);
                                        if(applyDiscount()==="ok"){
                                            alert("적용되었습니다!");
                                        }else{
                                            $("#userPoint").val(0);
                                            $("#totalUserPoint").val(0);
                                        }
                                    }
                                }
                                function cancelPoint(){
                                    alert("적용이 취소되었습니다.");
                                    $("#userPoint").val(0);
                                    $("#totalUserPoint").val(0);
                                }
                                function useDepositPoint(){
                                    var willUse=$("input[name='depositPoint']").val();
                                    if (willUse>${depositPoint}) {
                                        alert("보유 적립금보다 금액이 큽니다!");
                                        $("#userPoint").val(0);
                                    }else{
                                        $("#totalDepositPoint").val(willUse);
                                        if(applyDiscount()==="ok"){
                                            alert("적용되었습니다!");
                                        }else{
                                            $("#userPoint").val(0);
                                            $("#totalDepositPoint").val(0);
                                        }
                                    }
                                }
                                function cancelDepositPoint(){
                                    alert("적용이 취소되었습니다.");
                                    $("#depositPoint").val(0);
                                    $("#totalDepositPoint").val(0);
                                }
                                function applyDiscount(){
                                    var totalCost=parseInt($("input[name='totalPrice']").val());
                                    var discount1=$("input[name='totalUserPoint']").val();
                                    var discount2=$("input[name='totalDepositPoint']").val();
                                    var discount3=$("input[name='totalCouponPoint']").val();
                                    totalCost=totalCost-parseInt(discount1)-parseInt(discount2)-parseInt(discount3);

                                    if(totalCost<0){
                                        alert("할인 금액이 결제할 금액보다 큽니다!");
                                        return "deny";
                                    }
                                    $("#totalCost1").val(totalCost);
                                    return "ok";
                                }
                            </script>


                        </div> <!-- chkStlmType() 2번째 종료 -->
                        <h3 class="title22" id="dlvTitleH3">주문고객/배송지 정보 입력</h3>

                        <span class="txt" style="margin: 10px 0 10px 0;">※ 주문 고객 정보 &nbsp;(보내시는 분 수정할 수 있습니다)</span>
                        <div style="height: 20px;"></div>
                        <table>
                            <caption>주문 고객 정보 테이블</caption>
                            <colgroup>
                                <col style="width:100px; ">
                                <col style="width:150px; background-color:white; ">
                                <col style="width:100px">
                                <col style="width:150px; background-color:white; ">
                            </colgroup>
                            <tr>
                                <th scope="col">주문하시는 분</th>
                                <sec:authorize access="isAuthenticated()">
                                    <sec:authentication property="principal" var="pinfo" />
                                    <th scope="col">${pinfo.userVO.user_name}</th>
                                    <th scope="col">보내시는 분</th>
                                    <th scope="col"><input type="text" name="order_user_name" value="${pinfo.userVO.user_name}" style="color: black; font-size: 15.5px; text-align: center; padding: 7px;"/></th>
                                </sec:authorize>
                            </tr>

                        </table>
                        <div style="height: 20px;"></div>
                        <span class="txt">※ 배송지 정보</span>
                        <div class="board" style="margin-top: 15px;">
                            <!--table-->
                            <div class="tblwrap">
                                <table>
                                    <caption>주문고객/베송지 정보 테이블</caption>
                                    <colgroup>
                                        <col style="width:100px">
                                        <col style="width:600px">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td style="background-color: lightgrey">
                                                배송지 선택
                                            </td>
                                            <td>
                                                <div>
                                                    &nbsp;
                                                    <button type="button" class="btn btn-linelgray small30" onclick="addNewAddress();"><span>신규 배송지 저장</span></button>
                                                    <button class="btn btn-linelgray small30" type="button" onclick="openAddressListPup()"><span>이전 배송지</span></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: lightgrey">받으시는 분</td>
                                            <td><input type="text" name="receiveName" id="receiveName" value="" style="padding: 7px;"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: lightgrey">연락처</td>
                                            <td><input type="number" name="phoneNumber1" id="phoneNumber1" value="" style="padding: 7px;"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: lightgrey">휴대폰</td>
                                            <td><input type="number" name="phoneNumber2" id="phoneNumber2" value="" style="padding: 7px;"></td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: lightgrey">주소</td>
                                            <td>
                                                <div style="display: flex;">
                                                    <label class="inplabel btnlabel"><input type="text"  value="${basicAddress.user_address_address1}" placeholder="우편번호" id="zipcode" name="zipcode" style="padding: 7px;"></label>
                                                    <button type="button" class="btn btn-linelgray small30" onclick="execPostCode();"><span>우편번호 검색</span></button>
                                                </div>
                                                <div>
                                                    <label class="inplabel btnlabel"><input type="text"  value="${basicAddress.user_address_address2}" placeholder="도로명 주소" id="order_delivery1" name="order_delivery1" style="padding: 7px;"></label>
                                                    <label class="inplabel"><input type="text" name="order_delivery2" value="${basicAddress.user_address_address3}" placeholder="상세 주소를 입력해주세요." id="order_delivery2" maxlength="100" style="padding: 7px;"></label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: lightgrey">남기실 말씀</td>
                                            <td>
                                                <label class="inplabel"><input type="text" name="order_message" value="" placeholder="남기실 말씀을 입력해주세요." id="order_message" maxlength="100" style="padding: 7px;"></label>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div id="cost">
                            <h3 class="title22">결제 정보 선택</h3>
                            <div class="discount-box">
                                <div class="point-area">
                                    <ul class="row-list">
                                        <%--                                        TODO: 결제수단에 따라 페이지 전환(무통장입금은 바로 주문접수 페이지, 신용카드는 결제 API 사용--%>
                                        <li>
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="radio" name="paymentMethod" id="paymentMethod1" value="paymentMethod1">
                                                    <span>카카오페이</span>
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="row-title">
                                                <label class="chklabel">
                                                    <input type="radio" name="paymentMethod" id="paymentMethod2" value="paymentMethod2">
                                                    <span>무통장입금</span>
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                    <input type="hidden" value="" name="payMethod" id="payMethod">
                                </div>
                            </div>
                        </div> <!-- chkStlmType() 2번째 종료 -->

                        <div class="sticky-ui-wrapper util-option-sticky">
                            <div class="sticky-placeholder" style=""></div>
                            <div class="util-option sticky" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;" style="">
                                <div class="sticky-inner">
                                    <h4 class="title20">총 결제금액</h4>
                                    <ul class="payment-list">
                                        <li>
                                            <div id="orderAmt">
                                                <span class="tit">총 판매금액</span>
                                                <input type="hidden" value="${total_price}" name="totalPrice" />
                                                <span class="txt"><strong><fmt:formatNumber value="${total_price}"
                                                                                            pattern="#,###"/></strong>원</span>
                                            </div>
                                            <div id="copnDcCoupon" class="hidden">
                                                <span class="tit">쿠폰 사용</span>
                                                <span class="txt">
                                                    <label for="totalCouponPoint"></label>
                                                    <strong><input value="0" name="totalCouponPoint" id="totalCouponPoint" style="border: none;width: 100px; text-align:right;"></strong>
                                                    원</span>
                                            </div>
                                            <div id="copnDcAmtDiv" class="hidden">
                                                <span class="tit">적립금 사용</span>
                                                <span class="txt">
                                                    <label for="totalUserPoint"></label>
                                                    <strong><input value="0" name="totalUserPoint" id="totalUserPoint" style="border: none;width: 100px; text-align:right;"></strong>
                                                    원</span>
                                            </div>

                                            <div class="hidden" id="alliDcAmtDiv">
                                                <span class="tit">예치금 사용</span>
                                                <span class="txt">
                                                <label for="totalDepositPoint"></label>
                                                <strong><input value="0" name="totalDepositPoint" id="totalDepositPoint" style="border: none;width: 100px; text-align:right;"></strong>
                                                원</span>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="total">
                                                <span class="tit">최종 결제금액</span>
                                                <span class="txt" id="lastStlmAmtDd">
                                                    <label for="totalDepositPoint"></label>
                                                <strong>
                                                    <label for="totalCost1"></label>
                                                    <input value="${total_price}" name="totalCost1" id="totalCost1" style="border: none;width: 100px; text-align:right;">
                                                </strong>
                                                </span>
                                            </div>

                                        </li>
                                    </ul>

                                    <div class="btngroup">
                                        <button type="button" class="btn btn-default medium" onclick="goToPay();"><span>결제</span></button>
                                    </div>
                                    <input type="hidden" value="${basketList}" name="basketList"/>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //.container -->
    </div>
    <script type="text/javascript">
        //결제
        function goToPay(){
            //결제 수단에 따른 페이지 이동 및 ..
            if($('input:radio[name=paymentMethod]').is(':checked')){
                //결제수단: 신용카드 -> 카카오API
                if($("input:radio[name='paymentMethod']:checked").val()==='paymentMethod1'){
                    $("#payMethod").val('카카오페이');
                    //카카오 결제 API
                    var IMP=window.IMP;
                    IMP.init('imp40479509');
                    IMP.request_pay({
                        pg:'kakaopay',
                        pay_method:'card',
                        merchant_uid:'merchant_'+new Date().getTime(), //주문번호
                        name: $("input[name='product_name']").val(),//상품명
                        amount:parseInt($("input[name='totalCost1']").val()),
                        customer_uid:$("input[name='order_user_name']").val()+new Date().getTime(),
                        buyer_name:$("input[name='order_user_name']").val(),
                        buyer_tel:$("input[name='phoneNumber1']").val(),
                    }, function(rsp){//callback
                        if(rsp.success){//결제 성공 시 로직
                            console.log('빌링키 발급 성공', rsp);
                            alert('결제가 완료되었습니다. 주문 내역으로 이동합니다.');

                            orderProcess();

                        }else{// 결제 실패 시 로직
                            var msg='결제에 실패하였습니다. 다시 시도해주세요!';
                            alert(msg);
                            return false;
                        }
                    });
                }else{//무통장입금 선택시 -> 자동 결제 되는 식으로
                    $("#payMethod").val('무통장입금');
                    orderProcess();
                }
            }else{
                alert("결제 수단을 선택해주세요!");
            }

        }

        function orderProcess(){

            // 운송장 번호 랜덤 추출(같은 자리수)
            function randomNum (lower, upper) {
                return Math.floor(Math.random() * (upper - lower + 1)) + lower;
            }
            let invoiceNum=randomNum (1000000000, 9999999999);


            //적립금
            var total_price=$("input[name='totalCost1']").val();
            var point1=Math.ceil(parseInt(total_price)*0.05);
            var point2=Math.ceil((parseInt(total_price)*0.05)-parseInt($("input[name='totalUserPoint']").val()));
            var point3=parseInt($("input[name='totalUserPoint']").val());
            console.log(point3);

            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue = "${_csrf.token}";

            let basket_list=[];
            let product_list=[];

            let opData=[];
            for(var i=0; i< parseInt($("input[name='basketListLength']").val()); ++i){
                basket_list.push($("input[name='" + 'baCount'+String(i) + "']").val());
                product_list.push($("input[name='" + 'prSeq'+String(i) + "']").val())
            }
            console.log(basket_list, product_list);

            var orderData={
                //orderVO
                user_point:point2,// 업데이트될 포인트 금액
                point: point1,// 적립된 포인트(총 결제금액의 5% 적립)
                status: '주문접수', //준비중
                userName: $("input[name='order_user_name']").val(), //보내시는 분
                userNumber:$("input[name='phoneNumber1']").val(),
                delivery:$("input[name='order_delivery1']").val(), //상세주소
                invoice:invoiceNum, //랜덤으로 주기
                totalCost:total_price,
                message:$("input[name='order_message']").val(),
                //productVO
                product_seq:$("input[name='product_seq']").val(),
                user_deposit:$("input[name='totalDepositPoint']").val(),
                "basket_list":basket_list,
                "product_list":product_list,
                coupon_seq:$("input[name='couponName']:checked").val(),
                receiveName:$("input[name='receiveName']").val(),
                order_method:$("input[name='payMethod']").val(),
                point_cost:point3,
                deposit_cost:$("input[name='totalDepositPoint']").val(),
                order_coupon_seq:$("input[name='couponName']:checked").val()
            };

            console.log(orderData);

            $.ajax({
                url: '${contextPath}/order/orderComplete',
                type:'post',
                data:orderData,
                dataType: 'text',
                beforeSend:function (xhr){
                    xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                },
                success:function(data){
                    alert("주문이 완료되었습니다. 결제 완료 페이지로 넘어갑니다!");
                    location.href='${contextPath}/order/od/'+data;

                },
                error: function (request,status,error) {
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            })
        }
    </script>
    <script type="text/javascript">
        // TODO: 체크버튼이 클릭 되어있을 때 값을 다시 계산해주는 식으로 전송: DB 연동으로 검사
        // checkbox name
        // 적립금: resPoint
        // 예치금: depoistPoint
        // 쿠폰: couponCheck
        // total= total-respoint+depositPoint-couponCheck //check안되어있을 시 0으로 간주하고 계산
        // 적립금, 예치금 화면에 띄우기, check안되어있을 때는 초기값으로 설정.
        var couponSeq=0;
        var discountCost=0;
        var totalCost=parseInt($("input[name='totalPrice']").val());
        $("#couponSelectorBtn").on("click", function(){

            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue = "${_csrf.token}";
            //할인 값 가져오는 ajax
            $.ajax({
                type:'POST',
                dataType:'text',
                data:{
                    couponSeq:$("input[name='couponName']:checked").val()
                },
                url:'${contextPath}/order/couponInfo',
                beforeSend:function (xhr){
                    xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
                },
                success:function(discount){
                    console.log('쿠폰 할인가격: ', parseInt(discount));
                    discount=parseInt(discount);
                    //가격 할인
                    if(discount>100){
                        totalCost=parseInt(totalCost)

                        var discount1=$("input[name='totalUserPoint']").val();
                        var discount2=$("input[name='totalDepositPoint']").val();

                        totalCost=totalCost-parseInt(discount1)-parseInt(discount2)-discount;
                        if(totalCost<0){
                            alert("할인 금액이 결제할 금액보다 큽니다!");
                            return;
                        }
                        $("#couponDiscount").val(discount);
                        $("#totalCouponPoint").val(discount);
                        $("#totalCost1").val(totalCost);
                    }else{//비율 할인
                        var ratioCost=parseInt(totalCost)*(discount/100);
                        totalCost=totalCost-parseInt(discount1)-parseInt(discount2)-ratioCost;
                        if(totalCost<0){
                            alert("할인 금액이 결제할 금액보다 큽니다!");
                            return;
                        }
                        $("#couponDiscount").val(ratioCost);
                        $("#totalCouponPoint").val(ratioCost);
                        $("#totalCost").val(totalCost);
                    }
                    $('#pec007').modal().hide();
                },
                error:function(){
                    alert('쿠폰을 적용하지 못합니다.');
                }
            });
        });
    </script>

</main>
<script type="text/javascript">
    function openAddressListPup(){
        var url="/user/openAddressListPup";
        var popName="addressListPopUp"
        var popOption="height=616, width=800, fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
        window.open(url, popName, popOption);
    }

    function gfn_appendComma(nNumber,nDetail) {
        if (nNumber == null)    return "";
        if (nDetail == null)    nDetail = 0;

        nNumber             = parseFloat(nNumber);
        nNumber             = Math.round(nNumber, nDetail);

        var strNumber       = new String(nNumber);
        var arrNumber       = strNumber.split(".");
        var strFormatNum    = "";
        var j = 0;

        for (var i = arrNumber[0].length - 1; i >= 0; i--) {
            if (i != strNumber.length && j == 3) {
                strFormatNum = arrNumber[0].charAt(i) + "," + strFormatNum;
                j = 0;
            } else {
                strFormatNum = arrNumber[0].charAt(i) + strFormatNum;
            }
            j++;
        }

        if (arrNumber.length > 1)   strFormatNum = strFormatNum + "." + arrNumber[1];

        return strFormatNum;
    }

    function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                $("[name=zipcode]").val(data.zonecode);
                $("[name=order_delivery1]").val(fullRoadAddr);
                /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
        }).open();
    }

    function addNewAddress(){

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        $.ajax({
            type: 'post',
            data:{
                user_address_address1: $("input[name='zipcode']").val(),
                user_address_address2:$("input[name='order_delivery1']").val(),
                user_address_address3:$("input[name='order_delivery2']").val(),
                user_address_name:$("input[name='receiveName']").val(),
                user_address_phone_num:$("input[name='phoneNumber1']").val(),
                basic_address:0
            },
            url: '${contextPath}/user/addNewAddress',
            beforeSend:function (xhr){
                xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
            },
            success:function (res){
                alert("새로운 배송지가 등록되었습니다!")
            },
            error:function (){
                alert("error");
            }

        });


    }

</script>

<script type="text/javascript">
    function applyCopnDc() {
        isAutoDcing = true;
        if ( $("input[name=copnDcAply]").prop("checked") ) {
            var recommandDisc = new Array();
            recommandDisc.push("00003560|2137894734|00002|0|1|10|1|0||0|03|40|N");
            var plusDisc = new Array();
            if ( recommandDisc.length > 0 ) {
                for(var i = 0; i < recommandDisc.length; i++) {
                    $("input[value='"+recommandDisc[i]+"']").prop("checked", true);
                    selectCopn($("input[value='"+recommandDisc[i]+"']").parents("div.coupon-list").find("input[name=copnInf]").attr("id"),"N");
                }
            }
            if ( plusDisc.length > 0 ) {
                for(var i = 0; i < plusDisc.length; i++) {
                    $("input[value='"+plusDisc[i]+"']").prop("checked", true);
                    selectCopn($("input[value='"+plusDisc[i]+"']").parents("div.coupon-list").find("input[name=copnInf]").attr("id"),"N");
                }
            }
            // 무료배송 쿠폰
            //pop-freeDlvCopnLayer
            var aplyDlvCopnArr = new Array();
            if($("div.pop-freeDlvCopnLayer").length > 0) {
                var aArr = new Array();
                $("div.pop-freeDlvCopnLayer").each(function() {
                    var dlvCost = $(this).find("input[name='dcPrice']").val();
                    var slitmCd = $(this).find("input[name='slitmCd']").val();
                    aArr.push(dlvCost + "|" + slitmCd);
                });
                var bArr = new Array();
                var rnk = aArr.length;
                for (var i = 0; i < aArr.length; i++) {
                    rnk = 1;
                    for (var j = 0; j < aArr.length; j++) {
                        if (parseFloat(aArr[i].split("|")[0]) < parseFloat(aArr[j].split("|")[0])) rnk++;
                    }
                    for (var j = 0; j < bArr.length; j++) {
                        if (bArr[j].split("|")[2] == rnk) rnk++;
                    }
                    bArr[i] = aArr[i] + "|" + rnk;
                }
                // 랭킹순서로 적용
                for (var j = 0; j < bArr.length; j++) {
                    for (var i = 0; i < bArr.length; i++) {
                        if ((j+1) == bArr[i].split("|")[2]) {
                            var slitmCd = bArr[i].split("|")[1];
                            $("div.pop-freeDlvCopnLayer").each(function() {
                                var defSlitmCd = $(this).find("input[name='slitmCd']").val();
                                if (slitmCd == defSlitmCd) {
                                    // 옵션 루프
                                    // 가능쿠폰만 옵션에 들어가 있으므로 하나씩 적용
                                    var isSelected = false;
                                    var checkedName = "";
                                    $(this).find("input[name^='freeDlvCopn']").each(function() {
                                        if (!isEmpty($(this).val()) && !isEmpty($(this).val().split("|")[0])) {
                                            var curCopn = $(this).val().split("|")[1];
                                            var isDup = false;
                                            for (var k = 0; k < aplyDlvCopnArr.length; k++) {
                                                var chkCopn = aplyDlvCopnArr[k];
                                                if (curCopn == chkCopn) {
                                                    isDup = true;
                                                }
                                            }
                                            if (!isDup) {
                                                aplyDlvCopnArr.push(curCopn);
                                                isSelected = true;
                                                $(this).prop("checked", true);
                                                checkedName = $(this).attr("name");
                                                return false;
                                            }
                                        }
                                    });
                                    if (isSelected) {
                                        selectDlvCopnBtn(checkedName);
                                    }
                                }
                            });
                        }
                    }
                }
            }
            // 결제금액할인쿠폰
            if($("input[name='paymentCopnInf']").length > 0 && $("input[name='selPaymentCopn']").length > 0) {
                var isDisabled = $("#stlmAmtCopnDcDiv").css("display");
                if(isDisabled != "none") {
                    var calDcAmtArr = new Array();
                    var maxDcAmt = 1000;
                    $("input[name='selPaymentCopn']").each(function(index) {
                        if($(this).parents(".coupon-box").css("display") != "none"
                            && $(this).parents(".coupon").css("display") != "none"
                            && !$(this).prop("disabled") && !isEmpty($(this).val())) {
                            $(this).prop("checked", true);
                            selectPaymentCopn();
                            // selectPaymentCopn에서 쿠폰 금액체크시 해제되는 케이스가 발생하여 쿠폰체크상태를 확인하고 진행한다.
                            if ( !isEmpty($(this).val()) && $(this).prop("checked") ) {
                                var maxCopnData = $(this).val().split("|")[0];
                                var tmpTotDcAmtCalc = Number($("input[name='orderAmt']:last").val()) - Number($("input[name=totDcAmtCalc]").val());
                                if (tmpTotDcAmtCalc >= maxDcAmt) {
                                    calDcAmtArr.push($("input[name=totDcAmtCalc]").val() + "|" + index + "|" + maxCopnData);
                                } else {
                                    $(this).remove();
                                }
                            }
                        }
                    });
                    if(calDcAmtArr.length > 0){
                        $("input[name='selPaymentCopn']:eq(0)").prop("checked", true);
                        selectPaymentCopn();
                        var tmpTotDcAmtArray = new Array();
                        for(var i = 0; i < calDcAmtArr.length; i++) {
                            var totDcAmtCalc = calDcAmtArr[i].split("|")[0];
                            var arrayIndex = i < 10 ? "0" + i : String(i);
                            tmpTotDcAmtArray.push(totDcAmtCalc + arrayIndex);
                        }
                        var maxIndexVal = String(Math.max.apply(null, tmpTotDcAmtArray));
                        var maxIndex = Number(maxIndexVal.substring(maxIndexVal.length -2, maxIndexVal.length));
                        var eqIndex = calDcAmtArr[maxIndex].split("|")[1];
                        $("input[name='selPaymentCopn']:eq("+eqIndex+")").prop("checked", true);
                        selectPaymentCopn();
                        // selectPaymentCopn(chkPlcc);
                        // var chkHppCoup = $("input[name='selPaymentCopn']:eq("+eqIndex+")").val().split("|")[9];
                        // if(!isEmpty(chkHppCoup)){
                        //     if(chkHppCoup == "B5" || chkHppCoup == "B7") {
                        //         $("input[name='payment-type'][value='31']").prop("checked", true);
                        //     }
                        //     if(chkHppCoup == "B6"){
                        //         $("input[name='payment-type'][value='32']").prop("checked", true);
                        //     }
                        // }else{
                        //     $("input[name='payment-type'][value='31']").prop("checked", true);
                        // }
                    }
                }
            }
        } else {
            $("div[id^=plusCopn]").each(function(){
                $(this).find("input[type=radio]").eq(0).prop("checked", true);
                selectCopn($(this).find("input[type=radio]").eq(0).parents("div.coupon-list").find("input[name=copnInf]").attr("id"),"N");
            });
            $("div[id^=gnrlCopn]").each(function(){
                $(this).find("input[type=radio]").eq(0).prop("checked", true);
                selectCopn($(this).find("input[type=radio]").eq(0).parents("div.coupon-list").find("input[name=copnInf]").attr("id"),"N");
            });
            $("div.pop-freeDlvCopnLayer").each(function(){
                $(this).find("input[type=radio]").eq(0).prop("checked", true);
                selectDlvCopnBtn($(this).find("input[type=radio]").eq(0).parents("div.coupon-box").find("input[name^=freeDlvCopn]").attr("name"));
            });
            $("div#paymentCopn_layer").each(function(){
                $(this).find("input[type=radio]").eq(0).prop("checked", true);
                selectPaymentCopn();
            });
        }
        aplyCopn();
        isAutoDcing = false;
        // if(window["firstCk"] == null){
        //     setTimeout(gotoPlcc,500);
        //     window["firstCk"] = 1;
        // }else{
        //     gotoPlcc();selPaymentCopn
        // }
        cardCalculate();
    }
</script>
