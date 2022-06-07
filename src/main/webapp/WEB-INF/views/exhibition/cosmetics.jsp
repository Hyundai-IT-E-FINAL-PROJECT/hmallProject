<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/06/05
  Time: 12:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="contents">
            <link href="//image.hmall.com/p/css/co/video-js.css" rel="stylesheet">
            <script src="//image.hmall.com/p/js/co/video.js"></script>
            <script src="//image.hmall.com/p/js/co/videojs-http-streaming.js"></script>
            <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
            <div class="exhibition-wrap">
                <div class="exh-thumb" style="text-align: center;"><p style="TEXT-ALIGN: justify"></p></div>
            </div>
            <!--// exhibition-wrap -->
            <script type="text/javascript" src="//image.hmall.com/p/js/co/intersectionObserver.js?ver=060500"></script>
            <script type="text/javascript">
                var custNo = "";
                var sectId = "2795515";
                var sortType = 'sect_disp';
                var preview = '';
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
                        sectId = "2795515";
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
                        openLoginPopup("/p/dpa/searchSpexSectItem.do?sectId=2795515");
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
                <!-- tab-content -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane ui-active" id="pd-2799844">
                        <div class="list-head">
                            <img id="btnKakao" class="link-icon kakao" onclick="shareKakao();" src="${contextPath}/resources/img/exhibitions/kakao.png" width="25" height="25" style="float: right"/>
                            <h3 class="title22">미백순수22</h3>
                        </div>
                        <div class="pdlist-wrap col5">
                            <ul>
                                <c:forEach items="${list}" var="cosmetics" varStatus="status">
                                    <li class="pdthumb" ga-custom-title="" ga-custom-name="" ga-custom-position="" ga-custom-creative="" ga-custom-id="" ga-custom-etc="">
                                        <a href="javascript:;" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2799844&amp;slitmCd=2140259421', this);">
                                            <div class="thumb">
                                                <img src="${contextPath}/resources/img/exhibitions/${cosmetics.IMAGE_NAME}.jpg" data-io-src="https://image.hmall.com/static/4/9/25/40/2140259421_0.jpg?RS=400x400&amp;AR=0" alt="NEW 미백순수22 비타민C앰플 시즌2 더블구성" class=" done" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=400x400&amp;AR=0')">
                                                <div class="ready">
                                                    <span class="playtime"><i class="icon"></i><em>00:53</em></span>
                                                </div>
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="TVCF동일 이보희 NEW 미백순수 비타민앰플 로즈골드에디션">${cosmetics.PRODUCT_NAME}</div>
                                                <div class="pdprice">
                                                    <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                        <p class="discount" aria-label="할인가"><em><fmt:formatNumber value="${cosmetics.DISCOUNTED_COST}" pattern="#,###"/></em>원 外</p>
                                                        <em class="rate" aria-label="할인율">${cosmetics.COUPON_RATIO}<i>%</i></em>
                                                        <del class="normal" aria-label="정상가"><fmt:formatNumber value="${cosmetics.PRODUCT_COST}" pattern="#,###"/></del>
                                                    </span>
                                                </div>
                                                <div class="pdinfo">
                                                    <div class="benefits">
                                                        <span class="flag"><em class="color-ec5baa">적립금</em></span>
                                                        <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${cosmetics.PRODUCT_COST * 0.05}" /></span>
                                                    </div>
                                                    <p class="like-count">
                                                        <!-- 옵션상품 && 딜상품 -->
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="javascript:;" class="hoverview" onclick="goItemDetail('/p/pda/itemPtc.do?sectId=2799844&amp;slitmCd=2140259421', this , '_blank');"><i class="icon"></i>새창열기</a>
                                        <div class="alimlike" data-slitmcd="2140259421" data-bsitmcd="2140259421">
                                            <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','017766','','2140259421', event);"> <i class="icon"></i><span class="hiding">찜</span></a>
                                        </div>
                                    </li>
                                    <!--  상품기본정보 start -->
                                    <!-- ctSectTmplId:spex/ancer01 itemAuthGrp:Y EHAdltCertYn:N ctHmallExclYn:Y-->
                                    <!-- 혜택 영역 -->
                                    <!-- //혜택 영역 -->
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- tab-content -->
            </div>
        </div>
    </div>
</main>
<script>
    function shareKakao() {
        // 사용할 앱의 JavaScript 키 설정
        Kakao.init('caf33407aea23e6cbd7ad732e602b5ad');

        // 카카오링크 버튼 생성
        Kakao.Link.createDefaultButton({
            container: '#btnKakao', // 카카오공유버튼ID
            objectType: 'feed',
            content: {
                title: "금주의 히트예감 대공개", // 보여질 제목
                description: "미백순수22 파격 기획전", // 보여질 설명
                imageUrl: "${contextPath}/resources/img/exhibitions/mainImg_4.jpeg", // 콘텐츠 URL
                link: {
                    mobileWebUrl: "http://localhost:8080/exhibition/cosmetics?exhibit_num=2",
                    webUrl: "http://localhost:8080/exhibition/cosmetics?exhibit_num=2"
                }
            }
        });
    }
</script>
