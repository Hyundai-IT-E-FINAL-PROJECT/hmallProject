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

    <!-- ajax 새로고침 영역 설정-->
    <div id="reflashArea" class="container" style="margin-top: 68px">


        <!-- 매장전시이주형 searchResult 변수를 중복사용하고 있어서 다른 변수로 선언함 -->


        <form name="searchPageNation" action="/p/dpa/searchSectItem.do?sectId=2731753" method="post"></form>


        <!-- 검색을 위한 Form 영역 -->
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

                <!-- 필터 -->

                <div class="side-content">
                    <ul class="detail-filter-list">

                        <!-- 매장 내 검색 -->
                        <li>
                            <input id="filter-title-14" class="filter-title _rescan _def" type="checkbox" name="detail-filter" checked="checked">
                            <label for="filter-title-14" class="filter-label">
                                <span><em>매장 내 검색</em></span>
                            </label>
                            <button type="button" class="btn init" onclick="javascript:initKeyword();"><i class="icon"></i><span>검색초기화</span></button>

                            <div class="filter-content">
                                <div class="except-search">
                                    <div class="inputbox">
                                        <label class="inplabel" for="searchKeyword"><input type="text" id="searchKeyword" name="searchKeyword" onkeydown="return keydownKeyword(event);" placeholder="검색어를 입력하세요" title="검색어를 입력하세요"></label>
                                    </div>
                                    <button type="button" class="btn btn-lineblack" id="searchKeywordBtn" onclick="javascript:search($('#searchKeyword').val(), ${categoryVO.category_seq}, $('.ui-active').val());"><span>적용</span></button>
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







                        <h2 class="title30"><span>${categoryVO.category_name}</span> <em>(${productVOList.size()})</em></h2>


                        <!-- 선택된 탭 표시 -->

                        <ul class="ui-tab _selectCategory" role="tablist">
                            <!-- 전체 -->
                            <li role="presentation" class="autoCate ui-active" value=""><a onclick="javascript:searchAutoCate(this, ${categoryVO.category_seq}, 0);" role="tab">전체</a></li>
<%--                            다른 하위 카테고리--%>
                            <c:forEach items="${subCategoryList}" var="subCategory">
                                <li role="presentation" class="autoCate" value="${subCategory.category_seq}"><a onclick="javascript:searchAutoCate(this, ${categoryVO.category_seq}, ${subCategory.category_seq});" role="tab">${subCategory.category_name}</a></li>
                            </c:forEach>

                        </ul>


                        <div class="list-sort-area">
                            <div class="sortOption">
                                <!--// 활성화시 a태그에 active 클래스 추가 REG_DTM@DESC-->


                                <a href="javascript://" onclick="javascript:searchSortProc(this);" class="active">
                                    <input type="hidden" class="sort" value="REG_DTM@DESC">최근등록순
                                </a>






                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                    <input type="hidden" class="sort" value="SELL_QTY@DESC">많이팔린순
                                </a>





                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                    <input type="hidden" class="sort" value="BASIC@DESC">MD추천순
                                </a>





                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                    <input type="hidden" class="sort" value="SELL_PRC@ASC">낮은가격순
                                </a>





                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                    <input type="hidden" class="sort" value="SELL_PRC@DESC">높은가격순
                                </a>





                                <a href="javascript://" onclick="javascript:searchSortProc(this);">
                                    <input type="hidden" class="sort" value="ITEM_EVAL_CNT@DESC">상품평수순
                                </a>


                            </div>

                            <div class="sort-form">

                            </div>

                            <div class="selectwrap"><div id="selectListSize" class="custom-selectbox sm" data-modules-selectbox="">
                                <select id="listSize" onchange="javascript:listSubmit(this);">
                                    <option value="30">30개씩 보기</option>
                                    <option value="60" selected="selected">60개씩 보기</option>
                                    <option value="120">120개씩 보기</option>
                                </select>
                                <input type="hidden" name="f" value="on">
                                <div class="ui-label"><a href="#2">60개씩 보기</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">30개씩 보기</a></li><li><a href="#2">60개씩 보기</a></li><li><a href="#3">120개씩 보기</a></li></ul></div></div></div></div>
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
                                        <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->

                                        <a href="/product/detail?product_seq=${productVO.PRODUCT_SEQ}" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141512848&amp;sectId=431541', 'DV0001_U02', 'A');">
                                            <div class="thumb">

                                                <img src="/resources/img/${productVO.IMAGE_NAME}.jpg" alt="[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm" id="2141512848_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="제품명">
                                                        ${productVO.PRODUCT_NAME}
                                                </div>

                                                <c:choose>
                                                    <c:when test="${productVO.PRODUCT_COST == productVO.DISCOUNTED_COST}">
                                                        <div class="pdprice">
                                                            <span class="rateprice" aria-label="정상가 가격">
                                                                <p class="discount" aria-label="정상가"><em><fmt:formatNumber value="${productVO.PRODUCT_COST}" pattern="#,###"/></em>원</p>
                                                            </span>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${productVO.PRODUCT_COST != productVO.DISCOUNTED_COST}">
                                                        <div class="pdprice">
                                                            <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                <p class="discount" aria-label="할인가"><em><fmt:formatNumber value="${productVO.DISCOUNTED_COST}" pattern="#,###"/></em>원</p>
                                                                <em class="rate" aria-label="할인율">${productVO.COUPON_RATIO}<i>%</i></em>
                                                                <del class="normal" aria-label="정상가"><fmt:formatNumber value="${productVO.PRODUCT_COST}" pattern="#,###"/></del>
                                                            </span>
                                                        </div>
                                                    </c:when>
                                                </c:choose>

                                                <div class="pdinfo">
                                                    <div class="benefits" style="line-height: 20px;">
                                                        <span class="flag hdshop"> <em>적립금</em></span>
                                                        <span><fmt:formatNumber value="${productVO.DISCOUNTED_COST * 0.05}" pattern="#,###"/>원</span>
                                                    </div>
                                                    <p class="like-count">
                                                        <em>4.5점</em>
                                                        <b>(2)</b>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                            <i class="icon"></i>새창열기
                                        </a>
                                        <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                            <a href="javascript:;" class="btn btn-like" data-modules-modal="target:#broadcast-channel-info"">
                                                <i class="icon"></i><span class="hiding">찜</span></a>
                                        </div>
                                    </li>
                                </c:forEach>
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





                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=11&amp;sort=REG_DTM%40DESC" class="page-next" aria-label="다음페이지 이동"><i class="icon"></i><span class="hiding">다음페이지 이동</span></a>



                                <a href="/p/dpa/searchSectItem.do?sectId=2731753&amp;page=762&amp;sort=REG_DTM%40DESC" class="page-last" aria-label="마지막페이지 이동"><i class="icon"></i><span class="hiding">마지막페이지 이동</span></a>

                            </div>



                        </div>



                        <input id="ajaxSearchCnt" type="hidden" value="(45,670)">

                    </div>

                    <div class="ui-modal broadcast-channel-info" id="broadcast-channel-info" tabindex="-1" role="dialog" aria-label="방송채널 안내" style="z-index: 1031; display: none;">
                        <div class="ui-modal-dialog" role="document">
                            <div class="content">
                                <p class="ui-title">방송채널 안내</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <div class="tblwrap">
                                        <table>
                                            <caption>방송채널 안내 항목 - 방송사, TV쇼핑, TV+샵</caption>
                                            <colgroup>
                                                <col style="width:calc(100%/3);">
                                                <col style="width:calc(100%/3);">
                                                <col style="width:calc(100%/3);">
                                            </colgroup>
                                            <thead>
                                            <tr>
                                                <th scope="col">방송사</th>
                                                <th scope="col">TV쇼핑</th>
                                                <th scope="col">TV+샵</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-olleh.png" alt="olleh"></td>
                                                <td class="txt-center">10번</td>
                                                <td class="txt-center">36번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-skbroadband.png" alt="SK broadband"></td>
                                                <td class="txt-center">8번</td>
                                                <td class="txt-center">39번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-lgu.png" alt="LG U+"></td>
                                                <td class="txt-center"><strong class=" color-ff5340">12번</strong></td>
                                                <td class="txt-center">34번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-skylife.png" alt="skylife"></td>
                                                <td class="txt-center">6번</td>
                                                <td class="txt-center">26번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-lghellovision.png" alt="LG HelloVision"></td>
                                                <td class="txt-center">13번</td>
                                                <td class="txt-center"><strong class=" color-ff5340">36번</strong></td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-tboard.png" alt="t broad"></td>
                                                <td class="txt-center">6번</td>
                                                <td class="txt-center">33번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-dlive.png" alt="D'LiVE"></td>
                                                <td class="txt-center">6번</td>
                                                <td class="txt-center">37번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-hyundai.png" alt="현대 HCN"></td>
                                                <td class="txt-center">10번</td>
                                                <td class="txt-center">22번</td>
                                            </tr>
                                            <tr>
                                                <td class="txt-center"><img src="//image.hmall.com/p/img/co/img-cmb.png" alt="CMB"></td>
                                                <td class="txt-center">8번</td>
                                                <td class="txt-center">-</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="btngroup">
                                        <button class="btn btn-default" data-dismiss="modal"><span>닫기</span></button>
                                        <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
                                    </div>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                </div>
                <!-- //.contents -->
            </div>
        </form></div>
    <!-- //.container -->

</main>
<script src="/resources/js/productAll.js"></script>
