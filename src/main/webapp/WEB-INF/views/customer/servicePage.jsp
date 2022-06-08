<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-24
  Time: 오전 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<body class="vsc-initialized">--%>
<%--<div class="wrap customer-center"><!-- wing banner 미노출 시 : wing-none 클래스 추가 -->--%>
<%--    <div class="nav-skip"><a href="#mainContents">본문 콘텐츠로 건너뛰기</a></div>--%>


    <main class="cmain customer" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
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
                //고객의 의견
                function openCustBoardPup(){
                    var url = "https://www.hmall.com/p/cce/selectCustBoardPup.do";
                    //var url = "/p/cce/viewPage.do?view=CustBoardPup_if";
                    var popName = "selectCustBoardPup";
                    var popOption = "height=853, width=923, fullscreen=no, location=no, scrollbars=yes, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                    var windowPup = window.open(url,popName,popOption);
                    windowPup.focus();
                }
            </script>


            <div class="side-content">

                <h2 class="side-menu-title" onclick="javascript:location.href=&quot;/p/cca/main.do&quot;" style="cursor:pointer;">고객센터</h2>
                <div class="side-menu-list">
                    <ul>
                        <li><a class="#" href="${contextPath}/customer/faqList">자주 묻는 질문</a></li>
                        <li><a href="${contextPath}/customer/inquiryPage">1:1 문의하기</a></li>
                        <li><a href="${contextPath}/customer/noticeList">공지사항</a></li>
                    </ul>
                </div>
                <!-- // .side-menu-list -->

                <!--side-info-->
                <div class="side-info">
                    <p class="banner"><strong>현대Hmall</strong><em>1600-0000</em><span>(유료)</span></p>
                    <p class="banner"><strong>모바일 현대Hmall</strong><em>1600-0009</em><span>(유료)</span></p>
                    <p class="txt"><span>평일 09:00~20:00<br>주말, 공휴일 휴무</span></p>
                </div>
                <!--//side-info-->
            </div>
            <!-- // LNB 끝 -->

            <div class="contents">
                <!--search : 자주 묻는 질문-->
                <div class="cus-wrap">
                    <h3>자주 묻는 질문</h3>
                    <!-- 20200909 시안 08/26 기준 작업 -->
                    <div class="search-area">
                        <form name="searchForm" method="get" action="/customer/faqList.do">
                            <div class="inputbox">
                                <input hidden="hidden">
                                <label class="inplabel icon-find"><input type="text" name="ancmCntn" placeholder="질문을 검색해보세요" title="검색어 입력" value=""></label>
                                <button type="button" class="btn btn-find" onclick="searchCntn();"><i class="icon find-sm"></i><span class="hiding">검색</span></button>
                                <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                            </div>
                            <input type="hidden" name="sort" id="sort" value="false">
                            <input type="hidden" name="faqMCsfNo" id="faqMCsfNo" value="">
                        </form>
                    </div>
                    <!-- 20200909 시안 08/26 기준 작업 -->
                </div>
                <!--//search : 자주 묻는 질문-->


                <!--베스트 FAQ 10-->
                <div class="cus-wrap">
                    <div class="tit-wrap">
                        <h3>베스트 FAQ 10</h3>
                        <p><a class="#" href="/p/ccc/faqList.do">전체보기</a></p> <!--pjb002로이동-->
                    </div>
                    <!--accparent-->
                    <div class="accparent">

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3 class=""><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,25,05)"><i class="icon question"></i><span>주문 내용 변경, 취소, AS 등은 어떻게 하나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt01" role="best-txt01" aria-label="주문 내용 변경, 취소, AS 등은 어떻게 하나요?">
                            <div class="txt-wrap">
                                <p><strong><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷&nbsp;색상/사이즈&nbsp;및 배송지 변경</span><br></span></strong><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">결제완료 단계일때 마이페이지에서 직접 수정하실 수 있습니다. </span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문이 상품준비중 단계로 변경된&nbsp;이후에는 1:1 고객상담을 통해 변경 신청 하실 수 있습니다. </span><br><br></span><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong><strong><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;주문 취소</span><br></span></strong><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">마이페이지 주문상세 내역에서 즉시 취소가 가능한 단계는 아래와 같습니다.&nbsp;</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">- 신용카드 주문 : 결제완료, 상품준비중 (주문제작/설치 등 일부 상품 제외)</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">- 현금, 상품권 주문 : 주문접수</span><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">즉시 취소가 가능한 주문은 위 단계일때 [주문취소] 버튼이 표시되므로, 직접 취소 하실 수 있습니다. </span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">단, 위에 해당되지 않는 단계로 넘어간 주문에 대해서는 1:1 고객상담을 통해 주문취소 신청하실 수 있습니다.&nbsp;</span></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"><br></span><br></span><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;AS신청</span></strong><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d"> </span><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">AS는 마이페이지에서 직접 신청이 불가합니다. </span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1:1상담신청 혹은 현대홈쇼핑 고객센터(1600-0000)로 전화 주시어 AS 문의를 남겨 주신다면 안내 도와 드리겠습니다.</span><br></span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문 진행상태에 따라 신청 가능한 항목은 다음과 같습니다.</span></p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p><img src="https://image.hmall.com/CO/EDITOR/20220208/133804159/414tk.jpg"></p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,19,04)"><i class="icon question"></i><span>주문한 상품은 배송 내역은 어디서 확인하나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt02" role="best-txt02" aria-label="주문한 상품은 배송 내역은 어디서 확인하나요?">
                            <div class="txt-wrap">
                                <p style="LINE-HEIGHT: 1.5"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문하신 상품의 배송 일정은 결제완료 시점을 기준으로 안내됩니다. </span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">상품 종류에 따라 배송 일정이 달라질 수 있으니 아래 가이드에 따라 배송 일정을 확인해주시면 됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷회원 주문 시</span><br></span></strong></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1. [ 마이페이지 &gt; </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문/배송현황 &gt; </span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문/배송 상세 ]&nbsp;선택</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2. 배송 관련 상세 정보 확인 가능</span><br><br></span><span style="COLOR: #000000"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;</span><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">비회원 주문 시</span><br></span></strong></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1. 로그인 화면에서 비회원 주문조회 선택</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2. 성명/주문번호 입력</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3. 배송 관련 상세 정보 확인 가능</span><br><br></span><span style="COLOR: #000000"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">※&nbsp;</span><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">참고사항<br></span></span></strong></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">꽃이나 케이크는 배송희망일을 주문 메모에 적어 주시면 해당 날짜에 배송해 드립니다.</span></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3 class=""><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,52944,05)"><i class="icon question"></i><span>취소/반품 완료 후 환불 언제 되나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt03" role="best-txt03" aria-label="취소/반품 완료 후 환불 언제 되나요?">
                            <div class="txt-wrap">
                                <p><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">취소 또는 반품에 대한 환불 처리는 취소, 반품 접수 후 24시간 이내 해드립니다. 환불 처리는 주문 결제 수단과 동일하게 함을 원칙으로 하며, 환불 받을 금액을 예치 해두고 다음에 사용하고자 한다면 고객센터를 통해 환불 금액의 예치금 전환을 신청해 주시기 바랍니다.</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ Hmall 상품의 반품에 대한 환불 처리는 상품 입고하여 검품 완료 후 환불처리 되므로 대략 4~7일 정도의 시간이 소요됩니다. </span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ 주말 또는 휴일처럼 금융업무가 비정상적인 경우 그 다음 근무 일에 처리됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷ 신용카드<span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"></span></span><br></strong></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">주문취소 시 카드매출 취소는 즉시 접수 되지만, 카드사 매입 취소까지 보통 3~7일 정도 소요될 수 있습니다. </span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">※ 매입 전 카드 주문은 당일 취소됩니다.</span><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #000000">※ 각 카드사마다 취소 처리 기간이 다르기 때문에 카드사를 통하여 확인하실 수 있습니다. </span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">만약에 대금이 결제되었다 하더라도 해당 금액만큼 해당 카드사에서 다음달 결제 대금에서 제외됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷ 체크카드</span><br></strong></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">당사 취소 청구 후 7일 이내 카드사에서 계좌로 입금됩니다.</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ 은행에 따라 소요일 달라질 수 있습니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷ 무통장입금/ 실시간계좌이체</span><br></strong></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">환불요청 후 익일 (영업일 기준<span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"></span>) 입력하신 계좌로 입금됩니다.</span><br></span><span style="COLOR: #cc3d3d"><strong><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷ 휴대폰 결제</span><br></strong></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif">환불요청 후 3~5일 소요됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷ 상품권 결제</span><br></strong></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">환불 요청 후 익일 (영업일 기준) 예치금 환불로 처리됩니다.</span></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,28,05)"><i class="icon question"></i><span>택배기사를 기다릴 필요없이 편의점반품이 가능한가요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt04" role="best-txt04" aria-label="택배기사를 기다릴 필요없이 편의점반품이 가능한가요?">
                            <div class="txt-wrap">
                                <span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">반품신청 후 수거가 진행되는 동안의 불편함을 줄이고자 편의점반품 서비스를 오픈하였습니다.</span><br><br><b><font color="red"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷편의점반품이란?</span><br></font></b><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">반품신청 후 택배기사님의 방문을 기다릴 필요 없이 가까운 편의점(GS25, CU)에 방문하여 반품접수를 </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">할 수 있는 서비스입니다. </span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ 사전 현대홈쇼핑 고객센터(1600-0000)로 연락하여 접수해 주시기 바랍니다. </span><br><br><font color="red"><span style="COLOR: #cc3d3d"><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong></span><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">편의점반품 진행단계</span></strong></span></font><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1. </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">당사 고객센터 전화상담</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2.</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"> 편의점반품 접수</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3.</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"> 반품신청승인번호 SMS발송</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">4.</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"> 편의점방문,승인번호입력 / 택배접수</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">5.</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"> 반품배송 시작</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">6.</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"> 반품배송 완료</span><br><br><font color="red"><span style="COLOR: #cc3d3d"><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷</span></strong></span><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">편의점반품 불가상품</span></strong></span></font><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1. </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">비규격상품(가로+세로+높이의 합이 100cm이상 또는 2kg이상)</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2. </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">식품류</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3. </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">상품가격 50만원 이상의 상품</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"> </span>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,26,05)"><i class="icon question"></i><span>환불은 어떻게 받나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt05" role="best-txt05" aria-label="환불은 어떻게 받나요?">
                            <div class="txt-wrap">
                                <p><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">취소 또는 반품에 대한 환불처리는 취소, 반품 접수 후 24시간 이내 해드립니다.&nbsp; </span><br><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">단, Hmall 상품의 반품에 대한 환불처리는 상품 입고하여 검품 완료 후 환불처리 되므로 대략 4~7일 정도의 시간이 소요됩니다. </span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">다만, 주말 또는 휴일처럼 금융업무가 비정상적인 경우 그 다음 근무일에 처리됩니다.</span><br><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">참고로, 환불처리는 주문결제 수단과 동일하게 함을 원칙으로 하며, 환불 받을 금액을 예치해두고 다음에 사용하고자 한다면 고객센터를 통해 환불금액의 예치금 전환을 신청해 주시기 바랍니다.</span></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,5,01)"><i class="icon question"></i><span>회원탈퇴는 어떻게 하나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt06" role="best-txt06" aria-label="회원탈퇴는 어떻게 하나요?">
                            <div class="txt-wrap">
                                <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; COLOR: #123456"><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷PC </span></span></span></strong></span><br><span style="FONT-SIZE: 10pt; COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">화면 상단에 있는 [마이페이지 &gt;&nbsp;회원정보 &gt; 회원탈퇴]를 선택하시면 회원탈퇴를 하실 수 있습니다.</span><br><br></span><strong><span style="FONT-SIZE: 10pt; COLOR: #123456"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷모바일</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">&nbsp;</span></span><br></strong><span style="FONT-SIZE: 10pt; COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">화면 하단에 있는 [마이페이지 &gt; 최하단 ‘㈜현대홈쇼핑’ &gt; 회원탈퇴]를 선택하시면 회원탈퇴를 하실 수 있습니다.</span><br><br></span><span style="COLOR: #cc3d3d"><span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">※ </span><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">유의사항</span></strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d"> </span></span></span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1. 배송 진행 중, 반품진행중인 주문 건이 &nbsp;있을 경우에는 탈퇴처리가 되지 않습니다.</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2. 재가입하셔도 개인정보가 복원되지 않습니다. </span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3. Hmall에 가지고 계신 적립금, 예치금, 할인쿠폰 등의 혜택이 자동삭제 되며, 재가입하실 경우에도 복원되지 않습니다.</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">4.&nbsp;재가입시, 기존에 사용하셨던 ID는 재가입 시 사용하실 수 없습니다. </span></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,24,05)"><i class="icon question"></i><span>교환 또는 반품이 안되는 경우는 어떤 경우인가요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt07" role="best-txt07" aria-label="교환 또는 반품이 안되는 경우는 어떤 경우인가요?">
                            <div class="txt-wrap">
                                <p style="LINE-HEIGHT: 1.5"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">받으신 상품에 하자가 있거나 마음에 들지 않는 경우, Hmall 상품은 배송완료 후 7일내, TV 홈쇼핑 상품은 30일 이내에&nbsp;언제든지 교환 또는 반품신청이 가능합니다. 단, TV 홈쇼핑 의류, 보석, 핸드백, 슈즈, 선글라스 상품은 상품인도 후 15일, 신선식품은 상품인도 후 7일 이내에 가능합니다.</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">상품이 불량일 경우에는 언제든지 반품이 가능합니다. 단, 아래의 경우는 반품이 불가능합니다.(상품불량 제외)<br></span></p>
                                <p style="LINE-HEIGHT: 1.5">&nbsp;</p>
                                <p style="LINE-HEIGHT: 1.5"><img src="https://image.hmall.com/CO/EDITOR/20220208/133734588/9j5j5.jpg"></p>
                                <p style="LINE-HEIGHT: 1.5"><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #000000">※ 상품에 따라서 변심으로 인한 반품 시 고객께서 반품 비용을 부담하셔야 하는 경우도 있습니다.</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif"><span style="COLOR: #000000">※ 그 외 특이사항은 해당 상품 설명에 표기되어 있습니다. </span></span></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,31,07)"><i class="icon question"></i><span>이벤트 당첨은 어디서 확인하나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt08" role="best-txt08" aria-label="이벤트 당첨은 어디서 확인하나요?">
                            <div class="txt-wrap">
                                <p class="depth1" nodeindex="1" jquery17102688160967782381="246" sizcache09139176650749625="6" sizset="54"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">이벤트 당첨자는 이벤트 탭의 이벤트 당첨공지에서 확인하실 수 있습니다.</span><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">내가 참여한 이벤트는 마이페이지 &gt; 참여이벤트에서 확인하실 수 있습니다.</span><br><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">[PC]</span><br><img src="http://image.hyundaihmall.com/CO/EDITOR/20210208/053356609/www5o.jpg"><br><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">[모바일]</span><br><img style="HEIGHT: 581px; WIDTH: 310px" src="http://image.hyundaihmall.com/CO/EDITOR/20210208/053421173/19o7u.jpg" width="310" height="581"></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,21,04)"><i class="icon question"></i><span>백화점 상품의 배송은 어떻게 진행이 되나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt09" role="best-txt09" aria-label="백화점 상품의 배송은 어떻게 진행이 되나요?">
                            <div class="txt-wrap">
                                <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">가구 및 침구 등 일부 상품의 경우 협력사에 직접 배송이 진행되며, 그 외 상품은 현대백화점 매장을 통해 배송 진행 됩니다.</span><br></span><span style="COLOR: #cc3d3d"><strong><span style="COLOR: #cc3d3d"><br><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷배송과정 </span><br></span></strong></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">1. 결제완료가 된 다음날 백화점 매장으로 상품 준비 요청됩니다. </span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2. 현대백화점 배송팀에서 상품을 받아 포장합니다.</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">3. 포장완료후 해당지역으로 발송합니다.</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">4. 발송후 1~2일 이후 수령(결제후 2~7일이내)&nbsp;가능합니다.</span><br></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ 무통장입금 경우 무통장입금 확인이 된 다음날 백화점 매장으로 상품 준비 요청됩니다.</span><br><br></span><span style="COLOR: #cc3d3d"><strong><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d">▷&nbsp;배송기간</span><span style="COLOR: #cc3d3d"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #cc3d3d"> </span><br></span></strong></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #000000"><span style="COLOR: #353535">1. 매장에 재고가 있을 경우 주문일로 부터 평균 3~4일 소요되며(공휴일 제외)</span><span style="COLOR: #353535">&nbsp;</span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">일시품절일 경우 평균 5~7일 소요됩니다.(완전 품절일 경우 취소 요청)</span></span></span><span style="COLOR: #000000"><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">2. 백화점의 휴무일과 공휴일, 주말의 주문상품은 평균배송일에 1~2일이 더 소요됩니다.&nbsp;</span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">제품 품절시 고객님께 가능한 빠른시간내에 품절통보 및 환불절차에 대해 안내해 드리도록 하겠습니다.</span><br></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                        <!--best-txt01 : -h3/accordion-panel에 selected 시 열림-->
                        <h3><button data-modules-collapse="parent:.accparent;" class="accordion-trigger" aria-expanded="false" onclick="lookup_count(this,18,04)"><i class="icon question"></i><span>주문 후 배송상태를 어떻게 알 수 있나요?</span><i class="icon acc-arrow"></i></button></h3>
                        <div class="accordion-panel best-txt010" role="best-txt010" aria-label="주문 후 배송상태를 어떻게 알 수 있나요?">
                            <div class="txt-wrap">
                                <p style="LINE-HEIGHT: 1.5"><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">고객께서 주문하신 상품의 배송상태는 화면 상단의 [주문/배송조회]에서 확인하실 수 있습니다.</span><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">주문상태별 주문의 진행현황은 다음과 같습니다.<br></span></p>
                                <p style="LINE-HEIGHT: 1.5">&nbsp;</p>
                                <p style="LINE-HEIGHT: 1.5"><img src="https://image.hmall.com/CO/EDITOR/20220208/133831202/af1o8.jpg"></p>
                                <p style="LINE-HEIGHT: 1.5"><br><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535"><br>※ 발송완료 단계에서는 배송추적기능을 통해 택배사, 상품의 현재 위치를 시간대별로 실시간 </span></span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">조회하실 수 있습니다. </span><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ 주문상태의 변경은 실시간으로 반영하는 것을 원칙으로 하오나, 업체배송 상품의 경우 간혹 </span><span style="COLOR: #000000"><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">반영이 늦어지는 경우가 발생할 수 있습니다.</span><br></span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">※ 주문상태 변경이 지연되고 있는 경우에는 1대1 고객상담이나 고객센터(1600-0000)으로 문의하시면 빠른 시간 내에 배송현황을 </span><span style="FONT-SIZE: 10pt; FONT-FAMILY: Gulim,굴림,AppleGothic,sans-serif; COLOR: #353535">알려드리겠습니다.</span><span style="COLOR: #000000"><br></span></p>
                            </div>
                        </div>
                        <!--best-txt01 -->

                    </div>
                    <!--//accparent-->
                </div>
                <!--//베스트 FAQ 10-->

                <!--1:1문의하기 / 공지사항-->
                <div class="cus-wrap noti">
                    <!--1:1 문의하기-->
                    <div class="question-wrap">
                        <h3>1:1 문의하기</h3>
                        <div class="btngroup">
                            <button class="btn btn-board" onclick="openCnslAcptPup(); return false;"><span><i class="icon"></i>게시판 상담</span></button>
                            <button class="btn btn-chat" type="button" onclick="openCnslChat();"><span><i class="icon"></i>채팅 상담</span></button>
                        </div>
                    </div>
                    <!--//1:1 문의하기-->
                    <!--공지사항-->
                    <div class="noti-wrap">
                        <div class="tit-wrap">
                            <h3>공지사항</h3>
                            <p><a href="/p/ccb/noticeList.do">전체보기</a></p>
                        </div>
                        <!--tblwrap tbl-list-->
                        <div class="tblwrap tbl-list">
                            <table>
                                <caption>고객센터 공지사항</caption>
                                <colgroup>
                                    <col style="width:400px">
                                    <col style="width:75px">
                                </colgroup>
                                <tbody>













                                <tr>
                                    <td class="nowrap"><a href="/p/ccb/noticeView.do?ancmId=53744&amp;page=1">현대홈쇼핑 멤버십 제도 개편 안내</a></td>
                                    <td class="txt-center"><span class="date">2022.05.02</span></td>
                                </tr>







                                <tr>
                                    <td class="nowrap"><a href="/p/ccb/noticeView.do?ancmId=53740&amp;page=1">현대홈쇼핑 상시채용 안내</a></td>
                                    <td class="txt-center"><span class="date">2022.04.15</span></td>
                                </tr>







                                <tr>
                                    <td class="nowrap"><a href="/p/ccb/noticeView.do?ancmId=53722&amp;page=1">개인정보처리방침 변경 안내(01/27)</a></td>
                                    <td class="txt-center"><span class="date">2022.01.27</span></td>
                                </tr>







                                <tr>
                                    <td class="nowrap"><a href="/p/ccb/noticeView.do?ancmId=53597&amp;page=1">현대홈쇼핑 금융소비자보호 내부통제기준 및 금융소비자보호기준</a></td>
                                    <td class="txt-center"><span class="date">2021.09.24</span></td>
                                </tr>







                                <tr>
                                    <td class="nowrap"><a href="/p/ccb/noticeView.do?ancmId=53596&amp;page=1">현대홈쇼핑 보험대리점등록증</a></td>
                                    <td class="txt-center"><span class="date">2021.09.24</span></td>
                                </tr>




































                                </tbody>
                            </table>
                        </div>
                        <!--//tblwrap tbl-list-->
                    </div>
                    <!--//공지사항-->
                </div>
                <!--//1:1문의하기 / 공지사항-->

                <!--고객평가단/채널모니터링-->
                <div class="cus-wrap monitering">
                    <a href="javascript:checkCseg()">
                        <dl class="cus-rating">
                            <dt>고객 평가단</dt>
                            <dd>현대홈쇼핑 고객평가단의 <br> 커뮤니티 공간</dd>
                        </dl>
                    </a>
                    <a href="javascript:checkMtrg()">
                        <dl class="cus-channel">
                            <dt>채널 모니터링</dt>
                            <dd>케이블 TV의 상태를 모니터하는 <br> 회원들의 공간</dd>
                        </dl>
                    </a>
                </div>
                <!--//고객평가단/채널모니터링-->
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
    <script type="text/javascript" src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=052401"></script>
    <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=052401"></script>

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

    <script type="text/javascript">

        var skySclbrodEndTime = "";
        var skyScldtvEndTime = "";

        function setOnAirSkySc(){
            try {
                $.ajax({
                    type: "get"
                    ,url: "https://wwwca.hmall.com/p/coe/onAirList.do?time=052401"
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
                            ,url: "/p/coe/onAirList.do?time=052401"
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
                    ,url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList.do?time=052401"
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
                            ,url: "/p/coe/onAirCardPrmoList.do?time=052401"
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
    <div class="sticky-ui-wrapper wing-banner-sticky"><div class="sticky-placeholder" style=""></div><div class="wing-banner banner-right ui-break" data-modules-sticky="padding:0;breakPoint:.header-menu-wrap;className:wing-banner-sticky" style="">
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

                    <a href="javascript:;" class="tv-shopping" onclick="gaTagging(this, &quot;/p/pda/itemPtc.do?sectId=1003&amp;slitmCd=2140403405&amp;bfmtNo=202205233017&amp;brodDt=20220523&amp;brodStrtDtm=01:25&amp;brodType=P&quot;, &quot;etvhm_etv&quot;, &quot;eTV온에어^영상상품^[86TV] LG 울트라 HD TV 217cm [86UP8300KNA] (사은품 : LG사운드바 + 쿠첸밥솥)&quot;)" ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="TV쇼핑" ga-custom-creative="방송상품" ga-custom-id="2140403405_[86TV] LG 울트라 HD TV 217cm [86UP8300KNA] (사은품 : LG사운드바 + 쿠첸밥솥)" ga-custom-etc="home">
                        <img src="https://image.hmall.com/static/4/3/40/40/2140403405_0.png?RS=140x140&amp;AR=0" alt="[86TV] LG 울트라 HD TV 217cm [86UP8300KNA] (사은품 : LG사운드바 + 쿠첸밥솥)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
                        <span class="over-box">
		                            <strong class="onair-kind shopping">TV쇼핑</strong>
		                            <em class="onair-time" id="onAirHtime" data-brodenddtm="20220524021500">00:24:48</em>
		                        </span>
                    </a>


                </li>



                <li>

                    <a href="javascript:;" class="tv-shopping" onclick="gaTagging(this, &quot;/p/pda/itemPtc.do?sectId=1003&amp;slitmCd=2139655715&amp;bfmtNo=202205235027&amp;brodDt=20220523&amp;brodStrtDtm=01:20&amp;brodType=P&quot;, &quot;etvhm_etv&quot;, &quot;eTV온에어^영상상품^22SS 르까프 남성 썸머 트랙수트 2종&quot;)" ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="TV쇼핑" ga-custom-creative="방송상품" ga-custom-id="2139655715_22SS 르까프 남성 썸머 트랙수트 2종" ga-custom-etc="home">
                        <img src="https://image.hmall.com/static/7/5/65/39/2139655715_0.jpg?RS=140x140&amp;AR=0" alt="22SS 르까프 남성 썸머 트랙수트 2종" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
                        <span class="over-box">
		                            <strong class="onair-kind shop">TV+샵</strong>
		                            <em class="onair-time" id="onAirHdtime" data-brodenddtm="20220524015959">00:08:48</em>
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





                    <a href="https://www.hmall.com/p/dpa/crdDmndDcPrmo.do?prmoNo=P202204280907">
                        <span class="img"><img src="//image.hmall.com/p/img/ev/icon/ico-card-samsung.png" alt="삼성카드"></span>
                        <span class="card-txt">
		                            <strong class="card-name">삼성카드</strong>
		                            <span class="benefit-txt">
		                              <em class="point-red">

		                                      7%


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

    <script type="text/javascript">
        function searchCntn() {
            var ancmCntn = $("input[name='ancmCntn']").val().trim();
            if (ancmCntn == "") {
                alert("검색어를 입력해 주세요.");
                return false;
            }
            $("form[name='searchForm']").submit();
        }
    </script>
    <!-- 스카이스크래퍼 -->
</div>
<script type="text/javascript" async="" src="//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js"></script>
<script type="text/javascript" async="" src="//image.hmall.com/p/js/co/tagging.collector-1.3.min.js"></script>
<div id="fb-root" class=" fb_reset"><div style="position: absolute; top: -10000px; width: 0px; height: 0px;">
    <div></div>
</div>
<%--</div></body>--%>

