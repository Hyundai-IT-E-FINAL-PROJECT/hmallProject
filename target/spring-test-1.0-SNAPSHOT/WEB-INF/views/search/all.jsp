<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: gimjihye
  Date: 2022/05/26
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main class="cmain main" role="main" id="mainContents">
    <div id="reflashArea" class="container" style="margin-top: 68px">
        <form name="searchPageNation" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post"></form>
        <form name="pdeSearchForm" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post">
            <div class="pdeSearchFormHiddenInput" style="display: none">
                <input type="hidden" class="nonClear" name="weightYn" value="">
                <input type="hidden" name="sectDispGbcd" value="01"> <!-- 화면에서만 사용하는 변수 -->

                <input type="hidden" name="page" value="1">
                <input type="hidden" class="nonClear" name="listSize" value="60"><!-- listSize -->
                <input type="hidden" name="sort" value="REG_DTM@DESC"><!-- sort -->

                <input type="hidden" name="itemListType" value="type1"><!-- 상품 가로[type2], 세로[type1] -->

                <input type="hidden" name="priceFlag" value="">

                <input type="hidden" name="csfLCat" value=""><!-- csfLCat -->
                <input type="hidden" name="csfMCat" value=""><!-- csfMCat -->
                <input type="hidden" name="csfSCat" value=""><!-- csfSCat -->
                <input type="hidden" name="csfDCat" value=""><!-- csfDCat -->
                <input type="hidden" name="csfNameCode" value=""><!-- csfNameCode -->
                <input type="hidden" name="csfDepth" value="A"><!-- csfDepth -->

                <!-- 매장에서 넘어오는 param -->


                <!-- //매장에서 넘어오는 param -->


                <input type="hidden" name="brodMore" value="">

                <input type="hidden" name="logYn" value="">
                <input type="hidden" name="hmPdOnly" value="N">

                <input type="hidden" name="searchTerm" value="A">
                <input type="hidden" name="autoCate" value="">
            </div>
            <div class="gird-l2x">
                <div class="side-content">
                    <ul class="detail-filter-list">
                        <li>
                            <input id="filter-title-14" class="filter-title _rescan _def" type="checkbox"
                                   name="detail-filter" checked="checked">
                            <label for="filter-title-14" class="filter-label">
                                <span><em>매장 내 검색</em></span>
                            </label>
                            <button type="button" class="btn init" onclick="javascript:initKeyword();"><i class="icon"></i><span>검색초기화</span></button>
                            <div class="filter-content">
                                <div class="except-search">
                                    <div class="inputbox">
                                        <label class="inplabel" for="searchKeyword"><input type="text"
                                                                                           id="searchKeyword"
                                                                                           name="searchKeyword"
                                                                                           onkeydown="return keydownKeyword(event);"
                                                                                           placeholder="검색어를 입력하세요"
                                                                                           title="검색어를 입력하세요"></label>
                                    </div>
                                    <button type="button" class="btn btn-lineblack" id="searchKeywordBtn"
                                            onclick="javascript:search($('#searchKeyword').val(), ${categoryVO.category_seq}, $('.ui-active').val());">
                                        <span>적용</span></button>
                                </div>
                            </div>
                        </li>
                        <!-- 매장 내 검색 // -->

                    </ul>
                    <!-- //.detail-filter-list -->
                </div>
                <!-- //.side-content -->
                <!-- 필터 //-->

                <div class="contents" id="pl_main">
                    <div class="display-list-wrap" id="itemListArea">
                        <h2 class="title30" first_category="${categoryVO.category_seq}"><span>${categoryVO.category_name}</span> <em>(${productVOList.size()})</em></h2>
                        <ul class="ui-tab _selectCategory" role="tablist">
                            <li role="presentation" class="autoCate ui-active" value=""><a
                                    onclick="javascript:searchAutoCate(this, ${categoryVO.category_seq}, 0);"
                                    role="tab">전체</a></li>
                            <c:forEach items="${subCategoryList}" var="subCategory">
                                <li role="presentation" class="autoCate" value="${subCategory.category_seq}"><a
                                        onclick="javascript:searchAutoCate(this, ${categoryVO.category_seq}, ${subCategory.category_seq});"
                                        role="tab">${subCategory.category_name}</a></li>
                            </c:forEach>
                        </ul>
                        <div class="list-sort-area">
                            <div class="sortOption">
                                <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="date" class="active">
                                    <input type="hidden" class="sort" value="REG_DTM@DESC">최근등록순
                                </a>
                                <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="sell">
                                    <input type="hidden" class="sort" value="SELL_QTY@DESC">많이팔린순
                                </a>
                                <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="date">
                                    <input type="hidden" class="sort" value="BASIC@DESC">MD추천순
                                </a>
                                <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="low_cost">
                                    <input type="hidden" class="sort" value="SELL_PRC@ASC">낮은가격순
                                </a>
                                <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="high_cost">
                                    <input type="hidden" class="sort" value="SELL_PRC@DESC">높은가격순
                                </a>
                                <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="date">
                                    <input type="hidden" class="sort" value="ITEM_EVAL_CNT@DESC">상품평수순
                                </a>
                            </div>

                            <div class="sort-form">

                            </div>

                            <div class="selectwrap">
                                <div id="selectListSize" class="custom-selectbox sm" data-modules-selectbox="">
                                    <select id="listSize" onchange="javascript:listSubmit(this);">
                                        <option value="30">30개씩 보기</option>
                                        <option value="60" selected="selected">60개씩 보기</option>
                                        <option value="120">120개씩 보기</option>
                                    </select>
                                    <input type="hidden" name="f" value="on">
                                    <div class="ui-label"><a href="#2">60개씩 보기</a></div>
                                    <div class="ui-selectbox">
                                        <div class="selectbox_area">
                                            <ul>
                                                <li><a href="#1">30개씩 보기</a></li>
                                                <li><a href="#2">60개씩 보기</a></li>
                                                <li><a href="#3">120개씩 보기</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 선택필터 노출영역 -->
                        <div class="selected-filter-list" style="display:none">
                            <ul data-modules-scrollitems="align:center;" class="prev-disabled"></ul>
                            <a href="javascript:searchInit();" class="reload"><i class="icon"></i><span>초기화</span></a>
                        </div>

                        <div class="pdlist-wrap" id="pdListDiv">
                            <ul>
                            </ul>
                        </div>

                        <div class="paging">
                            <div class="page-prevarea">
                                <strong aria-label="현재 선택페이지">1</strong>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=2&amp;sort=REG_DTM%40DESC">2</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=3&amp;sort=REG_DTM%40DESC">3</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=4&amp;sort=REG_DTM%40DESC">4</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=5&amp;sort=REG_DTM%40DESC">5</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=6&amp;sort=REG_DTM%40DESC">6</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=7&amp;sort=REG_DTM%40DESC">7</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=8&amp;sort=REG_DTM%40DESC">8</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=9&amp;sort=REG_DTM%40DESC">9</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=10&amp;sort=REG_DTM%40DESC">10</a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=11&amp;sort=REG_DTM%40DESC"
                                   class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span class="hiding">다음페이지 이동</span></a>
                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=762&amp;sort=REG_DTM%40DESC"
                                   class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span class="hiding">마지막페이지 이동</span></a>
                            </div>


                        </div>

                        <input id="ajaxSearchCnt" type="hidden" value="(45,670)">
                    </div>
                    <div class="ui-modal broadcast-channel-info" id="broadcast-channel-info" tabindex="-1" role="dialog"
                         aria-label="방송채널 안내" style="z-index: 1031; display: none;">
                        <div class="ui-modal-dialog" role="document">
                            <div class="content">
                                <p class="ui-title" style="font-size: initial;"></p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <div class="product-banner-wrap">
                                        <div data-modules-imageviewer="">
                                            <div class="product-mainbanner slick-initialized slick-slider isArrows"
                                                 data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:5;">
                                                <button class="slick-prev slick-arrow" aria-label="Previous"
                                                        type="button" style="">Previous
                                                </button>
                                                <div class="slick-list">
                                                    <div class="slick-track" style="opacity: 1; width: 6240px; transform: translate(-520px, 0px);">
                                                    </div>
                                                </div>
                                                <button class="slick-next slick-arrow" aria-label="Next" type="button"
                                                        style="">Next
                                                </button>
                                            </div>
                                            <div class="ui-angle"
                                                 style="display: none; width: 260px; height: 260px; top: 79px; left: 260px;"></div>
                                        </div>
                                        <div class="slider-thumbnaii ">
                                            <ul>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                </div>
                <!-- //.contents -->
            </div>
        </form>
    </div>
</main>
<script src="/resources/js/productAll.js"></script>
