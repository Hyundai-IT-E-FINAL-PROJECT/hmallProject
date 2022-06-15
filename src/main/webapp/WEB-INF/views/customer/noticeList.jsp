<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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

    <link rel="shortcut icon" href="https://www.hmall.com/favicon.ico">
    <!-- UI/UX Style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/layout.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/popup.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/search.css">
    <style>
        .hidden {display:none !important;}
    </style>
    <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
    <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
    <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
    <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
    <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
    <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
    <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
    <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

    <!-- Google analytics -->
    <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052701"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052701"></script>



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
            GA_info[GACustomKey.Dimension8] = "20220526";
            GA_info[GACustomKey.Dimension9] = "20220526";

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
            GA_info[GACustomKey.Dimension28] = "20220526";

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
    <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/cc/customer.css">
    <script type="text/javascript">
        //쇼핑가이드
        function shopGuidePup(){
            var url = "https://www.hmall.com/html/shop/Guide_order_trouble.html";
            var popName = "shopGuidePup";
            var popOption = "height=700, width=990, fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
            window.open(url,popName,popOption);
        }
        //1:1 상담
        function openCnslAcptPup(obj){
            if(isLogin() == 'true'){
                var url = "/p/ccd/selectCnslAcptPup.do?cnslCsfCd=" + obj;
                if(isEmpty(obj)){
                    url = "/p/ccd/selectCnslAcptPup.do";
                }
                var popName = "selectCnslAcptPup";
                var popOption = "height=316, width=800, fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                window.open(url,popName,popOption);
            }else{
                openLoginPopup();
            }
        }
    </script>
    <meta http-equiv="origin-trial" content="A9wkrvp9y21k30U9lU7MJMjBj4USjLrGwV+Z8zO3J3ZBH139DOnCv3XLK2Ii40S94HG1SZ/Zeg2GSHOD3wlWngYAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjYxMjk5MTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/1066206974/?random=1653584355880&amp;cv=9&amp;fst=1653584355880&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=20&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5n0&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;tiba=%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20-%20%ED%98%84%EB%8C%80Hmall&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script><meta http-equiv="origin-trial" content="A9wkrvp9y21k30U9lU7MJMjBj4USjLrGwV+Z8zO3J3ZBH139DOnCv3XLK2Ii40S94HG1SZ/Zeg2GSHOD3wlWngYAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjYxMjk5MTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/1066206974/?random=1653584356066&amp;cv=9&amp;fst=1653584356066&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=20&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5n0&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;tiba=%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20-%20%ED%98%84%EB%8C%80Hmall&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/937000404/?random=1653584356144&amp;cv=9&amp;fst=1653584356144&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=20&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5n0&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;tiba=%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20-%20%ED%98%84%EB%8C%80Hmall&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/937000404/?random=1653584356150&amp;cv=9&amp;fst=1653584356150&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=20&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5n0&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccb%2FnoticeList.do&amp;tiba=%EA%B3%B5%EC%A7%80%EC%82%AC%ED%95%AD%20-%20%ED%98%84%EB%8C%80Hmall&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script><style type="text/css" data-fbcssmodules="css:fb.css.base css:fb.css.dialog css:fb.css.iframewidget css:fb.css.customer_chat_plugin_iframe">.fb_hidden{position:absolute;top:-10000px;z-index:10001}.fb_reposition{overflow:hidden;position:relative}.fb_invisible{display:none}.fb_reset{background:none;border:0;border-spacing:0;color:#000;cursor:auto;direction:ltr;font-family:"lucida grande", tahoma, verdana, arial, sans-serif;font-size:11px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:1;margin:0;overflow:visible;padding:0;text-align:left;text-decoration:none;text-indent:0;text-shadow:none;text-transform:none;visibility:visible;white-space:normal;word-spacing:normal}.fb_reset>div{overflow:hidden}@keyframes fb_transform{from{opacity:0;transform:scale(.95)}to{opacity:1;transform:scale(1)}}.fb_animate{animation:fb_transform .3s forwards}
.fb_dialog{background:rgba(82, 82, 82, .7);position:absolute;top:-10000px;z-index:10001}.fb_dialog_advanced{border-radius:8px;padding:10px}.fb_dialog_content{background:#fff;color:#373737}.fb_dialog_close_icon{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;cursor:pointer;display:block;height:15px;position:absolute;right:18px;top:17px;width:15px}.fb_dialog_mobile .fb_dialog_close_icon{left:5px;right:auto;top:5px}.fb_dialog_padding{background-color:transparent;position:absolute;width:1px;z-index:-1}.fb_dialog_close_icon:hover{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent}.fb_dialog_close_icon:active{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent}.fb_dialog_iframe{line-height:0}.fb_dialog_content .dialog_title{background:#6d84b4;border:1px solid #365899;color:#fff;font-size:14px;font-weight:bold;margin:0}.fb_dialog_content .dialog_title>span{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;float:left;padding:5px 0 7px 26px}body.fb_hidden{height:100%;left:0;margin:0;overflow:visible;position:absolute;top:-10000px;transform:none;width:100%}.fb_dialog.fb_dialog_mobile.loading{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;min-height:100%;min-width:100%;overflow:hidden;position:absolute;top:0;z-index:10001}.fb_dialog.fb_dialog_mobile.loading.centered{background:none;height:auto;min-height:initial;min-width:initial;width:auto}.fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner{width:100%}.fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content{background:none}.loading.centered #fb_dialog_loader_close{clear:both;color:#fff;display:block;font-size:18px;padding-top:20px}#fb-root #fb_dialog_ipad_overlay{background:rgba(0, 0, 0, .4);bottom:0;left:0;min-height:100%;position:absolute;right:0;top:0;width:100%;z-index:10000}#fb-root #fb_dialog_ipad_overlay.hidden{display:none}.fb_dialog.fb_dialog_mobile.loading iframe{visibility:hidden}.fb_dialog_mobile .fb_dialog_iframe{position:sticky;top:0}.fb_dialog_content .dialog_header{background:linear-gradient(from(#738aba), to(#2c4987));border-bottom:1px solid;border-color:#043b87;box-shadow:white 0 1px 1px -1px inset;color:#fff;font:bold 14px Helvetica, sans-serif;text-overflow:ellipsis;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0;vertical-align:middle;white-space:nowrap}.fb_dialog_content .dialog_header table{height:43px;width:100%}.fb_dialog_content .dialog_header td.header_left{font-size:12px;padding-left:5px;vertical-align:middle;width:60px}.fb_dialog_content .dialog_header td.header_right{font-size:12px;padding-right:5px;vertical-align:middle;width:60px}.fb_dialog_content .touchable_button{background:linear-gradient(from(#4267B2), to(#2a4887));background-clip:padding-box;border:1px solid #29487d;border-radius:3px;display:inline-block;line-height:18px;margin-top:3px;max-width:85px;padding:4px 12px;position:relative}.fb_dialog_content .dialog_header .touchable_button input{background:none;border:none;color:#fff;font:bold 12px Helvetica, sans-serif;margin:2px -12px;padding:2px 6px 3px 6px;text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0}.fb_dialog_content .dialog_header .header_center{color:#fff;font-size:16px;font-weight:bold;line-height:18px;text-align:center;vertical-align:middle}.fb_dialog_content .dialog_content{background:url(https://static.xx.fbcdn.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;border:1px solid #4a4a4a;border-bottom:0;border-top:0;height:150px}.fb_dialog_content .dialog_footer{background:#f5f6f7;border:1px solid #4a4a4a;border-top-color:#ccc;height:40px}#fb_dialog_loader_close{float:left}.fb_dialog.fb_dialog_mobile .fb_dialog_close_icon{visibility:hidden}#fb_dialog_loader_spinner{animation:rotateSpinner 1.2s linear infinite;background-color:transparent;background-image:url(https://static.xx.fbcdn.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);background-position:50% 50%;background-repeat:no-repeat;height:24px;width:24px}@keyframes rotateSpinner{0%{transform:rotate(0deg)}100%{transform:rotate(360deg)}}
.fb_iframe_widget{display:inline-block;position:relative}.fb_iframe_widget span{display:inline-block;position:relative;text-align:justify}.fb_iframe_widget iframe{position:absolute}.fb_iframe_widget_fluid_desktop,.fb_iframe_widget_fluid_desktop span,.fb_iframe_widget_fluid_desktop iframe{max-width:100%}.fb_iframe_widget_fluid_desktop iframe{min-width:220px;position:relative}.fb_iframe_widget_lift{z-index:1}.fb_iframe_widget_fluid{display:inline}.fb_iframe_widget_fluid span{width:100%}
.fb_mpn_mobile_landing_page_slide_out{animation-duration:200ms;animation-name:fb_mpn_landing_page_slide_out;transition-timing-function:ease-in}.fb_mpn_mobile_landing_page_slide_out_from_left{animation-duration:200ms;animation-name:fb_mpn_landing_page_slide_out_from_left;transition-timing-function:ease-in}.fb_mpn_mobile_landing_page_slide_up{animation-duration:500ms;animation-name:fb_mpn_landing_page_slide_up;transition-timing-function:ease-in}.fb_mpn_mobile_bounce_in{animation-duration:300ms;animation-name:fb_mpn_bounce_in;transition-timing-function:ease-in}.fb_mpn_mobile_bounce_out{animation-duration:300ms;animation-name:fb_mpn_bounce_out;transition-timing-function:ease-in}.fb_mpn_mobile_bounce_out_v2{animation-duration:300ms;animation-name:fb_mpn_fade_out;transition-timing-function:ease-in}.fb_customer_chat_bounce_in_v2{animation-duration:300ms;animation-name:fb_bounce_in_v2;transition-timing-function:ease-in}.fb_customer_chat_bounce_in_from_left{animation-duration:300ms;animation-name:fb_bounce_in_from_left;transition-timing-function:ease-in}.fb_customer_chat_bounce_out_v2{animation-duration:300ms;animation-name:fb_bounce_out_v2;transition-timing-function:ease-in}.fb_customer_chat_bounce_out_from_left{animation-duration:300ms;animation-name:fb_bounce_out_from_left;transition-timing-function:ease-in}.fb_invisible_flow{display:inherit;height:0;overflow-x:hidden;width:0}@keyframes fb_mpn_landing_page_slide_out{0%{margin:0 12px;width:100% - 24px}60%{border-radius:18px}100%{border-radius:50%;margin:0 24px;width:60px}}@keyframes fb_mpn_landing_page_slide_out_from_left{0%{left:12px;width:100% - 24px}60%{border-radius:18px}100%{border-radius:50%;left:12px;width:60px}}@keyframes fb_mpn_landing_page_slide_up{0%{bottom:0;opacity:0}100%{bottom:24px;opacity:1}}@keyframes fb_mpn_bounce_in{0%{opacity:.5;top:100%}100%{opacity:1;top:0}}@keyframes fb_mpn_fade_out{0%{bottom:30px;opacity:1}100%{bottom:0;opacity:0}}@keyframes fb_mpn_bounce_out{0%{opacity:1;top:0}100%{opacity:.5;top:100%}}@keyframes fb_bounce_in_v2{0%{opacity:0;transform:scale(0, 0);transform-origin:bottom right}50%{transform:scale(1.03, 1.03);transform-origin:bottom right}100%{opacity:1;transform:scale(1, 1);transform-origin:bottom right}}@keyframes fb_bounce_in_from_left{0%{opacity:0;transform:scale(0, 0);transform-origin:bottom left}50%{transform:scale(1.03, 1.03);transform-origin:bottom left}100%{opacity:1;transform:scale(1, 1);transform-origin:bottom left}}@keyframes fb_bounce_out_v2{0%{opacity:1;transform:scale(1, 1);transform-origin:bottom right}100%{opacity:0;transform:scale(0, 0);transform-origin:bottom right}}@keyframes fb_bounce_out_from_left{0%{opacity:1;transform:scale(1, 1);transform-origin:bottom left}100%{opacity:0;transform:scale(0, 0);transform-origin:bottom left}}@keyframes slideInFromBottom{0%{opacity:.1;transform:translateY(100%)}100%{opacity:1;transform:translateY(0)}}@keyframes slideInFromBottomDelay{0%{opacity:0;transform:translateY(100%)}97%{opacity:0;transform:translateY(100%)}100%{opacity:1;transform:translateY(0)}}</style></head>


    <script type="text/javascript" src="//image.hmall.com/gen/js/searchPopKeyWordList.js?ver=052701"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchADTextList.js?ver=052701" charset="UTF-8"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchADLinkList.js?ver=052701" charset="UTF-8"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchSpecialShopLinkList.js?ver=052701" charset="UTF-8"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchBrndShopLinkList.js?ver=052701" charset="UTF-8"></script>

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
            GA_info[GACustomKey.Dimension8] = "20220526";
            GA_info[GACustomKey.Dimension9] = "20220526";

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
            GA_info[GACustomKey.Dimension28] = "20220526";

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
    <script type="text/javascript" src="//image.hmall.com/gen/js/new_main_data.js?ver=052701" charset="UTF-8"></script>


    <!-- TODO 곽희섭 20170523 통합포인트 추가 -->
    <script type="text/javascript" src="//image.hmall.com/p/js/cu/SsoAjax.js?version=1"></script>

    <script type="text/javascript">
        var serverHost       = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
        var serverHostForSSL = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";

        /* TODO 곽희섭 20170524 통합포인트 추가 */
        var ssoAuthYn       = "";
        var ssoAuthCd       = "";
        var upntCustNoEnc   = "";
        var mcustNo         = ""; //TODO 곽희섭 20170804 통합멤버십 회원 코드
        var custNo          = "202205302469"; //TODO 곽희섭 20170810 회원코드
        var upntCustYn      = "N"; // 통멤회원여부
        var vipYn           = ""; // VIP여부(다이아몬드)

        var gv_gnbHomeBnnrTitl = "";
        var gv_gnbHomeBnnrLinkUrl = "";
        var gv_gnbSearchADTextList = []; //bnnrImflNm, bnnrLinkUrl

        var ieDownloadLink="https://support.microsoft.com/ko-kr/topic/internet-explorer-%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%ED%95%98%EA%B8%B0-d49e1f0d-571c-9a7b-d97e-be248806ca70?fbclid=IwAR3yzDW3KiiUHFqdlLmC600TNwd-mO9j81tb50j34SiKLL9O6QEGSGPi3Bg#ID0EBBD=Windows_7";
        var chromeDownloadLink = "https://www.google.com/intl/ko/chrome/";


        function fnSso() {
            gfnSsoInit();
            gfnSsoReqAjax(fnSsoCallback1);
        }

        function fnSsoCallback1(data) {
            console.log("fnSsoCallback1.data:" + data);
            document.cookie = "SSOTOKENYN=; Max-Age=0"; // 토큰발급 여부 초기화

            var currUrl = location.href;
            if (currUrl.indexOf("upntBindingLogin") > 0) {
                // 최초 H.point 로그인 이후 H.point 연결안되어 있으면 stop.(as-is 는 header 없는 페이지라..)
                return;
            }
            if(data.succYn == "Y" && data.mcustNo != "") {
                var redirectUrl = 'https://www.hmall.com/p/cob/upntGateSsoPage.do?upntFlag=Y&mcustkey='+data.mcustNo;
                mcustNo = data.mcustNo;
                window.location.href=redirectUrl;
            } else {
                var todayDate = new Date();
                todayDate.setDate( todayDate.getDate() + 5/24/60 );
                document.cookie = "SSOAUTHYN=N; path=/; domain=.hmall.com; expires=" + todayDate.toGMTString() + ";"
            }
        }

        function fnTokn(){
            gfnSsoInit();
            gfnReqSSoToknIssuAjax(upntCustNoEnc, ssoAuthCd,fnSsoTokenCallback);
        }

        function fnSsoTokenCallback(data) {
            console.log(data);
            document.cookie = "SSOTOKENYN=Y;";  // 토큰발급 성공여부 세션쿠키에 저장
        }

        function getCookie(name) {
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
                        return unescape(dc.substring(begin, end));
                    }
                }
            }
            return null;
        }
        $(document).ready(function() {
            if (navigator.userAgent.indexOf("Edge") >= 0) {

            }


            $('header').removeClass('header-wrap');
            $('#content_wrap').css('margin-top','0px');
            //10.31 스크립트에러 발생으로 주석처리 김용우
            //setQuicklink(PCmainTABJson);
            ie11Check();

            //ie11 브라우저 체크
            function ie11Check(){
                /* if($.browser.msie && $.browser.version.split('.')[0] < 11) */
                if (browserVersionCheck !== 'MSIE 5' && browserVersionCheck !== 'MSIE 6' && browserVersionCheck !== 'MSIE 7' && browserVersionCheck !== 'MSIE 8' && browserVersionCheck !== 'MSIE 9' && browserVersionCheck !== 'MSIE 10'){
                }else{
                    console.log('# browser : ' + browserVersionCheck);
                    $('.header').prepend('<div class="top-banner">' +
                        '<div class="browser-update-wrap">' +
                        '<div class="browser-update-in">' +
                        '<div class="notice-text">' +
                        '<p>최신 브라우저로 Hmall을 이용해 주세요.</p>' +
                        '<p>Hmall은 ' +
                        '<strong class="point-red">Chrome 브라우저</strong> 및 ' +
                        '<strong class="point-red">인터넷익스플로러 11</strong> ' +
                        '이상에서 안정적인서비스를 제공합니다.</p>' +
                        '</div>' +
                        '<div class="browser-down">' +
                        '<a href="'+ chromeDownloadLink + '" target="_blank">' +
                        '<img src="//image.hmall.com/p/img/co/ico-chrome.png" alt="크롬">'+
                        '<span class="download-text">최신버전 다운로드</span>' +
                        '</a>' +
                        '<a href="'+ ieDownloadLink + '" target="_blank">' +
                        '<img src="//image.hmall.com/p/img/co/ico-explore.png" alt="익스플로러">'+
                        '<span class="download-text">최신버전 다운로드</span>' +
                        '</a>' +
                        '</div>' +
                        '</div>' +
                        '</div>'
                    );
                }
            }

            //GNB - 바로가기 링크
            function setQuicklink(jsonData){
                var _data = jsonData;
                var _html = "";

                $(_data).each(function(_idx){
                    var _label = this.dispNm.toString();
                    var _dispUrl = this.dispUrl.toString();
                    var _item = "";

                    if(_idx == 0) _item = "<li class='on'>";
                    else _item = "<li>";

                    var _bizParam = _dispUrl.indexOf("?") >= 0 ? "&_IC_=tab"+(_idx+1) : "?_IC_=tab"+(_idx+1);

                    _item += "<a href='" + _dispUrl + _bizParam + "' class='gp_className' ga-category='메인 홈' ga-action='상단탭' ga-label='" + _label + "'>" + _label + "</a>" + "</li>";

                    _html += _item;
                });

                $('.quicklink.ql-left').empty().append(_html);
                var i = $('.quicklink.ql-left li').length;
                var moreHtml = "";
                moreHtml  += "<div class=\"quick-menu-more\"><a href=\"javascript:$('.quick-menu-more').attr('class').indexOf('on') > -1 ? $('.quick-menu-more').removeClass('on') : $('.quick-menu-more').addClass('on');\" class=\"btn-quick-more\">퀵메뉴 더보기</a><div class=\"quick-menu-add\" style=\"z-index: 101;\">";
                while(i<20 && i>7){
                    moreHtml  += $('.quicklink.ql-left li').eq(i-1).html();
                    $('.quicklink.ql-left li').eq(i-1).remove();
                    i--;
                }
                moreHtml  += "</div></div>";
                $('.quick-menu-list').after(moreHtml);
            }



            getPopularSearch();  // 인기검색어
            //searchPopKeyword();  asp매장이 아닐경우만 조회되도록 변경 2017.02.10 jts  no.24830


            /* TODO 곽희섭 20170524 통합포인트 추가 */
            if(custNo == "") {
                if(ssoAuthCd == "") {
                    fnSso();
                }
            }else if(ssoAuthYn == "Y" && upntCustYn == "Y" && custNo != "" && ssoAuthCd != "" && upntCustNoEnc != "" && getCookie("SSOTOKENYN") != "Y"){
                fnTokn();
            }

            $("#del-all-history").bind("click", function() {
                $.ajax({
                    url: "/p/pde/deleteCustSrchKeywordAjax.do"
                    , type: "post"
                    , dataType : "json"
                    , success: function(data) {
                    }
                });
// 			$("#keyword-list li").remove();
                // 2020.12.21 icj : css 문제로 ul 삭제
                $("#keyword-list").remove();
                // 2020.11.23 icj : 전체삭제시 검색창이 닫히지 않도록 수정
// 			$('#search-autowrap').css({ display : "none" });
// 			$("#search-popup").css({ display : "none" });

                // 2020.12.02 icj : 전체삭제시 히든처리
                $(this).hide();

                // 2020.12.21 icj : 최근 검색어가 없습니다. 노출
                $('#nodata').show();

                return false;
            });

            // 2020.12.09 icj 빠져있던 코드 추가
            var queryString = location.href;
            if(queryString.indexOf("adidas") == -1 && queryString.indexOf("nike") == -1 && queryString.indexOf("hanatour") == -1 && queryString.indexOf("modetour") == -1) {
                initSearchAD();
                searchPopKeyword();   //asp매장이 아닐경우만 조회되도록 변경 2017.02.10 jts  no.24830
            }

            var searchTerm = "";
            var searchBaseKeyword = "";
            if(searchTerm != searchBaseKeyword && searchTerm !='A') {
                $("#gnbSearchKeyword").val(searchTerm);
            }

        });

        var gnbLoginYn = "Y";


        // 2020.12.29 icj : 검색어 삭제 기능 제어
        function searchDeleteX(isShow){
            var $seachX = $('#searchDeleteX');
            if(isShow){
                $seachX.show().parent().addClass('btn ico-clearabled');
            }else {
                $seachX.hide().parent().removeClass('btn ico-clearabled');
            }
        }

        function clearWord(){
            searchDeleteX(false);
            $("#gnbSearchKeyword").val("");
            $("#gnbSearchKeyword").focus();
        }

        function esuper_click() {
            try {
                _trk_clickTrace('EVT','GNB_e슈퍼마켓');
            } catch (e) {}
        }

        function nextchk(arg,len,nextname) {
            if(arg.value.length == len) {
                nextname.focus();
                return;
            }
        }

        //2016.10.06 김이수 최근검색어 추가
        //2020.11.23 icj deleteCustSrchKeywordAjax 호출시 return이 없어서 오류 처리됨 , dataType : "json" 삭제

        function deleteCustKeyword(obj) {
            var custSrchKeyword = unescape(obj);
            custSrchKeyword = encodeURIComponent(escapeHtml(custSrchKeyword));
            $.ajax({
                url: "/p/pde/deleteCustSrchKeywordAjax.do"
                , type: "post"
                , data: "scwd=" + custSrchKeyword
                , success: function(data) {
                    mySearchList();
                }
                , error : function(e) {
                    console.log('error', e);
                }
            });
            return;
        }

        function escapeHtml(obj){
            // 지우고자 하는 특수문자들을 변환
            obj= obj.split("&quot;").join("\"");
            obj= obj.split("&#39;").join("\'");
            obj= obj.split("&lt;").join("<");
            obj= obj.split("&gt;").join(">");

            return obj;
        }

        function getCookie_header() {
            cName = "_LAST_SEARCH" + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cName);
            var cValue = '';
            if(start != -1){
                start += cName.length;
                var end = cookieData.indexOf(';', start);
                if(end == -1)end = cookieData.length;
                cValue = cookieData.substring(start, end);
            }

            return decodeURI(cValue);
        }

        function mySearchList() {
            var cookie = getCookie_header().replace(/[+]/gi, ' ');
            var str = new Array();
            if(!isEmpty(cookie)){
                str = cookie.split("‡");
            }

            // 2020.12.11 icj : 최근 검색어가 없는 경우 전체삭제 숨김처리. 검색어가 없다 노출
            if(str.length == 0){
                $('#del-all-history').hide();
                $('#keyword-list').remove();
                $('#nodata').show();
            }

            var ulVal = $("#keyword-list");
            var liVal='';
            var mySearchCnt = 0;
            ulVal.find("li").remove();
            if(str != null && str.length > 0) {
                for(var i=0; i < str.length; i++) {
                    // 검색 최대 20개 설정
                    if(i < 10) {
                        var mIndex = str[i].lastIndexOf('>');
                        var keyWord = '';
                        var keyWordDate = '';
                        if(mIndex > -1) {
                            keyWord = str[i].substring(mIndex +1, str[i].length);
                            keyWordDate = str[i].substring(0, mIndex);
                        } else {
                            keyWord = str[i];
                        }

                        if(!isEmpty(keyWord) && keyWord != "") {
                            if(mySearchCnt==0) liVal = "";

                            liVal += '<li><a href="javascript:clickSeachText(\''+unescape(keyWord)+'\')"><span>'+unescape(keyWord) +'</span></a>'
                                + '<button class="btn btn-delete" onclick="deleteCustKeyword(\'' + keyWord +'\')"><i class="icon xico"></i><span class="hiding">삭제</span></button></li>';
                            // <li><a href="javascript:;"><span>폴로 랄프 로렌</span></a>
                            //  <button class="btn btn-delete"><i class="icon xico"></i><span class="hiding">삭제</span></button></li>

                            mySearchCnt++;
                        }
                    }
                }
            }
            ulVal.append(liVal);
        }

        //2016.09.26 김이수 인기검색어 노출추가
        function searchPopKeyword() {
            if(typeof popKeyWordListJson == 'undefined') return;
            var searchPopKeyword = popKeyWordListJson;
            var liVal='';
            var ulVal = $(".keyword-result").find("ol");
            ulVal.find("li").remove();
            $.each(searchPopKeyword, function(i) {
                liVal += '<li><a class = "text" href="javascript:clickSeachText(\''+searchPopKeyword[i].keyword+'\')">'+'<span>'+ (i+1) +'. </span>' +searchPopKeyword[i].keyword+'</a>';
            });
            ulVal.append(liVal);
        }

        //검색창 입력전 AD
        function fn_searchAdKeywordDefault() {
            try {
                $("#fcsClick").empty();
                var keyList="";
                var defaultKeywordList = "";
                try{
                    defaultKeywordList = defaultKeywordListJson;
                } catch(e) {
                    try {
                        $.ajax({
                            url: "/p/bma/getKeywordMainAdList.do"
                            , type: "post"
                            , dataType : "json"
                            , async: false
                            , data: {searchTerm : "" , scwdAsExpsTrtyGbcd : ""}
                            , success: function(data) {
                                defaultKeywordList = data.defaultKeywordList;
                            }
                        });
                    } catch(e) {
                    }
                }

                if(defaultKeywordList.length > 0) {
                    $("#popular-list").css({ display : "none" });  // 최근검색어
                    $("#fcsClick").show();
                    keyList += '<p class="stitle">포커스 클릭</p>'
                        + '<span class="flag-da">AD</span>';

                    if(defaultKeywordList.length == 1) {
                        keyList += '<div class="pdlist-wrap">'
                            +  '<ul>';
                    }
                    if(defaultKeywordList.length == 2) {
                        keyList += '<div class="pdlist-wrap horizon">'
                            +  '<ul>';
                    }
                    if(defaultKeywordList.length == 3) {
                        keyList += '<div class="pdlist-wrap horizon">'
                            +  '<ul>';
                    }


                    $.each(defaultKeywordList, function(i){
                        if(defaultKeywordList[i].gb == "VDO"){
                            keyList +="<li class=\"pdthumb\">"
                                + "<a href=\"javascript:fn_KeywordAdConnUrl10(\'"+defaultKeywordList[i].connUrl+"','"+defaultKeywordList[i].gb+"','"+defaultKeywordList[i].adnm+"','"+defaultKeywordList[i].id+"');\" >"
                                + "<div class=\"thumb\">"
                                + "<img src='https://image.hmall.com"+"/"+defaultKeywordList[i].dispImflNm+"?RS=200X200&AR=0' alt='' />"
                                + "<div class=\"ready\">"
                                + "<span class=\"playtime\"><i class=\"icon\"></i><em></em></span>"
                                + "</div>"
                                + "</div>"
                                + "<div class=\"figcaption\">"
                                + "<div class=\"pdtit\">"+ defaultKeywordList[i].nm +"</div>"
                                + "<div class=\"pdname\" aria-label=\"제품명\">" +defaultKeywordList[i].evntdesc+ "</div>"
                                + "</div></a></li>";

                        } else if(defaultKeywordList[i].gb == "SPEX") {
                            var spexUrl = defaultKeywordList[i].connUrl;
                            if(defaultKeywordList[i].connUrl == "" || defaultKeywordList[i].connUrl == null){
                                spexUrl = "/p/dpa/searchSpexSectItem.do?sectId="+defaultKeywordList[i].id;
                            }

                            keyList +="<li class=\"pdthumb\">"
                                + "<a href=\"javascript:fn_KeywordAdConnUrl10(\'"+spexUrl+"','"+defaultKeywordList[i].gb+"','"+defaultKeywordList[i].adnm+"','"+defaultKeywordList[i].id+"');\" >"
                                + "<div class=\"thumb\">"
                                + "<img src='https://image.hmall.com"+"/"+defaultKeywordList[i].dispImflNm+"?RS=200X200&AR=0' alt='' />"
                                + "</div>"
                                + "<div class=\"figcaption\">"
                                + "<div class=\"pdtit\">"+ defaultKeywordList[i].nm +"</div>"
                                + "<div class=\"pdname\" aria-label=\"제품명\">" +defaultKeywordList[i].evntdesc+ "</div>"
                                + "</div></a></li>";

                        } else {//상품
                            var imPath = "/static/"+defaultKeywordList[i].slitmCd.substr(7,1)+ "/" + defaultKeywordList[i].slitmCd.substr(6, 1) + "/"+ defaultKeywordList[i].slitmCd.substr(4, 2) + "/" + defaultKeywordList[i].slitmCd.substr(2, 2)+ "/";
                            // 상품
                            keyList +="<li class=\"pdthumb\">"
                                + "<a href=\"javascript:fn_KeywordAdConnUrl10(\'/p/pda/itemPtc.do?slitmCd="+defaultKeywordList[i].slitmcd+"','"+defaultKeywordList[i].gb+"','"+defaultKeywordList[i].adnm+"','"+defaultKeywordList[i].id+"');\" >"
                                + "<div class=\"thumb\">"
                                + "<img src='https://image.hmall.com"+imPath+defaultKeywordList[i].dispImflNm+"?RS=200X200&AR=0' alt='' />"
                                + "</div>";
                            if(defaultKeywordList.length == 1){  //상품1개 일 경우 ui 다름
                                keyList += "<div class=\"figcaption txt-left\">";
                            }else{
                                keyList += "<div class=\"figcaption\">";
                            }
                            keyList += "<div class=\"pdname\" aria-label=\"제품명\">" +defaultKeywordList[i].nm+ "</div>"
                                + "<div class=\"pdprice\">"
                                + "<span class=\"normal\" aria-label=\"정상가\"><em>"+defaultKeywordList[i].sellprc+"</em>원</span></div>"
                                + "</div></a></li>";

                        }
                    });
                    keyList +="</ul></div>";

                    $("#fcsClick").append(keyList);

                    // 2020.12.11 icj : 노이미지 처리
                    $('#fcsClick').find('img').on('error', function(){
                        $(this).attr('src', '//image.hmall.com/p/img/co/noimg-thumb.png');
                    });
                } else {
                    $("#fcsClick").hide();
                    $("#fcsClick").empty();
                }
            } catch(e) {
                //alert(e);
            }
            //키워드 광고 추가 2018.06.25 E
        }

        function fn_KeywordAdConnUrl10(connUrl,gb,nm,id) {
            var title ="";
            if(gb == "VDO") {
                title = "검색창_검색전_영상광고_"+ nm;
            } else if(gb == "SPEX") {
                title = "검색창_검색전_기획전광고_"+ nm;
            } else {
                title = "검색창_검색전_상품광고_"+ nm;
            }

            try {
                _trk_clickTrace('EVT',title);
            } catch (e) {}

            try {
                setGaPromotion("검색>검색창", "검색창", "검색전(입력전)광고", id + "_" + nm, "");
            } catch (e) {}

            window.location.href = connUrl;
        }

        function fn_searchAdKeyword() {
            var defaultKeywordList = "";
            var keyList="";

            //검색어광고 추가 2018.06.25
            try {
                $("#fcsClick").empty();
                $.ajax({
                    url: "/bma/getKeywordMainAdList.do"
                    , type: "post"
                    , dataType : "json"
                    , data:{scwdAsExpsTrtyGbcd:"20", searchTerm : $("#gnbSearchKeyword").val() }
                    , success: function(data) {
                        defaultKeywordList = data.keywordList;
                        //alert(defaultKeywordList.length);
                        if(defaultKeywordList.length > 0) {
                            keyList += "<h3>포커스 클릭 <span>AD</span></h1>";
                            $.each(defaultKeywordList, function(i) {
                                if(defaultKeywordList[i].gb == "VDO") {
                                    keyList +="<a href=\"javascript:fn_KeywordAdConnUrl10(\'"+defaultKeywordList[i].connUrl+"','"+defaultKeywordList[i].slitmcd+"','"+defaultKeywordList[i].gb+"','"+defaultKeywordList[i].adnm+"','"+defaultKeywordList[i].id+"');\" class='no-prd _video'>"+
                                        "<img src='"+defaultKeywordList[i].dispImflNm+"?RS=200X200&AR=0' alt='' />"+
                                        "<strong>"+defaultKeywordList[i].nm+"</strong>"+
                                        "<span>"+defaultKeywordList[i].evntdesc+"</span>";
                                } else if(defaultKeywordList[i].gb == "SPEX") {
                                    var spexUrl = defaultKeywordList[i].connUrl;
                                    if(defaultKeywordList[i].connUrl == "" || defaultKeywordList[i].connUrl == null) {
                                        spexUrl = "/p/dpa/searchSpexSectItem.do?sectId="+defaultKeywordList[i].id;
                                    }
                                    keyList +="<a href=\"javascript:fn_KeywordAdConnUrl10(\'"+spexUrl+"','"+defaultKeywordList[i].slitmcd+"','"+defaultKeywordList[i].gb+"','"+defaultKeywordList[i].adnm+"','"+defaultKeywordList[i].id+"');\" class='no-prd'>"+
                                        "<img src='"+defaultKeywordList[i].dispImflNm+"?RS=200X200&AR=0' alt='' />"+
                                        "<strong>"+defaultKeywordList[i].nm+"</strong>"+
                                        "<span>"+defaultKeywordList[i].evntdesc+"</span>";
                                } else {//상품
                                    keyList +="<a href=\"javascript:fn_KeywordAdConnUrl10(\'/p/pda/itemPtc.do?slitmCd=','"+defaultKeywordList[i].slitmcd+"','"+defaultKeywordList[i].gb+"','"+defaultKeywordList[i].adnm+"','"+defaultKeywordList[i].id+"');\" class='prd'>"+
                                        "<img src='"+defaultKeywordList[i].dispImflNm+"?RS=200X200&AR=0' alt='' />"+
                                        "<span>"+defaultKeywordList[i].nm+"</span>"+
                                        "<strong>"+defaultKeywordList[i].sellprc+"<span>원</span></strong>";
                                }
                                keyList +=" </a>";
                            });
                        } else {
                            $("#search-popup").addClass("no-adv");
                        }

                        $("#search-recommend .focus-click").append(keyList);//키워드 광고 추가 2018.06.25
                        if(defaultKeywordList.length == 1) {
                            $("#search-recommend .focus-click").attr("class","focus-click");
                        }
                        if(defaultKeywordList.length == 2) {
                            $("#search-recommend .focus-click").attr("class","focus-click _row _two");
                        }
                        if(defaultKeywordList.length == 3) {
                            $("#search-recommend .focus-click").attr("class","focus-click _row _three");
                        }
                    }
                });
            } catch(e) {
                //alert(e);
            }
            //키워드 광고 추가 2018.06.25 E
        }

        function clickSeachText(val) {
            if(val.indexOf("www.") >= 0) {
                alert("검색할 수 없는 키워드가 포함되어 있습니다.");
                return false;
            }

            var isSearchADText = goSearchADText(val);

            if(!isSearchADText){
                location.href = "https://www.hmall.com/p/pde/search.do?searchTerm="+val;
            }
        }

        function doSmsSend(prmoNo) {
            if(isLogin() == 'true') {
                var ddd = $("input[name='ddd']").val();
                var tel1 = $("input[name='tel1']").val();
                var tel2 = $("input[name='tel2']").val();

                if (isEmpty(ddd)|| isEmpty(tel1) || isEmpty(tel2)) {
                    alert('마이페이지>회원정보에서 휴대폰번호를 입력한 후 이용하실 수 있습니다.');
                }

                $.ajax({
                    type: "GET"
                    ,url: "https://www.hmall.com/pevent/eva/evntTmplSmsSend.do"
                    ,dataType: "jsonp"
                    ,jsonCallback: "callback"
                    ,crossDomain: true
                    ,data:{prmoNo:prmoNo, ddd:ddd, tel1:tel1 , tel2:tel2}
                    ,async: false
                    ,success : function(data) {
                        if(isEmpty(data.errorMessage)) {
                            alert(data.errorMessage);
                            window.location.reload();
                        } else {
                            alert(data.errorMessage);
                        }
                    }
                    ,error : function(request,status,error) {
                        alert("이벤트 응모시 오류가 발생했습니다.");
                    }
                });
            } else {
                doEvntLoginTop();
            }
        }

        function doEvntLoginTop() {
            alert("로그인 후 이용해 주세요.");
            openLoginPopup();
            return;
        }

        function mCheck() {
            var pathVal ='^헤더^앱다운로드';

            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            var ddd = "";
            var tel1 = "";
            var tel2 = "";

            if(isLogin() == 'true') {
                $.ajax({
                    type: "post"
                    , url: "https://www.hmall.com/p/getHp.do"
                    , dataType: "jsonp"
                    , crossDomain: true
                    , success : function(data) {
                        $("input[name='ddd']").val(data.hpIdntNo);
                        $("input[name='tel1']").val(data.hpIntmNo);
                        $("input[name='tel2']").val(data.hpBckNo);
                        ddd = data.hpIdntNo;
                        tel1 = data.hpIntmNo;
                        tel2 = data.hpBckNo;

                        if (isEmpty(ddd)|| isEmpty(tel1) || isEmpty(tel2)) {
                            alert('마이페이지>회원정보에서 휴대폰번호를 입력한 후 이용하실 수 있습니다.');
                        }
                    }
                    , error: function(data) {
                        console.log("mCheck error");
                    }
                });
            }
            return;
        }

        // 장바구니, 찜리스트, 마이페이지 마우스 액션
        $(document).on("mouseenter", ".person_menu li.mypage", function() {
            if($(this).siblings("li").find(".sub").hasClass("on")) {
                $(this).siblings("li").find(".sprite.ico, .sub").removeClass("on");
            }

            if($(this).find(".sub").hasClass("on")) {
                $(this).find(".sprite.ico, .sub").removeClass("on");
            } else {
                $(this).find(".sprite.ico, .sub").addClass("on");
            }

            return false;
        }).on("mouseleave", ".person_menu li.mypage", function() {
            $(this).find(".sprite.ico, .sub").removeClass("on");
        });


        //장바구니,ㅡ 찜리스트 좌측 아이콘 클릭 시 화면 이동 되도록 수정
        $(document).on("click", ".person_menu li", function() {
            if($(this).hasClass("basket")){
                location.href = "https://www.hmall.com/p/odb/basktList.do?GnbGroup=Basket";
            } else if($(this).hasClass("zzim")){
                location.href = "https://www.hmall.com/p/mpc/sltdItemList.do?GnbGroup=WishList";
            }
        });

        /* TODO 곽희섭 20170517 통합포인트 추가 */
        function submitCompanyLogin() {
            var pathVal = "^헤더^마이페이지 레이어^통합멤버십 로그인";

            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            window.open("",'sendLogin','width=400,height=550,scrollbars=yes');
            document.loginForm.submit();
        }

        //TODO 곽희섭 20170524 통합포인트 추가
        function doSearchUPnt(pathVal) {
            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}
            location.href = "https://www.hmall.com/p/cua/registUpnt.do";
        }

        function doSearchUPntPop(pathVal) {
            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            document.myPntForm.mcustNo.value = mcustNo;
            document.myPntForm.action = "https://www.h-point.co.kr/cu/myh/myPnt.shd";
            window.open("",'myPntForm','width=900,height=650');
            document.myPntForm.submit();
        }

        /**
         * 2018.06 김이수 검색탭 리뉴얼 관련 JS
         */

        $(function() {
// 		mySearchList();    // 로드 순서 문제로 다른곳에서 처리

            $(document).on("click",".header .searchclose", function(){
                // 2020.11.23 icj 검색창에서 닫기 버튼시 검색 하단 레이어 숨김처리 및 자동 focus 제거
                $('#search-autowrap').hide();
                $("#search-popup").hide();
                $(".header .search").removeClass("selected");
            }).on('click', function(e){
                // 2020.12.28 icj : 유저 클릭 이벤트인 경우만
                if(e.originalEvent){
                    var target = $(e.target);
                    if(!$('.header .search .field').has(e.target).length){
                        $(".header .search").removeClass("selected");
                    }
                }
            })

            //이외 영역 클릭 시 카테고리 메뉴 숨김 처리
            $(document).on("click", function() {
                if($('.category-menu-wrap').is(':visible')){
                    $('.category-menu-wrap').hide();
                }
            });

            //퍼블 스크립트 끝
            $("#gnbSearchKeyword").on("keyup", function(e) {
                var keyword = $("#gnbSearchKeyword").val();

                if(!$(".header .search").hasClass("selected")){
                    $(".header .search").addClass("selected");
                }

                if(e.which==13 ){
                    // 2020.12.21 icj : 이중 alert으로 주석처리(submit으로 doSearchGnb호출됨)
// 				doSearchGnb();
                    return false;
                }

                if(keyword.length == 0  || isEmpty(keyword)){
                    searchDeleteX(false);
                    $("#search-recommend").hide();
                    $("#search-popup").show();
                    $(".header .search").addClass("selected");  // 2020.11.27 icj 검색어가 없는 경우 selected 필요
                    fn_searchAdKeywordDefault();
                } else{
                    searchDeleteX(true);
                    $("#search-popup").hide();
                    $("#search-recommend").show();
                }
                //추천검색 중첩방지
                if(processing==0) {
                    dup_keyword();
                }
                // else{
                // 	console.log('중첩방지');
                // }
            });

            //input박스 클릭시
            var noDelKeyword_rgx = new RegExp('(/p/pde/)','g');
            var noDelKeyword_Filter = noDelKeyword_rgx.test(locationHref);

            // 최근본이미지조회
            getRecentImg();

        });

        //추천검색어 및 자동완성
        var before_Keyword = "";
        var clear_DupKeyword;

        //타자속도가 빨라 keyup시 여러단어 입력으로 이중검색 되는 로직 방지
        var processing  = 0;   //시작:0 , 호출시 +1
        function dup_keyword(){
            processing+=1;
            // console.log('dup_keyword call processing : ' +  processing);
            // if(processing>10){   //무한루프방지
            // 	debugger;
            // }

            var searchHost = serverHost;

            if (locationHref.indexOf("https") > -1) {
                searchHost = serverHostForSSL;
            }

            //검색어 자동완성
            var nowKeyword = $("input[name=searchTerm]").val();

            var $this_val = $("#gnbSearchKeyword").val();
            // 추천 검색어 가져올때 광고키워드와 입력 키워드 일치 여부 확인
            var keywordAd20List = "";

            //검색어 광고 DB 조회 여부
            var adGb="N";
            var adCnt = 0;
            try{
                keywordAd20List = keywordAd20ListJson; // 광고 키워드 json
            }catch(e){
            }

            if(keywordAd20List.length > 0){
                $.each(keywordAd20List, function(i){
                    if(keywordAd20List[i].keyword == nowKeyword){
                        adCnt++;
                    }
                });
                if(adCnt > 0){
                    adGb ="Y";  //광고 키워드가 일치할 경우 AD 데이터가져옴(keywordAdList)
                }
            }


            centerLoading(true,12);
            $.ajax({
                url: searchHost + '/p/pde/searchKeywordAutoCompleteAjax.do?adGb=' + adGb
                , data: { searchTerm : $this_val }
                , type: "post"
                , dataType: "html"
                , success: function(data) {
                    //console.log("searchKeywordAutoCompleteAjax call");
                    processing=0 ; //키워드검색 종료 초기화

                    $("#search-recommend").hide();
                    $("#search-recommend").html(data);

                    $("#search-recommend").show();
                    searchSpecialShop();
                    searchBrandShop();

                    //연관 추천검색어 및 브랜드, 스페셜샵, 광고 없는 경우 search-autowrap hidden 처리
                    var specialCount = $("#spacialshop").length;
                    var brandCount = $("#brandshop").length;
                    var recommCount = $("#recommend-keyword-list li").length;

                    //추천검색어 없을 경우 영역삭제
                    if(recommCount==0){
                        $("#recommend-keyword-list").css({display:"none"});
                    }

                    //추천 단어 없을때
                    if(specialCount==0 && brandCount==0 && recommCount==0){
                        $("#search-recommend").prepend('<p class="nodata" id="search_layer1">입력하신 단어로 검색어를 추천할 수 없습니다.</p>');
                    }

                    //검색어를 다 지웠을때
                    if($("#gnbSearchKeyword").val().length == 0  || isEmpty($("#gnbSearchKeyword").val())){
                        $("#search-autowrap").show();
                        $("#search-popup").show();
                        $("#search-popup div").show();
                        $("#search_layer1").hide();

                        fn_searchAdKeywordDefault();
                    }
                    centerLoading(false);
                }
                ,error: function(){
                    processing=0 ; //키워드검색 초기화
                    centerLoading(false);
                }
            });
        }


        //2019.10.07 문주성 인기검색어 추가
        // /p/bma/getPopScwd.do 바라보는 로직 제외 HDHS-22649
        function getPopularSearch() {

            var searchPopKeyword = popKeyWordListJson;

            var show1to10 = "";
            $.each(searchPopKeyword, function (i, item) {
                $(item).each(function (key, value) {
                    if(value.ranking >= 1 && value.ranking <= 10) {
                        show1to10 += "<li>";
                        show1to10 += "<a href=\"javascript:void(0);\" onclick=\"javascript:clickPopSrch('" + value.keyword + "');\" >";
                        show1to10 += value.keyword
                        if(value.gap < 0) {
                            // show1to10 += "<span class=\"rank _dw\"></span>";
                            show1to10 += "<em><i class=\"icon down\"></i><span class=\"hiding\">하락</span></em>";
                        }else if(value.gap > 0) {
                            if(value.prevRanking > 10) {
                                show1to10 += "<em><i class=\"icon new\"></i><span class=\"hiding\">유지</span></em>";
                            }else {
                                show1to10 += "<em><i class=\"icon up\"></i><span class=\"hiding\">상승</span></em>";
                            }
                        }else {
                            show1to10 += "<em><i class=\"icon keep\"></i><span class=\"hiding\">유지</span></em>";
                        }
                        show1to10 += "</a>";
                        show1to10 += "</li>"
                    }
                });
            });

            $("#popular-list >ol").append(show1to10);
        }

        function clickPopSrch(searchTerm){

            var isSearchADText = goSearchADText(searchTerm);

            if(!isSearchADText){
                var newForm = $('<form></form>');

                newForm.attr("name","newForm");
                newForm.attr("method","post");
                newForm.attr("action","/p/pde/search.do?searchTerm="+searchTerm);

                newForm.append($('<input/>', {type: 'hidden', name: 'popSrchYn', value:'Y' }));
                newForm.appendTo('body');

                newForm.submit();
            }
        }

        //최근본쇼핑 하단 이미지조회
        function getRecentImg(){
            $.ajax({
                type: "get",
                url: '/p/coe/selectRcntShpgImg.do',
                dataType: "json",
                success: function(data){

                    var itemImg = data.rcntShpgMap.itemImg;
                    if(itemImg != null && itemImg != ""){
                        var imgTag = '<img src='+itemImg+' onerror="noImage(this, \'https://image.hmall.com/p/img/co/noimg-thumb.png\')" >';
                        $("#recentlyImg > em").html(imgTag);
                    }


                    //하단이미지 조회 후 쿠키동의여부 팝업 노출여부 체크 및 노출
                    if(sessionStorage.getItem("recentCokiUseAgr") == "Y"){

                        // 로그인 성공 했을 때
                        $.ajax({
                            type: "get"
                            ,url: "/p/coe/checkRcntShpg.do"
                            ,dataType: "json"
                            ,cache : false
                            ,data: {}
                            ,async: true
                            ,success : function(data) {
                                if (data && data.showRcntShpgPop == "Y") {
                                    $("#recentCokiUseAgr").addClass("active");
                                    $("#recentCokiUseAgr").show();
                                    sessionStorage.removeItem("recentCokiUseAgr");
                                }
                            },
                            error : function(e){
                            }
                        });
                    }


                },
                error: function(xhr, type){
                    //alert('no data : ' + type);
                }
            });
        }

        //최근본쇼핑 쿠키동의여부 처리
        function setRecentCookieAgr(agrVal){
            $.ajax({
                type: "get",
                url: serverHostForSSL + '/p/coe/saveRcntCokiUseAgr.do',
                dataType: "json",
                data: {recentCokiUseAgr:agrVal},
                success: function(data){
                    $("#recentCokiUseAgr").hide();
                    sessionStorage.removeItem("recentCokiUseAgr");
                },
                error: function(xhr, type){
                    //alert('no data : ' + type);
                }
            });
        }

        // 최근본 쇼핑 열기
        function openRecentShopping() {

            // Dim 영역을 먼저 노출
            $("#recentlyItem").html('<div class="layer-dim"></div>').show();

            $.ajax({
                type: "get"
                ,url: '/p/coe/listRcntShpg.do'
                ,dataType: "html"
                ,async: true
                ,success : function(data) {

                    $recentlyItem = $("#recentlyItem");
                    $recentlyItem.html(data).show();
                }
                ,
                error : function(){
                }
            });

            return false;
        }
        //for chrome debugger
        //# sourceURL= script-for-Top1.js
    </script>

    <!-- TODO 곽희섭 20170517 통합포인트 추가 -->
    <form id="loginForm" name="loginForm" method="post" action="https://www.h-point.co.kr/cu/login.nhd" target="sendLogin">
        <input type="hidden" name="retUrl" value="https://www.hmall.com/p/cob/upntGatePage.do">
        <input type="hidden" name="retPage" value="">
        <input type="hidden" name="prtnrId" value="D020" readonly="">
        <input type="hidden" name="chnnlId" value="1102">
        <input type="hidden" name="htmlYn" value="Y">

        <input type="hidden" name="ci" value="">
    </form>
    <form id="myPntForm" name="myPntForm" method="post" action="" target="myPntForm">
        <input type="hidden" name="mcustNo" value="">
    </form>

    <!-- skip navigation -->
    <div class="nav-skip"><a href="#mainContents" id="accessibility">본문 콘텐츠로 건너뛰기</a></div>


    <script>
        function setTopBanner() {
            try {
                var TopBannerArr = [top1Json, top2Json, top3Json, top4Json];
                var imageServer = 'https://image.hmall.com';

                $.each(TopBannerArr, function(i, arr) {
                    if(TopBannerArr[i].length == 0) return;

                    var dispUrl = TopBannerArr[i][0].dispUrl;
                    var dispTrtyNmCd = TopBannerArr[i][0].dispTrtyNmCd;
                    var dispImflNm = TopBannerArr[i][0].dispImflNm;
                    var dispNm = TopBannerArr[i][0].dispNm;
                    var evntDesc = TopBannerArr[i][0].evntDesc;

                    if (dispNm == null) {
                        dispNm = "";
                    }

                    if (evntDesc == null) {
                        evntDesc = "";
                    }

                    var _html ="";




                    if (i == 0) {
                        _html = '<a class="banner-item type4 firstitem gp_className" ga-category="헤더" ga-action="탑배너1" ga-label="' + dispNm + '" href="javascript:bizSpringTag(\''+dispUrl+'&_IC_=top'+Math.round(i+1)+'\',\'^헤더^탑배너^'+dispNm+'\');">';
                    } else if (i == 3) {
                        _html = '<a class="banner-item type4 lastitem gp_className" ga-category="헤더" ga-action="탑배너4" ga-label="' + dispNm + '" href="javascript:bizSpringTag(\''+dispUrl+'&_IC_=top'+Math.round(i+1)+'\',\'^헤더^탑배너^'+dispNm+'\');">';
                    } else {
                        _html = '<a class="banner-item type4 gp_className" ga-category="헤더" ga-action="탑배너' + i +'" ga-label="' + dispNm + '" href="javascript:bizSpringTag(\''+dispUrl+'&_IC_=top'+Math.round(i+1)+'\',\'^헤더^탑배너^'+dispNm+'\');">';
                    }


                    if (i == 3) {
                        _html = _html + '<span class="label-wrap"><span class="cat-label">'+dispNm+'</span><span class="main-label">'+evntDesc+'</span></span></a>';
                    } else {
                        _html = _html + '<img src="'+imageServer+dispImflNm+'"/><span class="label-wrap"><span class="cat-label">'+dispNm+'</span><span class="main-label">'+evntDesc+'</span></span></a>';
                    }

                    $("#top_bar").append(_html);




                    if ( i == 3 ) return false;

                });
                if($("#top_bar").size() > 0) $(".header-banner").css({ backgroundColor : $("#top_bar").find("img").first().attr("src").split("-")[1] == undefined ? "#FFF" : "#"+ $("#top_bar").find("img").first().attr("src").split("-")[1].split(".")[0] });
            } catch (err){}
        }

        function loadPCdirect() {
            try {
                var ulSize    = 0;
                $(PCdirectJson).each(function(idx,cOAPCdirectInfVO) {
                    $("#pcdirect").attr("href", "javascript:bizSpringTagForVisit('"+cOAPCdirectInfVO.dispUrl+"','^스카이스크래퍼^바로접속ON');");
                    ulSize += 1;
                    if ( ulSize == 1 ) return false;
                });
            } catch (err){}
        }
        function bizSpringTagForVisit(url, pathVal) {
            var bookMarkFlag = 'true';

            if(bookMarkFlag == 'true') {
                try {
                    _trk_flashEnvView('_TRK_CP=' + pathVal);
                } catch(e){}
            } else {

            }

            url = url.replace(/ /g,'');
            if(url != "" && url != undefined){
                location.href = url;
            }
        }


        function bizSpringTag(url, pathVal) {
            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            url = url.replace(/ /g,'');
            if(url != "" && url != undefined) {
                location.href = url;
            }
        }

        function bizspringClickTrace(tag) {
            try {
                if(!isEmpty(tag)) _trk_clickTrace('EVT', tag);
            } catch (e) {}
        }

        function openLoginTag(url, pathVal) {

            try {

                //현재는 사용안함 향후 매체동의 사용시에 주석 제거
                //sessionStorage.setItem("recentCokiUseAgr", "Y");

                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            // 2020.11.25 icj : url이 없는 경우 현재 url 전달
            if(isEmpty(url)){
                // 2021.01.13 : url이 없는경우 특정 url은 제외 처리
                if (isLoginExpectUrl(location.href)) {
                    url = "";
                } else {
                    url = location.href;
                }

            }

            openLoginPopup(url);
        }

        //2020.03.04 gnb_search.js에서 이동
        var searchAdTempArr = new Array();

        function initSearchAD(){
            if(typeof searchADLinkList !== 'undefined'){ //searchADLinkList.js 배치로 만들어진 파일이라 local Test시 에러방지
                if(searchADLinkList.length > 0){
                    //2021.12.21 인터넷 노출 컬럼 기준 필터링
                    for (var i = 0; i < searchADLinkList.length; i++){
                        if (searchADLinkList[i].itntDispYn == "Y"){
                            searchAdTempArr.push(i); //인터넷 노출될 인덱스 값 저장
                        }
                    }

                    adIndex = Math.round(Math.random() * 10) % searchAdTempArr.length;

                    gv_gnbHomeBnnrTitl = searchADLinkList[searchAdTempArr[adIndex]].bnnrTitl;
                    gv_gnbHomeBnnrLinkUrl = searchADLinkList[searchAdTempArr[adIndex]].bnnrLinkUrl;
                }
            }

            if(typeof searchADTextList !== 'undefined'){
                if(searchADTextList.length > 0){
                    gv_gnbSearchADTextList = searchADTextList;
                }
            }

            // 2020.12.24 icj : 미선택시에만 값 세팅
            if(!$('.header .search').hasClass('selected')){
                $("#gnbSearchKeyword").val(gv_gnbHomeBnnrTitl);
            }

        }

        function doSearchGnb () {
            var searchKeyword = $("#gnbSearchKeyword").val();
            if(searchKeyword == null || searchKeyword == "") {
                alert("검색어를 입력해주세요.");
                return false;
            }
            if(searchKeyword.indexOf("www.") >= 0) {
                alert("검색할 수 없는 키워드가 포함되어 있습니다.");
                return false;
            }

            //검색어 값이 처음 현시된 글과 같을경우 해당 Url에 이동
            if(typeof gv_gnbHomeBnnrTitl !=='undefined'){
                if(gv_gnbHomeBnnrTitl == searchKeyword){
                    var url = gv_gnbHomeBnnrLinkUrl;
                    if(gv_gnbHomeBnnrLinkUrl.indexOf("http:") == -1 && gv_gnbHomeBnnrLinkUrl.indexOf("https:") == -1 ) {
                        if(url.indexOf("/p/") >= 0){
                            url = serverHost + "/" + url;
                        } else {
                            url = "http://" + url;
                        }
                    }
                    try {
                        _trk_flashEnvView('_TRK_CP=^헤더^검색창광고^' + searchKeyword);
                    } catch(e){}

                    window.location.href = url;
                    return false;
                }
            }

            var isSearchADText = goSearchADText(searchKeyword);

            if(!isSearchADText){
                var form = document.gnbPdeSearchForm;
                form.action = "https://www.hmall.com/p/pde/search.do";
                form.submit();
            }
        }

        function goSearchADText(searchKeyword){

            if(gv_gnbSearchADTextList.length > 0){
                var index = -1;
                for(var idx = 0 ; idx < gv_gnbSearchADTextList.length ; idx++){
                    if(!isEmpty(gv_gnbSearchADTextList[idx].bnnrTitl)){
                        if(gv_gnbSearchADTextList[idx].bnnrTitl == searchKeyword){
                            index  = idx;
                            break;
                        }
                    }
                }

                if(index >= 0){
                    if(!isEmpty(gv_gnbSearchADTextList[index])){
                        var url = gv_gnbSearchADTextList[index].bnnrLinkUrl;
                        if(url.indexOf("http:") == -1 && url.indexOf("https:") == -1 ) {
                            if(url.indexOf("/p/") >= 0){
                                url = serverHost + "/" + url;
                            } else {
                                url = "http://" + url;
                            }
                        }

                        // 180305 - bizSpring - rlatkdals
                        _trk_bnnrTitl = "TEXT검색어_"+ gv_gnbSearchADTextList[index].bnnrTitl;
                        _trk_clickTrace('EVT', _trk_bnnrTitl);

                        window.location.href = url;
                        return true;
                    }
                }
            }
            return false;
        }

        $(function() {
            var flag = 0;
            $(document).on('click', '#gnbSearchKeyword', function() {
                var searchTerm = "";
                //최초 검색키워드 설정 후 초기화
                if(searchTerm=="A"){
                    searchTerm='';
                }
                if(flag == 0) {
                    $("#gnbSearchKeyword").val(searchTerm);
                    flag = 1;

                    //IE 커서 위치를 맨 뒤로
                    if(this.createTextRange) {
                        var range = this.createTextRange();
                        range.move('character', this.value.length);
                        range.select();
                    }
                }

                $(".search-box").focus();
            });

        });

        /* GNB - 카테고리 vs008 */
        function setCategory(url){
            $.ajax({
                type : "get"
                //,url : "/p/coe/getSectCtgr.do"
                ,url : "//image.hmall.com/gen/html/sectCtgr.html"
                ,dataType : "html"
                ,crossDomain: true
                ,success : function(data, textStatus, jqXHR){
                    $("#categoryArea").append(data);
                    $(".category-list li:first, .category-list-contents:first").addClass("on");
                    catNavigation();
                },complete: function(){
                    //var CtrAdBannerPJson = $.parseJSON('[{"cd":"10","adBnnrNo":52434,"bnnrTitl":"타이틀타이틀타이틀타이틀타이틀타이틀타이틀타이틀타이틀타이틀","bnnrImflNm":"\/HM\/HM026\/20200603\/191146\/0529_kse.jpg","bnnrLinkUrl":"http:\/\/www.hmall.com\/p\/dpa\/searchSpexSectItem.do?sectId=1974291","dispStrtDtm":"20171101000000","dispEndDtm":"20210522000000","srcCntn":"내용내용내용내용내용내용내용내용내용내용내용내용내용내용","bbPrc":null},{"cd":"09","adBnnrNo":52442,"bnnrTitl":"TV방송","bnnrImflNm":"\/HM\/HM026\/20200519\/161503\/1.PNG","bnnrLinkUrl":"http:\/\/www.hmall.com\/p\/dpa\/searchSpexSectItem.do?sectId=1974291","dispStrtDtm":"20171101000000","dispEndDtm":"20210522000000","srcCntn":"테스트","bbPrc":null}]');
                    setCategoryBanner(CtrAdBannerPJson);
                },error : function(e) {
                    //cors 오류 시 기존 ajax 타도록 수정
                    $.ajax({
                        type : "get"
                        ,url : "/p/coe/getSectCtgr.do"
                        ,dataType : "html"
                        ,crossDomain: true
                        ,success : function(data, textStatus, jqXHR){
                            $("#categoryArea").append(data);
                            $(".category-list li:first, .category-list-contents:first").addClass("on");
                            catNavigation();
                        },complete: function(){
                            //var CtrAdBannerPJson = $.parseJSON('[{"cd":"10","adBnnrNo":52434,"bnnrTitl":"타이틀타이틀타이틀타이틀타이틀타이틀타이틀타이틀타이틀타이틀","bnnrImflNm":"\/HM\/HM026\/20200603\/191146\/0529_kse.jpg","bnnrLinkUrl":"http:\/\/www.hmall.com\/p\/dpa\/searchSpexSectItem.do?sectId=1974291","dispStrtDtm":"20171101000000","dispEndDtm":"20210522000000","srcCntn":"내용내용내용내용내용내용내용내용내용내용내용내용내용내용","bbPrc":null},{"cd":"09","adBnnrNo":52442,"bnnrTitl":"TV방송","bnnrImflNm":"\/HM\/HM026\/20200519\/161503\/1.PNG","bnnrLinkUrl":"http:\/\/www.hmall.com\/p\/dpa\/searchSpexSectItem.do?sectId=1974291","dispStrtDtm":"20171101000000","dispEndDtm":"20210522000000","srcCntn":"테스트","bbPrc":null}]');
                            setCategoryBanner(CtrAdBannerPJson);
                        }
                    });
                }
            });
        }

        /* GNB - 카테고리 배너 vs008 */
        function setCategoryBanner(jsonData){
            var _data = jsonData;

            $(_data).each(function(_idx){
                if(this.cd != null && this.cd != "") {
                    var _catecode = this.cd.toString();
                    var _mainLabel = this.bnnrTitl == null ? " " : this.bnnrTitl.toString();
                    var _subLabel = this.srcCntn == null ? " " : this.srcCntn.toString();
                    var _dispUrl = this.bnnrLinkUrl == null ? " " : this.bnnrLinkUrl.toString();
                    var _imgUrl = this.bnnrImflNm == null ? " " : this.bnnrImflNm.toString();

                    /* 임시처리 TV쇼핑 노출되지 않도록 처리 */
                    var _html = "<div class='exhibition-banner'>" +
                        "<a href='"+ _dispUrl +"'>" +
                        "<img src='"+ 'https://image.hmall.com' + _imgUrl +"' alt='기획전 Banner' onerror=\"this.src='//image.hmall.com/p/img/co/sample/img-bnn01.jpg'\"/>" +
                        "<span class='banner-text'>" +
                        "<strong>"+ _mainLabel +"</strong>" +
                        "<em>"+ _subLabel +"</em>" +
                        "</span>" +
                        "</a>" +
                        "</div>";

                    $('.category-list-contents[data-catecode="'+ _catecode +'"]').append(_html);
                }
            });
        }

        /* GNB - 카테고리 공통 common 동작 추가 (category append 이후 동작 처리) */
        function catNavigation(option){
            var $selector = $('#categoryArea');

            var _default = {
                menuWrap : '.category-menu-wrap',
                btn : '.btn-category',
                mainList : '.category-list',
                contents : '.category-list-contents',
                index : 0,
            }
            var _option = $.extend({}, _default, option)
            var $menuWrap = $(_option["menuWrap"])
            var $mainMenu = $menuWrap.find(_option.mainList)
            var $menuList = $menuWrap.find(_option.mainList + ' li')
            var $contents = $(_option["contents"])
            var _index = _option["index"]

            var init_renew = function(){
                if(!$selector.length){
                    console.log('No elements. "' + _selector + '"')
                }
                onClickHandler_renew()
                onMouseLeaveHandler_renew()
                onMenuOverHandler_renew()
            }

            var onClickHandler_renew = function(){
                $selector.on('click', _option.btn, function(e){
                    e.stopPropagation()
                    if($menuWrap.is(':visible')){
                        $menuWrap.hide()
                    } else {
                        $menuWrap.show()
                        showMenuByIndex_renew(_index)
                        equalizeHeight_renew(_index)

                        //검색창 숨김 처리
                        $('#search-autowrap').hide();
                        $("#search-popup").hide();
                        $(".header .search").removeClass("selected");

                        //퀵 메뉴 숨김 처리
                        $('.quick-menu-more').removeClass('on');
                    }
                })
            }

            var onMouseLeaveHandler_renew = function(){
                $menuWrap.on('mouseleave', function(){
                    // $menuWrap.hide()
                })
            }

            var onMenuOverHandler_renew = function(){
                $menuList.on('mouseenter', function(e){
                    var index = $(e.target).closest('li').index()
                    showMenuByIndex_renew(index)
                    equalizeHeight_renew(index)
                })
            }

            var showMenuByIndex_renew = function(index){
                _index = index
                $menuList.removeClass('on').eq(_index).addClass('on')
                $contents.hide().closest("[data-catecode='"+$menuList.eq(_index).data('catecode')+"']").show()
            }
            var equalizeHeight_renew = function(index){
                var $currentContents = $contents.hide().closest("[data-catecode='"+$menuList.eq(_index).data('catecode')+"']").show()
                var maintHeight = $mainMenu.outerHeight()
                var currentContentsHeight = $currentContents.outerHeight()

                if(maintHeight > currentContentsHeight){
                    $currentContents.height(maintHeight-2)
                } else if(currentContentsHeight > maintHeight){
                    $mainMenu.height(currentContentsHeight)
                }
            }

            init_renew()
            return this;
        }
        //for chrome debugger
        //# sourceURL= script-for-Top2.js

        $(document).on('click', '.header-top .logo', function() {
            if($(this).parent('div').attr('class') != 'header-inner') {
                var form = document.createElement('form');
                var objs;

                objs = document.createElement('input');
                objs.setAttribute('type', 'text');
                objs.setAttribute('name', 'cacheYn');
                objs.setAttribute('value', 'N');
                form.appendChild(objs);
                form.setAttribute('method','post');
                form.setAttribute('action','/p/index.do');
                document.body.appendChild(form);
                form.submit();
                //window.location.href = "/p/index.do?cacheYn=N";
            }
        });

    </script>

    <!-- 최근본상품 -->
    <div id="recentlyItem" class="layer-popup recently" style="display:none;">

    </div>




    <!-- 브랜드 검색 : 추천 브랜드  -->
    <div class="layer-popup brand" style="display:none;">
        <!-- style 임시 적용 : 확인용 -->
        <div class="pop-wrap">
            <div class="pop-content-wrap">
                <strong class="pop-title">브랜드 검색</strong>
                <!-- 검색 영역 -->
                <div class="search" role="search">
                    <div class="field">
                        <div class="inputbox">
                            <label class="inplabel"><input type="text" name="brndTp" placeholder="브랜드를 입력해 주세요" title="브랜드 검색"></label>
                            <button class="btn ico-clearabled" onclick="javascript:brnClear();" id="CEOBrndSearchClear"><i class="icon"></i><span class="hiding">지우기</span></button>

                        </div>
                    </div>
                    <button class="btn btn-search"><span>검색</span></button>
                </div>
                <!-- // 검색 영역 -->
                <div class="pop-content">
                    <!-- 팝업 컨텐츠 -->
                    <div class="middle-content">
                        <div class="recommend-brand">
                            <p class="title"><strong>추천 브랜드</strong></p>
                            <ul id="brand-list">
                                <!-- 추천 브랜드 목록 -->
                            </ul>
                        </div>
                        <div class="result-brand" style="display:none;">
                            <p class="title"><strong>'가구' 검색결과</strong><span>총 <em></em>건</span></p>
                            <ul id="hangulSrchResult">

                            </ul>
                        </div>
                        <div class="nodata" style="display:none;">
                            <span class="bgcircle"><i class="icon nodata-type10"></i></span>
                            <p>브랜드 검색결과가 없습니다.</p>
                        </div>
                    </div>
                    <!-- //팝업 컨텐츠 -->
                </div>
            </div>
            <!-- // .pop-content-wrap -->
            <button class="btn-close" onclick="javascript:$('.layer-popup.brand').css('display','none');"><span>팝업 닫기</span></button>
        </div>
    </div>
    <!-- TODO action 변경필요 -->
    <form name="brndSearchMoveForm" action="/p/pde/brndSearchL.do" method="get">
        <input type="hidden" name="srchBrndCd" value="">
        <input type="hidden" name="sort" value="SELL_QTY@DESC">   <!-- 많이 팔린 순 정렬 기본-->
        <input type="hidden" name="moveGbn" value="first">
    </form>
    <!-- 브랜드 검색 : 추천 브랜드  -->
    <script>
        function brndOpenPopup(){
            makeSpecialBrndCategoryUi();
            $('.layer-popup.brand').css('display','block');
        }

        /* GNB - 브랜드검색 */
        function makeSpecialBrndCategoryUi() {
            var specialContents = $("#brand-list");
            var cateStr ="";
            var idx = 0;

            var listMod = 0;

            specialContents.empty();
            var imageServer = 'https://image.hmall.com';

            $.ajax({
                url: "/p/smBrndSearchAjax.do"
                , type: "get"
                , dataType: "json"
                , async: true
                , data: { brndMainType : 'Y'}
                , success: function(data) {
                    for (var i=0; i < 20; i++) {
                        var brndImgPath = imageServer+ "/static/image/sect/brand/disp_img/" + data.brndList[i].dispImgNm;
                        //brndImgPath = brndImgPath + (data.brndList[i].sImgNm == null ? "/large_img/"+data.brndList[i].lImgNm : "/small_img/"+data.brndList[i].sImgNm);
                        cateStr = cateStr + "<li>";
                        cateStr = cateStr + "<a href=#>";
                        cateStr = cateStr + "<span class=\"img-brand\"><img src=\""+ brndImgPath + "\" alt=\"" + data.brndList[i].brndNm + "\" onerror=\"this.src='//image.hmall.com/p/img/co/logo-brand-default.jpg'\" height=\"50\" width=\"50\"></span>";
                        cateStr = cateStr + "<em class=\"name-brand\">" + data.brndList[i].brndNm + "</em>";
                        cateStr = cateStr + "</a>";
                        if(data.brndList[i].brndJjimCnt != 0){
                            cateStr = cateStr + "<button class=\"btn btn-like active\" data-brnd-cd =\""+data.brndList[i].brndCd+"\" data-brnd-nm =\""+data.brndList[i].brndNm+"\" onClick=\"javascript:fnBranChoice('"+data.brndList[i].brndCd+"','" + data.brndList[i].brndNm +"',event);\"><i class=\"icon\"></i><span class=\"hiding\">찜하기</span></button>";
                        }else{
                            cateStr = cateStr + "<button class=\"btn btn-like\" data-brnd-cd =\""+data.brndList[i].brndCd+"\" data-brnd-nm =\""+data.brndList[i].brndNm+"\" onClick=\"javascript:fnBranChoice('"+data.brndList[i].brndCd+"','" + data.brndList[i].brndNm +"',event);\"><i class=\"icon\"></i><span class=\"hiding\">찜하기</span></button>";
                        }
                        cateStr = cateStr + "</li>";
                    }
                    specialContents.append(cateStr);
                }
            });
        }
        /* 대표브랜드 이동 */
        $(document).on('click', '#brand-list li', function() {
            var brndSrchTyp = $(this).find('.btn-like').data('brnd-cd') + ' ' + $(this).find('.btn-like').data('brnd-nm');
            fnBrndSrchMove(brndSrchTyp);
        });

        /* 대표브랜드 이동 */
        function goBrnUrl(obj){
            var brndSrchTyp = $(this).find('.btn-like').data('brnd-cd') + ' ' + $(this).find('.btn-like').data('brnd-nm');
            //console.log($(this).parent().length);
            //console.log('brndSrchTyp :' + brndSrchTyp);
            return false;
            fnBrndSrchMove(brndSrchTyp);
        };

        //브랜드 검색화면으로 이동하는 함수
        function fnBrndSrchMove(srchBrndCd){
            var brndNm = srchBrndCd.split(' ')[1];
            var pathVal = "브랜드검색_" + brndNm;
            $("form[name='brndSearchMoveForm']").find("input[name='srchBrndCd']").val(srchBrndCd);
            $("form[name='brndSearchMoveForm']").submit();
        }

        /* 검색어 삭제 버튼 */
        function brnClear(){

            $("input[name='brndTp']").val('');
            $("input[name='brndTp']").focus();
            $(".result-brand").attr('style', 'display:none');
            $(".recommend-brand").attr('style', 'display:block');
            $("#CEOBrndSearchClear").hide();
        };

        function CEOBrndSearchBtn(){
            var p = $("input[name='brndTp']").val();
            p = p.toUpperCase();

            if(p.length > 0){
                $.ajax({
                    url: "/p/smBrndSearchAjax.do"
                    , type: "get"
                    , dataType: "json"
                    , async: true
                    , data: {  brndSearchTxt : p
                        /* brndSearchTxt : brndSearchTxt, brndSearchVal : brndSearchVal */
                    }
                    , success: function(data) {
                        ajaxBrndResult(data, p)
                        sessionStorage.setItem('brndTp', p);
                        sessionStorage.setItem('srchVal', '');
                        sessionStorage.setItem('srchValId', '');
                    }
                });
            }else{
                alert("검색어를 입력해주세요");
            }
        }

        /*검색박스에 브랜드명 입력시 ajax*/
        $("input[name='brndTp']").keyup(function(e){
            /*검색박스에 입력된 검색어를 가져온다*/
            var p = $("input[name='brndTp']").val();
            p = p.toUpperCase();

            if(p.length > 0){
                $("#CEOBrndSearchClear").show();
                $.ajax({
                    url: "/p/smBrndSearchAjax.do"
                    , type: "get"
                    , dataType: "json"
                    , async: true
                    , data: {  brndSearchTxt : p
                        /* brndSearchTxt : brndSearchTxt, brndSearchVal : brndSearchVal */
                    }
                    , success: function(data) {
                        ajaxBrndResult(data, p)
                        sessionStorage.setItem('brndTp', p);
                        sessionStorage.setItem('srchVal', '');
                        sessionStorage.setItem('srchValId', '');
                    }
                });
            }else{
                $("#CEOBrndSearchClear").hide();
                $(".result-brand").attr('style', 'display:none');
                $(".recommend-brand").attr('style', 'display:block');
            }
            return false;
        });

        /*브랜드검색 비동기호출 함수*/
        function ajaxBrndResult(result, srchTxt){
            /* search-list */
            $(".result-brand .title strong").text("'"+srchTxt+"' 검색결과");
            $("#hangulSrchResult").empty();
            var ulText = $("#hangulSrchResult");
            var qs_text = result;
            var liText = "";
            if (qs_text.brndList.length > 0){
                $(".recommend-brand").attr('style', 'display:none');
                $(".result-brand").attr('style', 'display:block');
                $(".result-brand em").text(qs_text.brndList.length);
                for ( var i=0; i< qs_text.brndList.length ; i++){
                    var brndNmTxt = qs_text.brndList[i].brndNm.replace(srchTxt,'<strong class="keyword">'+srchTxt+'</strong>');
                    liText += '<li><a href="javascript:fnBrndSrchMove(\''+qs_text.brndList[i].brndCd + " " + qs_text.brndList[i].brndNm + '\');"><span class="search-text">'+brndNmTxt+'</span></a>';
                    if(qs_text.brndList[i].brndJjimCnt > 0){
                        liText += '<button class="btn btn-like active" data-brnd-cd ="'+qs_text.brndList[i].brndCd+'" data-brnd-nm ="'+qs_text.brndList[i].brndNm+'" onClick="javascript:fnBranChoice(\''+qs_text.brndList[i].brndCd+ "'\,\'" + qs_text.brndList[i].brndNm +'\',event);"><i class="icon"></i><span class="hiding">찜</span></button></li>';
                    }else{
                        liText += '<button class="btn btn-like" data-brnd-cd ="'+qs_text.brndList[i].brndCd+'" data-brnd-nm ="'+qs_text.brndList[i].brndNm+'" onClick="javascript:fnBranChoice(\''+qs_text.brndList[i].brndCd+ "'\,\'" + qs_text.brndList[i].brndNm +'\',event);"><i class="icon"></i><span class="hiding">찜</span></button></li>';
                    }
                }
                $(".nodata").attr('style', 'display:none');
                $(ulText).append(liText);
            }else{
                $(".recommend-brand").attr('style', 'display:none');
                $(".result-brand").attr('style', 'display:block');
                $(".result-brand em").text('0');
                $(".nodata").attr('style', 'display:block');
                $(".nodata").css('display', 'inline-flex');
            }
        }

        //브랜드 찜 함수
        function fnBranChoice(brndCd, brndNm, event){
            if(event.stopPropagation) {
                event.stopPropagation(); // FF
            } else {
                event.cancelBubble=true; // IE
            }
            if(!event.preventDefault){
                event.returnValue = false; //IE
            } else {
                event.preventDefault();
            }

            if(custNo == null || custNo == '') {
                if(confirm("브랜드 찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")){
                    openLoginPopup('');
                }
                return false;
            }
            $.ajax({
                type: "post"
                ,url: "/p/brndGgimP.do"
                ,data: { "brndCd" : brndCd }
                ,async: true
                ,dataType: 'jsonp'
                ,crossDomain: true
                ,success : function(data) {
                    if (data.ActorError == "false") {
                        var pathVal = "브랜드검색_찜_" + brndNm;
                        $(event.target).parent('button').addClass("active");
                        $("[data-brnd-cd='"+brndCd+"']").addClass('active');
                        alert(data.ErrorMessage);
                    }
                    else {
                        var pathVal = "브랜드검색_찜_취소_" + brndNm;
                        $(event.target).parent('button').removeClass("active");
                        $("[data-brnd-cd='"+brndCd+"']").removeClass('active');
                        alert(data.ErrorMessage);
                    }
                }
            });
        }

    </script>

    <form name="registMemberForm" method="post">
        <input type="hidden" name="email" value="">
        <input type="hidden" name="emailCertNo">
        <input type="hidden" name="langType" value="korean">

        <!-- 전자상거래 규제 개선 -->
        <input type="hidden" name="isOverseasSectPup" value="N">
        <input type="hidden" name="popupYn" value="N">
        <input type="hidden" name="redirectUrl" value="">
        <input type="hidden" name="errorMessage" value="">
        <input type="hidden" name="token">
        <input type="hidden" name="snsType">
    </form>

    <script type="text/javascript">
        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        window.fbAsyncInit = function() {
            FB.init({
                appId      : '532674750212632',
                cookie     : true,
                status     : true,
                xfbml      : true,
                version    : 'v3.2'
            });
        };

        function fbLogin() {
            var pathVal = "^헤더^마이페이지 레이어^페이스북 로그인";

            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            //현재 페이스북 로그인 여부 확인 후 FB.login fuction 호출 여부 구분
            FB.getLoginStatus(function(response){

                if(response.status == "connected") {
                    var token = response.authResponse.accessToken;
                    FB.api('/me', {fields: 'email'}, function(response){
                        //opener.name = "parent";
                        if(response.email !== undefined){
                            var form = $("form[name='registMemberForm']")[0];
                            //form.target = opener.name;
                            form.setAttribute("action", "https://www.hmall.com/p/cob/snsAuth.do");

                            $("input[name='token']").val(token);
                            $("input[name='snsType']").val("10");

                            form.submit();
                            showLoadingBar("180px", "150px");
                        }
                        else{
                            // 페이스북 가입 마지막 단계(가입확인 메일 체크) 확인 안한 계정 로그인시
                            alert("check your confirmation email");
                        }
                        //window.close();
                    });
                }else {
                    FB.login(function(response){
                        if(response.authResponse){
                            var token = response.authResponse.accessToken;
                            FB.api('/me', {fields: 'email'}, function(response){
                                //opener.name = "parent";
                                if(response.email !== undefined){
                                    var form = $("form[name='registMemberForm']")[0];
                                    //form.target = opener.name;
                                    form.setAttribute("action", "https://www.hmall.com/p/cob/snsAuth.do");

                                    $("input[name='token']").val(token);
                                    $("input[name='snsType']").val("10");

                                    form.submit();
                                    showLoadingBar("180px", "150px");
                                }
                                else{
                                    // 페이스북 가입 마지막 단계(가입확인 메일 체크) 확인 안한 계정 로그인시
                                    alert("check your confirmation email");
                                }
                                //window.close();
                            });
                        }
                    }, {scope: 'email'});
                }
            });
        }
    </script>

    <script type="text/javascript">
        function naverLogin() {
            var pathVal = "^헤더^마이페이지 레이어^네이버 로그인";

            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            var returnURL = "";
            var redirect_uri ='https://www.hmall.com';
            /* if(returnURL.indexOf("&") > -1){
            returnURL = returnURL.replace(/&amp;/g,"||");
        } */

            var gnbLoginYn = "Y";
            redirect_uri += '/p/cob/naverLoginChk.do?gnbLoginYn=' + gnbLoginYn + '&returnUrl=' + returnURL;

            var url = "/p/cob/naverLogin.do?redirect_uri=" + encodeURIComponent(redirect_uri);
            var popName = "NaverLogin";
            var popOption = "height=760, width=795, fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no, top=0, left=0, status=no";
            window.open(url, popName, popOption);
        }

        setTopBanner();

        loadPCdirect();
        ajaxCallback();
    </script>

    <script type="text/javascript" defer="defer">
        (function() {
            function gaUseWinload() {
                //for google analytics click event
                useWinload();
            }
            if (window.attachEvent) {
                window.attachEvent('onload', gaUseWinload);
            } else {
                window.addEventListener('load', gaUseWinload, false);
            }
        })();
    </script>
    <!--//header -->

    <!-- //gnb -->
    <main class="cmain customer" role="main">
        <div class="container">
            <!-- LNB 시작 -->




            <script type="text/javascript">
                //1:1 상담
                function openCnslAcptPup(obj){
                    if(isLogin() == 'true'){
                        var url = "/p/ccd/selectCnslAcptPup.do?cnslCsfCd=" + obj;
                        if(isEmpty(obj)){
                            url = "/p/ccd/selectCnslAcptPup.do";
                        }
                        var popName = "selectCnslAcptPup";
                        var popOption = "height=660, width=650, fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                        window.open(url,popName,popOption);
                    }else{
                        openLoginPopup();
                    }
                }

            </script>


            <div class="side-content">

                <h2 class="side-menu-title" onclick="javascript:location.href='${contextPath}/customer'" style="cursor:pointer;">고객센터</h2>
                <div class="side-menu-list">
                    <ul>
                        <li><a href="${contextPath}/customer/inquiryPage">1:1 문의하기</a></li>
                        <li><a href="${contextPath}/customer/myInquiryPage">내 상담내역 조회하기</a></li>
                        <li><a href="${contextPath}/customer/noticeList">공지사항</a></li>
                    </ul>
                </div>
            </div>
            <!-- // LNB 끝 -->

            <!-- .contents -->

            <div class="contents">
                <!--공지사항-->
                <div class="cus-wrap">
                    <h3>공지사항</h3>
                    <!--tblwrap tbl-list-->
                    <div class="tblwrap tbl-list">
                        <table id="noticeTable">
                            <caption>고객센터 공지사항</caption>
                            <colgroup>
                                <col style="width:70px">
                                <col style="width:500px">
                                <col style="width:125px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">NO</th>
                                <th scope="col">제목</th>
                                <th scope="col">등록일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${noticeList}" var="notice" varStatus="status">
                                <tr>
                                    <td class="txt-center"><div class="arrow>">${status.index+1}</div></td>
                                    <td class="txt-left nowrap">${notice.notice_title}</td>
                                    <td class="txt-left nowrap">
                                        <fmt:formatDate value="${notice.created_at}" pattern="yyyy-MM-dd"/>
                                    </td>

                                </tr>
                                <tr>
                                    <td  colspan="3">
                                        <div class="consult-form-wrap">
                                            <h3 style="margin-top: -20px;">공지 내용</h3>
                                            <!--문의내용-->
                                            <div class="consult-form" style="background-color:aliceblue; border-radius: 5px;">
                                                <div class="field">
                                                    <div>
                                                        <label class="txtlabel">
                                                            <textarea cols="28" rows="2" readonly style="resize:none; height:30px;">${notice.notice_content}</textarea>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--//tblwrap tbl-list-->
                    <!--paging-->
                    <div class="paging">
                        <div class="page-prevarea">





                            <div class="page-prevarea">








                                <strong aria-label="현재 선택페이지">1</strong>



                                <a href="/p/ccb/noticeList.do?page=2">2</a>




                                <a href="/p/ccb/noticeList.do?page=3">3</a>




                                <a href="/p/ccb/noticeList.do?page=4">4</a>







                            </div>



                        </div>
                    </div>
                    <!--//paging-->
                </div>
                <!--//공지사항-->
            </div>
            <!-- // .contents -->
        </div>
        <!-- //.container -->
    </main>
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
    <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052701"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052701"></script>

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
            GA_info[GACustomKey.Dimension8] = "20220526";
            GA_info[GACustomKey.Dimension9] = "20220526";

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
            GA_info[GACustomKey.Dimension28] = "20220526";

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
                    ,url: "https://wwwca.hmall.com/p/coe/onAirList.do?time=052701"
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
                            ,url: "/p/coe/onAirList.do?time=052701"
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
                    ,url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList.do?time=052701"
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
                            ,url: "/p/coe/onAirCardPrmoList.do?time=052701"
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


</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#noticeTable tr:odd").addClass("odd");
        $("#noticeTable tr:not(.odd)").hide();
        $("#noticeTable tr:first-child").show(); //열머리글 보여주기

        $("#noticeTable tr.odd").click(function(){
            $(this).next("tr").toggle();
            $(this).find("#toggle").toggleClass("up");

        });
    });
</script>


<script type="text/javascript" async="" src="//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js"></script><script type="text/javascript" async="" src="//image.hmall.com/p/js/co/tagging.collector-1.3.min.js"></script><div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;"><div></div></div>