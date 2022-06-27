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
        <div class="gird-l2x">
            <div class="side-content">
                <ul class="detail-filter-list">
                    <li>
                        <input id="filter-title-14" class="filter-title _rescan _def" type="checkbox"
                               name="detail-filter" checked="checked">
                        <label for="filter-title-14" class="filter-label">
                            <span><em style="font-size: larger;">${categoryVO.category_name}내 검색</em></span>
                        </label>
                        <button type="button" class="btn init" onclick="javascript:initKeyword($('#searchKeyword').val(), ${categoryVO.category_seq}, $('.ui-active').val());"><i
                                class="icon"></i><span>검색초기화</span></button>
                        <div class="filter-content">
                            <div class="except-search">
                                <div class="inputbox">
                                    <label class="inplabel" for="searchKeyword">
                                        <c:choose>
                                            <c:when test="${search_text == ''}">
                                                <input type="text" id="searchKeyword" name="searchKeyword" on onkeypress="javascript:if(event.keyCode==13) {search($('#searchKeyword').val(), ${categoryVO.category_seq}, $('.ui-active').val());}" placeholder="검색어를 입력하세요" title="검색어를 입력하세요"></label>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" id="searchKeyword" name="searchKeyword" on onkeypress="javascript:if(event.keyCode==13) {search($('#searchKeyword').val(), ${categoryVO.category_seq}, $('.ui-active').val());}" placeholder="검색어를 입력하세요" title="검색어를 입력하세요" value="${search_text}"></label>
                                            </c:otherwise>
                                        </c:choose>
                                </div>
                                <button type="button" class="btn btn-lineblack" id="searchKeywordBtn"
                                        onclick="javascript:search($('#searchKeyword').val(), ${categoryVO.category_seq}, $('.ui-active').val());">
                                    <span>적용</span></button>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="contents" id="pl_main">
                <div class="display-list-wrap" id="itemListArea">
                    <h2 class="title30" first_category="${categoryVO.category_seq}">
                        <span style="font-size: unset;">${categoryVO.category_name}</span> <em id="product-count">(${total})</em>
                    </h2>
                    <ul class="ui-tab _selectCategory" role="tablist">
                        <c:forEach items="${subCategoryList}" var="subCategory">
                            <c:choose>
                                <c:when test="${curr_category == subCategory.category_seq}">
                                    <li role="presentation" class="autoCate ui-active" value="${subCategory.category_seq}"><a
                                            onclick="javascript:searchAutoCate(this, ${categoryVO.category_seq}, ${subCategory.category_seq});"
                                            role="tab">${subCategory.category_name}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li role="presentation" class="autoCate" value="${subCategory.category_seq}"><a
                                            onclick="javascript:searchAutoCate(this, ${categoryVO.category_seq}, ${subCategory.category_seq});"
                                            role="tab">${subCategory.category_name}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </ul>
                    <div class="list-sort-area">
                        <div class="sortOption">
                            <c:forEach items="${sortVOList}" var="sortVO">
                                <c:choose>
                                    <c:when test="${curr_sort == sortVO.sort_value}">
                                        <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="${sortVO.sort_value}" class="active">
                                            <input type="hidden" class="sort" value="REG_DTM@DESC">${sortVO.sort_name}
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="javascript://" onclick="javascript:searchSortProc(this, ${categoryVO.category_seq});" sort="${sortVO.sort_value}">
                                            <input type="hidden" class="sort" value="REG_DTM@DESC">${sortVO.sort_name}
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- 선택필터 노출영역 -->
                    <div class="selected-filter-list" style="display:none">
                        <ul data-modules-scrollitems="align:center;" class="prev-disabled"></ul>
                        <a href="javascript:searchInit();" class="reload"><i class="icon"></i><span>초기화</span></a>
                    </div>

                    <div class="pdlist-wrap" id="pdListDiv">
                        <ul>
                            <c:forEach items="${productVOList}" var="productVO">
                                <li class="pdthumb">
                                    <a href="/product/detail?product_seq=${productVO.PRODUCT_SEQ}&page_num=1">
                                        <div class="thumb">
                                            <img src="/resources/img/${productVO.IMAGE_NAME}.jpg" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')" img404="http://localhost:8080/resources/img/undefined.jpg">
                                        </div>
                                        <div class="figcaption">
                                            <div class="pdname" aria-label="제품명">
                                                    ${productVO.PRODUCT_NAME}
                                            </div>

                                            <c:choose>
                                                <c:when test="${productVO.DISCOUNTED_COST == productVO.PRODUCT_COST}">
                                                    <div class="pdprice">
                                                    <span class="rateprice" aria-label="정상가 가격">
                                                        <p class="discount" aria-label="정상가"><em><fmt:formatNumber value="${productVO.PRODUCT_COST}" pattern="#,###"/></em>원</p>
                                                    </span>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="pdprice">
                                                    <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                        <p class="discount" aria-label="할인가"><em><fmt:formatNumber value="${productVO.DISCOUNTED_COST}" pattern="#,###"/></em>원</p>
                                                        <em class="rate" aria-label="할인율">${productVO.COUPON_RATIO}<i>%</i></em>
                                                        <del class="normal" aria-label="정상가"><fmt:formatNumber value="${productVO.PRODUCT_COST}" pattern="#,###"/></del>
                                                    </span>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="pdinfo">
                                                <div class="benefits" style="line-height: 20px;">
                                                    <span class="flag hdshop"> <em>적립금</em></span>
                                                    <span><fmt:formatNumber value="${productVO.DISCOUNTED_COST * 0.05}" pattern="#,###"/>원</span>
                                                </div>
                                                <p class="like-count">
                                                    <em><fmt:formatDate value="${productVO.CREATED_AT}" pattern="yyyy-MM-dd"/></em>
                                                    <b>(${productVO.SELL_COUNT})</b>
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                        <i class="icon"></i>새창열기
                                    </a>
                                    <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                        <a href="javascript:;" class="btn btn-like" data-modules-modal="target:#broadcast-channel-info" onclick="image_show(${productVO.PRODUCT_SEQ})">
                                            <i class="icon"></i><span class="hiding">찜</span></a>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="paging">
                        <div class="page-prevarea">
                            <div class="page-prevarea">
                                <c:if test="${pageMaker.prev}">
                                    <a onclick="paging(this, 1)"
                                       class="page-first" aria-label="처음페이지 이동">
                                        <i class="icon"></i><span class="hiding">처음페이지 이동</span>
                                    </a>
                                </c:if>
                                <c:if test="${pageMaker.prev}">
                                    <a onclick="paging(this, ${pageMaker.startPage} - 1)"
                                       class="page-prev" aria-label="이전페이지 이동">
                                        <i class="icon"></i><span class="hiding">이전페이지 이동</span>
                                    </a>
                                </c:if>
                                <c:forEach var="num" begin="${pageMaker.startPage}"
                                           end="${pageMaker.endPage}">
                                    <c:choose>
                                        <c:when test="${pageMaker.cri.pageNum == num}">
                                            <strong class="checkedPage" id="page${num}">${num}</strong>
                                        </c:when>
                                        <c:otherwise>
                                            <a onclick="paging(this, ${num})" id="page${num}">${num}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:if test="${pageMaker.next}">
                                    <a onclick="paging(this, ${pageMaker.endPage} + 1)"
                                       class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span class="hiding">다음페이지 이동</span></a>
                                </c:if>
                                <c:if test="${pageMaker.cri.pageNum != pageMaker.realEnd}">
                                    <a onclick="paging(this, ${pageMaker.realEnd})"
                                       class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span class="hiding">마지막페이지 이동</span></a>
                                </c:if>
                             </div>

                            <input id="ajaxSearchCnt" type="hidden" value="(45,670)">
                        </div>
                        <div class="ui-modal broadcast-channel-info" id="broadcast-channel-info" tabindex="-1"
                             role="dialog"
                             aria-label="방송채널 안내" style="z-index: 1031; display: none;">
                            <div class="ui-modal-dialog" role="document">
                                <div class="content">
                                    <p cgitlass="ui-title" style="font-size: initial;"></p>
                                    <!-- //.content-head mm -->
                                    <div class="content-body">
                                        <div class="product-banner-wrap">
                                            <div data-modules-imageviewer="">
                                                <div class="product-mainbanner slick-initialized slick-slider isArrows"
                                                     data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:5;">
                                                    <button class="slick-prev slick-arrow" aria-label="Previous"
                                                            type="button" style="">Previous
                                                    </button>
                                                    <div class="slick-list" style="height: 520px">
                                                        <div class="slick-track"
                                                             style="opacity: 1; width: 6240px; transform: translate(-520px, 0px);">
                                                        </div>
                                                    </div>
                                                    <button class="slick-next slick-arrow" aria-label="Next"
                                                            type="button"
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
                                    <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                            class="hiding" style="display: none">레이어 닫기</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="/resources/js/productAll.js"></script>
