<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-27
  Time: 오전 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
  <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/common.css"><!-- 공통 css -->
  <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/layout.css"><!-- 공통 Layout css -->
  <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/popup.css"><!-- 공통 Popup css -->
  <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
  <style>
    .hidden {display:none !important;}
  </style>
  <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
  <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
  <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
  <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
  <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
  <script src="//image.hmall.com/p/js/co/common.js"></script><!-- UI에 사용하는 기본 js  -->
  <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
  <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
  <script src="//image.hmall.com/p/js/co/commonFunction.js"></script><!-- as-is common.js 상속  -->
  <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->

  <!-- Google analytics -->
  <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052711"></script>
  <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052711"></script>



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
      GA_info[GACustomKey.Dimension9] = "20220527";

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
    var changeChk = '';
    var seller_host_customer = "https://htalk.hmall.com/happytalk/customer";
    var claimDiv = ""; //mCnslCsfCdBoardFixed
    var ordNo = "";
    var ordPtcSeq = "";


    jQuery(function($) {

      // 옵션 select
      $(document).on("change", "select[id*=exchUitmSelect]", function(e) {
        exchUitmSel(this, e);
      });

      $(document).on("click", '#attachImg1, #attachImg2, #attachImg3', function(e) {
        console.log("attach icon clicked");
        var agent = navigator.userAgent.toLowerCase();
        if ( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
          uploadImgIEcase($(this));
        } else {
          uploadImg($(this));
        }
      });

      $(document).on('click', '#attachVideo', function(e) {
        if(e.target.className.indexOf("attach") > -1) {
          $(".marginB15").hide();
          deleteImg(this);
          return false;
        }else{
          if ( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1)) {
            uploadImgIEcase($(this));
          } else {
            uploadImg($(this));
          }
        }
      });

      window.resizeTo(700,680);
      $("div.hideBtnGroup").attr('style', 'display:none');

      if(!isEmpty(claimDiv)){
        if(claimDiv == "cancle"){
          $("select[name='cnslCsfCd']").change(function(){
            var url = "";
            var mCnslCsfCd = $("select[name='mCnslCsfCd']").val();
            switch(mCnslCsfCd){
              case '0405' 	: 	url = "/p/mpa/selectOrdCnclReqPup.do";
                break;
              case '0404' 	: 	url = "/p/mpa/selectOrdRtpReqPup.do";
                break;
              case '0501' 	: 	url = "/p/mpa/selectOrdDlvWtdwReqPup.do";
                break;
              case '0303' 	: 	url = "/p/mpa/selectOrdStlmRepyReqPup.do";
                break;
              case '0402' 	: 	url = "/p/mpa/selectOrdExchReqPup.do";
                break;
              case '0401' 	: 	url = "/p/mpa/selectOrdASReqPup.do";
                break;
              default		: 	$("select[name='cnslCsfCd']").append('<option value="">상담 사유</option>');
                submitUrl="";
                return;
            }
            $.ajax({
              type: "get"
              ,url: url
              ,data: {ordNo:ordNo, ordPtcSeq:ordPtcSeq, claimDiv:claimDiv}
              ,dataType: "html"
              ,async: true
              ,success : function(data) {
                choiceProductCallBack(data);
              },
              error : function(){
                console.log("json error");
              }
            });
          });
        }else{
          var url;
          if(claimDiv == "return"){
            $("select[name='mCnslCsfCd']").parent().selectbox().selected("0404");
            inSelectHtml('0404');
            url = "/p/mpa/selectOrdRtpReqPup.do";
            $("select[name='mCnslCsfCd']").parent().addClass("disabled");
          }else if(claimDiv == "change"){
            $("select[name='mCnslCsfCd']").parent().selectbox().selected("0402");
            inSelectHtml('0402');
            url = "/p/mpa/selectOrdExchReqPup.do";
            $("select[name='mCnslCsfCd']").parent().addClass("disabled");
          }
          $.ajax({
            type: "get"
            ,url: url
            ,data: {ordNo:ordNo, ordPtcSeq:ordPtcSeq, claimDiv:claimDiv}
            ,dataType: "html"
            ,async: true
            ,success : function(data) {
              choiceProductCallBack(data);
            },
            error : function(){
              console.log("json error");
            }
          });
        }
      }

      if(isEmpty(claimDiv)){

        $("select[name='cnslCsfCd']").change(function(){
          var cnslCsfCd = $("select[name='cnslCsfCd']").val();
          if(isEmpty(cnslCsfCd)){
            $("#productChoiceMsg").css("display","none");
            $("#cnslNoItemMsg").css("display","none");
            $("#cnslChoiceMsg").css("display","block");
            $("div.popup-win")[0].classList.remove("product-delete");
            $('#divContent').children().remove();
            $("#choiceItemDiv").children().remove();
          }else if(cnslCsfCd.substr(0,2) == '07'){
            //Do nothing
          }else{
            var mCnslCsfNm = $("select[name='mCnslCsfCd'] option:checked").text();
            $.ajax({
              type: "post"
              ,url: "/p/ccd/selectCnslAcptViewList.do"
              ,data: {cnslCsfCd:$("select[name='cnslCsfCd']").val(), page:changeChk, mCnslCsfNm: mCnslCsfNm, ordNo:ordNo}
              ,dataType: "json"
              ,async: false
              ,success : function(data) {
                if(data.ordList.length <= 0){
                  $("#choiceItemDiv").children().remove();
                  if($("select[name='mCnslCsfCd']").val() == "0401"){
                    $("#cnslNoItemMsg").html("<p><em>"+mCnslCsfNm+"</em> 가능한 주문/배송 내역이 없습니다.</p>");
                  }else{
                    $("#cnslNoItemMsg").html("<p>최근 12개월 내 <em>"+mCnslCsfNm+"</em> 가능한 주문/배송 내역이 없습니다.</p>");
                  }
                  $("#cnslNoItemMsg").css("display","block");
                  $("#cnslChoiceMsg").css("display","none");
                }else{
                  $("#choiceItemDiv").children().remove();
                  $("#productChoiceMsg").css("display","block");
                  $("#cnslNoItemMsg").css("display","none");
                  $("#cnslChoiceMsg").css("display","none");
                  $("div.popup-win")[0].classList.add("product-delete");
                }
              }
            });
          }
          changeChk = 1;
        });
      }


      $("select[name='mCnslCsfCd']").change(function(){

        $('#divContent').children().remove();

        var mCnslCsfCd = $(this).val();
        var sCnslCsfCd = "";
        $("#productChoiceMsg").css("display","none");
        $("#cnslChoiceMsg").css("display","block");
        $("#cnslNoItemMsg").css("display","none");
        $("#choiceItemDiv").children().remove();
        inSelectHtml(mCnslCsfCd);
        $("div.hideBtnGroup").attr('style', 'display:none');
        changeChk = 1;
        console.log("mCnslCsfCd  : " + mCnslCsfCd);

        if(mCnslCsfCd.substr(0,2) == '07'){
          $("#cnslChoiceMsg").css("display","none");
          $("div.popup-win")[0].classList.add("product-delete");
          //popup-win div에 product-delete class 추가 필요
          if(mCnslCsfCd.substr(0,4) == '0712'){
            sCnslCsfCd = "071201"
            setViewForm(sCnslCsfCd)
          }else{
            sCnslCsfCd = "070102"
            setViewForm(sCnslCsfCd)
          }
          window.resizeTo(700,930);
        }
      });



      $("#cnslCntn").live('keyup', function(){
        limitBytes('cnslCntn', 1000);
        var len = getByteLength($('#cnslCntn').val());
        $("span.textareaBytes").text(len);
      });


    });

    function byteLength(input){
      var iByteLength = 0;
      for (var i = 0; i < input.length; i++) {
        var sChar = escape(input.charAt(i));
        if (sChar.length == 1 ) {
          iByteLength ++;
        } else if (sChar.indexOf("%u") != -1) {
          iByteLength += 2;
        } else if (sChar.indexOf("%") != -1) {
          iByteLength += sChar.length/3;
        }
      }
      return iByteLength;
    }


    function deleteImg(target){
      //$("#attachImg"+target.id).removeClass("attach");
      //$("#thumbnail"+target.id).remove();
      var thumbnailSize = $("img[id^='thumbnail']").length;

      if (target.id == "1") {

        if (thumbnailSize == 3) {
          $("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
          $("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
          $("#thumbnail1")[0].title = $("#thumbnail2")[0].title;
          $("#thumbnail2")[0].title = $("#thumbnail3")[0].title;

          $("#attachImg3").removeClass("attach");
          $("#thumbnail3").remove();
          $("#3").css("display","none");
        } else if (thumbnailSize == 2) {
          $("#thumbnail1")[0].src = $("#thumbnail2")[0].src;
          $("#thumbnail1")[0].title = $("#thumbnail2")[0].title;

          $("#attachImg2").removeClass("attach");
          $("#thumbnail2").remove();
          $("#2").css("display","none");
        } else {

          $("#attachImg1").removeClass("attach");
          $("#thumbnail1").remove();
          $("#1").css("display","none");
        }

      } else if (target.id == "2") {

        if (thumbnailSize == 3) {
          $("#thumbnail2")[0].src = $("#thumbnail3")[0].src;
          $("#thumbnail2")[0].title = $("#thumbnail3")[0].title;

          $("#attachImg3").removeClass("attach");
          $("#thumbnail3").remove();
          $("#3").css("display","none");
        } else if (thumbnailSize == 2) {
          $("#attachImg2").removeClass("attach");
          $("#thumbnail2").remove();
          $("#2").css("display","none");
        }
      } else {
        $("#attachImg3").removeClass("attach");
        $("#thumbnail3").remove();
        $("#3").css("display","none");
      }
    }



    function choiceProductCallBack(data) {
      window.resizeTo(700,930);
      $("#choiceItemDiv").html(data).css("display","block");
      $("#cnslChoiceMsg").css("display","none");
      $("#productChoiceMsg").css("display","none");
      $(".custom-selectbox").selectbox();
      $("div.popup-win")[0].classList.add("product-delete");
    }

    //1:1 상담
    function openCnslAcptPup(){
      var cnslCsfCd = $("select[name='cnslCsfCd']").val();
      var url = "/p/ccd/selectCnslAcptView.do"
              +"?cnslCsfCd="+cnslCsfCd
              +"&page="+changeChk
              +"&mCnslCsfNm="+$("select[name='mCnslCsfCd'] option:checked").text();

      if(ordNo != '' ){
        url += "&ordNo="+ordNo;
      }

      var popName = "selectCnslAcptView";
      var popOption = "fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
      window.open(url,popName,popOption);
    }


    function setViewForm(cnslCsfCd){
      $.ajax({
        type: "post"
        ,url: "/p/ccd/selectCnslAcptView.do"
        ,data: {cnslCsfCd:cnslCsfCd, page:changeChk, mCnslCsfNm: $("select[name='mCnslCsfCd'] option:checked").text()}
        ,dataType: "html"
        ,async: false
        ,success : function(html) {
          $('#choiceItemDiv').html(html);
        }
      });
      $("div.hideBtnGroup").attr('style', 'display:none');
    }
    //상세 내역 select 생성
    function inSelectHtml(mCnslCsfCdBoard){
      $("select[name='cnslCsfCd']").html('');

      var selectHtml1="";
      var selectHtml2="";
      var selectHtml3="";
      var selectHtml4="";
      var selectHtml5="";
      var selectHtml6="";
      var selectHtml7="";
      var selectHtml8="";

      //취소신청
      selectHtml1 += '	<option value="">상담 사유</option>									      ';
      selectHtml1 += '	<option value="040501">변심</option>									      ';
      selectHtml1 += '	<option value="040501">유사상품 구입</option>						      ';
      selectHtml1 += '	<option value="040501">결제변경</option>								      ';
      selectHtml1 += '	<option value="040501">단품변경</option>								      ';
      selectHtml1 += '	<option value="040501">가격변경</option>								      ';
      selectHtml1 += '	<option value="040501">배송지연</option>								      ';
      selectHtml1 += '	<option value="040501">기타문의</option>								      ';

      //반품신청
      selectHtml2 += '	<option value="">상담 사유</option>									      ';
      selectHtml2 += '	<option value="040401">변심</option>									      ';
      selectHtml2 += '	<option value="040401">이미지차이</option>							      ';
      selectHtml2 += '	<option value="040401">상품불량(작동불량)</option>				      ';
      selectHtml2 += '	<option value="040401">반품배송</option>								      ';
      selectHtml2 += '	<option value="040401">지연</option>									      ';
      selectHtml2 += '	<option value="040401">기타사유</option>								      ';

      //배송/회수 문의
      selectHtml3 += '	<option value="">상담 사유</option>									      ';
      selectHtml3 += '	<option value="050103">배송문의</option>								      ';
      selectHtml3 += '	<option value="050105">배송지 변경요청</option>';
      selectHtml3 += '	<option value="050103">출고후 배송지연</option>					      ';
      selectHtml3 += '	<option value="050103">지정일 배송문의</option>					      ';
      selectHtml3 += '	<option value="050103">회수지연</option>								      ';
      selectHtml3 += '	<option value="050103">기타문의</option>								      ';

      //결제/환불 문의
      selectHtml4 += '	<option value="">상담 사유</option>									      ';
      selectHtml4 += '	<option value="030304">입금확인문의</option>						      ';
      selectHtml4 += '	<option value="030304">예치금환불</option>							      ';
      selectHtml4 += '	<option value="030304">상품권 결제 문의</option>					      ';
      selectHtml4 += '	<option value="030304">기타문의</option>								      ';

      //교환신청
      selectHtml5 += '	<option value="">상담 사유</option>									      ';
      selectHtml5 += '	<option value="0402">포장불량</option>								      ';
      selectHtml5 += '	<option value="0402">색상변경</option>								      ';
      selectHtml5 += '	<option value="0402">상품불량(작동불량)</option>				       ';
      selectHtml5 += '	<option value="0402">사이즈변경</option>				       ';
      selectHtml5 += '	<option value="0402">구성품누락</option>				       ';
      selectHtml5 += '	<option value="0402">교환지연</option>								      ';
      selectHtml5 += '	<option value="0402">교환방법문의</option>						      ';
      selectHtml5 += '	<option value="0402">기타문의</option>								      ';

      //AS신청
      selectHtml6 += '	<option value="">상담 사유</option>									      ';
      selectHtml6 += '	<option value="040101">작동불량</option>								      ';
      selectHtml6 += '	<option value="040101">수선</option>									      ';
      selectHtml6 += '	<option value="040101">AS센터 전화번호 확인</option>				      ';
      selectHtml6 += '	<option value="040101">AS가능여부 확인</option>					      ';
      selectHtml6 += '	<option value="040101">AS신청 후 처리사항</option>				      ';
      selectHtml6 += '	<option value="040101 ">기타 문의 </option>							      ';

      //시스템오류
      selectHtml7 += '    <option value="071201" selected>시스템오류/불편사항</option>				       ';

      //서비스문의
      selectHtml8 += '    <option value="070102" selected>이벤트문의(문화공연/일반)</option>				       ';

      switch(mCnslCsfCdBoard){
        case '0405' 	: 	$("select[name='cnslCsfCd']").append(selectHtml1);
          break;
        case '0404' 	: 	$("select[name='cnslCsfCd']").append(selectHtml2);
          break;
        case '0501' 	: 	$("select[name='cnslCsfCd']").append(selectHtml3);
          break;
        case '0303' 	: 	$("select[name='cnslCsfCd']").append(selectHtml4);
          break;
        case '0402' 	: 	$("select[name='cnslCsfCd']").append(selectHtml5);
          break;
        case '0401' 	: 	$("select[name='cnslCsfCd']").append(selectHtml6);
          break;
        case '0712'  :   $("select[name='cnslCsfCd']").append(selectHtml7);
          break;
        case '0701' : 	$("select[name='cnslCsfCd']").append(selectHtml8);
          break;
        default		: 	$("select[name='cnslCsfCd']").append('<option value="">상담 사유</option>');
          submitUrl="";
          break;
      }
      //$("select[name='cnslCsfCd']").append(html);
      $("#cnslCsfCd").selectbox('refresh');
    }

    function getByteLength(input) {
      var iByteLength = 0;
      for (var i = 0; i < input.length; i++) {
        var sChar = escape(input.charAt(i));
        if (sChar.length == 1 ) {
          iByteLength ++;
        } else if (sChar.indexOf("%u") != -1) {
          iByteLength += 2;
        } else if (sChar.indexOf("%") != -1) {
          iByteLength += sChar.length/3;
        }
      }
      return iByteLength;
    }

    function changeCnslChatAcpt() {
      window.location.href = "/p/ccd/selectCnslChatAcptPup.do";
    }

    function openOrderListPup(){
      var url="/product/openOrderListPup";
      var popName="totalOrderListPup"
      var popOption="height=616, width=800, fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
      window.open(url, popName, popOption);
    }

    /*
     * 웹 이미지 업로드
     *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
     */
    function uploadImgIe(obj){
      var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
      var imgId = "#getfile_" + imgSeq;
      var file = document.querySelector(imgId);

      var max_size = 0;
      var min_size = 0;
      var width = 0;
      var height = 0;
      var orientation = 0;
      var dataURIRotate;

      $(imgId).trigger('click');

      var files2 = file.files.length;

      if(files2 > 0) {
        $("#attachImg"+ imgSeq).addClass("attach");
        //file.onchange = function () {
        var fileList = file.files ;

        // 읽기
        var reader = new FileReader();
        reader.readAsDataURL(fileList [0]);

        //로드 한 후
        reader.onload = function  () {
          if(imgSeq < 4) {

            if(fileList [0].size > 10000000) {
              alert('10MB 이하크기의 사진만 등록이 가능합니다.');
              return false;
            }

            var fne = fileList[0].name.substring(fileList[0].name.lastIndexOf(".")+1,fileList[0].name.length).toLowerCase();
            if(filechk(fne)) {
              if ($.browser.msie) { // ie 일때 input[type=file]
                $("#getfile_" + imgSeq).replaceWith( $(imgId).clone(true) );
              } else { // other browser 일때 input[type=file] init.
                $("#getfile_" + imgSeq).val("");
              }

              $("#attachImg"+ imgSeq).removeClass("attach");

              alert(fne+" 형식 파일은 등록이 불가합니다.\nJPG,PNG,GIF 형식으로 등록해주세요.");

              return false;
            }

            //썸네일 이미지 생성
            var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
            tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

            tempImage.onload = function () {

              //사진 EXIF 정보 가져오기
              window.EXIF.getData(tempImage, function () {
                orientation = window.EXIF.getTag(this, "Orientation");
              });

              //리사이즈를 위해 캔버스 객체 생성
              var canvas = document.createElement('canvas');
              max_size = 800;
              width = tempImage.width;
              height = tempImage.height;

              if(width < 300 || height < 300){
                alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                $("#getfile_" + imgSeq).replaceWith( $("#getfile_" + imgSeq).clone(true) );
                $("#attachImg"+ imgSeq).removeClass("attach");
                return false;
              }

              if (width > height) {
                if (width > max_size) {
                  height *= max_size / width;
                  width = max_size;
                }
              } else {
                if (height > max_size) {
                  width *= max_size / height;
                  height = max_size;
                }
              }

              canvas.width = width;
              canvas.height = height;
              canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
              var dataUrl = canvas.toDataURL('image/jpeg');
              //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

              //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
              var dataURI = canvas.toDataURL("image/jpeg");

              // store current data to an image
              myImage = new Image();
              myImage.src = dataURI;

              myImage.onload = function () {
                // reset the canvas with new dimensions

                switch(orientation){
                  case 6:
                  case 8:
                    canvas.width = height;
                    canvas.height = width;
                    width = canvas.width;
                    height = canvas.height;

                    canvas.getContext('2d').save();
                    if(orientation == 6){
                      canvas.getContext('2d').translate(width, 0);
                      canvas.getContext('2d').rotate(90 * Math.PI / 180);
                    }else{
                      canvas.getContext('2d').translate(0, height);
                      canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                    }
                    break;

                  case 1:
                  case 3:
                    canvas.width = width;
                    canvas.height = height;
                    width = canvas.height;
                    height = canvas.width;

                    if(orientation == 3){
                      canvas.getContext('2d').translate(height, width );
                      canvas.getContext('2d').rotate(180 * Math.PI / 180);
                    }
                }

                // draw the previows image, now rotated
                canvas.getContext('2d').drawImage(myImage, 0, 0);
                canvas.getContext('2d').restore();

                dataURIRotate = canvas.toDataURL("image/jpeg");

                var imgId = "thumbnail" + imgSeq;
                //var srcImg = "<img class='addImg' src='' id=" + imgId +" />";
                var srcImg = "<img src='' id=" + imgId +" onerror=noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg')/>";

                var thumnailId = "attachImg" + imgSeq;
                $("#"+ thumnailId).append(srcImg);
                //$("#"+ thumnailId).find("a._delimg").show();

                //썸네일 이미지 보여주기
                document.querySelector('#' + imgId).src = dataURIRotate;

                callAjax(dataURIRotate,imgId,imgSeq, fileList [0].name,"1");
              };
            }; //tempImage.onload
          }
        };
      }
    }

    function uploadImgCh(obj){
      var imgSeq = Number(obj.attr('id').replace("attachImg", ""));
      var imgId = "#getfile_" + imgSeq;
      var file = document.querySelector(imgId);

      var max_size = 0;
      var width = 0;
      var height = 0;
      var orientation;
      var dataURIRotate;

      $(imgId).trigger('click');

      file.onchange = function () {
        $("#attachImg"+ imgSeq).addClass("attach");
        var fileList = file.files ;

        // 읽기
        var reader = new FileReader();
        reader.readAsDataURL(fileList [0]);

        //로드 한 후
        reader.onload = function  () {
          if(imgSeq < 4) {

            if(fileList [0].size > 10000000) {
              alert('10MB 이하크기의 사진만 등록이 가능합니다.');
              return false;
            }

            var fne = fileList[0].name.substring(fileList[0].name.lastIndexOf(".")+1,fileList[0].name.length).toLowerCase();
            if(filechk(fne)) {
              if ($.browser.msie) { // ie 일때 input[type=file]
                $("#getfile_" + imgSeq).replaceWith( $(imgId).clone(true) );
              } else { // other browser 일때 input[type=file] init.
                $("#getfile_" + imgSeq).val("");
              }

              $("#attachImg"+ imgSeq).removeClass("attach");

              alert(fne+" 형식 파일은 등록이 불가합니다.\nJPG,PNG,GIF 형식으로 등록해주세요.");

              return false;
            }

            //썸네일 이미지 생성
            var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
            tempImage.src = reader.result; //data-uri를 이미지 객체에 주입

            tempImage.onload = function () {

              //사진 EXIF 정보 가져오기
              window.EXIF.getData(tempImage, function () {
                orientation = window.EXIF.getTag(this, "Orientation");
              });

              //리사이즈를 위해 캔버스 객체 생성
              var canvas = document.createElement('canvas');
              max_size = 800;
              width = tempImage.width;
              height = tempImage.height;

              if(width < 300 || height < 300){
                alert("300x300 사이즈 이상 이미지로 등록해주세요.");
                $("#getfile_" + imgSeq).val("");
                $("#attachImg"+ imgSeq).removeClass("attach");
                return false;
                return false;
              }

              if (width > height) {
                if (width > max_size) {
                  height *= max_size / width;
                  width = max_size;
                }
              } else {
                if (height > max_size) {
                  width *= max_size / height;
                  height = max_size;
                }
              }

              canvas.width = width;
              canvas.height = height;
              canvas.getContext('2d').drawImage(tempImage, 0, 0, width, height);
              var dataUrl = canvas.toDataURL('image/jpeg');
              //var dataUrl = canvas.toDataURL('image/jpeg', 0.90);   // 이미지 퀄리티 조절도 가능...

              //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
              var dataURI = canvas.toDataURL("image/jpeg");

              // store current data to an image
              myImage = new Image();
              myImage.src = dataURI;

              myImage.onload = function () {
                // reset the canvas with new dimensions

                switch(orientation){
                  case 6:
                  case 8:
                    canvas.width = height;
                    canvas.height = width;
                    width = canvas.width;
                    height = canvas.height;

                    canvas.getContext('2d').save();
                    if(orientation == 6){
                      canvas.getContext('2d').translate(width, 0);
                      canvas.getContext('2d').rotate(90 * Math.PI / 180);
                    }else{
                      canvas.getContext('2d').translate(0, height);
                      canvas.getContext('2d').rotate(-90 * Math.PI / 180);
                    }
                    break;

                  case 1:
                  case 3:
                    canvas.width = width;
                    canvas.height = height;
                    width = canvas.height;
                    height = canvas.width;

                    if(orientation == 3){
                      canvas.getContext('2d').translate(height, width );
                      canvas.getContext('2d').rotate(180 * Math.PI / 180);
                    }
                }

                // draw the previows image, now rotated
                canvas.getContext('2d').drawImage(myImage, 0, 0);
                canvas.getContext('2d').restore();

                dataURIRotate = canvas.toDataURL("image/jpeg");

                var imgId = "thumbnail" + imgSeq;
                //var srcImg = "<img class='addImg' src='' id=" + imgId +" />";
                var srcImg = "<img src='' id=" + imgId +" onerror=noImage(this, 'https://image.hmall.com/hmall/pd/no_image_100x100.jpg') />";

                var thumnailId = "attachImg" + imgSeq;
                $("#"+ thumnailId).append(srcImg);
                //$("#"+ thumnailId).find("a._delimg").show();

                //썸네일 이미지 보여주기
                document.querySelector('#' + imgId).src = dataURIRotate;

                var theimg = document.getElementById("thumbnail1");    //?

                callAjax(dataURIRotate,imgId,imgSeq, fileList [0].name,"1");
              };
            }; //tempImage.onload
          }

        }; //reader.onload
      }
    }

    /*
     * 웹 이미지 업로드
     *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
     */
    function uploadImg(obj){
      var imgSeq = Number(obj.attr('id').replace("attachImg", ""));


      if (obj.find("img").length != 0) {
        $(this).removeClass("attach").children("img").remove();
        return;
      }


      var imgId = "#getfile_" + imgSeq;
      //var imgId = "#getfile_1";
      var file = document.querySelector(imgId);
      file.value='';
      var canvas = document.createElement('canvas');

      var max_size = 0;
      var width = 0;
      var height = 0;
      var orientation = 0;
      var dataURIRotate;

      $(imgId).trigger('click');

      file.onchange = function () {

        var fileList = file.files ;

        if($("img[id^='thumbnail']").length + fileList.length>3){
          alert("이미지는 3장이상 추가할 수 없습니다");
          return;
        }else{
          var thumbSize = $("img[id^='thumbnail']").length;

          for(var i=0; i< fileList.length;i++){
            var f = fileList[i];
            var idx = thumbSize + i + 1;
            var imgId = "thumbnail" + idx;
            if(!f.type.match('image')) continue;

            $("#"+idx).css("display","block");

            var picReader = {};
            picReader[i] = new FileReader();

            picReader[i].addEventListener("load", picCallback.bind(null, some_other_func,f,idx,imgId),false);
            picReader[i].readAsDataURL(f);
          }
        }

      } //file.onchange
    }


    /*
     * 웹 이미지 업로드
     *  - 업로드 전에 HTML에서 이미지 압축까지해서 서버로 전송
     */
    function uploadImgIEcase(obj){
      var imgSeq = Number(obj.attr('id').replace("attachImg", ""));


      if (obj.find("img").length != 0) {
        $(this).removeClass("attach").children("img").remove();
        return;
      }


      var imgId = "#getfile_" + imgSeq;
      //var imgId = "#getfile_1";
      var file = document.querySelector(imgId);

      var canvas = document.createElement('canvas');

      var max_size = 0;
      var width = 0;
      var height = 0;
      var orientation = 0;
      var dataURIRotate;

      $(imgId).trigger('click');

      var files2 = file.files.length;

      if(files2 > 0) {
        //file.onchange = function () {

        var fileList = file.files ;

        if($("img[id^='thumbnail']").length + fileList.length>3){
          alert("이미지는 3장이상 추가할 수 없습니다");
          return;
        }else{
          var thumbSize = $("img[id^='thumbnail']").length;

          for(var i=0; i< fileList.length;i++){
            var f = fileList[i];
            var idx = thumbSize + i + 1;
            var imgId = "thumbnail" + idx;
            if(!f.type.match('image')) continue;

            $("#"+idx).css("display","block");

            var picReader = {};
            picReader[i] = new FileReader();

            picReader[i].addEventListener("load", picCallback.bind(null, some_other_func,f,idx,imgId),false);
            picReader[i].readAsDataURL(f);
          }
        }

      } //file.onchange
    }

    function picCallback(otherFunc,f,idx,imgId,event){
      otherFunc(f,idx,imgId,event);
    }

    function some_other_func(f,idx,imgId,event){
      var picFile = event.target;
      var srcImg = "<img id=\"" + imgId +"\" src='" + picFile.result + "' title='" + f.name+ "' />";
      var thumnailId = "attachImg" + idx;

      $("#"+ thumnailId+" .upfile").append(srcImg);
      $("#"+ thumnailId).addClass("attach");
      callAjax(picFile.result,imgId,idx,f.name,"1");
    }

    function filechk(fileDir){

      var rtnVal = false;

      if(fileDir.search("jpg") == -1 && fileDir.search("png") == -1 && fileDir.search("gif") == -1 && fileDir.search("jpeg") == -1) {
        rtnVal = true;
      }

      return rtnVal;
    }

    function callAjax(dataURIRotate,imgId,imgSeq,filename,atflGbcd) {
      //page_loading();
      //파일 전송
      var blob = dataURItoBlob(dataURIRotate);
      var formData = new FormData();
      formData.append(filename, blob);
      formData.append("atflGbcd",atflGbcd);
      formData.append("csYn","Y");

      $.ajax({
        url: '/p/pdc/insertResizeImg.do',
        type: "post",
        dataType: "json",
        data : formData,
        // cache: false,
        processData: false,
        contentType: false,
        success: function(data, textStatus, jqXHR) {
          var returnPath = data.returnPath;
          document.querySelector('#' + imgId).src = returnPath;
          $("#attachImg"+ imgSeq).addClass("attach");
          //remove_page_loading();
          //remove_page_dim();
        }, error: function(jqXHR, textStatus, errorThrown) {
          alert('사진 업로드에 실패하였습니다. error');
          $("#attachImg"+ imgSeq).removeClass("attach");
          location.reload();
          //remove_page_loading();
          //remove_page_dim();
        }
      });
    }

    //html5의 Canvas를 사용해서 이미지 리사이징이 가능한지 판별하는 메소드
    function isImageResizable() {
      var isCanvasUsable = !!document.createElement('canvas').getContext;
      var isLowerIE = false;

      if($.browser.msie) {
        if($.browser.version < 10) {    // IE9은 Canvas는 쓸 수 있지만 file input에서 file Object를 가져오지 못해 제외
          isLowerIE = true;
        }
      }

      return isCanvasUsable && !isLowerIE;
    }

    function dataURItoBlob(dataURI){
      var byteString = atob(dataURI.split(',')[1]);
      var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]
      var ab = new ArrayBuffer(byteString.length);
      var ia = new Uint8Array(ab);
      for (var i = 0; i < byteString.length; i++)
      {
        ia[i] = byteString.charCodeAt(i);
      }

      var bb = new Blob([ab], { "type": mimeString });
      return bb;
    }

    //1:1 채팅 상담 시작하기 클릭시 게시판 상담쪽으로 이동(그안에 채팅버튼노출)
    function openCnslChat(){
      openAlert();

      if(isLogin() == 'true'){



      }
      formCheckSubmitSellerChat();

    }


    //1:1채팅상담 서비스점검 alert
    function openAlert() {

    }

    /**
     * 입력한 문자열의 바이트를 계산한다.
     * @param obj
     * @param limitByte
     */
    function checkCntn(obj, limitByte) {

      $obj = $(obj);
      var inputStr = $obj.val();

      var iByteLength = 0;
      for (var i = 0; i < inputStr.length; i++) {
        var sChar = escape(inputStr.charAt(i));
        iByteLength += calculateByte(sChar);

        if(iByteLength > limitByte){
          alert('최대 '+limitByte+'Byte 까지 입력가능합니다.');
          $obj.val(inputStr.substring(0, i));
          iByteLength = iByteLength - calculateByte(escape(inputStr.charAt(i)));

          break;
        }
      }
      $("span.txtcount em").text(iByteLength);
    }


    /**
     * 바이트 계산
     * @param sChar
     * @returns {Number}
     */
    function calculateByte(sChar) {

      var byte = 0;
      if(sChar.length == 1 ) {
        byte = 1;
      } else if (sChar.indexOf("%u") != -1) {
        byte = 2;
      } else if (sChar.indexOf("%") != -1) {
        byte = 3;
      }

      return byte;

    }

    function formCheckSubmitSellerChat(obj) {
      var userId  = "VsI6KZYJknkGWkqgz0jEcg%3D%3D";
      //alert(iserId);
      $.ajax({
        type: "GET"
        ,url: "https://htalk.hmall.com/happytalk/api/chat/isEnable"
        ,dataType: "json"
        ,async: false
        ,crossDomain: true
        ,success : function(result) {
          if(result.code == '0000'){
            var sellerUrl = "";
            var room_href = sellerUrl + "?userId="+userId;
            var popName = "cnslChatAcptPup";
            var popOption = "height=800, width=800, fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
            window.open(room_href,popName,popOption);
          }else{
            alert("네트워크가 불안정합니다. 잠시후에  다시 시도해주세요. ");
            return false;
          }
        }
        ,
        error : function(){
          console.log("json fail");
        }
      });


    }

  </script>

  <meta http-equiv="origin-trial" content="A9wkrvp9y21k30U9lU7MJMjBj4USjLrGwV+Z8zO3J3ZBH139DOnCv3XLK2Ii40S94HG1SZ/Zeg2GSHOD3wlWngYAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjYxMjk5MTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/1066206974/?random=1653616987493&amp;cv=9&amp;fst=1653616987493&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=1&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5p1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccd%2FselectCnslAcptPup.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccd%2FselectCnslOrdReqDtl.do&amp;tiba=1%3A1%20%EC%83%81%EB%8B%B4%EC%8B%A0%EC%B2%AD%20-%20%ED%98%84%EB%8C%80Hmall&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script><meta http-equiv="origin-trial" content="A9wkrvp9y21k30U9lU7MJMjBj4USjLrGwV+Z8zO3J3ZBH139DOnCv3XLK2Ii40S94HG1SZ/Zeg2GSHOD3wlWngYAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjYxMjk5MTk5LCJpc1RoaXJkUGFydHkiOnRydWV9"><script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/937000404/?random=1653616987511&amp;cv=9&amp;fst=1653616987511&amp;num=1&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=1&amp;u_tz=540&amp;u_java=false&amp;u_nplug=5&amp;u_nmime=2&amp;gtm=2oa5p1&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccd%2FselectCnslAcptPup.do&amp;ref=https%3A%2F%2Fwww.hmall.com%2Fp%2Fccd%2FselectCnslOrdReqDtl.do&amp;tiba=1%3A1%20%EC%83%81%EB%8B%B4%EC%8B%A0%EC%B2%AD%20-%20%ED%98%84%EB%8C%80Hmall&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script></head>

<!--윈도우팝업(새창으로열기) 1:1 상담신청 :  PIA017 LNB 1:1상담신청 클릭 시 윈도우 팝업 // 20200825 script 요청드림-->  <!--pc 공통 스크립트 잡은 후 윈도우 팝업 변경 가능성 있음-->
<!--popup-win : 윈도우 팝업일 경우 // width:649px , min-height:482px, height:575px (높이값은 popup-win 뒤의 클래스마다 변경) -->
<div class="popup-win wd600 cus-consult product-delete" style="display:flex; justify-content: center;"> <!--20200828 금요일 pc레이아웃 공통작업 wd600 클래스 추가-->
  <!--pop-wrap-->
  <div class="pop-wrap" tabindex="0" style="width: 70%; display:flex; justify-content: center;">
    <!--pop-content-wrap-->
    <div class="pop-content-wrap">
      <strong class="pop-title">1:1 문의하기</strong>
      <!--pop-content-->
      <div class="pop-content">
        <p class="desc">
          문의하고자 하시는 내용을 작성해주세요. 빠른 답변 드리겠습니다.<br> 고객센터 > 고객상담실 > 내 상담내역 조회에서 확인하실 수 있습니다.
        </p>
        <div class="content">
          <select name="reasonChoice" class="cu_select" >

            <option value="">상담 분야 선택</option>
            <option value="0405">취소신청</option>
            <option value="0404">반품신청</option>
            <option value="0501">배송/회수 문의</option>
            <option value="0303">결제/환불 문의</option>
          </select>
          <!--product-wrap-->
          <div class="product-wrap delete" id="productChoiceMsg" style="display: none;">  <!--20200827 금요일 윈도우 팝업안에서 버튼 클릭 시 새창 윈도우로 뜸. (페이지고유 name값 추가)-->
            <a href="#" onclick="openCnslAcptPup(); return false;">
              <p><i class="icon"></i>상담할 상품을 선택해주세요.</p>
            </a>
          </div>
          <!--//product-wrap-->
          <br>
          <input type="text" value="" style="border: none; background: none"/>
          문의 상품 정보 &nbsp;&nbsp;&nbsp;
          <button class="btn btn-linelgray small30" type="button" onclick="openOrderListPup()"><span>주문 내역에서 찾기</span></button> <!--마이페이지 1:1상담으로 이동-->
          <button class="btn btn-linelgray small30" type="button" onclick="openCnslOrdReq()"><span>장바구니에서 찾기</span></button> <!--마이페이지 1:1상담으로 이동-->

          <!--choice-item-->
          <div id="choiceItemDiv" style="display: block;">





            <script type="text/javascript">
              var changeChk = '';

              jQuery(function($) {

                $("div.hideBtnGroup").attr('style', 'display:none');

                var paramCnslCsfCd = '';
                if(!isEmpty(paramCnslCsfCd)){
                  setSelectCnslCsfCd(paramCnslCsfCd.substr(0, 4), paramCnslCsfCd);
                  setViewForm(paramCnslCsfCd);
                }


                $("input[name=acntCdpstRepy]").click(function() {

                  if (this.checked) {
                    if (this.id == "acnt") {
                      $("#bankInfHeader").attr("rowspan", "2");
                      $("#bankInf").show();
                      $("input[name=bankInfSelect]").val("acnt");
                      $("input[name='acntCdpstRepy']").val("acnt");
                    } else if (this.id == "cdpst") {
                      $("#bankInfHeader").attr("rowspan", "1");
                      $("#bankInf").hide();
                      $("input[name=bankInfSelect]").val("cdpst");
                      $("input[name='acntCdpstRepy']").val("cdpst");
                    }
                  }
                });

              });


              if ("" != "") {
                alert("");
                try {
                  //opener.fnRefresh();
                  opener.document.location.href="/p/ccd/selectCnslOrdReqDtl.do";
                }catch(e) {}
                window.close();
              }


              function checkNum(obj){
                var regexp = /^[0-9]/g;
                var v = $(obj).val();
                if(!regexp.test(v)){
                  alert("숫자만 입력 가능합니다.");
                  $(obj).val("");
                  return false;
                }
              }


              function submitForm(){
                var email = $("input[name=email]");
                var cntn = $("textarea[name=cntn]");
                var reqCntn = $("input[name=reqCntn]");
                var reqCntnJson = $("input[name=reqCntnJson]");
                var answReqnGbcd = $("input:radio[name=answReqnGbcd]:checked").val();
                var bankInfSelect = $("input[name='acntCdpstRepy']");
                var bankCd = $("select[name=bankCd]");
                var bnkac = $("input[name=bnkac]");
                var dpsr = $("input[name=dpsr]");
                var relp = $("select[name=relp]");
                var payWayGbcd = $("input[name=acntCdpstRepy]:checked");
                var dlvco = $("select[name=dlvco]");
                var invcNo = $("input[name=invcNo]");
                var mobileDdd,mobilePhone1,mobilePhone2;

                if(answReqnGbcd == "3"){
                  if (isEmpty(email.val())) {
                    alert("이메일 입력해 주세요 ");
                    email.focus();
                    return false;
                  }

                  if (validateEmail(email.val()) == false) {
                    alert("올바른 이메일을 입력해 주세요");
                    email.focus();
                    return false;
                  }
                  var mobileDddOrg = $("input[name='mobileDdd']").val(); // $("select[name=mobileDdd]");
                  mobileDdd = mobileDddOrg.substr(0,3);

                  if(mobileDdd == '013'){
                    mobileDdd=mobiledDddOrg.substr(0,4);
                    mobileDddOrg=mobildDddOrg.substr(4,8);
                  }else{
                    mobileDddOrg = mobileDddOrg.substr(3,8);
                  }

                  if(mobileDddOrg.length == 7){
                    mobilePhone1 = mobileDddOrg.substr(0,3);
                    mobilePhone2 = mobileDddOrg.substr(3,7);
                  }else if(mobileDddOrg.length == 8){
                    mobilePhone1 = mobileDddOrg.substr(0,4);
                    mobilePhone2 = mobileDddOrg.substr(4,8);
                  }
                  $("input[name='mobileDdd']").val(mobileDdd);
                  $("input[name='mobilePhone1']").val(mobilePhone1);
                  $("input[name='mobilePhone2']").val(mobilePhone2);
                }


                if (getByteLength(cntn.val()) > 1000) {
                  alert("문의내용은 1000자(한글 500자)이내로 입력하세요.");
                  cntn.focus();
                  return false;
                }else if (getByteLength(cntn.val()) == 0) {
                  alert("문의 내용을 입력하세요.");
                  cntn.focus();
                  return false;
                }


                if(!$("input[name='chkPersonalInfo']")[0].checked){
                  alert("개인정보 수집 및 이용에 모두 동의해주세요.");
                  return false;
                }

                if ($("input[name='acntCdpstRepy']").val()== "acnt") {
                  if ($("select[name=bankCd]").val()=="은행 선택") {
                    alert("환불받을 은행을 선택하여 주세요 ");
                    bankCd.focus();
                    return false;
                  }

                  if (isEmpty(bnkac.val())) {
                    alert("계좌번호를 입력하여 주세요 ");
                    bnkac.focus();
                    return false;
                  }

                  if (isEmpty(dpsr.val())) {
                    alert("예금주명을 입력하여 주세요 ");
                    dpsr.focus();
                    return false;
                  }

                  if (isEmpty(relp.val())) {
                    alert("관계를 입력하여 주세요 ");
                    relp.focus();
                    return false;
                  }

                  if(!$("input[name='chkPersonalInfoRefund']")[0].checked){
                    alert("개인정보 수집 및 이용에 모두 동의해주세요.");
                    return false;
                  }
                }

                if(answReqnGbcd == "1" || answReqnGbcd == "2"){

                  var mobileDddOrg = $("input[name='mobileDdd']").val(); // $("select[name=mobileDdd]");
                  mobileDdd = mobileDddOrg.substr(0,3);

                  if (isEmpty(mobileDdd)) {
                    alert("전화번호를 입력해 주세요 ");
                    return false;
                  }

                  if(mobileDdd == '013'){
                    mobileDdd=mobiledDddOrg.substr(0,4);
                    mobileDddOrg=mobildDddOrg.substr(4,8);
                  }else{
                    mobileDddOrg = mobileDddOrg.substr(3,8);
                  }

                  if(mobileDddOrg.length == 7){
                    mobilePhone1 = mobileDddOrg.substr(0,3);
                    mobilePhone2 = mobileDddOrg.substr(3,7);
                  }else if(mobileDddOrg.length == 8){
                    mobilePhone1 = mobileDddOrg.substr(0,4);
                    mobilePhone2 = mobileDddOrg.substr(4,8);
                  }else{
                    alert("전화번호를 확인해 주세요");
                    return false;
                  }

                  $("input[name='mobileDdd']").val(mobileDdd);
                  $("input[name='mobilePhone1']").val(mobilePhone1);
                  $("input[name='mobilePhone2']").val(mobilePhone2);
                }
                //계좌번호
                var decBnkac = "04";
                //환불계좌
                var decReBnkac = "48";
                //입금계좌
                var decInBnkac = "49";
                //전화번호
                var decPhoneNum = "55";
                //휴대폰번호
                var decMobileNum = "56";
                //예금주
                var decDpsr = "26";
                //기타사유
                var decEtc = "99";

                var reqCntnStrJson = {};
                //reqCntnStrJson[decEtc] = cntn.val();


                var line = "\n"
                var reqCntnStr = cntn.val() + line + line;
                reqCntnStr += "아래는 신청내용입니다." + line;
                reqCntnStr += "세부문의분야 : " + $("select[name='cnslCsfCd'] option:selected").text() + line;
                reqCntnStr += "상품명 : " + $("input[name=ordItemNm]").val() + line;
                reqCntnStr += "수량 : " + $("input[name=ordQty]").val() + line;
                reqCntnStr += "주문번호 : " + "20220527276991" + line;
                if(answReqnGbcd == "3"){
                  reqCntnStr += "이메일 : " + email.val() + line;
                }

                if(answReqnGbcd == "1" || answReqnGbcd == "2" || answReqnGbcd == "3"){
                  reqCntnStrJson[decMobileNum] = mobileDdd + "-" + mobilePhone1 + "-" + mobilePhone2;
                }

                reqCntnStr += "입금하신 금액 : " + $("input[name=dmndAmt]").val() + line;

                if (payWayGbcd.val() == "acnt") {
                  reqCntnStr += "환불희망은행 : " + $("select[name=bankCd] option:selected").text() + line;
                  reqCntnStr += "예금주명 : " + dpsr.val() + line;
                  reqCntnStr += "관계 : " + relp.val() + line;
                  reqCntnStr += "계좌번호 : " + bnkac.val() + line;
                  //reqCntnStrJson[decBnkac] = bnkac.val() + line;
                }  else if (payWayGbcd.val() == "cdpst") {
                  reqCntnStr += "※예치금환불희망" + line;
                } else if (payWayGbcd.val() == "card") {
                  reqCntnStr += "※카드취소희망" + line;
                } else if (payWayGbcd.val() == "easy") {
                  reqCntnStr += "※간편결제취소희망" + line;
                } else if (payWayGbcd.val() == "etc") {
                  reqCntnStr += "※기타(여러 결제수단 취소)" + line;
                } else if (payWayGbcd.val() == "point") {
                  reqCntnStr += "※포인트 취소희망" + line;
                } else if (payWayGbcd.val() == "phone") {
                  reqCntnStr += "※휴대폰소액결제 취소희망" + line;
                }


                if (isEmpty(dlvco.val())) {
                  reqCntnStr += "택배사 : 미선택" + line;
                  reqCntnStr += "운송장번호 : 미입력" + line;
                } else {
                  reqCntnStr += "택배사 : " + $("select[name=dlvco] option:selected").text() + line;
                  reqCntnStr += "운송장번호 : " + invcNo.val() + line;
                }

                // 신청내역 입력
                reqCntn.val(reqCntnStr);
                reqCntnJson.val(JSON.stringify(reqCntnStrJson));
                $("#frm").submit();
              }



              $("input[name='answReqnGbcd']").change(function(){
                var checked = $("input[name='answReqnGbcd']:checked").val();
                if(checked == '3'){//이메일
                  $("#emailConsultDiv").css("display","block");
                  $("#phoneConsultDiv").css("display","none");
                }else {//전화상담,SMS
                  $("#emailConsultDiv").css("display","none");
                  $("#phoneConsultDiv").css("display","block");
                }
              });
            </script>

            <form id="frm" action="/p/mpa/updateOrdCnclReq.do" method="post">


              <div class="choice-item">
                <div class="pdwrap pdlist pdconsult">
                  <div class="pdlist-wrap">
                    <figure class="pdthumb">
                      <div class="thumb">
                        <a href="/p/mpa/selectOrdPTCPup.do?ordNo=20220527276991" target="_blank"><img src="https://image.hmall.com/static/2/8/88/02/2102888217_0.jpg?RS=140" alt="[공식 3+머그] 스타벅스 캡슐커피 by 네스프레소" style="width:90px;height:90px;" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=600x600&amp;AR=0')"></a>
                      </div>
                      <figcaption>
                        <div class="delive-stat">



                          주문접수


                        </div>

                        <div class="pdname" aria-label="제품명"><a href="/p/mpa/selectOrdPTCPup.do?ordNo=20220527276991" target="_blank">[공식 3+머그] 스타벅스 캡슐커피 by 네스프레소</a></div>
                        <div class="pdoption" aria-label="옵션/수량">
                          <span class="color">스타벅스 블론드 에스프레소</span>
                          <span class="count"><em class="count-num">1</em>개</span>
                        </div>
                        <div class="pdprice">
                          <ins class="normal" aria-label="가격">
                            <em>7,990</em><b>원</b>
                          </ins>
                        </div>
                      </figcaption>

                      <div class="another">
                        <button class="btn btn-linelgray small34" type="button" onclick="openCnslAcptPup();"><i class="icon"></i><span>다른상품선택</span></button>
                      </div>

                    </figure>
                  </div>
                </div>
              </div>


              <!--consult-form-wrap-->


              <div class="consult-form-wrap">
                <h3>제목</h3>
                <div class="field" id="inquiryTitle">
                  <div class="inputbox">
                    <label class="inplabel"><input type="text" name="mobileDdd" placeholder="제목을 입력해주세요" title="" value=""></label>
                    <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                  </div>
                </div>

                <h3>문의내용</h3>
                <!--문의내용-->
                <div class="consult-form">
                  <div class="field">
                    <div class="textareabox">
                      <label class="txtlabel">
	                    <textarea cols="48" rows="7" name="cntn" onkeyup="checkCntn(this, 500)" placeholder="문의하실 내용을 구체적으로 적어주시면정확하고 빠른 답변에 도움이 됩니다." aria-placeholder="문의하실 내용을 구체적으로 적어주시면
	                    정확하고 빠른 답변에 도움이 됩니다."></textarea>
                      </label>
                      <span class="txtcount"><em>0</em><b>500</b></span>
                    </div>
                  </div>
                </div>
                <!--//문의내용-->
              </div>
              <!--//consult-form-wrap-->

              <!--consult-form-wrap-->
              <div class="consult-form-wrap">
                <h3>답변 방법</h3>
                <!--답변방법-->
                <div class="consult-form">
                  <!--radiobox-->
                  <!--//radiobox-->
                  <!--휴대폰번호-->
                  <div class="field" id="phoneConsultDiv">
                    <div class="inputbox">
                      <label class="inplabel"><input type="number" name="mobileDdd" placeholder="휴대폰 번호 (예:01012345678)" title="휴대폰 번호 입력" value=""></label>
                      <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                    </div>
                  </div>
                  <!--//휴대폰번호-->
                  <!--//이메일-->
                  <div class="field" id="emailConsultDiv">
                    <div class="inputbox">
                      <label class="inplabel"><input type="email" name="email" placeholder="userid@mail.com" title="이메일 입력" value=""></label>
<%--                      <div class="checkbox_ui type1 agree_all">--%>
<%--                        <input type="checkbox" id="emailReceive" class="allCheckbox">--%>
<%--                        <label for="emailReceive">이메일로 답변 받음</label>--%>
<%--                      </div>--%>
                      <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                    </div>
                  </div>
                  <!--//이메일-->
                </div>
                <!--//답변방법-->
              </div>
              <!--//consult-form-wrap-->

              <div class="terms-box">
                <!-- [12/04]_수정(TMS 관련 수정 - PC_고객센터_1대1 상담신청_201022 체크박스 누락케이스 마크업 구조 변경 및 문구변경) -->
                <label class="chklabel">
                  <input type="checkbox" name="chkPersonalInfo">
                  <i class="icon"></i>
                  <span>이메일로 답변 받음</span>
                </label>
                <!--20201005 월요일 레이어팝업링크추가-->
                <a href="#modalCollectPersonalInfo" class="btn atext" data-modules-modal=""><span>내용보기</span><i class="arrow right"></i></a>
              </div>
              <!--btngroup-->
              <div class="btngroup">
                <!-- 20200828 금요일 취소버튼 클릭 시 닫힘 -->
                <button class="btn btn-linelgray medium" data-dismiss="window"><span>취소</span></button>
                <button class="btn btn-default medium" onclick="submitForm(); return false;"><span>문의하기</span></button>
              </div>
              <!--//btngroup-->
            </form>
          </div>
          <!--//choice-item -->

          <form id="cnslAcptPupForm">
            <input type="hidden" name="cnslCsfCd" value="">
            <input type="hidden" name="page" value="">
            <input type="hidden" name="mCnslCsfNm" value="">
          </form>
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
<!--20201005 월요일 레이어팝업추가 : 개인정보수집및이용-->
<div class="ui-modal" id="modalCollectPersonalInfo" tabindex="-1" role="dialog" aria-label="개인정보수집및이용">
  <div class="ui-modal-dialog collect-perInfo" role="document">
    <div class="content">
      <p class="ui-title">개인정보 수집 및 이용</p>
      <!-- //.content-head -->
      <div class="content-body">
        <div class="tblwrap">
          <table>
            <caption>개인정보 수집 및 이용</caption>
            <colgroup>
              <col style="width:138px">
              <col style="width:140px">
              <col style="width:182px">
            </colgroup>
            <thead>
            <tr>
              <th scope="col" class="regular">목적</th>
              <th scope="col" class="regular">항목</th>
              <th scope="col">보유기간</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td class="txt-center">1:1상담</td>
              <td class="txt-center">휴대폰번호(SMS, 전화상담 선택 시), 이메일(이메일 선택 시)</td>
              <td class="txt-center bold">회원탈퇴 시 <br> 또는 법정 의무 보유기간</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- //.content-body -->

      <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
    </div>
    <!-- //.content -->
  </div>
  <!-- //.ui-modal-dialog -->
</div>
<!--//20201005 월요일 레이어팝업추가 : 개인정보수집및이용-->
<!--20201005 월요일 레이어팝업추가 : 개인정보수집및이용-환불-->
<div class="ui-modal" id="modalCollectPersonalInfoRefund" tabindex="-1" role="dialog" aria-label="개인정보수집및이용">
  <div class="ui-modal-dialog collect-perInfo" role="document">
    <div class="content">
      <p class="ui-title">개인정보 수집 및 이용</p>
      <!-- //.content-head -->
      <div class="content-body">
        <div class="tblwrap">
          <table>
            <caption>개인정보 수집 및 이용</caption>
            <colgroup>
              <col style="width:138px">
              <col style="width:140px">
              <col style="width:182px">
            </colgroup>
            <thead>
            <tr>
              <th scope="col" class="regular">목적</th>
              <th scope="col" class="regular">항목</th>
              <th scope="col">보유기간</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td class="txt-center">환불처리</td>
              <td class="txt-center">예금주명, 계좌정보</td>
              <td class="txt-center bold">회원탈퇴 시 <br> 또는 법정 의무 보유기간</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- //.content-body -->

      <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
    </div>
    <!-- //.content -->
  </div>
</div>
<!--//20201005 월요일 레이어팝업추가 : 개인정보수집및이용-환불-->
<div class="ui-modal alert" id="modalAddressAlert1" tabindex="-1" role="dialog" aria-label="택배사 방문 주소를 입력해 주세요.">
  <div class="ui-modal-dialog restockalarm" role="document">
    <div class="content">
      <span class="bgcircle ex-redmark-sm"><i class="icon ex-red-mark"></i></span>
      <p class="ctypo17 bold">택배사 방문 주소를 입력해 주세요.</p>
    </div>
    <div class="btngroup">
      <button class="btn btn-default" data-dismiss="modal"><span>확인</span></button>
      <!-- 데이터 전송 후 닫힘 $(element).modal().hide() -->
    </div>
    <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
  </div>
</div>
