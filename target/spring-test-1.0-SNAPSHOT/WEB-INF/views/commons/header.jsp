<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
                <form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search"
                      onsubmit="event.preventDefault();">
                    <div class="inputbox">
                        <labael class="inplabel">
                            <input type="text" id="gnbSearchKeyword" name="searchTerm"
                                   value=""
                                   autocomplete="off" title="검색어" size="88"/>
                        </labael>
                        <button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i
                                id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
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
                                <ul class="recent-list" id="keyword-list">
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

                        <button class="btn searchclose" id="close-btn"><i class="hiding">검색 레이어</i><span>닫기</span>
                        </button>
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

            $("#gnbSearchKeyword").focus(function () {
                $(".header .search").addClass("selected");

                if ($("#gnbSearchKeyword").val() == gv_gnbHomeBnnrTitl) {
                    $("#gnbSearchKeyword").val('');
                }

                $("#search-popup").css({display: ""});  // 최근검색어 탭 노출
                if ($("#keyword-list li").length == 0) {
                    $("#nodata").css({display: ""});
                    $("#keyword-list").css({display: "none"});
                }

                //검색창 입력전 광고
                fn_searchAdKeywordDefault();
                $("#search-recommend").css({display: "none"});
                $("#search-autowrap").show();

                //퀵 메뉴 숨김 처리
                $('.quick-menu-more').removeClass('on');

                // 2020.12.17 icj : 텍스트 광고 입력이 없을시 재노출 (하선윤)
            }).focusout(function () {
                var $keyword = $("#gnbSearchKeyword");
                if ($keyword.val() == '') {
                    $keyword.val(gv_gnbHomeBnnrTitl);
                }
            });

        </script>

        <!-- 개인화 메뉴 -->
        <div class="personal-menu">
            <ul>
                <li>
                    <a class="cart" ga-category="헤더" ga-action="장바구니"
                       href="javascript:bizSpringTag('https://www.hmall.com/p/odb/basktList.do','^헤더^장바구니');">
                        <span>장바구니</span>


                    </a>
                </li>
                <li><a class="mypage" href="/mypage"><span>마이페이지</span></a></li>
                <li>
                    <a href="javascript:;" class="recently" id="recentlyImg"
                       onclick="openRecentShopping(); return false;">
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
<%--                <div class="category-menu-wrap" style="display: none;"><!-- 카테고리 메뉴 depth1-->--%>
<%--                    <div class="category-list" style="height:auto;">--%>
<%--                        <ul>--%>
<%--                            <li data-catecode="01" class="on"><a href="#">패션의류</a></li>--%>
<%--                            <li data-catecode="02"><a href="#">패션잡화/명품</a></li>--%>
<%--                            <li data-catecode="03"><a href="#">뷰티</a></li>--%>
<%--                            <li data-catecode="14"><a href="#">순금/주얼리/시계</a></li>--%>
<%--                            <li data-catecode="05"><a href="#">스포츠/레저</a></li>--%>
<%--                            <li data-catecode="04"><a href="#">출산/유아동</a></li>--%>
<%--                            <li data-catecode="06"><a href="#">주방용품</a></li>--%>
<%--                            <li data-catecode="18"><a href="#">생활/건강</a></li>--%>
<%--                            <li data-catecode="15"><a href="#">식품</a></li>--%>
<%--                            <li data-catecode="07"><a href="#">가구/침구</a></li>--%>
<%--                            <li data-catecode="08"><a href="#">가전/디지털</a></li>--%>
<%--                            <li data-catecode="13"><a href="#">반려동물</a></li>--%>
<%--                            <li data-catecode="16"><a href="#">여행/티켓/도서</a></li>--%>
<%--                            <li data-catecode="19"><a href="#">문화/렌탈/보험</a></li>--%>
<%--                            <li data-catecode="10"><a href="/p/dsMainR.do?GnbGroup=DeptHome">현대백화점</a></li>--%>
<%--                            <li data-catecode="20"><a href="/p/dpa/searchSectItem.do?sectId=2679838">해외직구</a></li>--%>
<%--                            <li data-catecode="09"><a href="/p/tvMainR.do?GnbGroup=TVHome">TV쇼핑</a></li>--%>
<%--                        </ul>--%>
<%--                        <div class="search-brand"><a--%>
<%--                                href="javascript:$('.category-menu-wrap').css('display','none');brndOpenPopup();"--%>
<%--                                class="lyopen" data-target="brand">브랜드검색</a></div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents on" data-catecode="01" style="display: block; height: 660px;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">패션의류</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731203&amp;GnbGroup=AllCategory&amp;Code=01">여성의류</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731204&amp;GnbGroup=AllCategory&amp;Code=01">남성의류</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731205&amp;GnbGroup=AllCategory&amp;Code=01">캐주얼의류</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731206&amp;GnbGroup=AllCategory&amp;Code=01">언더웨어</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2724600&amp;GnbGroup=AllCategory&amp;Code=01">POLO--%>
<%--                                                RALPH LAUREN</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679833&amp;GnbGroup=AllCategory&amp;Code=01">BEANPOLE </a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679811&amp;GnbGroup=AllCategory&amp;Code=01">라코스테</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1886163&amp;GnbGroup=AllCategory&amp;Code=01">TOMMY--%>
<%--                                                HILFIGER</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/cosHome.do?GnbGroup=AllCategory&amp;Code=01">COS</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/aosMain.do?GnbGroup=AllCategory&amp;Code=01">＆Other--%>
<%--                                                Stories</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2699933&amp;GnbGroup=AllCategory&amp;Code=01">수입/컨템포러리</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="02" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">패션잡화/명품</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731137&amp;GnbGroup=AllCategory&amp;Code=02">가방/지갑</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731138&amp;GnbGroup=AllCategory&amp;Code=02">신발</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731139&amp;GnbGroup=AllCategory&amp;Code=02">패션소품/ACC</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731140&amp;GnbGroup=AllCategory&amp;Code=02">명품</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2057137&amp;GnbGroup=AllCategory&amp;Code=02">마이클코어스</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2625458&amp;GnbGroup=AllCategory&amp;Code=02">메트로시티</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2626364&amp;GnbGroup=AllCategory&amp;Code=02">루이까또즈</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2686372&amp;GnbGroup=AllCategory&amp;Code=02">K-헤리티지(전통관)</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="03" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">뷰티</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731159&amp;GnbGroup=AllCategory&amp;Code=03">스킨케어</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731160&amp;GnbGroup=AllCategory&amp;Code=03">헤어케어</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731161&amp;GnbGroup=AllCategory&amp;Code=03">바디케어</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731162&amp;GnbGroup=AllCategory&amp;Code=03">메이크업</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731163&amp;GnbGroup=AllCategory&amp;Code=03">향수</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731164&amp;GnbGroup=AllCategory&amp;Code=03">기기/소품</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2642664&amp;GnbGroup=AllCategory&amp;Code=03">설화수</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="14" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">순금/주얼리/시계</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731184&amp;GnbGroup=AllCategory&amp;Code=14">보석</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731185&amp;GnbGroup=AllCategory&amp;Code=14">반지</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731186&amp;GnbGroup=AllCategory&amp;Code=14">목걸이/귀걸이</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731187&amp;GnbGroup=AllCategory&amp;Code=14">팔찌/발찌</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731188&amp;GnbGroup=AllCategory&amp;Code=14">시계</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731189&amp;GnbGroup=AllCategory&amp;Code=14">기타--%>
<%--                                                ACC</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="05" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">스포츠/레저</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731165&amp;GnbGroup=AllCategory&amp;Code=05">스포츠--%>
<%--                                                의류</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731166&amp;GnbGroup=AllCategory&amp;Code=05">스포츠신발</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731167&amp;GnbGroup=AllCategory&amp;Code=05">스포츠패션잡화</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731168&amp;GnbGroup=AllCategory&amp;Code=05">골프용품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731169&amp;GnbGroup=AllCategory&amp;Code=05">골프의류</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731170&amp;GnbGroup=AllCategory&amp;Code=05">구기/라켓/격투</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731171&amp;GnbGroup=AllCategory&amp;Code=05">등산/--%>
<%--                                                아웃도어</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731172&amp;GnbGroup=AllCategory&amp;Code=05">캠핑</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731173&amp;GnbGroup=AllCategory&amp;Code=05">낚시</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731174&amp;GnbGroup=AllCategory&amp;Code=05">헬스/요가</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731175&amp;GnbGroup=AllCategory&amp;Code=05">수영/물놀이</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731176&amp;GnbGroup=AllCategory&amp;Code=05">스키/스노보드</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731177&amp;GnbGroup=AllCategory&amp;Code=05">자전거/인라인/퀵보드</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731178&amp;GnbGroup=AllCategory&amp;Code=05">자동차</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2052165&amp;GnbGroup=AllCategory&amp;Code=05">나이키코리아공식</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679870&amp;GnbGroup=AllCategory&amp;Code=05">슈마커</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679865&amp;GnbGroup=AllCategory&amp;Code=05">ABC마트</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2762627&amp;GnbGroup=AllCategory&amp;Code=05">JD스포츠</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2759440&amp;GnbGroup=AllCategory&amp;Code=05">인수스</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2386151&amp;GnbGroup=AllCategory&amp;Code=05">내셔널지오그래픽</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2620264&amp;GnbGroup=AllCategory&amp;Code=05">다이나핏</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2694686&amp;GnbGroup=AllCategory&amp;Code=05">가네샤요가프랍스</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2734586&amp;GnbGroup=AllCategory&amp;Code=05">데카트론코리아--%>
<%--                                                공식</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="04" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">출산/유아동</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731207&amp;GnbGroup=AllCategory&amp;Code=04">임신/출산</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731208&amp;GnbGroup=AllCategory&amp;Code=04">기저귀/물티슈</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731209&amp;GnbGroup=AllCategory&amp;Code=04">스킨케어/위생/소독</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731210&amp;GnbGroup=AllCategory&amp;Code=04">유아--%>
<%--                                                침구/가구/매트</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731211&amp;GnbGroup=AllCategory&amp;Code=04">유모차/카시트/외출용품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731212&amp;GnbGroup=AllCategory&amp;Code=04">유아--%>
<%--                                                의류/잡화</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731213&amp;GnbGroup=AllCategory&amp;Code=04">완구</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2732613&amp;GnbGroup=AllCategory&amp;Code=04">유아동--%>
<%--                                                도서</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2482468&amp;GnbGroup=AllCategory&amp;Code=04">내--%>
<%--                                                아이가 좋아하는 IT템</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1961307&amp;GnbGroup=AllCategory&amp;Code=04">[BEANPOLE--%>
<%--                                                KIDS] 2022 S/S NEW </a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2699113&amp;GnbGroup=AllCategory&amp;Code=04">토이트론--%>
<%--                                                - LIKE A CHILD</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="06" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">주방용품</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726029&amp;GnbGroup=AllCategory&amp;Code=06">조리용기--%>
<%--                                                / 도구</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726030&amp;GnbGroup=AllCategory&amp;Code=06">식기/접시/홈세트</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726032&amp;GnbGroup=AllCategory&amp;Code=06">수납정리/소품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726031&amp;GnbGroup=AllCategory&amp;Code=06">보관용기</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726033&amp;GnbGroup=AllCategory&amp;Code=06">와인/커피용품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/searchSectItem.do?sectId=2731130&amp;GnbGroup=AllCategory&amp;Code=06">주방가전</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=427611&amp;GnbGroup=AllCategory&amp;Code=06">수입주방용품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2761833&amp;GnbGroup=AllCategory&amp;Code=06">알레보--%>
<%--                                                스페셜샵</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="18" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">생활/건강</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726024&amp;GnbGroup=AllCategory&amp;Code=18">세제/세정/탈취제</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726025&amp;GnbGroup=AllCategory&amp;Code=18">바디/헤어/구강</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726026&amp;GnbGroup=AllCategory&amp;Code=18">휴지/생리대/마스크</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726027&amp;GnbGroup=AllCategory&amp;Code=18">수납/청소/생활잡화</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2726028&amp;GnbGroup=AllCategory&amp;Code=18">건강관리/안마/실버</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="15" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">식품</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731190&amp;GnbGroup=AllCategory&amp;Code=15">농산</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731191&amp;GnbGroup=AllCategory&amp;Code=15">축산</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731192&amp;GnbGroup=AllCategory&amp;Code=15">수산</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731193&amp;GnbGroup=AllCategory&amp;Code=15">간편식/반찬</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731194&amp;GnbGroup=AllCategory&amp;Code=15">면/캔/오일/소스</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731195&amp;GnbGroup=AllCategory&amp;Code=15">떡/베이커리/과자</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731196&amp;GnbGroup=AllCategory&amp;Code=15">유제품/유아식</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731199&amp;GnbGroup=AllCategory&amp;Code=15">홍삼/전통건강식품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731198&amp;GnbGroup=AllCategory&amp;Code=15">커피/차</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731201&amp;GnbGroup=AllCategory&amp;Code=15">유산균/콜라겐</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731197&amp;GnbGroup=AllCategory&amp;Code=15">생수/음료</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731200&amp;GnbGroup=AllCategory&amp;Code=15">비타민/영양제</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2795755&amp;GnbGroup=AllCategory&amp;Code=15">클리어런스존</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="07" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">가구/침구</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731141&amp;GnbGroup=AllCategory&amp;Code=07">거실가구</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731142&amp;GnbGroup=AllCategory&amp;Code=07">침실가구/드레스룸</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731143&amp;GnbGroup=AllCategory&amp;Code=07">주방가구/테이블</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731144&amp;GnbGroup=AllCategory&amp;Code=07">학생/서재가구</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731145&amp;GnbGroup=AllCategory&amp;Code=07">리모델링--%>
<%--                                                시공/DIY</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731146&amp;GnbGroup=AllCategory&amp;Code=07">침구</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731147&amp;GnbGroup=AllCategory&amp;Code=07">커튼/카페트</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731148&amp;GnbGroup=AllCategory&amp;Code=07">인테리어소품</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679832&amp;GnbGroup=AllCategory&amp;Code=07">리바트(LIVART)</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679845&amp;GnbGroup=AllCategory&amp;Code=07">포터리반</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679846&amp;GnbGroup=AllCategory&amp;Code=07">포터리반--%>
<%--                                                키즈</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679847&amp;GnbGroup=AllCategory&amp;Code=07">웨스트엘름</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="08" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">가전/디지털</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731129&amp;GnbGroup=AllCategory&amp;Code=08">생활/미용가전</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731130&amp;GnbGroup=AllCategory&amp;Code=08">주방가전</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731131&amp;GnbGroup=AllCategory&amp;Code=08">계절가전</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731132&amp;GnbGroup=AllCategory&amp;Code=08">영상/음향--%>
<%--                                                가전</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731133&amp;GnbGroup=AllCategory&amp;Code=08">카메라/렌즈/캠코더</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731134&amp;GnbGroup=AllCategory&amp;Code=08">노트북/PC/게임</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731135&amp;GnbGroup=AllCategory&amp;Code=08">스마트기기/OA</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731136&amp;GnbGroup=AllCategory&amp;Code=08">리퍼--%>
<%--                                                가전</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679843&amp;GnbGroup=AllCategory&amp;Code=08">삼성전자--%>
<%--                                                브랜드샵</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2692354&amp;GnbGroup=AllCategory&amp;Code=08">다이슨--%>
<%--                                                브랜드샵</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1424358&amp;GnbGroup=AllCategory&amp;Code=08">하이마트--%>
<%--                                                브랜드샵</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="13" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">반려동물</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2222295&amp;GnbGroup=AllCategory&amp;Code=13">반려동물(H펫샵)</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2764739&amp;GnbGroup=AllCategory&amp;Code=13">이츠독</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2764995&amp;GnbGroup=AllCategory&amp;Code=13">펫노리터</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2722164&amp;GnbGroup=AllCategory&amp;Code=13">장보는--%>
<%--                                                강아지와 고양이</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="16" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">여행/티켓/도서</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731216&amp;GnbGroup=AllCategory&amp;Code=16">여행/숙박</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731217&amp;GnbGroup=AllCategory&amp;Code=16">서비스/e쿠폰/상품권</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731128&amp;GnbGroup=AllCategory&amp;Code=16">도서/음반</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731183&amp;GnbGroup=AllCategory&amp;Code=16">원예/꽃배달</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START--><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="19" style="display: none;">--%>
<%--                        <div class="center-area"><strong class="depth1-title">문화/렌탈/보험</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731214&amp;GnbGroup=AllCategory&amp;Code=19">렌탈</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2731215&amp;GnbGroup=AllCategory&amp;Code=19">보험/상조</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 일반 END--><!--HMALL 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679817&amp;GnbGroup=AllCategory&amp;Code=19">H렌탈샵</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1173378&amp;GnbGroup=AllCategory&amp;Code=19">바보사랑</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1148690&amp;GnbGroup=AllCategory&amp;Code=19">아트박스</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2215152&amp;GnbGroup=AllCategory&amp;Code=19">텐바이텐</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--HMALL 스페셜 END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" style="display: none;" data-catecode="10">--%>
<%--                        <div class="center-area"><strong class="depth1-title">현대백화점</strong><!--백화점-->--%>
<%--                            <div class="sub-category-area"><!--백화점 일반 START-->--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=325053&amp;GnbGroup=AllCategory&amp;Code=10">영캐주얼</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=325052&amp;GnbGroup=AllCategory&amp;Code=10">커리어/언더</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=325345&amp;GnbGroup=AllCategory&amp;Code=10">진/유니섹스</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=326244&amp;GnbGroup=AllCategory&amp;Code=10">남성정장</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=327187&amp;GnbGroup=AllCategory&amp;Code=10">남성캐주얼</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=146634&amp;GnbGroup=AllCategory&amp;Code=10">화장품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=327293&amp;GnbGroup=AllCategory&amp;Code=10">핸드백/지갑</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=327302&amp;GnbGroup=AllCategory&amp;Code=10">구두/잡화</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=326243&amp;GnbGroup=AllCategory&amp;Code=10">아동/유아</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=325425&amp;GnbGroup=AllCategory&amp;Code=10">레져/스포츠</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=146639&amp;GnbGroup=AllCategory&amp;Code=10">생활/가구</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=146638&amp;GnbGroup=AllCategory&amp;Code=10">식품</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2186849&amp;GnbGroup=AllCategory&amp;Code=10">현대아울렛</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div><!--백화점 일반 END--><!--백화점 스페셜 START-->--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1861421&amp;GnbGroup=AllCategory&amp;Code=10">RALPH--%>
<%--                                                LAUREN</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679840&amp;GnbGroup=AllCategory&amp;Code=10">스와로브스키</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=580827&amp;GnbGroup=AllCategory&amp;Code=10">CHANEL</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1196082&amp;GnbGroup=AllCategory&amp;Code=10">MAC</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1476179&amp;GnbGroup=AllCategory&amp;Code=10">URBAN--%>
<%--                                                DECAY</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1614556&amp;GnbGroup=AllCategory&amp;Code=10">TOM--%>
<%--                                                FORD BEAUTY</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1614598&amp;GnbGroup=AllCategory&amp;Code=10">Jo--%>
<%--                                                Malone London</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679875&amp;GnbGroup=AllCategory&amp;Code=10">휠라스포츠</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1379588&amp;GnbGroup=AllCategory&amp;Code=10">아디다스--%>
<%--                                                브랜드전</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=778977&amp;GnbGroup=AllCategory&amp;Code=10">명인명촌</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=411045&amp;GnbGroup=AllCategory&amp;Code=10">정관장</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2679871&amp;GnbGroup=AllCategory&amp;Code=10">부가부--%>
<%--                                                스페셜샵</a></li>--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/cosHome.do?GnbGroup=AllCategory&amp;Code=10">COS</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/aosMain.do?GnbGroup=AllCategory&amp;Code=10">＆Other--%>
<%--                                                Stories</a></li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                                <div class="brand-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2625458&amp;GnbGroup=AllCategory&amp;Code=10">메트로시티</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2626364&amp;GnbGroup=AllCategory&amp;Code=10">루이까또즈</a>--%>
<%--                                        </li>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2713968&amp;GnbGroup=AllCategory&amp;Code=10">BOSE</a>--%>
<%--                                        </li>--%>
<%--                                    </ul><!--백화점 스페셜 END--></div><!--백화점END--></div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="category-list-contents" data-catecode="09" style="display: none;">--%>
<%--                        <div class="center-area wide"><strong class="depth1-title">TV쇼핑</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=502950&amp;GnbGroup=AllCategory&amp;Code=09">패션의류</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=150549&amp;GnbGroup=AllCategory&amp;Code=09">언더웨어</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=69628&amp;GnbGroup=AllCategory&amp;Code=09">뷰티</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=216428&amp;GnbGroup=AllCategory&amp;Code=09">명품잡화</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=221473&amp;GnbGroup=AllCategory&amp;Code=09">유아동/도서</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=807410&amp;GnbGroup=AllCategory&amp;Code=09">레포츠</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=792090&amp;GnbGroup=AllCategory&amp;Code=09">홈쇼핑--%>
<%--                                                식품</a></li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/searchSectItem.do?sectId=58867&amp;GnbGroup=AllCategory&amp;Code=09">인테리어</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=147267&amp;GnbGroup=AllCategory&amp;Code=09">생활/건강</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=108163&amp;GnbGroup=AllCategory&amp;Code=09">주방용품</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=1824370&amp;GnbGroup=AllCategory&amp;Code=09">방송가전</a>--%>
<%--                                        </li><!--HMALL 일반 END--></ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <span class="tv-info"><a--%>
<%--                                    href="/p/bmc/brodPordPbdv.do?type=03&amp;GnbGroup=HmallCategory&amp;Code=09">생방송</a><a--%>
<%--                                    href="/p/bmc/brodPordPbdv.do">편성표</a></span></div>--%>
<%--                        <div class="center-area wide"><strong class="depth1-title">TV+샵</strong><!--HMALL 일반 START-->--%>
<%--                            <div class="sub-category-area">--%>
<%--                                <div class="sub-category">--%>
<%--                                    <ul>--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2264005&amp;GnbGroup=AllCategory&amp;Code=09">인테리어/침구/가구</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2264006&amp;GnbGroup=AllCategory&amp;Code=09">생활/건강/욕실</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2264007&amp;GnbGroup=AllCategory&amp;Code=09">주방용품</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2263921&amp;GnbGroup=AllCategory&amp;Code=09">언더웨어</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2264003&amp;GnbGroup=AllCategory&amp;Code=09">레포츠의류/용품</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2264004&amp;GnbGroup=AllCategory&amp;Code=09">농수축/신선/건강식품</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="/p/dpa/searchSectItem.do?sectId=2379016&amp;GnbGroup=AllCategory&amp;Code=09">대형/생활가전</a>--%>
<%--                                        </li><!--HMALL 일반 END--><!--HMALL 일반 START-->--%>
<%--                                        <li>--%>
<%--                                            <a href="http://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2686295&amp;GnbGroup=AllCategory&amp;Code=09">플러스샵--%>
<%--                                                [현대아울렛]</a></li><!--HMALL 일반 END--></ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>

            </div>
            <!-- // 카테고리 메뉴 -->
            <!-- 퀵메뉴 -->
            <div class="quick-menu-wrap">
                <div class="quick-menu-list">
                    <ul class="quicklink ql-left222" id="main_tab">

                        <li class=" ">
                            <a href="/p/bmc/brodPordPbdv.do?type=03?_IC_=tab1&mainDispSeq=2&" class="gp_className"
                               ga-category="메인 홈" ga-action="상단탭" ga-label="편성표">편성표</a></li>

                        <li class=" ">
                            <a href="/p/home.do?_IC_=tab2&mainDispSeq=1&" class="gp_className" ga-category="메인 홈"
                               ga-action="상단탭" ga-label="스토어">스토어</a></li>

                        <li class="current ">
                            <a href="/p/tvMainR.do?_IC_=tab3&mainDispSeq=3&" class="gp_className" ga-category="메인 홈"
                               ga-action="상단탭" ga-label="홈">홈</a></li>

                        <li class=" ">
                            <a href="/p/mktgMain.do?_IC_=tab4&mainDispSeq=62&" class="gp_className" ga-category="메인 홈"
                               ga-action="상단탭" ga-label="슈퍼H페스타">슈퍼H페스타</a></li>

                        <li class=" ">
                            <a href="/p/dsMainR.do?_IC_=tab5&mainDispSeq=6&" class="gp_className" ga-category="메인 홈"
                               ga-action="상단탭" ga-label="백화점">백화점</a></li>

                        <li class=" ">
                            <a href="/p/todayOpenDeal.do?_IC_=tab6&mainDispSeq=48&" class="gp_className"
                               ga-category="메인 홈" ga-action="상단탭" ga-label="오늘추천">오늘추천</a></li>

                        <li class=" ">
                            <a href="/pevent/eva/evntMainPage.do?_IC_=tab7&mainDispSeq=7&" class="gp_className"
                               ga-category="메인 홈" ga-action="상단탭" ga-label="이벤트">이벤트</a></li>

                        <li class=" point">
                            <a href="/p/dpd/wkBestTypeTot.do?_IC_=tab8&mainDispSeq=21&" class="gp_className"
                               ga-category="메인 홈" ga-action="상단탭" ga-label="주간베스트">주간베스트</a></li>

                    </ul>
                </div>

            </div>
            <!-- // 퀵메뉴-->
            <!-- 유틸메뉴 -->
            <div class="header-util">
                <h2 class="hiding">유틸메뉴</h2>
                <!-- 로그인 전 -->
                <ul style="display: flex;">
                    <sec:authorize access="isAnonymous()">
                        <li><a ga-category="헤더" ga-action="로그인" href="${contextPath}/customLogin"
                               onclick="openLoginTag('','^헤더^로그인');return false;">로그인</a></li>
                        <li><a href="${contextPath}/user/signup">회원가입</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication property="principal" var="pinfo"/>
                        <li><a href="mypage">${pinfo.userVO.user_name}님</a></li>
                        <li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
                        <form id="logout-form" action='<c:url value='/customLogout'/>' method="POST">
                            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                        </form>
                    </sec:authorize>
                    <li><a ga-category="헤더" ga-action="고객센터"
                           href="javascript:bizSpringTag('/p/cca/main.do','^헤더^고객센터');">고객센터</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
</html>