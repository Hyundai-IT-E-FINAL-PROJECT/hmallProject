<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/06/04
  Time: 12:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    a.active{
        color: blue;
    }
</style>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="contents">
            <div class="visual-wrap" style="background:#1326b5;">
                <div class="img ui-visualimg" style="height: 520px;">
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>일반매장
                </div>
                <div class="tit">
                    <img src="https://image.hmall.com/static/image/sect/dispbnnr2713900130151020220602100108.png" alt="의류 썸머 신상품 대공개" onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">
                </div>
            </div>
            <!-- 혜택 -->
            <div class="benefit-wrap" style="background:#ffef98;">
                <div class="point-wrap">
                    <div class="inner">
                        <p>
                            6월 2일 (목) ~
                            6월 5일 (일)
                        </p>
                    </div>
                </div>
                <!-- 이미지 사이즈에 따라 영상 사이즈 자동 변경 -->
                <!--// 영상 -->
                <!-- 혜택 종류 -->
                <div class="kinds-wrap">
                    <ol>
                        <!--brndNw(BRAND NEW)-->
                        <div class="exhibit-wrap" style="background:#ffef98;">
                            <div class="inner-wrap">
                                <div class="exhibit type-brand-large">
                                    <h3>대표브랜드</h3>
                                    <div class="item-wrap">
                                        <div class="item">
                                            <div class="thumb"><img src="https://image.hmall.com/static/image/sect/dispbnnr27139001301710020220526145907.jpg" alt=""></div>
                                            <div class="label-area">
                                                <strong>유로컬렉션</strong>
                                                <p>
                                                    2대째 내려오고 있는 LUXURY 모피의 명가, 유로컬렉션
                                                </p>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="thumb"><img src="https://image.hmall.com/static/image/sect/dispbnnr2713900130173020211014173514.jpg" alt=""></div>
                                            <div class="label-area">
                                                <strong>리오벨</strong>
                                                <p>
                                                    Beyond Leather LIOBELL리오벨
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--//brndNw(BRAND NEW)-->

                        <!--showLivePay(쇼핑라이브 구매왕)-->

                        <!--//showLivePay(쇼핑라이브 구매왕)-->
                        <!-- 리워드 정액 타입 -->
                        <li class="reward reward-table">
                            <div class="tit">
                                <span>혜택 1</span>
                                <em>역시즌 의류 브랜드전 10%적립</em>
                            </div>
                            <div class="con">
                                <div class="left">
                                    <table summary="기간 중 누적 결제금액 과 적립금 안내 정보 제공">
                                        <caption>기간 중 누적 결제금액 과 적립금 안내</caption>
                                        <colgroup>
                                            <col width="50%">
                                            <col width="*">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th scope="cal">기간 중 누적 결제액</th>

                                            <th scope="cal">H.Point</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>5만원 이상</td>
                                            <td>5,000
                                                P
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>10만원 이상</td>
                                            <td>10,000
                                                P
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>20만원 이상</td>
                                            <td>20,000

                                                P


                                            </td>
                                        </tr>

                                        <tr>
                                            <td>40만원 이상</td>
                                            <td>40,000

                                                P


                                            </td>
                                        </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="right">
                                    <div class="text">
                                        <p>



                                            <strong>최대 4만 H.Point 혜택</strong>



                                        </p>

                                        <button onclick="fnGoMove('/pevent/eva/evntHPointDtl.do?prmoNo=P202205305619');">
                                            <span>신청하기</span>
                                        </button>

                                    </div>
                                </div>
                            </div>
                        </li>
                        <!--// 리워드 정액 타입 -->

                        <!--brndNw(BRAND NEW)-->

                        <!--//brndNw(BRAND NEW)-->

                        <!--showLivePay(쇼핑라이브 구매왕)-->

                        <!--//showLivePay(쇼핑라이브 구매왕)-->

                        <!--brndNw(BRAND NEW)-->

                        <!--//brndNw(BRAND NEW)-->

                        <!--showLivePay(쇼핑라이브 구매왕)-->

                        <!--//showLivePay(쇼핑라이브 구매왕)-->

                    </ol>
                </div>

                <!--// 혜택 종류 -->
            </div>


            <!--xxxx: [] -->
            <!--xxxx:  -->

            <div class="display-list-wrap">
                <div class="tit-area">
                    <h3></h3>
                </div>
                <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
                <script type="text/javascript" src="//image.hmall.com/p/js/co/intersectionObserver.js?ver=060322"></script>

                <script type="text/javascript">

                    var custNo = "";
                    var sectId = "2713900";
                    var sortType = 'sect_disp';
                    var preview = '0';
                    var firstScrollFlag = true;
                    window.onload = function(){
                        $(window).scroll(function() {
                            if(window.sessionStorage != null && !firstScrollFlag){
                                sessionStorage.setItem('p_sectScrollTop', $(this).scrollTop());
                            }
                        });
                    };

                    $(document).ready(function() {
//alert('sect_disp ,'+$("#sortTypeHidden").val());
                        if($("#sortTypeHidden").val()){
                            sortType = $("#sortTypeHidden").val();
                        }

                        if(!sectId){
                            sectId = "2713900";
                        }

                        if(!preview){
                            preview = "";
                        }

                        if(null != window.sessionStorage){
                            if(sectId != sessionStorage.getItem('p_sectId')){
                                window.sessionStorage.clear();
                                firstScrollFlag = false;
                                sessionStorage.setItem('p_sectId',sectId);
                            }
                        }


                        $("#productSearchText").on('change keyup paste',function(key){
                            var $inputBox = $(this).closest('div.inputbox');
                            if(!this.value){
                                $inputBox.removeClass('selected');
                            }else{
                                if(!$inputBox.hasClass('selected')){
                                    $inputBox.addClass('selected');
                                }
                            }
                            if(key.keyCode == '13'){
                                $("#productSearchBtn").click();
                            }
                        });


                        $("#productSearchBtn").click(function(){
                            var sText = $.trim($("#productSearchText").val());
                            if(!sText){
                                alert('검색어를 입력해 주세요.');
                                return false;
                                /*
                                $("#displaySearchListDiv").html('').hide();
                                $("#displayListDiv").html('').show();
                                loadDcPage();
                                */
                            }else{
                                $("#displaySearchListDiv").html('').show();
                                $("#displayListDiv").html('').hide();
                                fnKeywordSearchItem();
                            }
                        });

                        $("#productSearchInitBtn").click(function(){
                            $("#productSearchInitDiv").hide();
                            $("#productSearchText").val('').change();

                            $("#displaySearchListDiv").html('').hide();
                            $("#displayListDiv").html('').show();
                            loadDcPage();

                        });

                        $(".ico-clearabled").click(function(){
                            $("#productSearchText").val('').change();
                        });


                        $(document).on('click','.pdlist-wrap .slide-list a',function(){
                            if($(this).find('img').length > 0 && $(this).parents('li.pdthumb').find('div.thumb img').length > 0){
                                $(this).parents('li.pdthumb').find('div.thumb img')[0].src =$(this).find('img')[0].src;
                                var runTime = $(this).data('run_time');
                                if(runTime){
                                    $(this).parents('li.pdthumb').find('.ready').html('<span class="playtime"><i class="icon"></i><em>'+runTime+'</em></span>');
                                }else{
                                    $(this).parents('li.pdthumb').find('.ready').html('');
                                }
                            }
                        });

                        if(sectId){
                            if($("#productSearchText").length > 0 && $("#productSearchText").val() != ''){
                                $("#productSearchBtn").click();
                            }else{
                                loadDcPage();
                            }
                        }
                    });

                    // function loadDcPageSet(data){
                    //     $("#productSearchInitDiv").hide();
                    //     $("#displayListDiv").html(data);
                    //     $("#displayListDiv").show();
                    //     initObserver();
                    //     personalSet(); //찜리스트 체크
                    //     moreLoading(false, $("#displayListDiv"));
                    //     if(sessionStorage.getItem('p_sectScrollTop') && sessionStorage.getItem('p_sectScrollTop') > 0){
                    //         $(window).scrollTop(sessionStorage.getItem('p_sectScrollTop'));
                    //     }
                    //
                    //     firstScrollFlag = false;
                    // }
                    //
                    // function loadDcPage() {
                    //     firstScrollFlag = true;
                    //     moreLoading(true, $("#displayListDiv"),true);
                    //     $(".load-bar").css('z-index',0);
                    //     $(".load-bar").css('align-items','start');
                    //     $(".load-bar").css('height',window.innerHeight);
                    //
                    //     $.ajax({
                    //         type : "get",
                    //         url : "https://www.hmall.com/p/dpa/searchSpexAjaxItemList.do",
                    //         dataType : "html",
                    //         data : {
                    //             sectId : sectId,
                    //             sortType : sortType,
                    //             EHAdltCertYn : '',
                    //             preview : preview
                    //         },
                    //         async : true,
                    //         success : function(data) {
                    //             loadDcPageSet(data);
                    //         },
                    //         error : function(data) {
                    //             $.ajax({
                    //                 type : "get",
                    //                 url : "https://www.hmall.com/p/dpa/searchSpexAjaxItemList.do",
                    //                 dataType : "html",
                    //                 data : {
                    //                     sectId : sectId,
                    //                     sortType : sortType,
                    //                     EHAdltCertYn : ''
                    //                 },
                    //                 async : true,
                    //                 success : function(data) {
                    //                     loadDcPageSet(data);
                    //                 },
                    //                 error : function(data) {
                    //                     moreLoading(false, $("#displayListDiv"));
                    //                     firstScrollFlag = false;
                    //                 }
                    //             });
                    //         }
                    //     });
                    // }

                    function fnKeywordSearchItem() {

                        moreLoading(true, $("#displaySearchListDiv"),true);
                        $(".load-bar").css('z-index',0);
                        $(".load-bar").css('align-items','start');
                        $(".load-bar").css('height',window.innerHeight);

                        $.ajax({
                            type : "get",
                            url : "https://www.hmall.com/p/dpa/selectSpexOnlyItemList.do",
                            dataType : "html",
                            data : {
                                sectId : sectId,
                                searchTxt : $("#productSearchText").val()
                            },
                            async : true,
                            success : function(data) {
                                $("#displayListDiv").hide();
                                $("#displaySearchListDiv").html(data).show();
                                $("#productSearchInitDiv").show();
                                initObserver();
                                personalSet();
                                moreLoading(false, $("#displaySearchListDiv"));

                                if(firstScrollFlag){
                                    $(window).scrollTop(sessionStorage.getItem('p_sectScrollTop'));
                                    firstScrollFlag = false;
                                }
                            },
                            error : function(data) {
                                console.log('검색오류');
                                moreLoading(false, $("#displaySearchListDiv"));
                            }
                        });
                    }

                    function fnSortChg(chgSort){
                        $("#sortTypeHidden").val(chgSort);
                        sortType = chgSort;
                        loadDcPage();
                    }

                    function goInsuSite(url){
                        if(isLogin() == 'true'){
                            $.ajax({
                                type: "post"
                                ,url: "/p/dpa/selectCustNoEcrty.do"
                                ,dataType: "json"
                                ,data:{custNo:custNo}
                                ,async: false
                                ,success : function(data) {

                                    if(url.indexOf("meritzfire") > 0)
                                    {
                                        window.location.href = url + "&mbr_no=" + data.custNoEcrty;
                                    }
                                    else
                                    {
                                        // 고객번호 파라미터 넘겨, 암호화된 고객번호 받는다.
                                        window.location.href = url + "&custNo=" + data.custNoEcrty;
                                    }

                                }
                                ,error : function(request,status,error){
                                }
                            });
                        }else{
                            openLoginPopup("/p/dpa/searchSpexSectItem.do?sectId=2713900");
                            return false;
                        }
                    }

                </script>
                <input type="text" id="sortTypeHidden" style="display: none;"> <!--  뒤로가기시  text type만 유지되는듯.. -->


                <div class="display-list-wrap" id="displaySearchListDiv" style="display: none;"></div>
                <div class="display-list-wrap" id="displayListDiv">

                    <script type="text/javascript">
                        $(document).ready(function(){
                            $('body').commonUi().initLibrary();
                        });
                    </script>
                    <div class="scroll-observer"></div><div class="tabwrap scrollspy-tab" data-modules-scrollspy="padding:24;navHeight:94;alSize:4;" style="height: 47px;">
                    <div class="inner">
                        <ul class="ui-tab ui-spynav" role="tablist" style="margin-top: 47px;">

                            <li role="presentation" class="ui-active"><a href="#pd-2740676">유로컬렉션</a></li>

                            <li role="presentation" class=""><a href="#pd-2740678">리오벨</a></li>

                            <li role="presentation"></li><li role="presentation"></li></ul>
                    </div>
                </div>
                    <div class="list-sort-area line">
                        <div class="sortOption">
                            <input type="hidden" id="exhibit_num_many" value="1">
                            <input type="hidden" id="sort_value_many" value="sell_count desc">
                            <a href="javascript:;" id="sell_class" onclick="sort_p('sell_count');">많이팔린순</a>
                            <input type="hidden" id="exhibit_num_date" value="1">
                            <input type="hidden" id="sort_value_date" value="tp.created_at desc">
                            <a href="javascript:;" id="create_class" onclick="sort_p('tp.created_at desc');">최근등록순</a>
                            <input type="hidden" id="exhibit_num_low" value="1">
                            <input type="hidden" id="sort_value_low" value="product_cost">
                            <a href="javascript:;" id="low_cost" onclick="sort_p('product_cost');">낮은가격순</a>
                            <input type="hidden" id="exhibit_num_high" value="1">
                            <input type="hidden" id="sort_value_high" value="product_cost desc">
                            <a href="javascript:;" id="high_cost" onclick="sort_p('product_cost desc');">높은가격순</a>
                        </div>
                        <div>
                            <img id="btnKakao" class="link-icon kakao" onclick="shareKakao();" src="${contextPath}/resources/img/exhibitions/kakao.png" width="25" height="25"></img>
                        </div>
                    </div>
                    <!-- tab-content -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane ui-active" id="pd-2740676">
                            <div class="list-head">
                                <h3 class="title22">유로컬렉션</h3>
                                <a href="#" class="btn-list-top">TOP<i class="icon"></i></a>
                            </div>
                            <!--반복문으로 유로 컬렉션 관련 리스트 값 받아오기-->
                                <div class="pdlist-wrap col4">
                                    <div class="eu">
                                    <ul>
                                        <c:forEach items="${list}" var="euro" varStatus="status">
                                            <c:if test="${euro.PRODUCT_BRAND eq 'EURO'}">
                                                <li class="pdthumb" ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
                                                    <a href="javascript:;" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740676&amp;slitmCd=2141175088', this);">
                                                        <div class="thumb">
                                                            <img src="${contextPath}/resources/img/exhibitions/${euro.EXHIBIT_IMAGE}.jpg">
                                                            <div class="ready">
                                                                <span class="playtime"><i class="icon"></i><em>00:59</em></span>
                                                            </div>
                                                        </div>
                                                        <div class="figcaption">
                                                            <div class="pdname" aria-label="유로컬렉션 22FW 휘메일 풀스킨 호리젠탈 밍크 베스트">${euro.PRODUCT_NAME}</div>
                                                            <div class="pdprice">
                                                                <span class="rateprice" aria-label="정상가 가격">
                                                                <p class="discount" aria-label="정상가"><em><fmt:formatNumber type="number" maxFractionDigits="0" value="${euro.PRODUCT_COST}"/></em>원</p>
                                                                </span>
                                                            </div>
                                                            <div class="pdinfo">
                                                                <div class="benefits">
                                                                    <span class="flag"><em class="color-ec5baa">적립금</em></span>
                                                                    <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${euro.PRODUCT_COST * 0.05}"/></span>
                                                                </div>
                                                                <p class="like-count">
                                                                    <em><fmt:formatDate value="${euro.CREATED_AT}" pattern="yyyy-MM-dd"/></em>
                                                                    <b>(${euro.SELL_COUNT})</b>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </a>
                                                    <a href="javascript:;" class="hoverview" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740676&amp;slitmCd=2141175088', this , '_blank');"><i class="icon"></i>새창열기</a>
                                                    <div class="alimlike" data-slitmcd="2141175088" data-bsitmcd="2141175088">
                                                        <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','016479','','2141175088', event);"> <i class="icon"></i><span class="hiding">찜</span></a>
                                                    </div>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                    </div>
                                </div>
                        </div>



                        <div role="tabpanel" class="tab-pane ui-active" id="pd-2740678">
                            <div class="list-head">
                                <h3 class="title22">리오벨</h3>
                                <a href="#" class="btn-list-top">TOP<i class="icon"></i></a>
                            </div>
                            <div class="pdlist-wrap col4">
                                <div class="lio">
                                <ul>
                                    <c:forEach items="${list}" var="liobell">
                                        <c:if test="${liobell.PRODUCT_BRAND eq 'LIOBELL'}">
                                            <li class="pdthumb " ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
                                                <a href="javascript:;" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740678&amp;slitmCd=2141537482', this);">
                                                    <div class="thumb">
                                                        <img src="${contextPath}/resources/img/exhibitions/${liobell.EXHIBIT_IMAGE}.jpg">
                                                        <div class="ready">
                                                        </div>
                                                    </div>
                                                    <div class="figcaption">
                                                        <div class="pdname" aria-label="리오벨[Liobell] 22 NEW 컬러링 리버서블 호주산 양모 100% 베스트 1종">${liobell.PRODUCT_NAME}</div>
                                                        <div class="pdprice">
                                                            <span class="rateprice" aria-label="정상가 가격">
                                                            <p class="discount" aria-label="정상가"><em><fmt:formatNumber type="number" maxFractionDigits="0" value="${liobell.PRODUCT_COST}"/></em>원</p>
                                                            </span>
                                                        </div>
                                                        <div class="pdinfo">
                                                            <div class="benefits">
                                                                <span class="flag"><em class="color-ec5baa">적립금</em></span>
                                                                <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${liobell.PRODUCT_COST * 0.05}"/></span>
                                                            </div>
                                                            <p class="like-count">
                                                                <em><fmt:formatDate value="${liobell.CREATED_AT}" pattern="yyyy-MM-dd"/></em>
                                                                <b>(${liobell.SELL_COUNT})</b>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </a>
                                                <a href="javascript:;" class="hoverview" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740678&amp;slitmCd=2141537482', this , '_blank');"><i class="icon"></i>새창열기</a>
                                                <div class="alimlike" data-slitmcd="2141537482" data-bsitmcd="2141476888">
                                                    <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','016671','','2141537482', event);"> <i class="icon"></i><span class="hiding">찜</span></a>
                                                </div>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- tab-content -->
                </div>
            </div>
        </div>
        <!-- //.container -->
    </div>
</main>

<script >

    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";

    function getFormatDate(date){
        var year = date.getFullYear();              //yyyy
        var month = (1 + date.getMonth());          //M
        month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
        var day = date.getDate();                   //d
        day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
        return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
    }

    function shareKakao() {
        // 사용할 앱의 JavaScript 키 설정
        Kakao.init('caf33407aea23e6cbd7ad732e602b5ad');

        // 카카오링크 버튼 생성
        Kakao.Link.createDefaultButton({
            container: '#btnKakao', // 카카오공유버튼ID
            objectType: 'feed',
            content: {
                title: "현대몰 유로컬렉션 기획전", // 보여질 제목
                description: "유로컬렉션 2대째 내려오고 있는 LUXURY 모피의 명가, 유로컬렉션" +
                    "리오벨 Beyond Leather LIOBELL리오벨" , // 보여질 설명
                imageUrl: "${contextPath}/resources/img/exhibitions/mainImg_5.jpeg", // 콘텐츠 URL
                link: {
                    mobileWebUrl: "http://localhost:8080/exhibition/euro_exhibit",
                    webUrl: "http://localhost:8080/exhibition/euro_exhibit?exhibit_num=1"
                }
            }
        });
    }

    function sort_p(st){
        console.log(st);
        $(".sortOption a").removeClass("active")
        //$(".sortOption a").addClass("active")
        if(st === 'product_cost') {
            var exhibit_num = document.getElementById('exhibit_num_low').value;
            var sort_value = document.getElementById('sort_value_low').value;
            document.getElementById('low_cost').classList.add("active");
            console.log(sort_value);
        }else if(st === 'tp.created_at desc'){
            var exhibit_num = document.getElementById('exhibit_num_date').value;
            var sort_value = document.getElementById('sort_value_date').value;
            console.log(sort_value);
            document.getElementById('create_class').classList.add("active");
        }else if(st === 'sell_count'){
            var exhibit_num = document.getElementById('exhibit_num_many').value;
            var sort_value = document.getElementById('sort_value_many').value;
            document.getElementById('sell_class').classList.add("active");
        }else{
            var exhibit_num = document.getElementById('exhibit_num_high').value;
            var sort_value = document.getElementById('sort_value_high').value;
            document.getElementById('high_cost').classList.add("active");
            console.log(sort_value);
        }
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        $(".autoCate").removeClass("ui-active");
        $('.eu ul li').remove();
        $('.lio ul li').remove();
        var a;

        $.ajax({
            url:"${contextPath}/exhibition/sort_exhibit",
            method: "post",
            data:{"exhibit_num":exhibit_num, "sort_value":sort_value},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },
            success: function (result){
                console.log(result);

                for(let pp of result) {

                    var date = new Date(pp.CREATED_AT);
                    date = getFormatDate(date);

                    console.log(pp);
                    console.log(pp.PRODUCT_NAME);
                    console.log(pp.PRODUCT_COST);
                    console.log(pp.PRODUCT_BRAND);
                    console.log(pp.CREATED_AT);
                    console.log(pp.SELL_COUNT);
                    console.log(pp.EXHIBIT_IMAGE);
                    var pn = pp.PRODUCT_NAME;
                    var pc = (pp.PRODUCT_COST).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                    var pb = pp.PRODUCT_BRAND;
                    var ps = pp.SELL_COUNT;
                    var pi = pp.EXHIBIT_IMAGE;
                    var pd = date;
                    var point = (Math.round(pp.PRODUCT_COST * 0.05).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
                    if (pb === 'EURO') {
                        $(".eu ul ").append(
                            `
                            <li class="pdthumb">
                                 <a href="javascript:;" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740676&amp;slitmCd=2141175088', this);">
                                            <div class="thumb">
                                                <img src="../../../resources/img/exhibitions/`+pi+`.jpg">
                                                <div class="ready">
                                                </div>
                                            </div>
                                            <div class="figcaption">
                                                  <div class="pdname" aria-label="유로컬렉션 22FW 휘메일 풀스킨 호리젠탈 밍크 베스트">` + pn + `</div>
                                                  <div class="pdprice">
                                                      <span class="rateprice" aria-label="정상가 가격">
                                                          <p class="discount" aria-label="정상가"><em>`
                            + pc +
                            `</em>원</p>
                                                      </span>
                                                  </div>
                                                 <div class="pdinfo">
                                                     <div class="benefits">
                                                           <span class="flag"><em class="color-ec5baa">적립금</em></span>
                                                           <span>` + point + `</span>
                                                     </div>
                                                     <p class="like-count">
                                                        <em>` + pd + `</em>
                                                        <b>(` + ps + `)</b>
                                                     </p>
                                                 </div>
                                            </div>
                                 </a>
                                 <a href="javascript:;" class="hoverview" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740676&amp;slitmCd=2141175088', this , '_blank');"><i class="icon"></i>새창열기</a>
                                 <div class="alimlike" data-slitmcd="2141175088" data-bsitmcd="2141175088">
                                     <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','016479','','2141175088', event);"> <i class="icon"></i><span class="hiding">찜</span></a>
                                 </div>
                            </li>
                        `
                        )
                    }else{
                        $(".lio ul ").append(
                            `
                            <li class="pdthumb">
                                 <a href="javascript:;" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740676&amp;slitmCd=2141175088', this);">
                                            <div class="thumb">
                                                <img src="../../../resources/img/exhibitions/`+pi+`.jpg">
                                                <div class="ready">
                                                </div>
                                            </div>
                                            <div class="figcaption">
                                                  <div class="pdname" aria-label="유로컬렉션 22FW 휘메일 풀스킨 호리젠탈 밍크 베스트">` + pn + `</div>
                                                  <div class="pdprice">
                                                      <span class="rateprice" aria-label="정상가 가격">
                                                          <p class="discount" aria-label="정상가"><em>`
                            + pc +
                            `</em>원</p>
                                                      </span>
                                                  </div>
                                                 <div class="pdinfo">
                                                     <div class="benefits">
                                                           <span class="flag"><em class="color-ec5baa">적립금</em></span>
                                                           <span>` + point + `</span>
                                                     </div>
                                                     <p class="like-count">
                                                        <em>` + pd + `</em>
                                                        <b>(` + ps + `)</b>
                                                     </p>
                                                 </div>
                                            </div>
                                 </a>
                                 <a href="javascript:;" class="hoverview" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2740676&amp;slitmCd=2141175088', this , '_blank');"><i class="icon"></i>새창열기</a>
                                 <div class="alimlike" data-slitmcd="2141175088" data-bsitmcd="2141175088">
                                     <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','016479','','2141175088', event);"> <i class="icon"></i><span class="hiding">찜</span></a>
                                 </div>
                            </li>
                        `
                        )
                    }
                }
            },error: function (e){
                console.log('error', e);
                console.log("에러다");
            }
        });
    }

</script>
