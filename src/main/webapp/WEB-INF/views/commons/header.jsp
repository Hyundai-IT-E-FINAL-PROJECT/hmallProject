<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<header class="header">
	<div class="header-top">
		<h1 class="logo"><a href="${contextPath}/" title="현대Hmall">Hmall</a></h1>

		<div class="search" role="search">
			<div class="field">
				<form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search" onsubmit="event.preventDefault();">
					<div class="inputbox">
						<label class="inplabel">
							<input type="text" id="gnbSearchKeyword" name="searchTerm"
								   value=""
								   autocomplete="off" title="검색어" size="88"/>
						</label>
						<button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
						<button class="btn btn-search" onclick="javascript:doSearchGnb();"><span>검색</span></button>
						<input type="hidden" name="gnbSearchYn" value="Y">
					</div>
				</form>
				<!-- S : 검색 레이어 -->
				<div class="search-autowrap" id="search-autowrap">

					<!-- 검색어 입력시 자동완성 -->
					<div class="keyword-area" id="search-recommend" aria-label="검색어 자동완성" style="display:none">

					</div>
					<!-- //.keyword-area -->

					<!-- 검색창에 포커스 일 때 -->
					<div class="autowrap" id="search-popup" style="display:none">
						<!-- 추천할 수 없는 검색어 인 경우 -->
						<body class="vsc-initialized">
						<div class="wrap cartwrap">

							<!-- gnb setting -->


							<!-- header -->








							<script type="text/javascript" src="//image.hmall.com/gen/js/searchPopKeyWordList.js?ver=052010"></script>
							<script type="text/javascript" src="//image.hmall.com/gen/js/searchADTextList.js?ver=052010" charset="UTF-8"></script>
							<script type="text/javascript" src="//image.hmall.com/gen/js/searchADLinkList.js?ver=052010" charset="UTF-8"></script>
							<script type="text/javascript" src="//image.hmall.com/gen/js/searchSpecialShopLinkList.js?ver=052010" charset="UTF-8"></script>
							<script type="text/javascript" src="//image.hmall.com/gen/js/searchBrndShopLinkList.js?ver=052010" charset="UTF-8"></script>

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

									GA_info[GACustomKey.Dimension9] = "20220520";

									var _gaid = getCookieGA('GAID');
									if(_gaid != null){GA_info[GACustomKey.Dimension11] = _gaid;}

									GA_info[GACustomKey.Dimension12] = "Y";
									GA_info[GACustomKey.Dimension24] = "6";


									GA_info[GACustomKey.Dimension13] = "U";
									GA_info[GACustomKey.Dimension14] = "U";
									GA_info[GACustomKey.Dimension15] = "실버";

									GA_info[GACustomKey.Dimension22] = "기타";






									GA_info[GACustomKey.Dimension30] = "N";

									GA_info[GACustomKey.Dimension37] = "0";
									GA_info[GACustomKey.Dimension38] = "N";


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
							<script type="text/javascript" src="//image.hmall.com/gen/js/new_main_data.js?ver=052010" charset="UTF-8"></script>


							<!-- TODO 곽희섭 20170523 통합포인트 추가 -->
							<script type="text/javascript" src="//image.hmall.com/p/js/cu/SsoAjax.js?version=1"></script>

							<script type="text/javascript">
								var serverHost       = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";
								var serverHostForSSL = (location.href.indexOf("final") > 0 || location.href.indexOf("stg") > 0 || location.href.indexOf("dev") > 0 || location.href.indexOf("local") > 0) ? "https://" + location.host : "https://www.hmall.com";

								/* TODO 곽희섭 20170524 통합포인트 추가 */
								var ssoAuthYn       = "";
								var ssoAuthCd       = "N";
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

							<header class="header">



								<div class="header-top">
									<h1 class="logo"><a href="javascript:;" title="현대Hmall">Hmall</a></h1>

									<div class="search" role="search">
										<div class="field">
											<form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search" onsubmit="event.preventDefault();">
												<div class="inputbox">
													<label class="inplabel">
														<input type="text" id="gnbSearchKeyword" name="searchTerm" value="" autocomplete="off" title="검색어" size="88">
													</label>
													<button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
													<button class="btn btn-search" onclick="javascript:doSearchGnb();"><span>검색</span></button>
													<input type="hidden" name="gnbSearchYn" value="Y">
												</div>
											</form>
											<!-- S : 검색 레이어 -->
											<div class="search-autowrap" id="search-autowrap">

												<!-- 검색어 입력시 자동완성 -->
												<div class="keyword-area" id="search-recommend" aria-label="검색어 자동완성" style="display:none">

												</div>
												<!-- //.keyword-area -->

												<!-- 검색창에 포커스 일 때 -->
												<div class="autowrap" id="search-popup" style="display:none">
													<!-- 추천할 수 없는 검색어 인 경우 -->


													<!-- input focus시 기본 나오는 UI -->
													<div class="autoarticle leftarea" id="search-history">
														<div class="recent-area" aria-label="최근검색어">
															<p class="stitle">최근 검색어</p>

															<!-- 최신검색어가 없을 경우 -->
															<p class="nodata" id="nodata" style="">최근 검색어가 없습니다.</p>
															<button class="btn btn-delall" id="del-all-history" style="display: none;"><span>전체삭제</span></button>
														</div>
														<!-- //.recent-area -->
													</div>
													<!-- //.autoarticle -->
													<div class="autoarticle rightarea">
														<div class="popular-area" id="popular-list" aria-label="인기검색어">
															<p class="stitle">인기 검색어</p>
															<ol class="num-list">
																<li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('삼립빵');">삼립빵<em><i class="icon keep"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('여성원피스');">여성원피스<em><i class="icon keep"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('써스데이아일랜드');">써스데이아일랜드<em><i class="icon keep"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('SPC삼립');">SPC삼립<em><i class="icon new"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('용평리조트패키지');">용평리조트패키지<em><i class="icon keep"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('여성샌들');">여성샌들<em><i class="icon new"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('여성여름자켓');">여성여름자켓<em><i class="icon new"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('여성골프웨어');">여성골프웨어<em><i class="icon new"></i><span class="hiding">유지</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('안나수이원피스');">안나수이원피스<em><i class="icon down"></i><span class="hiding">하락</span></em></a></li><li><a href="javascript:void(0);" onclick="javascript:clickPopSrch('보테가베네타가방');">보테가베네타가방<em><i class="icon down"></i><span class="hiding">하락</span></em></a></li></ol>
														</div>
														<!-- //.popular-area -->

														<div class="focusclick-area" id="fcsClick" aria-label="포커스클릭" style="display:none">
															<p class="stitle">포커스 클릭</p>
															<span class="flag-da">AD</span>
															<!-- 한 개 이상일 경우 class="horizon" 추가 -->
															<!-- 상품종료 및 품절일 경우 li thumb class end 추가 예)li class="thumb end" -->
														</div>
														<!-- //.focusclick-area -->
													</div>
													<!-- //.autoarticle -->

													<button class="btn searchclose" id="close-btn"><i class="hiding">검색 레이어</i><span>닫기</span></button>
												</div>
												<!-- //.autowrap -->

											</div>
											<!-- //.search-autowrap -->
											<!-- //E : 검색레이어 -->
										</div>
										<!-- //.field -->
									</div>
									<!-- // 검색 영역 -->

									<script>
										// 2020.12.24 검색 DOM 로드후 javascript 실행을 위해 옮김
										// 2020.12.17 icj : 텍스트 광고 입력이 없을시 재노출 (하선윤)
										mySearchList();

										$("#gnbSearchKeyword").focus(function(){
											$(".header .search").addClass("selected");

											if($("#gnbSearchKeyword").val() == gv_gnbHomeBnnrTitl){
												$("#gnbSearchKeyword").val('');
											}

											$("#search-popup").css({ display : "" });  // 최근검색어 탭 노출
											if($("#keyword-list li").length==0){
												$("#nodata").css({display:""});
												$("#keyword-list").css({display:"none"});
											}

											//검색창 입력전 광고
											fn_searchAdKeywordDefault();
											$("#search-recommend").css({ display : "none" });
											$("#search-autowrap").show();

											//퀵 메뉴 숨김 처리
											$('.quick-menu-more').removeClass('on');

											// 2020.12.17 icj : 텍스트 광고 입력이 없을시 재노출 (하선윤)
										}).focusout(function(){
											var $keyword = $("#gnbSearchKeyword");
											if($keyword.val() == ''){
												$keyword.val(gv_gnbHomeBnnrTitl);
											}
										});

									</script>

									<!-- 개인화 메뉴 -->
									<div class="personal-menu">
										<ul>
											<li>
												<a class="cart" ga-category="헤더" ga-action="장바구니" href="javascript:bizSpringTag('https://www.hmall.com/p/odb/basktList.do','^헤더^장바구니');">
													<span>장바구니</span>






													<em class="badge">1</em>






												</a>
											</li>
											<li><a class="mypage" href="javascript:bizSpringTag('https://www.hmall.com/p/mpf/selectMyPageMain.do','^헤더^마이페이지 레이어^마이페이지');"><span>마이페이지</span></a></li>
											<li>
												<a href="javascript:;" class="recently" id="recentlyImg" onclick="openRecentShopping(); return false;">
													<span>최근본쇼핑</span>
													<!-- 최근 본 상품 썸네일 이미지 -->
													<em class="thumb-recent"><img src="//image.hmall.com/static/0/1/17/37/2137171063_0.jpg?RS=140&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png')"></em>
												</a>
											</li>
										</ul>
									</div>
									<!-- // 개인화 메뉴 -->
								</div>

								<div class="header-menu-wrap">
									<div class="header-menu-in">
										<!-- 카테고리 메뉴 -->
										<div class="category-area" id="categoryArea">
											<a href="javascript:;" class="btn-category">카테고리</a>
											<!-- 카테고리 메뉴 시작 -->

											<div class="category-menu-wrap"><!-- 카테고리 메뉴 depth1--><div class="category-list" style="height:auto;"><ul><li data-catecode="01" class="on"><a href="#">패션의류</a></li><li data-catecode="02"><a href="#">패션잡화/명품</a></li><li data-catecode="03"><a href="#">뷰티</a></li><li data-catecode="14"><a href="#">순금/주얼리/시계</a></li><li data-catecode="05"><a href="#">스포츠/레저</a></li><li data-catecode="04"><a href="#">출산/유아동</a></li><li data-catecode="06"><a href="#">주방용품</a></li><li data-catecode="18"><a href="#">생활/건강</a></li><li data-catecode="15"><a href="#">식품</a></li><li data-catecode="07"><a href="#">가구/침구</a></li><li data-catecode="08"><a href="#">가전/디지털</a></li><li data-catecode="13"><a href="#">반려동물</a></li><li data-catecode="16"><a href="#">여행/티켓/도서</a></li><li data-catecode="19"><a href="#">문화/렌탈/보험</a></li><li data-catecode="10"><a href="/p/dsMainR.do?GnbGroup=DeptHome">현대백화점</a></li><li data-catecode="20"><a href="/p/dpa/searchSectItem.do?sectId=2679838">해외직구</a></li><li data-catecode="09"><a href="/p/tvMainR.do?GnbGroup=TVHome">TV쇼핑</a></li></ul><div class="search-brand"><a href="javascript:$('.category-menu-wrap').css('display','none');brndOpenPopup();" class="lyopen" data-target="brand">브랜드검색</a></div></div><div class="category-list-contents on" data-catecode="01"><div class="center-area"><strong class="depth1-title">패션의류</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731203&amp;GnbGroup=AllCategory&amp;Code=01">여성의류</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731204&amp;GnbGroup=AllCategory&amp;Code=01">남성의류</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731205&amp;GnbGroup=AllCategory&amp;Code=01">캐주얼의류</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731206&amp;GnbGroup=AllCategory&amp;Code=01">언더웨어</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2724600&amp;GnbGroup=AllCategory&amp;Code=01">POLO RALPH LAUREN</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679833&amp;GnbGroup=AllCategory&amp;Code=01">BEANPOLE </a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679811&amp;GnbGroup=AllCategory&amp;Code=01">라코스테</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1886163&amp;GnbGroup=AllCategory&amp;Code=01">TOMMY HILFIGER</a></li><li><a href="http://www.hmall.com/p/dpa/cosHome.do?GnbGroup=AllCategory&amp;Code=01">COS</a></li><li><a href="http://www.hmall.com/p/dpa/aosMain.do?GnbGroup=AllCategory&amp;Code=01">＆Other Stories</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2699933&amp;GnbGroup=AllCategory&amp;Code=01">수입/컨템포러리</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="02"><div class="center-area"><strong class="depth1-title">패션잡화/명품</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731137&amp;GnbGroup=AllCategory&amp;Code=02">가방/지갑</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731138&amp;GnbGroup=AllCategory&amp;Code=02">신발</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731139&amp;GnbGroup=AllCategory&amp;Code=02">패션소품/ACC</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731140&amp;GnbGroup=AllCategory&amp;Code=02">명품</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2057137&amp;GnbGroup=AllCategory&amp;Code=02">마이클코어스</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2625458&amp;GnbGroup=AllCategory&amp;Code=02">메트로시티</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2626364&amp;GnbGroup=AllCategory&amp;Code=02">루이까또즈</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2686372&amp;GnbGroup=AllCategory&amp;Code=02">K-헤리티지(전통관)</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="03"><div class="center-area"><strong class="depth1-title">뷰티</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731159&amp;GnbGroup=AllCategory&amp;Code=03">스킨케어</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731160&amp;GnbGroup=AllCategory&amp;Code=03">헤어케어</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731161&amp;GnbGroup=AllCategory&amp;Code=03">바디케어</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731162&amp;GnbGroup=AllCategory&amp;Code=03">메이크업</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731163&amp;GnbGroup=AllCategory&amp;Code=03">향수</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731164&amp;GnbGroup=AllCategory&amp;Code=03">기기/소품</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2642664&amp;GnbGroup=AllCategory&amp;Code=03">설화수</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="14"><div class="center-area"><strong class="depth1-title">순금/주얼리/시계</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731184&amp;GnbGroup=AllCategory&amp;Code=14">보석</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731185&amp;GnbGroup=AllCategory&amp;Code=14">반지</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731186&amp;GnbGroup=AllCategory&amp;Code=14">목걸이/귀걸이</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731187&amp;GnbGroup=AllCategory&amp;Code=14">팔찌/발찌</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731188&amp;GnbGroup=AllCategory&amp;Code=14">시계</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731189&amp;GnbGroup=AllCategory&amp;Code=14">기타 ACC</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="05"><div class="center-area"><strong class="depth1-title">스포츠/레저</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731165&amp;GnbGroup=AllCategory&amp;Code=05">스포츠 의류</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731166&amp;GnbGroup=AllCategory&amp;Code=05">스포츠신발</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731167&amp;GnbGroup=AllCategory&amp;Code=05">스포츠패션잡화</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731168&amp;GnbGroup=AllCategory&amp;Code=05">골프용품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731169&amp;GnbGroup=AllCategory&amp;Code=05">골프의류</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731170&amp;GnbGroup=AllCategory&amp;Code=05">구기/라켓/격투</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731171&amp;GnbGroup=AllCategory&amp;Code=05">등산/ 아웃도어</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731172&amp;GnbGroup=AllCategory&amp;Code=05">캠핑</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731173&amp;GnbGroup=AllCategory&amp;Code=05">낚시</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731174&amp;GnbGroup=AllCategory&amp;Code=05">헬스/요가</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731175&amp;GnbGroup=AllCategory&amp;Code=05">수영/물놀이</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731176&amp;GnbGroup=AllCategory&amp;Code=05">스키/스노보드</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731177&amp;GnbGroup=AllCategory&amp;Code=05">자전거/인라인/퀵보드</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731178&amp;GnbGroup=AllCategory&amp;Code=05">자동차</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2052165&amp;GnbGroup=AllCategory&amp;Code=05">나이키코리아공식</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679870&amp;GnbGroup=AllCategory&amp;Code=05">슈마커</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679865&amp;GnbGroup=AllCategory&amp;Code=05">ABC마트</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2762627&amp;GnbGroup=AllCategory&amp;Code=05">JD스포츠</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2759440&amp;GnbGroup=AllCategory&amp;Code=05">인수스</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2386151&amp;GnbGroup=AllCategory&amp;Code=05">내셔널지오그래픽</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2620264&amp;GnbGroup=AllCategory&amp;Code=05">다이나핏</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2694686&amp;GnbGroup=AllCategory&amp;Code=05">가네샤요가프랍스</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2734586&amp;GnbGroup=AllCategory&amp;Code=05">데카트론코리아 공식</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="04"><div class="center-area"><strong class="depth1-title">출산/유아동</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731207&amp;GnbGroup=AllCategory&amp;Code=04">임신/출산</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731208&amp;GnbGroup=AllCategory&amp;Code=04">기저귀/물티슈</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731209&amp;GnbGroup=AllCategory&amp;Code=04">스킨케어/위생/소독</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731210&amp;GnbGroup=AllCategory&amp;Code=04">유아 침구/가구/매트</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731211&amp;GnbGroup=AllCategory&amp;Code=04">유모차/카시트/외출용품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731212&amp;GnbGroup=AllCategory&amp;Code=04">유아 의류/잡화</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731213&amp;GnbGroup=AllCategory&amp;Code=04">완구</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2732613&amp;GnbGroup=AllCategory&amp;Code=04">유아동 도서</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2482468&amp;GnbGroup=AllCategory&amp;Code=04">내 아이가 좋아하는 IT템</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1961307&amp;GnbGroup=AllCategory&amp;Code=04">[BEANPOLE KIDS] 2022 S/S NEW </a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2699113&amp;GnbGroup=AllCategory&amp;Code=04">토이트론 - LIKE A CHILD</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="06"><div class="center-area"><strong class="depth1-title">주방용품</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2726029&amp;GnbGroup=AllCategory&amp;Code=06">조리용기 / 도구</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726030&amp;GnbGroup=AllCategory&amp;Code=06">식기/접시/홈세트</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726032&amp;GnbGroup=AllCategory&amp;Code=06">수납정리/소품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726031&amp;GnbGroup=AllCategory&amp;Code=06">보관용기</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726033&amp;GnbGroup=AllCategory&amp;Code=06">와인/커피용품</a></li><li><a href="http://www.hmall.com/p/dpa/searchSectItem.do?sectId=2731130&amp;GnbGroup=AllCategory&amp;Code=06">주방가전</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=427611&amp;GnbGroup=AllCategory&amp;Code=06">수입주방용품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2761833&amp;GnbGroup=AllCategory&amp;Code=06">알레보 스페셜샵</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="18"><div class="center-area"><strong class="depth1-title">생활/건강</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2726024&amp;GnbGroup=AllCategory&amp;Code=18">세제/세정/탈취제</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726025&amp;GnbGroup=AllCategory&amp;Code=18">바디/헤어/구강</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726026&amp;GnbGroup=AllCategory&amp;Code=18">휴지/생리대/마스크</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726027&amp;GnbGroup=AllCategory&amp;Code=18">수납/청소/생활잡화</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2726028&amp;GnbGroup=AllCategory&amp;Code=18">건강관리/안마/실버</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="15"><div class="center-area"><strong class="depth1-title">식품</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731190&amp;GnbGroup=AllCategory&amp;Code=15">농산</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731191&amp;GnbGroup=AllCategory&amp;Code=15">축산</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731192&amp;GnbGroup=AllCategory&amp;Code=15">수산</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731193&amp;GnbGroup=AllCategory&amp;Code=15">간편식/반찬</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731194&amp;GnbGroup=AllCategory&amp;Code=15">면/캔/오일/소스</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731195&amp;GnbGroup=AllCategory&amp;Code=15">떡/베이커리/과자</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731196&amp;GnbGroup=AllCategory&amp;Code=15">유제품/유아식</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731199&amp;GnbGroup=AllCategory&amp;Code=15">홍삼/전통건강식품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731198&amp;GnbGroup=AllCategory&amp;Code=15">커피/차</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731201&amp;GnbGroup=AllCategory&amp;Code=15">유산균/콜라겐</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731197&amp;GnbGroup=AllCategory&amp;Code=15">생수/음료</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731200&amp;GnbGroup=AllCategory&amp;Code=15">비타민/영양제</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2795755&amp;GnbGroup=AllCategory&amp;Code=15">클리어런스존</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="07"><div class="center-area"><strong class="depth1-title">가구/침구</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731141&amp;GnbGroup=AllCategory&amp;Code=07">거실가구</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731142&amp;GnbGroup=AllCategory&amp;Code=07">침실가구/드레스룸</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731143&amp;GnbGroup=AllCategory&amp;Code=07">주방가구/테이블</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731144&amp;GnbGroup=AllCategory&amp;Code=07">학생/서재가구</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731145&amp;GnbGroup=AllCategory&amp;Code=07">리모델링 시공/DIY</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731146&amp;GnbGroup=AllCategory&amp;Code=07">침구</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731147&amp;GnbGroup=AllCategory&amp;Code=07">커튼/카페트</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731148&amp;GnbGroup=AllCategory&amp;Code=07">인테리어소품</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2679832&amp;GnbGroup=AllCategory&amp;Code=07">리바트(LIVART)</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679845&amp;GnbGroup=AllCategory&amp;Code=07">포터리반</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679846&amp;GnbGroup=AllCategory&amp;Code=07">포터리반 키즈</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679847&amp;GnbGroup=AllCategory&amp;Code=07">웨스트엘름</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="08"><div class="center-area"><strong class="depth1-title">가전/디지털</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731129&amp;GnbGroup=AllCategory&amp;Code=08">생활/미용가전</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731130&amp;GnbGroup=AllCategory&amp;Code=08">주방가전</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731131&amp;GnbGroup=AllCategory&amp;Code=08">계절가전</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731132&amp;GnbGroup=AllCategory&amp;Code=08">영상/음향 가전</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731133&amp;GnbGroup=AllCategory&amp;Code=08">카메라/렌즈/캠코더</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731134&amp;GnbGroup=AllCategory&amp;Code=08">노트북/PC/게임</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731135&amp;GnbGroup=AllCategory&amp;Code=08">스마트기기/OA</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731136&amp;GnbGroup=AllCategory&amp;Code=08">리퍼 가전</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2679843&amp;GnbGroup=AllCategory&amp;Code=08">삼성전자 브랜드샵</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2692354&amp;GnbGroup=AllCategory&amp;Code=08">다이슨 브랜드샵</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1424358&amp;GnbGroup=AllCategory&amp;Code=08">하이마트 브랜드샵</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="13"><div class="center-area"><strong class="depth1-title">반려동물</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2222295&amp;GnbGroup=AllCategory&amp;Code=13">반려동물(H펫샵)</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2764739&amp;GnbGroup=AllCategory&amp;Code=13">이츠독</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2764995&amp;GnbGroup=AllCategory&amp;Code=13">펫노리터</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2722164&amp;GnbGroup=AllCategory&amp;Code=13">장보는 강아지와 고양이</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="16"><div class="center-area"><strong class="depth1-title">여행/티켓/도서</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731216&amp;GnbGroup=AllCategory&amp;Code=16">여행/숙박</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731217&amp;GnbGroup=AllCategory&amp;Code=16">서비스/e쿠폰/상품권</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731128&amp;GnbGroup=AllCategory&amp;Code=16">도서/음반</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731183&amp;GnbGroup=AllCategory&amp;Code=16">원예/꽃배달</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" data-catecode="19"><div class="center-area"><strong class="depth1-title">문화/렌탈/보험</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2731214&amp;GnbGroup=AllCategory&amp;Code=19">렌탈</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2731215&amp;GnbGroup=AllCategory&amp;Code=19">보험/상조</a></li></ul></div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2679817&amp;GnbGroup=AllCategory&amp;Code=19">H렌탈샵</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1173378&amp;GnbGroup=AllCategory&amp;Code=19">바보사랑</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1148690&amp;GnbGroup=AllCategory&amp;Code=19">아트박스</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2215152&amp;GnbGroup=AllCategory&amp;Code=19">텐바이텐</a></li></ul></div><!--HMALL 스페셜 END--></div></div></div><div class="category-list-contents" style="display:block" data-catecode="10"><div class="center-area"><strong class="depth1-title">현대백화점</strong><!--백화점--><div class="sub-category-area"><!--백화점 일반 START--><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=325053&amp;GnbGroup=AllCategory&amp;Code=10">영캐주얼</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=325052&amp;GnbGroup=AllCategory&amp;Code=10">커리어/언더</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=325345&amp;GnbGroup=AllCategory&amp;Code=10">진/유니섹스</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=326244&amp;GnbGroup=AllCategory&amp;Code=10">남성정장</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=327187&amp;GnbGroup=AllCategory&amp;Code=10">남성캐주얼</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=146634&amp;GnbGroup=AllCategory&amp;Code=10">화장품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=327293&amp;GnbGroup=AllCategory&amp;Code=10">핸드백/지갑</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=327302&amp;GnbGroup=AllCategory&amp;Code=10">구두/잡화</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=326243&amp;GnbGroup=AllCategory&amp;Code=10">아동/유아</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=325425&amp;GnbGroup=AllCategory&amp;Code=10">레져/스포츠</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=146639&amp;GnbGroup=AllCategory&amp;Code=10">생활/가구</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=146638&amp;GnbGroup=AllCategory&amp;Code=10">식품</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2186849&amp;GnbGroup=AllCategory&amp;Code=10">현대아울렛</a></li></ul></div><!--백화점 일반 END--><!--백화점 스페셜 START--><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=1861421&amp;GnbGroup=AllCategory&amp;Code=10">RALPH LAUREN</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679840&amp;GnbGroup=AllCategory&amp;Code=10">스와로브스키</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=580827&amp;GnbGroup=AllCategory&amp;Code=10">CHANEL</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1196082&amp;GnbGroup=AllCategory&amp;Code=10">MAC</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1476179&amp;GnbGroup=AllCategory&amp;Code=10">URBAN DECAY</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1614556&amp;GnbGroup=AllCategory&amp;Code=10">TOM FORD BEAUTY</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1614598&amp;GnbGroup=AllCategory&amp;Code=10">Jo Malone London</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679875&amp;GnbGroup=AllCategory&amp;Code=10">휠라스포츠</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=1379588&amp;GnbGroup=AllCategory&amp;Code=10">아디다스 브랜드전</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=778977&amp;GnbGroup=AllCategory&amp;Code=10">명인명촌</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=411045&amp;GnbGroup=AllCategory&amp;Code=10">정관장</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2679871&amp;GnbGroup=AllCategory&amp;Code=10">부가부 스페셜샵</a></li><li><a href="http://www.hmall.com/p/dpa/cosHome.do?GnbGroup=AllCategory&amp;Code=10">COS</a></li><li><a href="http://www.hmall.com/p/dpa/aosMain.do?GnbGroup=AllCategory&amp;Code=10">＆Other Stories</a></li></ul></div><div class="brand-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2625458&amp;GnbGroup=AllCategory&amp;Code=10">메트로시티</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2626364&amp;GnbGroup=AllCategory&amp;Code=10">루이까또즈</a></li><li><a href="/p/dpa/searchSectItem.do?sectId=2713968&amp;GnbGroup=AllCategory&amp;Code=10">BOSE</a></li></ul><!--백화점 스페셜 END--></div><!--백화점END--></div></div></div><div class="category-list-contents" data-catecode="09"><div class="center-area wide"><strong class="depth1-title">TV쇼핑</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=502950&amp;GnbGroup=AllCategory&amp;Code=09">패션의류</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=150549&amp;GnbGroup=AllCategory&amp;Code=09">언더웨어</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=69628&amp;GnbGroup=AllCategory&amp;Code=09">뷰티</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=216428&amp;GnbGroup=AllCategory&amp;Code=09">명품잡화</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=221473&amp;GnbGroup=AllCategory&amp;Code=09">유아동/도서</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=807410&amp;GnbGroup=AllCategory&amp;Code=09">레포츠</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=792090&amp;GnbGroup=AllCategory&amp;Code=09">홈쇼핑 식품</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="http://www.hmall.com/p/dpa/searchSectItem.do?sectId=58867&amp;GnbGroup=AllCategory&amp;Code=09">인테리어</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=147267&amp;GnbGroup=AllCategory&amp;Code=09">생활/건강</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=108163&amp;GnbGroup=AllCategory&amp;Code=09">주방용품</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=1824370&amp;GnbGroup=AllCategory&amp;Code=09">방송가전</a></li><!--HMALL 일반 END--></ul></div></div><span class="tv-info"><a href="/p/bmc/brodPordPbdv.do?type=03&amp;GnbGroup=HmallCategory&amp;Code=09">생방송</a><a href="/p/bmc/brodPordPbdv.do">편성표</a></span></div><div class="center-area wide"><strong class="depth1-title">TV+샵</strong><!--HMALL 일반 START--><div class="sub-category-area"><div class="sub-category"><ul><li><a href="/p/dpa/searchSectItem.do?sectId=2264005&amp;GnbGroup=AllCategory&amp;Code=09">인테리어/침구/가구</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=2264006&amp;GnbGroup=AllCategory&amp;Code=09">생활/건강/욕실</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=2264007&amp;GnbGroup=AllCategory&amp;Code=09">주방용품</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=2263921&amp;GnbGroup=AllCategory&amp;Code=09">언더웨어</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=2264003&amp;GnbGroup=AllCategory&amp;Code=09">레포츠의류/용품</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=2264004&amp;GnbGroup=AllCategory&amp;Code=09">농수축/신선/건강식품</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="/p/dpa/searchSectItem.do?sectId=2379016&amp;GnbGroup=AllCategory&amp;Code=09">대형/생활가전</a></li><!--HMALL 일반 END--><!--HMALL 일반 START--><li><a href="http://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2686295&amp;GnbGroup=AllCategory&amp;Code=09">플러스샵 [현대아울렛]</a></li><!--HMALL 일반 END--></ul></div></div></div></div>

											</div></div>
										<!-- // 카테고리 메뉴 -->
										<!-- 퀵메뉴 -->



										<div class="quick-menu-wrap">
											<div class="quick-menu-list">
												<ul class="quicklink ql-left222" id="main_tab">

													<li class=" ">
														<a href="/p/bmc/brodPordPbdv.do?type=03?_IC_=tab1&amp;mainDispSeq=2&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="편성표">편성표</a></li>

													<li class=" ">
														<a href="/p/home.do?_IC_=tab2&amp;mainDispSeq=1&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="스토어">스토어</a></li>

													<li class=" ">
														<a href="/p/tvMainR.do?_IC_=tab3&amp;mainDispSeq=3&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="홈">홈</a></li>

													<li class=" ">
														<a href="/p/mktgMain.do?_IC_=tab4&amp;mainDispSeq=62&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="슈퍼H페스타">슈퍼H페스타</a></li>

													<li class=" point">
														<a href="/p/mktgMain.do?_IC_=tab5&amp;mainDispSeq=32&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="어메이징딜">어메이징딜</a></li>

													<li class=" ">
														<a href="/p/dsMainR.do?_IC_=tab6&amp;mainDispSeq=6&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="백화점">백화점</a></li>

													<li class=" ">
														<a href="/p/todayOpenDeal.do?_IC_=tab7&amp;mainDispSeq=48&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="오늘추천">오늘추천</a></li>

													<li class=" ">
														<a href="/pevent/eva/evntMainPage.do?_IC_=tab8&amp;mainDispSeq=7&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="이벤트">이벤트</a></li>

												</ul>
											</div>

											<div class="quick-menu-more">
												<a href="javascript:;" class="btn-quick-more">퀵메뉴 더보기</a>
												<div class="quick-menu-add">

													<a href="/p/dpd/wkBestTypeTot.do?_IC_=tab1&amp;mainDispSeq=21&amp;" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="주간베스트">
														주간베스트
													</a>

												</div>
											</div>

										</div>
										<!-- // 퀵메뉴-->
										<script>

											/*function setTitle() {
                    if($('.quick-menu-list .current a').length < 1) {
                        return;
                    }

                    var tabname = $('.quick-menu-list .current a').first().text();

                    document.title = tabname + " - 현대Hmall";

                    if(tabname == '홈' || tabname == 'HMALL') {
                        document.title = '당신의 모든 취향을 읽다 - 현대Hmall';
                    }
                }

                setTitle();*/

										</script>

										<!-- 유틸메뉴 -->
										<div class="header-util">
											<h2 class="hiding">유틸메뉴</h2>
											<!-- 로그인 전 -->
											<ul>


												<li><a ga-category="헤더" ga-action="로그아웃" href="javascript:bizSpringTag('http://www.hmall.com/p/cob/logout.do','^헤더^로그아웃');">로그아웃</a></li>
												<li><a href="javascript:bizSpringTag('/pevent/eva/evntFamilyZoneMain.do','^헤더^마이페이지 레이어^멤버십존');">멤버십존</a></li>

												<li><a ga-category="헤더" ga-action="고객센터" href="javascript:bizSpringTag('/p/cca/main.do','^헤더^고객센터');">고객센터</a></li>
											</ul>
										</div>

									</div>

								</div>
							</header>

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


							<!-- full 배경이 들어간 구조 bgcmain -->
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
																<strong>장바구니</strong>  <span>(<em class="cart-count">1</em>)</span>
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
																<button type="button" class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button>
															</div>
														</div>
														<div class="cart-bottom">
															<div class="btngroup">
																<button type="button" class="btn btn-cart-del" onclick="deleteBasktAll();"><i class="icon cart-del"></i><span>장바구니 비우기</span></button>
																<button type="button" class="btn btn-cart-set lyopen" data-modules-modal="target:#cartAlarm;"><i class="icon cart-set"></i><span>알림설정</span></button>
															</div>
														</div>
													</div>
													<!-- //.cart-head -->

													<div class="cart-body">


















														<!-- 품절체크 -->












														<form action="#" name="totBasktForm" method="post" onsubmit="return false;">

															<!-- 일반상품 -->
															<div class="shipping-listwrap" aria-label="일반상품">
																<div class="cart-check">
																	<div class="checkbox">
																		<label class="chklabel"><input type="checkbox" name="all" id="gen" onclick="check(this, 'gen', 'all', '');"><i class="icon"></i><span>일반상품</span></label>
																		<span class="cart-count">(<strong>0</strong>/<em>1</em>)</span>
																	</div>
																	<button type="button" class="btn btn-linelgray sm" onclick="deleteBasktItem(this)"><span>선택삭제</span></button>
																</div>
																<!-- //.cart-check -->










																<!-- 초기화 -->








																<div class="shipping-list" id="gen">











																	<!-- .pdwrap -->
																	<div class="pdwrap pdlist ml" style="display:;" id="018489_000000_16">
																		<input type="hidden" id="exclItemTrgtGbcd_2137171063" name="exclItemTrgtGbcd" value="">
																		<input type="hidden" id="slitmNm_2137171063" name="slitmNm" value="[DKNY GOLF] 22SS 여성 니트 반팔 카라티 1종">
																		<input type="hidden" name="slitmCd" value="2137171063">

																		<!-- 새벽배송/신선식품 추가 20180705 특화배송조유진 -->
																		<input type="hidden" name="ordAgreeInf" value="N|N|N|N|[DKNY GOLF] 22SS 여성 니트 반팔 카라티 1종|블랙/95|00002|0">

																		<input type="hidden" name="uitmCdInfPup" value="[DKNY GOLF] 22SS 여성 니트 반팔 카라티 1종$블랙/95$1$99000$ $2137171063$bask">
																		<input type="hidden" name="dawnDlvYn" value="N">
																		<input type="hidden" name="freshFoodYn" value="N">

																		<input type="hidden" name="sectId" value="2731506">
																		<input type="hidden" name="stlmWayScopGbcd" value="10">

																		<input type="hidden" name="venCd" value="018489">
																		<input type="hidden" name="cardEventYn" value="">
																		<input type="hidden" name="basktGbcd" value="02">
																		<input type="hidden" name="brand" value="290274(DKNY골프)">
																		<input type="hidden" name="gaCategory" value="스포츠_레져/골프용품/골프웨어/니트셔츠(여성)">














																		<!-- 스토어픽 상품, 픽업일 경과일경우 -->




																		<input type="hidden" name="basktVenCdVal" id="basktVenCdVal" value="018489">
																		<input type="hidden" name="basktVen2CdVal" id="basktVen2CdVal" value="000000">
																		<input type="hidden" name="basktOshpVenAdrSeqVal" id="basktOshpVenAdrSeqVal" value="16">
																		<input type="hidden" name="basktGrpDivRnm" id="basktGrpDivRnm" value="EMT">
																		<input type="hidden" name="sdlvcVenSeq" id="sdlvcVenSeq" value="">
																		<input type="hidden" name="dlvcPayGbcdVal" id="dlvcPayGbcdVal" value="00">

																		<input type="hidden" name="dlvHopeOverYn" value="Y">
																		<input type="hidden" name="basktDlvCostVal" id="basktDlvCostVal" value="0">




																		<input type="hidden" name="basktVenCdGatherVal" id="basktVenCdGatherVal" value="018489|000000||EMT">







																		<input type="hidden" name="basktGiftOrderYn" value="Y">


																		<input type="hidden" name="basktTotalGiftOrderYn" value="Y">






																		<input type="hidden" name="bsicAmt" value="0">



																		<div class="checkbox">
																			<label class="chklabel"><input type="checkbox" name="basktInf" value="2137171063|00002|0|1|99000" onclick="check(this, 'gen', '2137171063', '00002');"><i class="icon"></i><span>[DKNY GOLF] 22SS 여성 니트 반팔 카라티 1종</span></label>
																		</div>
																		<button type="button" class="btn btn-cart-del" onclick="deleteBasktSlitem('2137171063|00002|0|1|99000');"><i class="icon cart-del"></i><span class="hiding">삭제</span></button>
																		<div class="pdlist-wrap">
																			<div class="pditem">
																				<figure class="pdthumb">
																					<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137171063&amp;sectId=2731506">
																						<div class="thumb">
																							<img src="https://image.hmall.com/static/0/1/17/37/2137171063_0.jpg?RS=120x120&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=120x120&amp;AR=0')">
																						</div>
																					</a>
																					<figcaption>
																						<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137171063&amp;sectId=2731506">
																							<div class="pdprice">










																								<!-- TODO 곽희섭 20170608 통합포인트 추가 -->


																								<input type="hidden" name="sellPrc" value="99000">
																								<input type="hidden" name="bbprc" value="99000">

																								<ins class="normal" aria-label="정상가"><em>99,000</em><b>원</b></ins>


																							</div>
																							<div class="benefits">











																								<!-- 카드즉시할인KJH -->

																							</div>



																							<div class="pdoption" aria-label="옵션/수량">
																								<span class="option">옵션: <em>블랙/95</em></span>
																								<span class="count">수량: <em>1개</em></span>
																							</div>
																						</a>
																					</figcaption>
																					<div class="pdlike">
																						<a href="javascript:;" onclick="zzimItem(this, '2137171063', '00002');" class="btn btn-like" id="zzim_2137171063:00002"><i class="icon"></i><span class="hiding">찜</span></a>
																					</div>
																				</figure>
																			</div>
																			<!-- //.pditem -->

																			<!-- gifts-area : 필수사은품 -->

																			<!-- //.gifts-area -->

																			<!-- btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->
																			<div class="btngroup">


																				<div class="pdfunc">
																					<button type="button" class="btn btn-linelgray sm btn-prop" id="optBtn_2137171063_00002" onclick="showChgUitmPup(this, '2137171063', '00002', 0, 99000, '');"><span>수량/속성변경</span><i class="icon"></i></button>
																				</div>






																				<button type="button" class="btn btn-linelgray" onclick="setGiftOrder('Y');buyDirect(this);" id="buyDirectBtn_2137171063"><span>선물하기</span></button>








																				<button type="button" class="btn btn-default" onclick="setGiftOrder('N');buyDirect(this);" id="buyDirectBtn_2137171063"><span>바로구매</span></button>





																			</div>
																			<!-- // btngroup: 수량,속성변경 / 선물하기 / 스토어픽 구매 / 바로구매 -->

																			<!-- 속성변경 옵션 class=selected 추가하면 활성화 됨 -->
																			<div class="prop-change" id="chgUitmLayer_2137171063_00002">
																			</div>
																			<!-- //.prop-change -->


																		</div>
																		<!-- //.pdlist-wrap -->
																	</div>
																	<!-- //.pdwrap -->


















																</div>
																<!-- //.shipping-list -->

															</div>
															<!-- //.shipping-listwrap  일반상품 -->
														</form>


													</div>
													<!-- //.cart-body -->


												</div>
												<!-- //.cart-area -->
											</div>
											<!-- //.csection -->

											<!-- 상품리스트에 하나라도 체크되면 활성화됨 -->
											<div class="sticky-ui-wrapper util-option-sticky"><div class="sticky-placeholder"></div><div class="util-option sticky" data-modules-sticky="padding:-40;breakPoint:.container;className:util-option-sticky;" style="">
												<div class="sticky-inner">
													<div class="result">
														<p class="sel-tit">선택한 상품<span>(<em id="selCnt">0</em>)</span></p>
														<p><strong>상품금액</strong><ins><em id="selSlitmAmt">0</em><b>원</b></ins></p>
														<!-- <p class="sale"><strong>할인</strong><ins><em class="off">0</em><b>원</b></ins></p>-->
														<p class="ship-fee"><strong>배송비</strong><ins><em id="selDlvAmt">0</em><b>원</b></ins></p>  <!-- 선택한 상품이 없을 경우 em에 class="off" 붙여주세요.  -->
													</div>
													<div class="total-price">
														<a href="javascript:;" class="btn-total"><span>총 주문 금액</span></a>
														<ins><em id="selOrdAmt">0</em><b>원</b></ins>
													</div>
													<div id="uobtnprsnbox" class="btngroup _gift" style="display:none;">
														<button class="btn btn-linelgray" onclick="setGiftOrder('Y');orderSelect();"><span>선물하기</span></button>
														<button class="btn btn-purchase" onclick="setGiftOrder('N');orderSelect();"><span>바로구매</span></button>
													</div>
													<div id="uobtnbox" class="btngroup">
														<button type="button" class="btn btn-purchase" onclick="setGiftOrder('N');orderSelect();"><span>선택상품 구매하기</span></button>
													</div>
												</div>
											</div></div>
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
																<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2028027962&amp;SectID=" onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니" ga-custom-position="오늘의 추천 상품" ga-custom-creative="2028027962_만쥬/찰밥바/경주빵/찰보리빵/아이스크림 모음" ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
																	<!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
																	<div class="thumb">
																		<img src="https://image.hmall.com/static/9/7/02/28/2028027962_0.jpg?RS=185x185&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
																	</div>
																	<figcaption>
																		<div class="pdname" aria-label="제품명">만쥬/찰밥바/경주빵/찰보리빵/아이스크림 모음</div>

																		<div class="pdprice">
																			<span aria-label="판매가"><em>10,900</em><b>원</b></span>
																		</div>

																	</figcaption>
																</a>
															</figure>



															<figure class="pdthumb">
																<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2062184449&amp;SectID=" onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니" ga-custom-position="오늘의 추천 상품" ga-custom-creative="2062184449_[화과방][이번주만 10% 다운쿠폰]팥빙수세트부터 양갱, 전병까지" ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
																	<!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
																	<div class="thumb">
																		<img src="https://image.hmall.com/static/4/4/18/62/2062184449_0.jpg?RS=185x185&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
																	</div>
																	<figcaption>
																		<div class="pdname" aria-label="제품명">[화과방][이번주만 10% 다운쿠폰]팥빙수세트부터 양갱, 전병까지</div>

																		<div class="pdprice">
																			<span aria-label="판매가"><em>16,500</em><b>원</b></span>
																		</div>

																	</figcaption>
																</a>
															</figure>



															<figure class="pdthumb">
																<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139463828&amp;SectID=" onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니" ga-custom-position="오늘의 추천 상품" ga-custom-creative="2139463828_[오트리][5% 다운쿠폰]단백질바 36개 32,400원 외 견과류 원물 / 하루견과" ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
																	<!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
																	<div class="thumb">
																		<img src="https://image.hmall.com/static/8/3/46/39/2139463828_0.jpg?RS=185x185&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
																	</div>
																	<figcaption>
																		<div class="pdname" aria-label="제품명">[오트리][5% 다운쿠폰]단백질바 36개 32,400원 외 견과류 원물 / 하루견과</div>

																		<div class="pdprice">
																			<span aria-label="판매가"><em>32,400</em><b>원</b></span>
																		</div>

																	</figcaption>
																</a>
															</figure>



															<figure class="pdthumb">
																<a href="http://www.hmall.com/p/pda/itemPtc.do?slitmCd=2139572013&amp;SectID=" onclick="gaTagging(this, '', '', '');" ga-custom-name="장바구니" ga-custom-position="오늘의 추천 상품" ga-custom-creative="2139572013_[던킨,배스킨라빈스][16일∼22일]10% 다운쿠폰 + 2개↑머그컵증정" ga-custom-title="주문/장바구니>장바구니>리스트" ga-custom-etc="">
																	<!-- [12/04]_수정(이미지 크기 및 border-radius , bg opacity 추가) -->
																	<div class="thumb">
																		<img src="https://image.hmall.com/static/0/2/57/39/2139572013_0.jpg?RS=185x185&amp;AR=0" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=185x185&amp;AR=0')">
																	</div>
																	<figcaption>
																		<div class="pdname" aria-label="제품명">[던킨,배스킨라빈스][16일∼22일]10% 다운쿠폰 + 2개↑머그컵증정</div>

																		<div class="pdprice">
																			<span aria-label="판매가"><em>19,900</em><b>원</b></span>
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
													<h3 class="major-headings">내 장바구니와 유사한 장바구니에 담긴 다른 상품</h3> <!-- 장바구니에 담긴 상품이 없을 시 텍스트 변경 : 이 상품 지금 딱!-->
													<div class="pdwrap xllist">
													</div>
													<!-- //.pdwrap -->
												</div>
												<!-- //.produt-slide : 내 장바구니와 유사한 장바구니에 담긴 다른 상품 -->

												<!-- .produt-slide :  장바구니 상품과 동일한 카테고리 베스트 셀러 -->
												<div class="article produt-slide hidden" id="rcmm2">
													<h3 class="major-headings">함께 구매하면 좋은 상품</h3>  <!-- 장바구니에 담긴 상품이 없을 시 텍스트 변경 : 지금 인기 많은 상품 -->
													<div class="pdwrap xllist">
													</div>
													<!-- //.pdwrap -->
												</div>
												<!-- //.produt-slide : 장바구니 상품과 동일한 카테고리 베스트 셀러 -->
											</div>
										</div>
										<!--product-cotent-->
									</div>
									<!-- //.cbody -->

									<!-- cfoot -->
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
														<li>일부 특가상품은 무이자 할부 대상에서 제외되며 또한 각 상품별로 무이자 할부 개월수가 상이하오니, 최종 결제 페이지에서 무이자 할부 개월수를 다시 한번 확인하시기 바랍니다.</li>
														<li>상품별로 무이자할부 혜택을 받고 싶으시다면, 개별 주문 부탁드립니다.</li>
													</ul>
												</div>
												<!-- //.cart-infocnt -->

											</div>
											<!-- //.cart-info -->
										</div>
									</div>
									<!-- //.cfoot -->

								</div>
								<!-- //.container -->
							</main>
							<!-- //.cmain -->

							<form id="productModifyForm" action="#" method="post"></form>
							<form id="goBasktList" action="https://www.hmall.com/p/odb/basktList.do" method="post"></form>
							<form id="orderForm" action="https://www.hmall.com/p/oda/orderRedirect.do" method="post"></form>
							<form id="deleteForm" method="post"></form>





							<script type="text/javascript">
								// 20201202 footer script 오류로... 임시!
								//$(window).on("load", function() {

								/* [UX-147]추천 알고리즘  비 활성화 처리*/
								// 	if ( 1 > 0 ) {
								//      cartRcmm("similarCart", "2137171063");
								//      cartRcmm("together");
								//  } else {
								//      cartRcmm("similarPrsn");
								//  }
								//});
							</script>

							<!-- footer include-->




							<!-- footer -->




							<!-- footer -->
							<!-- 푸터 영역 시작 -->
							<footer class="footer">
								<div class="link-area">
									<div class="link-area-in">
										<h2 class="hiding">푸터메뉴</h2>
										<div class="short-menu">
											<ul>
												<li><a href="http://www.ehyundai.com/newPortal/ir/main.do" target="_blank">현대백화점그룹</a></li>
												<li><a href="http://www.ehyundai.com/newPortal/index.jsp" target="_blank">현대백화점소개</a></li>
												<li><a href="https://company.hyundaihmall.com/" target="_blank">현대홈쇼핑소개</a></li>
												<li><a href="https://company.hyundaihmall.com/html/company/company_ethics-2.html" target="_blank">윤리경영</a></li>
												<li><a href="https://company.hyundaihmall.com/html/investment/investment_stock.html" target="_blank">IR</a></li>
												<li><a href="https://recruit.ehyundai.com/index.nhd" target="_blank">채용안내</a></li>
												<li><a href="https://company.hyundaihmall.com/html/affiliate/affiliate_contract-1.html" target="_blank">신규입점</a></li>
												<li><a href="https://company.hyundaihmall.com/html/affiliate/affiliate_marketing-1.html" target="_blank">마케팅/제휴안내/광고</a></li>
												<li><a href="/p/oda/massOrdReq.do" target="_blank">대량주문</a></li>
											</ul>
										</div>
										<!-- // .short-menu -->

										<!-- on 클래스 추가 시 select layer 노출 -->
										<div class="family-site">
											<div class="select-label" data-modules-customtoggle="parent:.family-site;activeClass:on;">Family Site</div>
											<!-- 디자인 반영 전 -->
											<div class="select-layer">
												<h3 class="group">쇼핑몰 Site</h3>
												<ul>
													<li><a href="http://www.thehyundai.com" target="_blank" title="더현대닷컴">더현대닷컴</a></li>
													<li><a href="https://www.hddfs.com/shop/dm/main.do?ptnrChlCd=00003014" target="_blank" title="현대백화점 DUTY FREE">현대백화점 DUTY FREE</a></li>
													<li><a href="http://esuper.ehyundai.com" target="_blank" title="e수퍼마켓">e수퍼마켓</a></li>
													<li><a href="http://www.thehansome.com" target="_blank" title="더한섬">더한섬</a></li>
													<li><a href="http://mall.hyundailivart.co.kr" target="_blank" title="현대리바트몰">현대리바트몰</a></li>
													<li><a href="http://www.hyundairentalcare.co.kr" target="_blank" title="현대렌탈케어">현대렌탈케어</a></li>
													<li><a href="http://www.hfashionmall.com" target="_blank" title="H패션몰">H패션몰</a></li>
													<li><a href="https://tohome.thehyundai.com" target="_blank" title="현대백화점 식품관">현대백화점 식품관</a></li>
													<li><a href="https://www.greating.co.kr" target="_blank" title="그리팅">그리팅</a></li>
													<li><a href="https://www.eqlstore.com/main" target="_blank" title="한섬EQL">한섬EQL</a></li>
													<li><a href="https://www.hyundailnc.com" target="_blank" title="현대L&amp;C몰">현대L&amp;C몰</a></li>
												</ul>
												<h3 class="group">관계사 Site</h3>
												<ul>
													<li><a href="http://www.ehyundai.com/newPortal/ir" target="_blank" title="현대백화점 그룹">현대백화점 그룹</a></li>
													<li><a href="http://www.ehyundai.com" target="_blank" title="현대백화점">현대백화점</a></li>
													<li><a href="http://www.hyundaigreenfood.com" target="_blank" title="현대그린푸드">현대그린푸드</a></li>
													<li><a href="http://www.thehansome.com" target="_blank" title="한섬">한섬</a></li>
													<li><a href="http://www.hyundailivart.co.kr" target="_blank" title="현대리바트">현대리바트</a></li>
													<li><a href="http://www.hyundairentalcare.co.kr" target="_blank" title="현대렌탈케어">현대렌탈케어</a></li>
													<li><a href="http://www.hyundaidreamtour.com" target="_blank" title="현대드림투어">현대드림투어</a></li>
													<li><a href="http://www.everdigm.com" target="_blank" title="에버다임">에버다임</a></li>
													<li><a href="http://www.cnsfoodsystem.co.kr" target="_blank" title="씨엔에스푸드시스템">씨엔에스푸드시스템</a></li>
													<li><a href="http://www.hyundaicatering.co.kr" target="_blank" title="현대캐터링시스템">현대캐터링시스템</a></li>
													<li><a href="http://www.hyundai-ite.com" target="_blank" title="현대IT&amp;E">현대IT&amp;E</a></li>
												</ul>
											</div>
											<!-- // .select-layer -->
										</div>
										<!-- // .family-site -->
									</div>
									<!-- // .link-area-in -->
								</div>
								<!-- // .link-area -->

								<div class="footer-contents">
									<div class="footer-logo"><img src="//image.hmall.com/p/img/co/footer-logo.jpg" alt="HYUNDAI">
									</div>
									<div class="info-area">
										<div class="policy-link-list">
											<ul>
												<li><a href="/p/cod/shmlTcnd.do">이용약관</a></li>
												<li><a href="/p/cod/psnHndl.do"><strong>개인정보 처리방침</strong></a></li>
												<li><a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2118676540" target="_blank">사업자정보확인</a></li>
												<li><a href="https://company.hyundaihmall.com/html/company/company_ethics-1.html" target="_blank">공정거래 자율준수</a></li>
												<li><a href="/p/cod/psnHdhsInnerCntrl.do">보험대리점 내부통제기준</a></li>
											</ul>
										</div>
										<!-- // .policy-link-list -->

										<!-- on 클래스 추가 시 노출 -->
										<div class="footer-info">
											<button class="btn-footer" data-modules-customtoggle="parent:.footer-info;activeClass:on;"><strong>(주)현대홈쇼핑</strong></button>
											<div class="footer-info-box">
												<div class="hmall-info">
													<div class="list-contents">
														<p><span>대표이사 : 임대규</span><span>주소 : 서울특별시 강동구 올림픽로70길 34 (주)현대홈쇼핑</span></p>
														<p><span>고객센터 TEL : 1600-0000(유료)</span><span>고객만족사업부 FAX : 02-2143-2731</span></p>
														<p><span>기타문의 : <a href="mailto:webmaster@hmall.com">webmaster@hmall.com</a></span><span>사업자등록번호
                                        : 211-86-76540</span></p>
														<p><span>통신판매업 신고 : 제 25-3133호</span><span>부가통신 신고번호 : 3787</span></p>
														<p><span>정보보호최고책임자 : 정보보호담당 오권호</span><span>청소년보호책임자 : Hmall사업부 홍성일</span></p>
														<p><span>호스팅서비스 : (주)현대홈쇼핑</span></p>
													</div>
												</div>
												<!-- // .hamall-info -->

												<div class="service-info-wrap">
													<p class="safe-info">우리은행 구매안전 서비스 <a href="#" onclick="window.open('https://www.hmall.com/static/html/popup/2013/11/woori_escrow.html','','left=300,top=150,scrollbars=yes,resizable=no,width=558,height=580'); return false;" target="_blank">가입사실 확인</a> 고객님은 안전거래를 위해 현금
														결제 시 저희
														쇼핑몰에서 가입한 우리은행의 구매안전 서비스를 이용하실 수 있습니다.</p>
													<div class="cs-link">
														<a href="/p/cod/hdhsArs.do">ARS안내</a>
														<a href="/p/ccc/faqList.do?faqLCsfNo=&amp;ancmCntn=카카오톡&amp;sort=false&amp;faqMCsfNo=" onclick="javascript:bizSpringTag('','^푸터^카톡주문안내');" name="shopGuide">카톡주문안내</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</footer>


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
							<script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052010"></script>
							<script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052010"></script>

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

									GA_info[GACustomKey.Dimension9] = "20220520";

									var _gaid = getCookieGA('GAID');
									if(_gaid != null){GA_info[GACustomKey.Dimension11] = _gaid;}

									GA_info[GACustomKey.Dimension12] = "Y";
									GA_info[GACustomKey.Dimension24] = "6";


									GA_info[GACustomKey.Dimension13] = "U";
									GA_info[GACustomKey.Dimension14] = "U";
									GA_info[GACustomKey.Dimension15] = "실버";

									GA_info[GACustomKey.Dimension22] = "기타";






									GA_info[GACustomKey.Dimension30] = "N";

									GA_info[GACustomKey.Dimension37] = "0";
									GA_info[GACustomKey.Dimension38] = "N";


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
											,url: "https://wwwca.hmall.com/p/coe/onAirList.do?time=052010"
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
													,url: "/p/coe/onAirList.do?time=052010"
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
											,url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList.do?time=052010"
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
													,url: "/p/coe/onAirCardPrmoList.do?time=052010"
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

							<!-- 스카이 스크래퍼 -->
							<div class="sticky-ui-wrapper wing-banner-sticky"><div class="sticky-placeholder"></div><div class="wing-banner banner-right" data-modules-sticky="padding:0;breakPoint:.header-menu-wrap;className:wing-banner-sticky">
								<!-- fixed 클래스 추가 시 고정 -->
								<a href="/pevent/eva/evntTmplDivideView.do?prmoNo=00049341">
									<div class="visit-indicator">바로접속


										<span class="visit-staus on" style="margin-left: 0px">ON</span>

									</div>
								</a>
								<div class="recent-view-area" id="skyScOnAirArea">









									<a class="recent-view-title">ON AIR</a>
									<ul id="banner-onair">


										<li>

											<a href="javascript:;" class="tv-shopping" onclick="gaTagging(this, &quot;/p/pda/itemPtc.do?sectId=1003&amp;slitmCd=2136720410&amp;bfmtNo=202205203004&amp;brodDt=20220520&amp;brodStrtDtm=09:25&amp;brodType=P&quot;, &quot;etvhm_etv&quot;, &quot;eTV온에어^영상상품^패밀리세트 비에날씬 프로(BNR 17) * 12BOX + 비에날프로틴 3BOX&quot;)" ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="TV쇼핑" ga-custom-creative="방송상품" ga-custom-id="2136720410_패밀리세트 비에날씬 프로(BNR 17) * 12BOX + 비에날프로틴 3BOX" ga-custom-etc="home">
												<img src="https://image.hmall.com/static/4/0/72/36/2136720410_0.png?RS=140x140&amp;AR=0" alt="패밀리세트 비에날씬 프로(BNR 17) * 12BOX + 비에날프로틴 3BOX" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
												<span class="over-box">
		                            <strong class="onair-kind shopping">TV쇼핑</strong>
		                            <em class="onair-time" id="onAirHtime" data-brodenddtm="20220520102500">00:09:15</em>
		                        </span>
											</a>


										</li>



										<li>

											<a href="javascript:;" class="tv-shopping" onclick="gaTagging(this, &quot;/p/pda/itemPtc.do?sectId=1003&amp;slitmCd=2140706072&amp;bfmtNo=202205205005&amp;brodDt=20220520&amp;brodStrtDtm=09:40&amp;brodType=P&quot;, &quot;etvhm_etv&quot;, &quot;eTV온에어^영상상품^[5월 한정 기획] 준우젬 18K 귀걸이 5종 + 18K 펜던트 2종 (총7종)&quot;)" ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="TV쇼핑" ga-custom-creative="방송상품" ga-custom-id="2140706072_[5월 한정 기획] 준우젬 18K 귀걸이 5종 + 18K 펜던트 2종 (총7종)" ga-custom-etc="home">
												<img src="https://image.hmall.com/static/0/6/70/40/2140706072_0.jpg?RS=140x140&amp;AR=0" alt="[5월 한정 기획] 준우젬 18K 귀걸이 5종 + 18K 펜던트 2종 (총7종)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
												<span class="over-box">
		                            <strong class="onair-kind shop">TV+샵</strong>
		                            <em class="onair-time" id="onAirHdtime" data-brodenddtm="20220520103959">00:23:15</em>
		                        </span>
											</a>


										</li>

									</ul>

								</div>
								<div class="qr_view_area">
									<span class="qr_txt">쇼핑라이브</span>
									<span class="img_qr"><img src="https://image.hmall.com/p/img/co/img-qr.jpg" alt="쇼핑라이브 qr이미지"></span>
								</div>
								<div class="wing-slide exhibition01" id="skyScCardArea">









									<ul>


										<li style="">





											<a href="https://www.hmall.com/p/dpa/crdDmndDcPrmo.do?prmoNo=P202204280893">
												<span class="img"><img src="//image.hmall.com/p/img/ev/icon/ico-card-shinhan.png" alt="신한카드"></span>
												<span class="card-txt">
		                            <strong class="card-name">신한카드</strong>
		                            <span class="benefit-txt">
		                              <em class="point-red">

		                                      5%


		                              </em>

                                               즉시 할인



		                            </span>
		                        </span>
											</a>
										</li>

									</ul>
									<!-- 페이징 -->





									<!-- // 페이징 -->
								</div>
								<!-- // .wing-slide -->

								<div class="btn-top"><a href="javascript:;">TOP</a></div>
							</div></div>
							<!-- // 스카이 스크래퍼 -->
							<script type="text/javascript">

								setTimeout(function() {
									setOnAirSkySc();
								}, 100);

								/*
    setTimeout(function() {
    	setCardPromotion();
    }, 300);
    */
							</script>
							<!-- 스카이스크래퍼 -->


							<!--알림설정 클릭 시 가격변경 알리미 팝업-->
							<div class="ui-modal" id="cartAlarm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="ui-modal-dialog cart alarm" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">가격변경 알리미</strong>
										<div class="pop-content">
											<p class="desc">장바구니에 담긴 상품의 가격이 인하되면 알림을 보내드립니다.</p>
											<div class="content">
												<div class="box-type">
													<p class="radio-box-tit">수신방법</p>
													<div class="radiobox">
														<div class="radio-cnt">
															<label class="radlabel"><input type="radio" name="basktNotfMthdGbcd" value="2"><i class="icon"></i><span>앱푸시 (PUSH)</span></label>
														</div>

														<div class="radio-cnt">
															<label class="radlabel"><input type="radio" name="basktNotfMthdGbcd" value="1"><i class="icon"></i><span>이메일 (bog*****@nate.com)</span></label>
															<button class="btn btn-round xs" onclick="window.location.href='/p/mpd/changeMemberInfoFormMain.do'"><span>변경</span></button>
														</div>

													</div>
												</div>
												<ul class="dotlist">
													<li>상품이 재입고 되면 알림을 보내드립니다.</li>
													<li>앱푸시(PUSH)는 수신 동의가 되어 있어야 발송됩니다. <br> (확인 및 수신동의 : Hmall앱 &gt; 설정 &gt; 알림설정 &gt; 혜택 알림받기 ON)</li>
													<li>21시 ~ 익일 08시에는 가격변경 알리미가 발송되지 않습니다. 단, 야간알림 PUSH 수신 동의시에는 알림이 발송됩니다.</li>
												</ul>
												<div class="btngroup">
													<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->


													<button type="button" class="btn btn-default ml" onclick="registBasketAlrimi('Y');"><span>알림신청</span></button>



												</div>
											</div>
										</div>

										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//알림설정 클릭 시 가격변경 알리미 팝업-->

							<!--품절된 상품 > 재입고 알림 버튼 클릭시 재입고 팝업-->
							<div class="ui-modal" id="cartRestock" tabindex="-1" role="dialog" aria-labelledby="cartRestock">
								<div class="ui-modal-dialog cart restock-alarm" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">재입고 알리미</strong>
										<div class="pop-content">
											<form name="restock" onsubmit="return false;">
												<input type="hidden" name="slitmCd">
												<input type="hidden" name="uitmCd">
												<input type="hidden" name="useYn" value="Y">
												<p class="desc">상품이 재입고되면 알림을 보내드립니다.</p>
												<div class="content">
													<div class="box-type item">  <!-- pditem이 있을 경우 item 클래스 추가 -->
														<div class="pditem">
															<figure class="pdthumb">
																<div class="thumb" id="restock_img"></div>
																<figcaption>
																	<p class="pdtit" id="restock_name"></p>
																</figcaption>
															</figure>
														</div>
														<p class="radio-box-tit">수신방법</p>
														<div class="radiobox">
															<label class="radlabel"><input type="radio" name="rad1" checked="" aria-checked="true"><i class="icon"></i><span>휴대폰 SMS (010-****-2769)</span></label>
														</div>
													</div>
													<ul class="dotlist">
														<li>상품이 재입고 되면 알림을 보내드립니다.</li>
														<li>앱푸시(PUSH)는 수신 동의가 되어 있어야 발송됩니다. <br> (확인 및 수신동의 : Hmall앱 &gt; 설정 &gt; 알림설정 &gt; 혜택 알림받기 ON)</li>
														<li>재입고 알리미 신청 확인 및 삭제는 Hmall 모바일 &gt; 마이페이지 &gt; 재입고 알리미에서 하실 수 있습니다.</li>
													</ul>
													<div class="btngroup">
														<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
														<button type="button" class="btn btn-default" onclick="insertAlrim();"><span>알림신청</span></button>
													</div>
												</div>
											</form>
										</div>
										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//품절된 상품 > 재입고 알림 버튼 클릭시 재입고 팝업-->

							<!--주의사항안내 : PEB003 신선식품 주의사항 안내-->
							<div class="ui-modal" id="divFreshFoodPd" tabindex="-1" role="dialog" aria-labelledby="divFreshFoodPd">
								<div class="ui-modal-dialog cart caution caution-fresh" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">신선식품 주의사항 안내</strong>
										<div class="pop-content">
											<p class="desc"><span>아래 신선식품(냉장, 냉동 포함) 상품은 상품가치 하락 사유로 <em>배송중에는 취소 불가</em>하며, 단순 변심으로 인한 <em>교환, 반품이 불가</em>합니다. <br> (단, 상품 하자 제외)</span></p>
											<div class="content">
												<div class="product-list" id="divFreshFoodPdItemList">
												</div>
												<div class="btngroup">
													<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
													<button type="button" class="btn btn-default" onclick="orderLayerPop('divFreshFoodPd');"><span>동의</span></button>
												</div>
											</div>
										</div>
										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//주의사항안내 : PEB003 신선식품 주의사항 안내-->
							<!--주의사항안내 : PEB004 할부개월 수 주의사항 안내-->
							<div class="ui-modal" id="divWintInsmMthsPd" tabindex="-1" role="dialog" aria-labelledby="divWintInsmMthsPd">
								<div class="ui-modal-dialog cart caution caution-installment" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">할부개월 수 안내</strong>
										<div class="pop-content">
											<p class="desc" id="pMinWintInsmMths"></p>
											<div class="content">
												<div class="product-list" id="divWintInsmMthsPdItemList">
												</div>
												<ul class="dotlist">
													<li>상품별로 제공하는 무이자할부 혜택을 이용하시려면 각각 구매해주세요.</li>
													<li>12개월 이상 무이자할부는 카드사별 적용조건이 상이하여 결제수단(카드) 선택 시 확인 가능합니다.</li>
												</ul>
												<div class="btngroup">
													<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
													<button type="button" class="btn btn-default" onclick="orderLayerPop('divWintInsmMthsPd')"><span>주문 진행</span></button>
												</div>
											</div>
										</div>
										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//주의사항안내 : PEB004 할부개월 수 주의사항 안내-->
							<!--주의사항안내 : PEB005 신용카드 즉시할인 적용안내 주의사항 안내-->
							<div class="ui-modal" id="divCrdImdtDc" tabindex="-1" role="dialog" aria-labelledby="divCrdImdtDc">
								<div class="ui-modal-dialog cart caution caution-sale" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">신용카드 즉시할인 적용안내</strong>
										<div class="pop-content">
											<p class="desc"><span>구매하실 상품들의 즉시할인 비대상이 포함되어있습니다. <br> 함께 주문하실 경우 <em>신용카드 즉시 할인이 적용되지 않습니다.</em></span></p>
											<div class="content">
												<div class="product-list" id="ulCrdImdtDc">
												</div>
												<ul class="dotlist">
													<li>상품별로 제공하는 카드즉시할인 혜택을 이용하시려면 개별 구매해주세요.</li>
												</ul>
												<div class="btngroup">
													<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
													<button type="button" class="btn btn-default" onclick="fn_crdImdtDcOrder();"><span>주문 진행</span></button>
												</div>
											</div>
										</div>
										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//주의사항안내 : PEB005 신용카드 즉시할인 적용안내 주의사항 안내-->
							<!--주의사항안내 : PEB006 주문상품 주의사항 안내-->
							<div class="ui-modal" id="divOrdMakePd" tabindex="-1" role="dialog" aria-labelledby="divOrdMakePd">
								<div class="ui-modal-dialog cart caution caution-product" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">주문상품 주의사항 안내</strong>
										<div class="pop-content">
											<p class="desc"><span>아래 상품은 <em>주문제작</em> 예정이므로 <em>취소, 교환, 반품이 불가</em> 합니다. <br> (상품 하자 제외)</span></p>
											<div class="content">
												<div class="product-list" id="divOrdMakePdItemList">
												</div>
												<div class="btngroup">
													<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
													<button type="button" class="btn btn-default" onclick="orderLayerPop('divOrdMakePd');"><span>동의</span></button>
												</div>
											</div>
										</div>
										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//주의사항안내 : PEB006 주문상품 주의사항 안내-->
							<!--주의사항안내 : PEB007 포장개봉 주의사항 안내-->
							<div class="ui-modal" id="divBoxOpenPd" tabindex="-1" role="dialog" aria-labelledby="divBoxOpenPd">
								<div class="ui-modal-dialog cart caution caution-product-pack" role="document">
									<div class="pop-wrap">
										<strong class="pop-title">포장개봉 주의사항 안내</strong>
										<div class="pop-content">
											<p class="desc"><span>아래 상품은 특성상, <em>박스(BOX) 또는 밀봉포장 개봉으로 인한 상품 가치 하락시 교환/반품이 불가</em> 한 상품입니다. (단, 상품가치 하락없이 재화 등의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외)</span></p>
											<div class="content">
												<div class="product-list" id="divBoxOpenPdItemList">
												</div>
												<div class="btngroup">
													<button type="button" class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
													<button type="button" class="btn btn-default" onclick="orderLayerPop('divBoxOpenPd');"><span>동의</span></button>
												</div>
											</div>
										</div>
										<button type="button" class="btn-close sm" data-dismiss="modal"><span>팝업 닫기</span></button> <!--data-dismiss="modal" 줄 경우 닫힘-->
									</div>
								</div>
							</div>
							<!--//주의사항안내 : PEB007 PEB007 포장개봉 주의사항 안내-->


							<div class="ui-modal cart-recom" id="cart-recommend" tabindex="-1" role="dialog" aria-label="이런 상품 어떠세요? 레이어 팝업">
								<div class="ui-modal-dialog w1080" role="document">
									<div class="content">
										<p class="ui-title">이런 상품 어떠세요?</p>
										<div class="content-body">
											<div class="pdlist-wrap col5"> <!--// 5xn class="col5" 추가 -->
											</div>
										</div>
										<button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
									</div>
								</div>
							</div>

							<!-- [11/24]_수정(찜리스트 알럿추가) -->
							<div class="ui-modal alert" id="zzimlistAdd" tabindex="-1" role="dialog" aria-label="찜리스트추가">
								<div class="ui-modal-dialog" role="document">
									<div class="content">
										<span class="bgcircle check-on-sm"><i class="icon check-on"></i></span>
										<p class="ctypo17 bold">찜리스트에 추가되었습니다.</p>
									</div>
									<div class="btngroup">
										<!-- <button class="btn btn-linelgray" data-dismiss="modal"><span>취소</span></button> -->
										<button class="btn btn-default" data-dismiss="modal"><span>확인</span></button>
										<!-- 데이터 전송 후 닫힘 $(element).modal().hide() -->
									</div>
									<button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
								</div>
							</div>

							<!-- [01/15] 선물포장안내-->
							<div class="ui-modal" id="modalGiftNoti" tabindex="-1" role="dialog" aria-label="선물포장안내">
								<div id="gift-popup-content" class="ui-modal-dialog giftnoti" role="document">
									<div class="content">
										<p class="ui-title">선물포장안내</p>
										<div class="content-body">
											<p class="ctypo17 bold" id="gift-popup-p">구매 하시는 상품은 선물포장, <br> <span>쇼핑백신청</span>이 가능한 상품입니다.</p>
											<p class="ctypo14" id="gift-popup-p-two">선물 포장을 신청하시겠습니까?</p>
											<div id="gift-popup-button" class="btngroup">
												<button class="btn btn-linegray" onclick="setBoxPrsnPackGbcd('0');setSpbgPrsnPackGbcd('0');order(packBoxBasktIngArr,packCrdImdtDcPrmoChkYN);"><span>아니오</span></button>
												<button class="btn btn-default" onclick="setBoxPrsnPackGbcd('1');setSpbgPrsnPackGbcd('1');order(packBoxBasktIngArr,packCrdImdtDcPrmoChkYN);"><span>예</span></button>
											</div>
										</div>
										<button class="btn btn-close" onclick="boxPackItemClose();" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
									</div>
								</div>
							</div>

							<!-- 크리테오 장바구니 페이지 트래커  ---->
							<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>
							<script type="text/javascript">
								window.criteo_q = window.criteo_q || [];
								window.criteo_q.push(
										{ event: "setAccount", account: 15047 },
										{ event: "setSiteType", type: "d" },
										{ event: "viewBasket", item: [

											]});
							</script>

						</div><div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;"><div></div></div></div><div id="criteo-tags-div" style="display: none;"></div><script type="text/javascript" async="" src="//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js"></script><script type="text/javascript" async="" src="//image.hmall.com/p/js/co/tagging.collector-1.3.min.js"></script><iframe src="https://bid.g.doubleclick.net/xbbe/pixel?d=KAE" style="display: none;"></iframe><iframe src="https://bid.g.doubleclick.net/xbbe/pixel?d=KAE" style="display: none;"></iframe><iframe height="0" width="0" title="Criteo DIS iframe" style="display: none;"></iframe></body>

						<!-- input focus시 기본 나오는 UI -->
						<div class="autoarticle leftarea" id="search-history">
							<div class="recent-area" aria-label="최근검색어">
								<p class="stitle">최근 검색어</p>
								<ul class="recent-list" id="keyword-list" >
								</ul>
								<!-- 최신검색어가 없을 경우 -->
								<p class="nodata" id="nodata" style="display:none;">최근 검색어가 없습니다.</p>
								<button class="btn btn-delall" id="del-all-history"><span>전체삭제</span></button>
							</div>
							<!-- //.recent-area -->
						</div>
						<!-- //.autoarticle -->
						<div class="autoarticle rightarea">
							<div class="popular-area" id="popular-list" aria-label="인기검색어">
								<p class="stitle">인기 검색어</p>
								<ol class="num-list">
								</ol>
							</div>
							<!-- //.popular-area -->

							<div class="focusclick-area" id="fcsClick" aria-label="포커스클릭" style="display:none">
								<p class="stitle">포커스 클릭</p>
								<span class="flag-da">AD</span>
								<!-- 한 개 이상일 경우 class="horizon" 추가 -->
								<!-- 상품종료 및 품절일 경우 li thumb class end 추가 예)li class="thumb end" -->
							</div>
							<!-- //.focusclick-area -->
						</div>
						<!-- //.autoarticle -->

						<button class="btn searchclose" id="close-btn"><i class="hiding">검색 레이어</i><span>닫기</span></button>
					</div>
					<!-- //.autowrap -->

				</div>
				<!-- //.search-autowrap -->
				<!-- //E : 검색레이어 -->
			</div>
			<!-- //.field -->
		</div>
		<!-- // 검색 영역 -->

		<script>
			// 2020.12.24 검색 DOM 로드후 javascript 실행을 위해 옮김
			// 2020.12.17 icj : 텍스트 광고 입력이 없을시 재노출 (하선윤)
			mySearchList();

			$("#gnbSearchKeyword").focus(function(){
				$(".header .search").addClass("selected");

				if($("#gnbSearchKeyword").val() == gv_gnbHomeBnnrTitl){
					$("#gnbSearchKeyword").val('');
				}

				$("#search-popup").css({ display : "" });  // 최근검색어 탭 노출
				if($("#keyword-list li").length==0){
					$("#nodata").css({display:""});
					$("#keyword-list").css({display:"none"});
				}

				//검색창 입력전 광고
				fn_searchAdKeywordDefault();
				$("#search-recommend").css({ display : "none" });
				$("#search-autowrap").show();

				//퀵 메뉴 숨김 처리
				$('.quick-menu-more').removeClass('on');

				// 2020.12.17 icj : 텍스트 광고 입력이 없을시 재노출 (하선윤)
			}).focusout(function(){
				var $keyword = $("#gnbSearchKeyword");
				if($keyword.val() == ''){
					$keyword.val(gv_gnbHomeBnnrTitl);
				}
			});

		</script>

		<!-- 개인화 메뉴 -->
		<div class="personal-menu">
			<ul>
				<li>
					<a class="cart" ga-category="헤더" ga-action="장바구니" href="${contextPath}/order">
						<span>장바구니</span>

					</a>
				</li>
				<li><a class="mypage" href="/mypage"><span>마이페이지</span></a></li>
				<li>
					<a href="javascript:;" class="recently" id="recentlyImg" onclick="openRecentShopping(); return false;">
						<span>최근본쇼핑</span>
						<!-- 최근 본 상품 썸네일 이미지 -->
						<em class="thumb-recent"></em>
					</a>
				</li>
			</ul>
		</div>
		<!-- // 개인화 메뉴 -->
	</div>

	<div class="header-menu-wrap">
		<div class="header-menu-in">
			<!-- 카테고리 메뉴 -->
			<div class="category-area" id="categoryArea">
				<a href="javascript:;" class="btn-category">카테고리</a>
				<!-- 카테고리 메뉴 시작 -->

			</div>
			<!-- // 카테고리 메뉴 -->
			<!-- 퀵메뉴 -->



			<div class="quick-menu-wrap">
				<div class="quick-menu-list">
					<ul class="quicklink ql-left222" id="main_tab">

						<li class=" ">
							<a href="/p/bmc/brodPordPbdv.do?type=03?_IC_=tab1&mainDispSeq=2&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="편성표">편성표</a></li>

						<li class=" ">
							<a href="/p/home.do?_IC_=tab2&mainDispSeq=1&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="스토어">스토어</a></li>

						<li class="current ">
							<a href="/p/tvMainR.do?_IC_=tab3&mainDispSeq=3&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="홈">홈</a></li>

						<li class=" ">
							<a href="/p/mktgMain.do?_IC_=tab4&mainDispSeq=62&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="슈퍼H페스타">슈퍼H페스타</a></li>

						<li class=" ">
							<a href="/p/dsMainR.do?_IC_=tab5&mainDispSeq=6&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="백화점">백화점</a></li>

						<li class=" ">
							<a href="/p/todayOpenDeal.do?_IC_=tab6&mainDispSeq=48&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="오늘추천">오늘추천</a></li>

						<li class=" ">
							<a href="/pevent/eva/evntMainPage.do?_IC_=tab7&mainDispSeq=7&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="이벤트">이벤트</a></li>

						<li class=" point">
							<a href="/p/dpd/wkBestTypeTot.do?_IC_=tab8&mainDispSeq=21&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="주간베스트">주간베스트</a></li>

					</ul>
				</div>

			</div>
			<!-- // 퀵메뉴-->
			<script>

				/*function setTitle() {
                    if($('.quick-menu-list .current a').length < 1) {
                        return;
                    }

                    var tabname = $('.quick-menu-list .current a').first().text();

                    document.title = tabname + " - 현대Hmall";

                    if(tabname == '홈' || tabname == 'HMALL') {
                        document.title = '당신의 모든 취향을 읽다 - 현대Hmall';
                    }
                }

                setTitle();*/

			</script>

			<!-- 유틸메뉴 -->
			<div class="header-util">
				<h2 class="hiding">유틸메뉴</h2>
				<!-- 로그인 전 -->
				<ul style="display: flex;">
					<sec:authorize access="isAnonymous()">
						<li><a ga-category="헤더" ga-action="로그인" href="${contextPath}/customLogin" onclick="openLoginTag('','^헤더^로그인');return false;">로그인</a></li>
						<li><a href="${contextPath}/user/signup">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />
						<li><a href="mypage">${pinfo.userVO.user_name}님</a></li>
						<li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
						<form id="logout-form" action='<c:url value='/customLogout'/>' method="POST">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
						<li><a href="level">멤버십존</a> </li>
					</sec:authorize>
					<li><a ga-category="헤더" ga-action="고객센터" href="javascript:bizSpringTag('/p/cca/main.do','^헤더^고객센터');">고객센터</a></li>
				</ul>
			</div>

		</div>

	</div>
</header>
</html>