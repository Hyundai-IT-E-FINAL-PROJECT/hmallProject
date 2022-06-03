<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <button type="button" class="btn btn-lineblack" id="searchKeywordBtn"><span>적용</span></button>
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
                            <li role="presentation" class="autoCate ui-active"><a onclick="javascript:searchAutoCate(this);" role="tab">전체</a></li>
<%--                            다른 하위 카테고리--%>
                            <c:forEach items="${subCategoryList}" var="subCategory">
                                <li role="presentation" class="autoCate "><a onclick="javascript:searchAutoCate(this, 4);" role="tab">${subCategory.category_name}</a></li>
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
                                <li class="pdthumb">
                                    <a href="javascript://" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141573456&amp;sectId=2731753', 'DV0001_U02', 'A');">
                                        <div class="thumb">
                                            <img src="https://image.hmall.com/static/4/3/57/41/2141573456_0.jpg?RS=300x300&amp;AR=0" alt="[하프클럽/탑보이]11 빅사이즈 베이직 엠보 7부 반팔티 (BTBS_986)" id="2141573456_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
                                        </div>
                                        <div class="figcaption">
                                            <div class="pdname" aria-label="제품명">
                                                [하프클럽/탑보이]11 빅사이즈 베이직 엠보 7부 반팔티 (BTBS_986)
                                            </div>

                                            <div class="pdprice">
                                                <span class="rateprice" aria-label="정상가 가격">
                                                    <p class="discount" aria-label="정상가"><em>27,720</em>원</p>
                                                </span>
                                            </div>

                                            <div class="pdinfo">
                                                <div class="benefits" style="line-height: 20px;">
                                                    <span>무료배송</span>
                                                </div>
                                                <p class="like-count">
                                                </p>
                                            </div>
                                        </div>
                                    </a>
                                    <a href="javascript://" onclick="sendSlitmClickNewWin('[하프클럽/탑보이]11 빅사이즈 베이직 엠보 7부 반팔티 (BTBS_986)','2141573456','검색결과','/p/pda/itemPtc.do?slitmCd=2141573456&amp;overL=nw');" class="hoverview">
                                        <i class="icon"></i>새창열기
                                    </a>
                                    <div class="alimlike" data-slitmcd="2141573456" data-bsitmcd="2141573456">

                                        <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','016092','P324151979','2141573456', event);">
                                            <i class="icon"></i><span class="hiding">찜</span></a>
                                    </div>
                                </li>
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

                    <!-- 브랜드 더보기 레이어 영역 as-is class="pl_dim" 참고-->
                    <div class="ui-modal brand-detail" id="brandDetail" tabindex="-1" role="dialog" aria-label="브랜드 더보기">
                        <div class="ui-modal-dialog" role="document">
                            <div class="content">
                                <p class="ui-title">브랜드 더보기</p>
                                <div class="inputbox md">
                                    <label class="inplabel icon-find">
                                        <input type="text" name="pl_brands_searchform_search" id="pl_brands_searchform_search" onkeyup="brandTxtSearchKeyUpEvent();" onkeydown="brandTxtSearchKeyEvent();" placeholder="브랜드 검색">
                                    </label>
                                    <button class="btn btn-find" type="button" onclick="brandLayerTxtSearch();"><i class="icon find"></i><span class="hiding">검색</span></button>
                                    <button class="btn ico-clearabled" type="button" id="brandKeywordClear" onclick="javascript:brandClearWord();"><i class="icon"></i><span class="hiding">지우기</span></button>
                                </div>
                                <!-- class="selectall" "active" "disabled" -->
                                <ul class="brand-filtermenu" id="pl_brands_brandlist">
                                    <li><a href="#all" onclick="brandSelectLayerProc(this, 'selectall');" class="selectall"><span>전체</span></a></li>
                                    <li class="brandAllH_A disabled"><a href="#brandAllH_A"><span>A</span></a></li>
                                    <li class="brandAllH_B disabled"><a href="#brandAllH_B"><span>B</span></a></li>
                                    <li class="brandAllH_C disabled"><a href="#brandAllH_C"><span>C</span></a></li>
                                    <li class="brandAllH_D disabled"><a href="#brandAllH_D"><span>D</span></a></li>
                                    <li class="brandAllH_E disabled"><a href="#brandAllH_E"><span>E</span></a></li>
                                    <li class="brandAllH_F disabled"><a href="#brandAllH_F"><span>F</span></a></li>
                                    <li class="brandAllH_G disabled"><a href="#brandAllH_G"><span>G</span></a></li>
                                    <li class="brandAllH_H disabled"><a href="#brandAllH_H"><span>H</span></a></li>
                                    <li class="brandAllH_I disabled"><a href="#brandAllH_I"><span>I</span></a></li>
                                    <li class="brandAllH_J disabled"><a href="#brandAllH_J"><span>J</span></a></li>
                                    <li class="brandAllH_K disabled"><a href="#brandAllH_K"><span>K</span></a></li>
                                    <li class="brandAllH_L disabled"><a href="#brandAllH_L"><span>L</span></a></li>
                                    <li class="brandAllH_M disabled"><a href="#brandAllH_M"><span>M</span></a></li>
                                    <li class="brandAllH_N disabled"><a href="#brandAllH_N"><span>N</span></a></li>
                                    <li class="brandAllH_O disabled"><a href="#brandAllH_O"><span>O</span></a></li>
                                    <li class="brandAllH_P disabled"><a href="#brandAllH_P"><span>P</span></a></li>
                                    <li class="brandAllH_Q disabled"><a href="#brandAllH_Q"><span>Q</span></a></li>
                                    <li class="brandAllH_R disabled"><a href="#brandAllH_R"><span>R</span></a></li>
                                    <li class="brandAllH_S disabled"><a href="#brandAllH_S"><span>S</span></a></li>
                                    <li class="brandAllH_T disabled"><a href="#brandAllH_T"><span>T</span></a></li>
                                    <li class="brandAllH_U disabled"><a href="#brandAllH_U"><span>U</span></a></li>
                                    <li class="brandAllH_V disabled"><a href="#brandAllH_V"><span>V</span></a></li>
                                    <li class="brandAllH_W disabled"><a href="#brandAllH_W"><span>W</span></a></li>
                                    <li class="brandAllH_X disabled"><a href="#brandAllH_X"><span>X</span></a></li>
                                    <li class="brandAllH_Y disabled"><a href="#brandAllH_Y"><span>Y</span></a></li>
                                    <li class="brandAllH_Z disabled"><a href="#brandAllH_Z"><span>Z</span></a></li>
                                    <li class="brandAllH_a disabled"><a href="#brandAllH_a"><span>ㄱ</span></a></li>
                                    <li class="brandAllH_b disabled"><a href="#brandAllH_b"><span>ㄴ</span></a></li>
                                    <li class="brandAllH_c disabled"><a href="#brandAllH_c"><span>ㄷ</span></a></li>
                                    <li class="brandAllH_d disabled"><a href="#brandAllH_d"><span>ㄹ</span></a></li>
                                    <li class="brandAllH_e disabled"><a href="#brandAllH_e"><span>ㅁ</span></a></li>
                                    <li class="brandAllH_f disabled"><a href="#brandAllH_f"><span>ㅂ</span></a></li>
                                    <li class="brandAllH_g disabled"><a href="#brandAllH_g"><span>ㅅ</span></a></li>
                                    <li class="brandAllH_h disabled"><a href="#brandAllH_h"><span>ㅇ</span></a></li>
                                    <li class="brandAllH_i disabled"><a href="#brandAllH_i"><span>ㅈ</span></a></li>
                                    <li class="brandAllH_j disabled"><a href="#brandAllH_j"><span>ㅊ</span></a></li>
                                    <li class="brandAllH_k disabled"><a href="#brandAllH_k"><span>ㅋ</span></a></li>
                                    <li class="brandAllH_l disabled"><a href="#brandAllH_l"><span>ㅌ</span></a></li>
                                    <li class="brandAllH_m disabled"><a href="#brandAllH_m"><span>ㅍ</span></a></li>
                                    <li class="brandAllH_n disabled"><a href="#brandAllH_n"><span>ㅎ</span></a></li>
                                    <li class="brandAllH_0 disabled"><a href="#brandAllH_0"><span>0</span></a></li>
                                    <li class="brandAllH_1 disabled"><a href="#brandAllH_1"><span>1</span></a></li>
                                    <li class="brandAllH_2 disabled"><a href="#brandAllH_2"><span>2</span></a></li>
                                    <li class="brandAllH_3 disabled"><a href="#brandAllH_3"><span>3</span></a></li>
                                    <li class="brandAllH_4 disabled"><a href="#brandAllH_4"><span>4</span></a></li>
                                    <li class="brandAllH_5 disabled"><a href="#brandAllH_5"><span>5</span></a></li>
                                    <li class="brandAllH_6 disabled"><a href="#brandAllH_6"><span>6</span></a></li>
                                    <li class="brandAllH_7 disabled"><a href="#brandAllH_7"><span>7</span></a></li>
                                    <li class="brandAllH_8 disabled"><a href="#brandAllH_8"><span>8</span></a></li>
                                    <li class="brandAllH_9 disabled"><a href="#brandAllH_9"><span>9</span></a></li>
                                </ul>
                                <div class="content-body">
                                    <div class="brands-show" id="custom-scroll-content" data-modules-scroll="">
                                    </div>
                                    <!-- //.brands-show -->
                                    <!-- 선택 해제/적용은 Method/Event는 스크립트 가이드 참조 -->
                                    <div class="btngroup">
                                        <button type="button" onclick="brandSelectLayerProc(this, 'cancel');" class="btn btn-lineblack"><span>선택 해제</span></button>
                                        <button type="button" onclick="clickFilter(this);brandSelectLayerProc(this, 'apply');" class="btn btn-default" id="brndApply" data-dismiss="modal"><span>적용</span></button>
                                    </div>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!-- //.ui-modal -->
                </div>
                <!-- //.contents -->
            </div>
        </form></div>
    <!-- //.container -->

</main>
