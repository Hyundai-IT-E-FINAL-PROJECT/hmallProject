<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html>
  <head>
    <title><tiles:getAsString name="title"/></title>
      <link rel="stylesheet" type="text/css" href="/resources/css/common.css"><!-- 공통 css -->
      <link rel="stylesheet" type="text/css" href="/resources/css/layout.css"><!-- 공통 Layout css -->
      <link rel="stylesheet" type="text/css" href="/resources/css/popup.css"><!-- 공통 Popup css -->
      <link rel="stylesheet" type="text/css" href="/resources/css/main.css"><!-- 공통 Popup css -->
      <link rel="stylesheet" type="text/css" href="/resources/css/video-js.css"><!-- 공통 Popup css -->
      <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/co/jquery-ui.css"><!-- jQuery UI css -->
      <link rel="stylesheet" type="text/css" href="//image.hmall.com/p/css/mp/mypage.css"> <!-- 마이페이지 css -->

      <script src="//image.hmall.com/p/js/co/jquery-3.4.1.min.js"></script><!-- jQuery Plugin -->
      <script src="//image.hmall.com/p/js/co/jquery.easing.min.js"></script><!-- jQuery UI Effect -->
      <script src="//image.hmall.com/p/js/co/jquery-ui.1.12.1.min.js"></script><!-- jQuery UI js -->
      <script src="//image.hmall.com/p/js/co/ukDetect.min.js"></script><!-- UI에 사용하는 Detect -->
      <script src="//image.hmall.com/p/js/co/slick.min.js"></script><!-- 공통 Slide 플러그인 -->
      <script src="/resources/js/common.js"></script><!-- UI에 사용하는 기본 js  -->
      <script src="/resources/js/index.js"></script>
      <script src="/resources/js/commonFunction.js"></script>
      <script src="//image.hmall.com/p/js/co/co.js"></script><!-- UI에 사용하는 기본 js  -->
      <script src="//image.hmall.com/p/js/co/jquery.cookie.js"></script>
      <script src="//image.hmall.com/p/js/co/reDirectExceptUrlList.js"></script><!-- 로그인버튼 click 리다이렉트 예외 url리스트  -->
      <script src="/resources/js/script-for-Top2.js"></script>
      <script src="/resources/js/script-for-Top1.js"></script>

      <style>
         .container {
            margin-top: 10px;
         }
         .container.footer {
            width: 100%;
         }
      </style>
  </head>
  <body>
      <script type="text/javascript" src="//image.hmall.com/gen/js/searchPopKeyWordList.js?ver=052510"></script>
      <script type="text/javascript" src="//image.hmall.com/gen/js/searchADTextList.js?ver=052510" charset="UTF-8"></script>
      <script type="text/javascript" src="//image.hmall.com/gen/js/searchADLinkList.js?ver=052510" charset="UTF-8"></script>
      <script type="text/javascript" src="//image.hmall.com/gen/js/searchSpecialShopLinkList.js?ver=052510" charset="UTF-8"></script>
      <script type="text/javascript" src="//image.hmall.com/gen/js/searchBrndShopLinkList.js?ver=052510" charset="UTF-8"></script>
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


                  $.ajax({
                      type: "post"
                      , url: "/p/GA_getDimension.do"
                      , data: ""
                      , dataType: "json"
                      , async: true
                      , success : function(data) {
                          console.log("ajax Return");
                      }
                  });

              }









              var _gaid = getCookieGA('GAID');
              if(_gaid != null){GA_info[GACustomKey.Dimension11] = _gaid;}

              GA_info[GACustomKey.Dimension12] = "N";





















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



      </script>
      <script type="text/javascript" src="//image.hmall.com/gen/js/new_main_data.js?ver=052510" charset="UTF-8"></script>
      <script type="text/javascript" src="//image.hmall.com/p/js/cu/SsoAjax.js?version=1"></script>
      <script type="text/javascript">
          var serverHost       = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
          var serverHostForSSL = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";

          /* TODO 곽희섭 20170524 통합포인트 추가 */
          var ssoAuthYn       = "";
          var ssoAuthCd       = "";
          var upntCustNoEnc   = "";
          var mcustNo         = ""; //TODO 곽희섭 20170804 통합멤버십 회원 코드
          var custNo          = ""; //TODO 곽희섭 20170810 회원코드
          var upntCustYn      = ""; // 통멤회원여부
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
        <tiles:insertAttribute name="header" />
        <div class="wrap hyundai-homeshoping">
           <tiles:insertAttribute name="body" />
        </div>
        <tiles:insertAttribute name="footer" />
  </body>
</html>