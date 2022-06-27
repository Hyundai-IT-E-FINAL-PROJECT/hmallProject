<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오후 1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="application/ld+json">
        {
            "@context": "http://schema.org",
            "@type": "Organization",
            "name": "hmall",
            "url": "https://www.hmall.com",
            "sameAs": [
                "https://www.facebook.com/hyundaiHmall",
                "https://www.youtube.com/c/%ED%9B%85%ED%8B%B0%EB%B9%84",
                "https://www.instagram.com/hyundai.homeshopping/",
                "https://itunes.apple.com/kr/app/id870397981",
                "https://play.google.com/store/apps/details?id=com.hmallapp&hl=ko",
                "http://myhmall.tistory.com"
            ]
        }
    </script>


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



                var ecommerce_hit = new Object();
                ecommerce_hit[GAHitKey.NonInteraction] = '1';
                ecommerce_hit[GAHitKey.currencyCode] = 'KRW';



                ecommerce_hit[GACustomKey.Metric1] = 0;

                ecommerce_hit[GACustomKey.Metric2] = 0;


                ecommerce_hit['dimension74'] = '';
                ecommerce_hit['dimension75'] = '';



                var action_obj = new Object();
                action_obj[GAActionFieldKey.TransactionID]='';
                action_obj[GAActionFieldKey.TransactionRevenue]='0';
                action_obj[GAActionFieldKey.TransactionShipping]='0';

                action_obj[GAActionFieldKey.TransactionCouponCode]='';







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
            GA_info[GACustomKey.Dimension8] = "20220527";
            GA_info[GACustomKey.Dimension9] = "20220527";

            var _gaid = getCookieGA('GAID');
            if(_gaid != null){GA_info[GACustomKey.Dimension11] = _gaid;}

            GA_info[GACustomKey.Dimension12] = "Y";
            GA_info[GACustomKey.Dimension24] = "";


            GA_info[GACustomKey.Dimension13] = "U";
            GA_info[GACustomKey.Dimension14] = "U";
            GA_info[GACustomKey.Dimension15] = "실버";

            GA_info[GACustomKey.Dimension22] = "기타";

            GA_info[GACustomKey.Dimension25] = "20220521";

            GA_info[GACustomKey.Dimension27] = "20220521";
            GA_info[GACustomKey.Dimension28] = "20220527";

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
    <!-- Google analytics end -->

    <script>

        $.fn.size = function() {
            return this.length;
        }

        /**
         * 팝업 관련  함수(아래 링크를 참고하고 있음)
         * as-is https://image.hmall.com/pc/js/hmall/co/common.js
         * serverHost indexof local이 없어 추가-> 추후 as-is js 생성 필요
         * 2020.09.21 http -> https 로 던지도록 변경
         */
        document.domain = "hmall.com";
        var locationHref = document.location.href;
        var imageServer = "https://image.hmall.com";
        var serverHost = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
        var serverHostForSSL = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local")>0) ? "https://" + location.host : "https://www.hmall.com";
        var switch_serverHost;

        if (locationHref.indexOf("https") > -1) {
            switch_serverHost = serverHostForSSL;
            imageServer = "https://image.hmall.com";
        } else if (locationHref.indexOf("http") > -1) {
            switch_serverHost = serverHost;
            imageServer = "https://image.hmall.com";
        }



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
            // $("body").prepend('hello new UI');

            //GA 맞춤측정 데이터 전송 및 클릭이벤트 초기화
            console.log("setDimension and useWindload 호출");
            setDimension();
            useWinload();

        });


        // GNB - 바로가기 링크
        function setQuicklink(jsonData){
            var _data = jsonData;
            var _html = "";

            $(_data).each(function(_idx){
                var _label = this.dispNm.toString();
                var _dispUrl = this.dispUrl.toString();
                var _item = "";

                if(_idx == 0) _item = "<li class='first'>";
                else _item = "<li>";

                var _bizParam = _dispUrl.indexOf("?") >= 0 ? "&_IC_=tab"+(_idx+1) : "?_IC_=tab"+(_idx+1);

                _item += "<a href='" + _dispUrl + _bizParam + "' class='gp_className' ga-category='메인 홈' ga-action='상단탭' ga-label='" + _label + "'>" + _label + "</a>" + "</li>";

                _html += _item;
            });

            $('.quicklink.ql-left').empty().append(_html);
        }
        /*
            function gaTagging(obj_GA, msg1, msg2, msg3){
                location.href = msg1;
            }
        */
        function getClickUrl(url){
            if(url == ''){
                return false;
            }else{
                document.location.href = url;

            }
        }

    </script>

    <!-- includeScript -->
    <!-- Main Contents css = Contents css부분은 각페이지마다 다르게 해당되는 css가 호출 됨(폴더 구조별)  -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/cc/customer.css">
    <script type="text/javascript">

        function goListPage(month){
            var condText = $("input[name='condText']").val();
            this.location.href = '/p/cce/selectCustBoardPup.do?month=' + month + '&condText=' + condText;
        }

        function openCustBoardTypeChoice(){
            if(isLogin() == 'true'){
                var url = "/p/cce/openCustBoardTypeChoicePup.do";
                var popName = "openCustBoardTypeChoicePup";
                var popOption = "height=355, width=589, fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                window.open(url,popName,popOption);

                opener.location.reload();
            }else{
                openLoginPopup("custBoardChoice");
            }
        }


        function editCustBoardOrd(){
            location.href="/p/cce/custBoardOrdListPup.do?month=1";
        }


        function editCustBoardEtc(){
            //parent.windowResizeTo(775, 635);
            location.href="/p/cce/custBoardFormPup.do";
        }

        function doDtlViewCheckBefore(cnslAcptNo, cnslAcptSeq, page, condText, scretAtclYn, writerCustNo){

            if(scretAtclYn == 'N'){
                doDtlViewCheckDoPost(cnslAcptNo, cnslAcptSeq, page, condText, scretAtclYn, writerCustNo);
            }else{
                if(isLogin() == 'true'){
                    var curCustNo = '202205302469';
                    if(writerCustNo == curCustNo){
                        doDtlViewCheckDoPost(cnslAcptNo, cnslAcptSeq, page, condText, scretAtclYn, writerCustNo);
                    }else{
                        alert("비밀글은 글쓴이만 볼수있습니다.");
                    }
                }else{
                    alert("비밀글은 글쓴이만 볼수있습니다.");
                }
            }

        }

        function doDtlViewCheckDoPost(cnslAcptNo, cnslAcptSeq, page, condText, scretAtclYn, writerCustNo){

            $(DtlViewCheckDoPostForm).find("input[name='cnslAcptNo']").val(cnslAcptNo);
            $(DtlViewCheckDoPostForm).find("input[name='cnslAcptSeq']").val(cnslAcptSeq);
            $(DtlViewCheckDoPostForm).find("input[name='page']").val(page);
            $(DtlViewCheckDoPostForm).find("input[name='condText']").val(condText);
            $(DtlViewCheckDoPostForm).find("input[name='scretAtclYn']").val(scretAtclYn);
            $(DtlViewCheckDoPostForm).find("input[name='custNo']").val(writerCustNo);


            document.getElementById("DtlViewCheckDoPostForm").action="/p/cce/viewCustBoardDtl.do";
            document.getElementById("DtlViewCheckDoPostForm").method="post";
            document.getElementById("DtlViewCheckDoPostForm").submit();

        }



    </script>
    <meta http-equiv="origin-trial" content="A9wkrvp9y21k30U9lU7MJMjBj4USjLrGwV+Z8zO3J3ZBH139DOnCv3XLK2Ii40S94HG1SZ/Zeg2GSHOD3wlWngYAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjYxMjk5MTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/1066206974/?random=1653628431299&amp;cv=9&amp;fst=1653628431299&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;eid=376635470&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=1&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5p1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fcce%2FselectCustBoardPup.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fcca%2Fmain.do&amp;tiba=%EA%B3%A0%EA%B0%9D%EC%84%BC%ED%84%B0%20%EA%B3%A0%EA%B0%9D%EC%9D%98%EA%B2%AC%EC%83%81%EC%84%B8%20%EC%A3%BC%EB%AC%B8%20%EC%9D%98%EA%B2%AC&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script><meta http-equiv="origin-trial" content="A9wkrvp9y21k30U9lU7MJMjBj4USjLrGwV+Z8zO3J3ZBH139DOnCv3XLK2Ii40S94HG1SZ/Zeg2GSHOD3wlWngYAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjYxMjk5MTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/937000404/?random=1653628431321&amp;cv=9&amp;fst=1653628431321&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;eid=376635471&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=1&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5p1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fcce%2FselectCustBoardPup.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fcca%2Fmain.do&amp;tiba=%EA%B3%A0%EA%B0%9D%EC%84%BC%ED%84%B0%20%EA%B3%A0%EA%B0%9D%EC%9D%98%EA%B2%AC%EC%83%81%EC%84%B8%20%EC%A3%BC%EB%AC%B8%20%EC%9D%98%EA%B2%AC&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script></head>
<body id="popWin" class="vsc-initialized">
<!--윈도우팝업(새창으로열기) LNB 고객의 의견 클릭 시 윈도우 팝업 // 20200825 script 요청드림-->
<!--popup-win : 윈도우 팝업일 경우 // width:929px , min-height:482px, height:800px (높이값은 popup-win 뒤의 클래스마다 변경) -->
<div class="popup-win wd880 cus-opinion"> <!--20200828 금요일 pc레이아웃 공통작업 wd880 클래스 추가-->
    <!--pop-wrap-->
    <div class="pop-wrap" tabindex="0">
        <!--pop-content-wrap-->
        <div class="pop-content-wrap">
            <strong class="pop-title">주문내역 조회</strong>
            <!--pop-content-->
            <div class="pop-content">
                <div class="content">
                    <!--tabgroup-->
                    <div class="tabgroup tab-bottom">
                        <div class="tab-content">
                            <!--allNoti-->
                            <div role="tabpanel" class="tab-pane ui-active" id="allNoti">
                                <!--box-type-->
                                <div class="box-type" style="margin-bottom: 10px;}">
                                    <!--dotlist-->
                                    <ul class="dotlist">
                                        <li>문의하실 주문을 선택하시고 확인 버튼을 눌러주세요.</li>
                                    </ul>
                                </div>
                                <!--//box-type-->
                                <!--search-form-->
<%--                                <div class="search-form">--%>
<%--                                    <p>--%>

<%--                                    </p>--%>
<%--                                    <!--search-area-->--%>
<%--                                    <form action="/p/cce/selectCustBoardPup.do" method="post" name="custBoardSchForm">--%>
<%--                                        <div class="search-area">--%>
<%--                                            <!--search-term--> <!--20200828 금요일 추후 라디오박스 형태로 변경 예정-->--%>
<%--                                            <div class="search-term">--%>
<%--                                                <a href="javascript:;" onclick="goListPage('1');" class="termmonth active">1개월</a>--%>
<%--                                                <a href="javascript:;" onclick="goListPage('3');" class="term ">3개월</a>--%>
<%--                                                <a href="javascript:;" onclick="goListPage('4');" class="term ">12개월</a>--%>
<%--                                                <a href="javascript:;" onclick="goListPage('A');" class="all ">전체보기</a>--%>
<%--                                                <input type="hidden" name="month" value="1">--%>
<%--                                            </div>--%>
<%--                                            <!--//search-term-->--%>
<%--                                            <!--field-->--%>
<%--&lt;%&ndash;                                            <div class="field">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <!--selectbox-->&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="selectwrap"><div class="custom-selectbox" data-modules-selectbox="">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <select>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="" selected="selected">분류를 선택하세요</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="02">상품</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="03">결제</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="04">취소/교환/반품/AS</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="05">배송/회수</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="06">사고</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <option value="07">서비스시스템</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="ui-label"><a href="#1">분류를 선택하세요</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">분류를 선택하세요</a></li><li><a href="#2">상품</a></li><li><a href="#3">결제</a></li><li><a href="#4">취소/교환/반품/AS</a></li><li><a href="#5">배송/회수</a></li><li><a href="#6">사고</a></li><li><a href="#7">서비스시스템</a></li></ul></div></div></div></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <!--//selectbox-->&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <!--검색창-->&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <div class="inputbox">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <label class="inplabel icon-find"><input type="text" name="condText" value="" placeholder="입력하세요"></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <button class="btn btn-find"><i class="icon find"></i><span class="hiding">검색</span></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <button class="btn ico-clearabled"><span class="hiding">지우기</span></button>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </div>&ndash;%&gt;--%>
<%--                                                <!--//검색창-->--%>
<%--                                                <!--20200828 금요일 새창으로 열기 글쓰기 버튼 클릭 시 유형선택 팝업 노출 PJD005 // width, height 값 -->--%>
<%--                                                <button class="btn btn-default small34" onclick="openCustBoardTypeChoice();"><span>조회</span></button>--%>
<%--                                            </div>--%>
<%--                                            <!--//field-->--%>
<%--                                        </div>--%>
<%--                                    </form>--%>
                                    <!--//search-area-->
                                </div>
                                <!--//search-form-->
                                <!--board-->
                                <div class="board">
                                    <!--table-->
                                    <div class="tblwrap">
                                        <table>
                                            <caption>주문내역 테이블</caption>
                                            <colgroup>
                                                <col style="width:60px">
                                                <col style="width:150px">
                                                <col style="width:400px">
                                                <col style="width:115px">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">선택</th>
                                                <th scope="col">주문번호</th>
                                                <th scope="col">상품명</th>
                                                <th scope="col">결제금액</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${userOrderList}" var="orderProduct">
                                                <tr>
                                                    <td>
                                                        <input type="radio" id="order_seq" name="order_seq" value="${orderProduct.ORDER_SEQ}" />
<%--                                                        <input type="hidden" id="order_seq" name="order_seq" value="${orderProduct.ORDER_SEQ}" />--%>
                                                    </td>
<%--                                                    <input type="hidden" id="product_seq" name="product_seq" value="${orderProduct.product_seq}" />--%>
                                                    <td class="txt-center">${orderProduct.ORDER_SEQ}</td>
                                                    <td class="txt-left nowrap">
                                                            ${orderProduct.PRODUCT_NAME}
                                                    </td>
                                                    <td class="txt-center">${orderProduct.ORDER_TOTAL_COST}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            <div style="display: flex;justify-content: center;margin-top: 20px;">
                                <button class="btn btn-default small34" onclick="closePopup();"><span>확인</span></button>
                            </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="myNoti">
                            </div>
                        </div>

                        <!--//Tab panes -->
                    </div>
                    <!--//tabgroup-->
                </div>
            </div>
            <!--//pop-content-->
        </div>
        <!--//pop-content-wrap-->
    </div>
    <!--//pop-wrap-->
</div>
<!--popup-win-->
<!--//윈도우팝업 1:1 상담신청-->
<script type="text/javascript">
    function closePopup(){

        var order_seq=$("input[name='order_seq']:checked").val();

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        //주문번호, 상품코드, 옵션 코드 가져오기, 데이터만 가져오기.
        $.ajax({
            url:"getProductInfo",
            type:"get",
            dataType : "json",
            contentType : 'application/json; charset=UTF-8',
            data: {
                order_seq: order_seq
            },
            beforeSend:function (xhr){
                xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
            },
            success:function (info){
                //부모창에 값 전달
                console.log(info);
                opener.document.getElementById("order_seq").value=info["ORDER_SEQ"];
                opener.document.getElementById("product_code").value=info["PRODUCT_CODE"];
                window.close();
            },
            error:function(request,status,error){
                alert("문의할 상품을 선택해주세요!");
            }
        });
    }

</script>

<iframe src="https://bid.g.doubleclick.net/xbbe/pixel?d=KAE" style="display: none;"></iframe>