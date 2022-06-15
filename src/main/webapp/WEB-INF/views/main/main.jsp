<%--
  Created by IntelliJ IDEA.
  User: SM-PC
  Date: 2022-05-18
  Time: 오후 6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
    .hshop-fullbox .hshop-full .onair-box {
        height: 500px;
    }
</style>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="contents">
            <!--contents-area-->
            <div class="main-contents-area">
                <!--homeshoping-wrap-->
                <div class="homeshoping-wrap">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jjimList();
                            listAlrimiWithItem();
                        });
                        var rgx1 = /\D/g;
                        var rgx2 = /(\d+)(\d{3})/;

                        // 금액 타입 체크
                        function getNumber(obj) {
                            var num01, num02;
                            num01 = obj.value;
                            num02 = num01.replace(rgx1, "");
                            num01 = setComma(num02);
                            obj.value = num01;
                        }

                        // 콤마 입력 변환
                        function setComma(inNum) {
                            var outNum;
                            outNum = inNum;
                            while (rgx2.test(outNum)) {
                                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
                            }
                            return outNum;
                        }

                    </script>

                    <div class="home-section display-wrap">

                        <!--딜배너 영역-->

                        <div class="top-banner-wrap">
                            <div class="titArea"><h3>이번주 혜택 가득 행사</h3></div>
                            <div class="sliderwrap slick-initialized slick-slider isArrows slick-paging slider-transitioning"
                                 data-modules-slick="arrows:true;dots:false;autoplay:true;paging:true;infinite:true;slidesToShow:1;">
                                <button class="slick-prev slick-arrow" aria-label="Previous" type="button" style="" onclick="plusSlides(-1)">
                                    Previous
                                </button>
                                <div class="slick-list draggable">
                                    <div class="slick-track">
                                        <div class="slick-slide" style="width: 711px;">
                                            <div>
                                                <form id="hitForm" method="get" action="${contextPath}/exhibition/hit">
                                                    <div class="items_main" style="width: 100%; vertical-align: top;">
                                                        <input type="hidden" name="exhibit_num" value="3">
                                                    </div>
                                                </form>
                                                <img class="img_1" src="${contextPath}/resources/img/exhibitions/mainImg_3.jpeg" onclick="exhibit_3()"/>
                                            </div>
                                        </div>
                                        <div class="slick-slide" style="width: 711px;" >
                                            <div>
                                                <form id="cosmeticForm" method="get" action="${contextPath}/exhibition/cosmetics">
                                                    <div class="items_main" style="width: 100%; vertical-align: top;">
                                                        <input type="hidden" name="exhibit_num" value="2">
                                                    </div>
                                                </form>
                                                <img class="img_1" src="${contextPath}/resources/img/exhibitions/mainImg_4.jpeg" onclick="exhibit_2()"/>
                                            </div>
                                        </div>
                                        <div class="slick-slide" style="width: 711px;">
                                            <div>
                                                <form id="euroForm" action="${contextPath}/exhibition/euro_exhibit" method="get">
                                                    <div class="items_main" style="width: 100%; vertical-align: top;">
                                                        <input type="hidden" name="exhibit_num" value="1">
                                                    </div>
                                                </form>
                                                <img class="img_1" src="${contextPath}/resources/img/exhibitions/mainImg_5.jpeg" onclick="exhibit_1();"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="slick-next slick-arrow" aria-label="Next" type="button" style="" onclick="plusSlides(1)">Next
                                </button>
                                <div class="slick-slidetotal" style=""><em id="current_slide">1</em><strong
                                        class="total">3</strong></div>
                            </div>

                            <button type="button" class="btn btn-all lyopen" data-modules-modal="target:#modalTvFull;">
                                <span>전체</span><i class="icon"></i></button>

                        </div>

                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('div#modalTvFull .display-wrap').html($("div.top-banner-wrap div.slick-slide:not(.slick-cloned) a").clone(true).wrap('<div class="items"></div>').parent());
                            });
                        </script>

                        <script>
                            function exhibit_1(){
                                document.getElementById('euroForm').submit();
                            }
                            function exhibit_2(){
                                document.getElementById('cosmeticForm').submit();
                            }
                            function exhibit_3(){
                                document.getElementById('hitForm').submit();
                            }
                        </script>


                        <script>
                            var slideIndex = 1;
                            showSlides(slideIndex);
                            function plusSlides(n){
                                showSlides(slideIndex+=n);
                                const resultElement = document.getElementById('current_slide');
                                // var currentElement = $('.current_slide').html();
                                var currentElement = resultElement.innerText;
                                console.log("n : "+n);
                                console.log("number : "+currentElement);
                                if(currentElement < 3 && currentElement > 1){
                                    if(n == 1){
                                        currentElement = parseInt(currentElement) +1;
                                    }else if(n == -1){
                                        currentElement = parseInt(currentElement) -1;
                                    }
                                }else if(currentElement == 1){
                                    if(n == 1){
                                        currentElement = parseInt(currentElement) +1;
                                    }else if(n == -1){
                                        currentElement = 3;
                                    }
                                }else if(currentElement == 3){
                                    if(n == 1){
                                        currentElement = 1;
                                    }else if(n == -1){
                                        currentElement = parseInt(currentElement) -1;
                                    }
                                }

                                resultElement.innerText = currentElement;
                            }
                            function showSlides(n){
                                var i;
                                var slides = document.getElementsByClassName("img_1");
                                console.log(slides);
                                if (n > slides.length) {slideIndex = 1}
                                if (n < 1) {slideIndex = slides.length}
                                for(i = 0 ; i < slides.length ; i++){
                                    slides[i].style.display = "none";
                                }
                                slides[slideIndex-1].style.display = "block";
                            }

                            var slideIndex_side = 1;
                            showSlides_side(slideIndex_side);

                            function plusSlides_side(n){
                                showSlides_side(slideIndex_side+=n);
                                console.log(n);
                                const resultElement = document.getElementById('current_side');
                                // var currentElement = $('.current_slide').html();
                                var currentElement = resultElement.innerText;
                                console.log(currentElement);
                                if(currentElement == 1){
                                    if(n==1){
                                        currentElement = 2;
                                    }else{
                                        currentElement = 2;
                                    }
                                }else if(currentElement ==2){
                                    if(n==1){
                                        currentElement = 1;
                                    }else{
                                        currentElement = 1;
                                    }
                                }
                                resultElement.innerText = currentElement;
                            }

                            function showSlides_side(n){
                                var i;
                                var slides_side = document.getElementsByClassName("slide_img");
                                console.log(slides_side);
                                if (n > slides_side.length) {slideIndex_side = 1}
                                if (n < 1) {slideIndex_side = slides_side.length}
                                for(i = 0 ; i < slides_side.length ; i++){
                                    slides_side[i].style.display = "none";
                                }
                                slides_side[slideIndex_side-1].style.display = "block";
                            }
                        </script>


                        <!--//딜배너 영역-->
                        <!--이달의 혜택 hm2tv_evicon 없는 경우에 display:none-->
                        <!--//이달의 혜택-->
                    </div>
                    <div class="home-section point" style="display:none">
                        <div class="point-box">
                            <div class="info-txt">
                                <i class="icon"><img src="//image.hmall.com/p/img/co/icon/ico-extialarm.png"
                                                     alt="혜택 아이콘"></i>
                                <p><strong>사용기한 7일 남은 혜택</strong>을 알려드려요!</p>
                            </div>
                            <ul class="info-list">
                                <li class="upnt" style="display: none;">
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, '/p/mpe/selectUPntTabPage.do', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                       ga-custom-creative="소멸예정 H.Point" ga-custom-id="" ga-custom-etc="urlAction"
                                       tag-comment="GA요청:홈쇼핑탭:6">

                                        <span class="tit">소멸예정 H.Point</span>
                                        <span class="txt point upnt"><strong>0</strong>P</span>
                                    </a>
                                </li>
                                <li class="svmt" style="display: none;">
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, '/p/mpe/selectHPntTabPage.do', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                       ga-custom-creative="소멸예정 적립금" ga-custom-id="" ga-custom-etc="urlAction"
                                       tag-comment="GA요청:홈쇼핑탭:6">
                                        <span class="tit">소멸예정 적립금</span>
                                        <span class="txt svmt"><strong>0</strong>원</span>
                                    </a>
                                </li>
                                <li class="copnCnt" style="display: none;">
                                    <a href="/p/mpe/selectCopnList.do">
                                    </a><a href="javascript:;"
                                           onclick="gaTagging(this, '/p/mpe/selectCopnList.do', '', '');"
                                           ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                           ga-custom-creative="소멸예정 쿠폰" ga-custom-id="" ga-custom-etc="urlAction"
                                           tag-comment="GA요청:홈쇼핑탭:6">
                                    <span class="tit">소멸예정 쿠폰</span>
                                    <span class="txt copnCnt"><strong>0</strong>장</span>
                                </a>
                                </li>
                                <li class="evalCnt" style="display: none;">
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, '/p/mpb/selectItemEvalAtclListPagingByCondtion.do', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                       ga-custom-creative="작성가능 상품평" ga-custom-id="" ga-custom-etc="urlAction"
                                       tag-comment="GA요청:홈쇼핑탭:6">
                                        <span class="tit">작성가능 상품평</span>
                                        <span class="txt evalCnt"><strong>0</strong>건</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="home-section mytem" id="myTemArea" style="">
                        <div class="titArea">
                            <h3>나에게 딱! 마이템</h3>
                        </div>

                        <!-- 이 카테고리를 본 고객님들이 본 상품 -->


                        <div class="pdlist-wrap col5">
                            <div data-modules-slick="paging:true;fade:false;dots:false;arrows:true;"
                                 class="slick-initialized slick-slider isArrows slick-paging">
                                <button class="slick-prev slick-arrow slick-disabled" aria-label="Previous"
                                        type="button" aria-disabled="true" style="">Previous
                                </button>
                                <div class="slick-list draggable">
                                    <div class="slick-track"
                                         style="opacity: 1; width: 2162px; transform: translate(0px, 0px);">
                                        <div class="slick-slide slick-current slick-active" data-slick-index="0"
                                             aria-hidden="false" style="width: 1081px;">
                                            <div>
                                                <div class="items"
                                                     style="width: 100%; display: inline-block; vertical-align: top;">
                                                    <ul id="mainProduct">

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slick-slide" data-slick-index="1" aria-hidden="true" tabindex="-1"
                                             style="width: 1081px;">
                                            <div>
                                                <div class="items"
                                                     style="width: 100%; display: inline-block; vertical-align: top;">
                                                    <ul>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2138703518&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2138703518_CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/5/3/70/38/2138703518_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종">CK
                                                                        퍼포먼스 22SS 남성 올데이 라운드셔츠 4종
                                                                    </div>
                                                                    <div class="pdprice">
                                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                        <p class="discount" aria-label="할인가"><em>87,200</em>원</p>
                                                                        </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2138703518&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2138703518_CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2137173064&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2137173064_[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/0/3/17/37/2137173064_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종">
                                                                        [DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종
                                                                    </div>
                                                                    <div class="pdprice">
                                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                        <p class="discount" aria-label="할인가"><em>71,200</em>원</p>
                                                                        </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2137173064&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2137173064_[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139997638&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139997638_[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) "
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/6/7/99/39/2139997638_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) "
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) ">
                                                                        [브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성)
                                                                    </div>
                                                                    <div class="pdprice">
                                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                        <p class="discount" aria-label="할인가"><em>159,000</em>원</p>
                                                                        </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139997638&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139997638_[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) "
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139810241&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139810241_메피스토(MEPHISTO) 컴포트 플랫슈즈"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/2/0/81/39/2139810241_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="메피스토(MEPHISTO) 컴포트 플랫슈즈"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="메피스토(MEPHISTO) 컴포트 플랫슈즈">
                                                                        메피스토(MEPHISTO) 컴포트 플랫슈즈
                                                                    </div>
                                                                    <div class="pdprice">
                                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                        <p class="discount" aria-label="할인가"><em>159,000</em>원</p>
                                                                        </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139810241&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139810241_메피스토(MEPHISTO) 컴포트 플랫슈즈"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2140320762&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2140320762_[플로레센스]썸머니트케이프2종(블랙+베이지)"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/7/0/32/40/2140320762_0.png?RS=300x300&amp;AR=0"
                                                                         alt="[플로레센스]썸머니트케이프2종(블랙+베이지)"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="[플로레센스]썸머니트케이프2종(블랙+베이지)">
                                                                        [플로레센스]썸머니트케이프2종(블랙+베이지)
                                                                    </div>
                                                                    <div class="pdprice">
                                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                        <p class="discount" aria-label="할인가"><em>39,800</em>원</p>
                                                                        </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2140320762&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2140320762_[플로레센스]썸머니트케이프2종(블랙+베이지)"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="slick-next slick-arrow" aria-label="Next" type="button" style=""
                                        aria-disabled="false">Next
                                </button>
                                <div class="slick-slidetotal" style=""><em class="current">1</em><strong
                                        class="total">2</strong></div>
                            </div>
                        </div>


                        <!--// 이 카테고리를 본 고객님들이 본 상품 -->
                    </div>
                    <script type="text/javascript">
                        // MYTEM 추천영역 셋팅
                        rcmmItemMyTem();
                    </script>
                    <div class="home-section banner-slider big-banner">
                        <ul data-modules-slick="paging:false;dots:true;arrows:false;autoplay:true;infinite:true;"
                            class="slick-initialized slick-slider slick-single">
                            <div class="slick-list draggable">
                                <div class="slick-track"
                                     style="opacity: 1; width: 1081px; transform: translate(0px, 0px);">
                                    <div class="slick-slide slick-current slick-active" data-slick-index="0"
                                         aria-hidden="false" style="width: 1081px;">
                                        <div>
                                            <li class="items"
                                                style="background-color: rgb(255, 153, 115); width: 100%; display: inline-block; vertical-align: top;">


                                                <a href="javascript:;"
                                                   onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2718492&amp;eventCode=HHS20', '', '');"
                                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭"
                                                   ga-custom-position="광고영역배너" ga-custom-creative="현대홈쇼핑 현대카드"
                                                   ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:14"
                                                   tabindex="0">


                                                    <div class="info-box">


                                                        <span class="tit">현대홈쇼핑 현대카드</span>


                                                        <p class="txt">현대홈쇼핑에서 첫 이용시 <br>3만원 할인<br>(2022.05.01~2022.05.31)
                                                        </p>

                                                    </div>
                                                    <div class="thumb">
                                                        <img src="https://image.hmall.com/MH/MH002/20220430/230553/0112_big2_ff9973.jpg"
                                                             alt=""
                                                             onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">

                                                    </div>
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </div>

                    <div class="home-section mytem" id="myTemArea" style="margin-bottom: -50px">
                        <div class="titArea">
                            <h3>진행중인 인기 리워드</h3>
                        </div>
                        <!--// 이 카테고리를 본 고객님들이 본 상품 -->
                    </div>

                    <div class="home-section theme-pd">
                        <!--8개로 운영, 8개 한번에 노출 // 어드민에 별도 url 입력된 경우 해당url로 이동, 그렇지 않을 시 기본기획전 url로 이동-->
                        <ul class="theme-list">
<%--                            <c:forEach items="${bestFund}" var="bestFund" varStatus="status">--%>
                                <li>
                                    <figure>
                                        <a href="javascript:;"
                                           onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                           ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                           ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                        <div class="img" style="margin-bottom: -12px">
                                            <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${bestFund[0].fund_product_main_img}">
                                        </div>
                                        <figcaption>
                                            <div>
                                                <p class="tit">${bestFund[0].fund_product_title}</p>
                                            </div>
                                            <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bestFund[0].fund_product_pr_cost}"/>원 펀딩</p>
                                            <div style="justify-content: space-between; display: flex">
                                                <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[0].fund_product_pr_cost/bestFund[0].fund_product_goal_cost)*100}"/> %</p>
                                                <fmt:formatDate var="itDate" value="${bestFund[0].fund_product_end_date}" pattern="yyyyMMdd" />
                                                <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                            </div>
                                        </figcaption>
                                        </a>
                                    </figure>
                                    <div>
                                        <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                            <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[0].fund_product_pr_cost/bestFund[0].fund_product_goal_cost)*100}"/>%;
                                                    display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                        </p>
                                    </div>
                                </li>
<%--                            </c:forEach>--%>
                                <li>
                                    <figure>
                                        <a href="javascript:;"
                                           onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                           ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                           ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                        <div class="img" style="margin-bottom: -12px">
                                            <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${bestFund[1].fund_product_main_img}">
                                        </div>
                                        <figcaption>
                                            <div>
                                                <p class="tit">${bestFund[1].fund_product_title}</p>
                                            </div>
                                            <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bestFund[1].fund_product_pr_cost}"/>원 펀딩</p>
                                            <div style="justify-content: space-between; display: flex">
                                                <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[1].fund_product_pr_cost/bestFund[1].fund_product_goal_cost)*100}"/> %</p>
                                                <fmt:formatDate var="itDate" value="${bestFund[1].fund_product_end_date}" pattern="yyyyMMdd" />
                                                <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                            </div>
                                        </figcaption>
                                        </a>
                                    </figure>
                                    <div>
                                        <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                                                        <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[1].fund_product_pr_cost/bestFund[1].fund_product_goal_cost)*100}"/>%;
                                                                                display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                        </p>
                                    </div>
                                </li>
                            <li>
                                <figure>
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                    <div class="img" style="margin-bottom: -12px">
                                        <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${bestFund[2].fund_product_main_img}">
                                    </div>
                                    <figcaption>
                                        <div>
                                            <p class="tit">${bestFund[2].fund_product_title}</p>
                                        </div>
                                        <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bestFund[2].fund_product_pr_cost}"/>원 펀딩</p>
                                        <div style="justify-content: space-between; display: flex">
                                            <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[2].fund_product_pr_cost/bestFund[2].fund_product_goal_cost)*100}"/> %</p>
                                            <fmt:formatDate var="itDate" value="${bestFund[2].fund_product_end_date}" pattern="yyyyMMdd" />
                                            <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                        </div>
                                    </figcaption>
                                    </a>
                                </figure>
                                <div>
                                    <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                                                                                <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[2].fund_product_pr_cost/bestFund[2].fund_product_goal_cost)*100}"/>%;
                                                                                                        display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                    </p>
                                </div>
                            </li>
                            <li>
                                <figure>
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                    <div class="img" style="margin-bottom: -12px">
                                        <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${bestFund[3].fund_product_main_img}">
                                    </div>
                                    <figcaption>
                                        <div>
                                            <p class="tit">${bestFund[3].fund_product_title}</p>
                                        </div>
                                        <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${bestFund[3].fund_product_pr_cost}"/>원 펀딩</p>
                                        <div style="justify-content: space-between; display: flex">
                                            <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[3].fund_product_pr_cost/bestFund[3].fund_product_goal_cost)*100}"/> %</p>
                                            <fmt:formatDate var="itDate" value="${bestFund[3].fund_product_end_date}" pattern="yyyyMMdd" />
                                            <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                        </div>
                                    </figcaption>
                                    </a>
                                </figure>
                                <div>
                                    <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                        <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(bestFund[3].fund_product_pr_cost/bestFund[3].fund_product_goal_cost)*100}"/>%;
                                                                                                        display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div class="home-section mytem" id="myTemArea" style="margin-bottom: -50px">
                        <div class="titArea">
                            <h3>마감임박 리워드 프로젝트</h3>
                       </div>
                        <!--// 이 카테고리를 본 고객님들이 본 상품 -->
                    </div>

                    <div class="home-section theme-pd">
                        <!--8개로 운영, 8개 한번에 노출 // 어드민에 별도 url 입력된 경우 해당url로 이동, 그렇지 않을 시 기본기획전 url로 이동-->
                        <ul class="theme-list">
                            <%--                            <c:forEach items="${bestFund}" var="bestFund" varStatus="status">--%>
                            <li>
                                <figure>
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                    <div class="img" style="margin-bottom: -12px">
                                        <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${deadlineProduct[0].fund_product_main_img}">
                                    </div>
                                    <figcaption>
                                        <div>
                                            <p class="tit">${bestFund[0].fund_product_title}</p>
                                        </div>
                                        <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${deadlineProduct[0].fund_product_pr_cost}"/>원 펀딩</p>
                                        <div style="justify-content: space-between; display: flex">
                                            <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[0].fund_product_pr_cost/deadlineProduct[0].fund_product_goal_cost)*100}"/> %</p>
                                            <fmt:formatDate var="itDate" value="${deadlineProduct[0].fund_product_end_date}" pattern="yyyyMMdd" />
                                            <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                        </div>
                                    </figcaption>
                                    </a>
                                </figure>
                                <div>
                                    <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                            <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[0].fund_product_pr_cost/deadlineProduct[0].fund_product_goal_cost)*100}"/>%;
                                                    display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                    </p>
                                </div>
                            </li>
                            <%--                            </c:forEach>--%>
                            <li>
                                <figure>
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                    <div class="img" style="margin-bottom: -12px">
                                        <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${deadlineProduct[1].fund_product_main_img}">
                                    </div>
                                    <figcaption>
                                        <div>
                                            <p class="tit">${deadlineProduct[1].fund_product_title}</p>
                                        </div>
                                        <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${deadlineProduct[1].fund_product_pr_cost}"/>원 펀딩</p>
                                        <div style="justify-content: space-between; display: flex">
                                            <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[1].fund_product_pr_cost/deadlineProduct[1].fund_product_goal_cost)*100}"/> %</p>
                                            <fmt:formatDate var="itDate" value="${deadlineProduct[1].fund_product_end_date}" pattern="yyyyMMdd" />
                                            <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                        </div>
                                    </figcaption>
                                    </a>
                                </figure>
                                <div>
                                    <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                       <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[1].fund_product_pr_cost/deadlineProduct[1].fund_product_goal_cost)*100}"/>%;
                                           display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                    </p>
                                </div>
                            </li>
                            <li>
                                <figure>
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                    <div class="img" style="margin-bottom: -12px">
                                        <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${deadlineProduct[2].fund_product_main_img}">
                                    </div>
                                    <figcaption>
                                        <div>
                                            <p class="tit">${deadlineProduct[2].fund_product_title}</p>
                                        </div>
                                        <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${deadlineProduct[2].fund_product_pr_cost}"/>원 펀딩</p>
                                        <div style="justify-content: space-between; display: flex">
                                            <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[2].fund_product_pr_cost/deadlineProduct[2].fund_product_goal_cost)*100}"/> %</p>
                                            <fmt:formatDate var="itDate" value="${deadlineProduct[2].fund_product_end_date}" pattern="yyyyMMdd" />
                                            <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                        </div>
                                    </figcaption>
                                    </a>
                                </figure>
                                <div>
                                    <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                        <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[2].fund_product_pr_cost/deadlineProduct[2].fund_product_goal_cost)*100}"/>%;
                                            display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                    </p>
                                </div>
                            </li>
                            <li>
                                <figure>
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발 CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">

                                    <div class="img" style="margin-bottom: -12px">
                                        <img src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${deadlineProduct[3].fund_product_main_img}">
                                    </div>
                                    <figcaption>
                                        <div>
                                            <p class="tit">${deadlineProduct[3].fund_product_title}</p>
                                        </div>
                                        <p class="tit" style="margin-bottom: 15px"><fmt:formatNumber type="number" maxFractionDigits="3" value="${deadlineProduct[3].fund_product_pr_cost}"/>원 펀딩</p>
                                        <div style="justify-content: space-between; display: flex">
                                            <p class="tit" style="color:#002fa3;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[3].fund_product_pr_cost/deadlineProduct[3].fund_product_goal_cost)*100}"/> %</p>
                                            <fmt:formatDate var="itDate" value="${deadlineProduct[3].fund_product_end_date}" pattern="yyyyMMdd" />
                                            <p class="tit" style="font-size: 15px; color: gray; margin-left: 120px;" >D -${itDate-now}</p>
                                        </div>
                                    </figcaption>
                                    </a>
                                </figure>
                                <div>
                                    <p style="width: 100%;height: 8px;margin-bottom: 0;border-radius: 4px;background: #eee; margin-top: -5px;">
                                        <span style="width: <fmt:formatNumber type="number" maxFractionDigits="0" value="${(deadlineProduct[3].fund_product_pr_cost/deadlineProduct[3].fund_product_goal_cost)*100}"/>%;
                                            display: block;height: 8px;border-radius: 4px;background: #18A0FB; max-width: 100%"></span>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div style="max-width:473px;
                            height: 56px;
                            background-color: #002fa3;
                            cursor: pointer;
                            font-size: 22px;
                            font-weight: 700;
                            letter-spacing: -.3px;
                            color: #fff;
                            text-align: center;
                            line-height: 56px;
                            margin: 0 auto;
                            margin-top: 100px;
                            border-radius: 10px;
                            " onclick="location.href='/fund/main'">펀딩 프로젝트 더 보기
                    </div>
                </div>
                <!--//homeshoping-wrap-->
            </div>
            <!--//contents-area-->
        </div>
    </div>
    <!-- //.container -->
    <script type="text/javascript">
        var lbrdEndTimeStrH = '20220525114000';

        var etvServerDtm;
        if ('20220525103333' != '' && '20220525103333' != null) {
            etvServerDtm = '20220525103333';
        }

        $(function () {
            if ((lbrdEndTimeStrH && lbrdEndTimeStrH.length > 0)) {
                clockH(etvServerDtm);
            }
            videojs($(".brodEtvArea video").get(0));
        });


        function clockH(serverDtm) {

            var now;
            if (serverDtm == undefined || serverDtm == null) {
                now = new Date();
            } else {
                now = new Date(serverDtm.replace(/([\d]{4})([\d]{2})([\d]{2})([\d]{2})([\d]{2})([\d]{2})/, '$2/$3/$1 $4:$5:$6'));
            }

            var year = Number(lbrdEndTimeStrH.substring(0, 4));       //년
            var month = Number(lbrdEndTimeStrH.substring(4, 6)) - 1; //월 (0 ~ 11)
            var date = Number(lbrdEndTimeStrH.substring(6, 8));       //일
            var hours = Number(lbrdEndTimeStrH.substring(8, 10));     //시
            var minutes = Number(lbrdEndTimeStrH.substring(10, 12));  //분
            var seconds = Number(lbrdEndTimeStrH.substring(12, 14));  //초

            var endDtm = new Date(year, month, date, hours, minutes, seconds);  // 방송종료일시

            var gap = (endDtm.getTime() - now.getTime()) / 1000;
            var leftTime = "";

            if (gap <= 0) {
                /* location.reload(true); */
                leftTime = "00 : 00 : 00";
                $('#etvLeftTime').html(leftTime);
                $("#etvLeftReload").show();
                $(".brodEtvArea .vjs-big-play-button").hide()
                return;
            }

            var hour = parseInt(gap / 3600);
            var min = parseInt((gap % 3600) / 60);
            var sec = parseInt(gap % 60);

            leftTime += ((hour < 10) ? "0" : "") + hour;
            leftTime += ((min < 10) ? " : 0" : " : ") + min;
            leftTime += ((sec < 10) ? " : 0" : " : ") + sec;

            $('#etvLeftTime').html(leftTime);
            setTimeout("clockH()", 1000);
        }
        function onairEtvGaTagging(obj) {
            if ($(obj).children().first().attr('class').indexOf('vjs-user-active vjs-live') > -1
                || $(obj).children().first().attr('class').indexOf('vjs-live vjs-user-active') > -1) {
                var $slitmInfo = $(obj).closest('figure');
                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"));
            }
        }
    </script>
</main>