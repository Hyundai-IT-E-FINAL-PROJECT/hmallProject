<header class="header">
    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <div class="header-top">
        <h1 class="logo"><a href="${contextPath}/" title="현대Hmall">Hmall</a></h1>
        <div class="search" role="search">
            <div class="field">
                <form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search"
                      onsubmit="event.preventDefault();">
                    <div class="inputbox">
                        <label class="inplabel">
                            <input type="text" id="gnbSearchKeyword" name="searchTerm" value=""
                                   autocomplete="off" title="검색어" size="88">
                        </label>
                        <button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i
                                id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
                        <button class="btn btn-search" onclick="javascript:doSearchGnb();"><span>검색</span>
                        </button>
                        <input type="hidden" name="gnbSearchYn" value="Y">
                    </div>
                </form>
                <div class="search-autowrap" id="search-autowrap">
                    <div class="keyword-area" id="search-recommend" aria-label="검색어 자동완성" style="display:none">
                    </div>
                    <div class="autowrap" id="search-popup" style="display:none">
                        <div class="autoarticle leftarea" id="search-history">
                            <div class="recent-area" aria-label="최근검색어">
                                <p class="stitle">최근 검색어</p>
                                <p class="nodata" id="nodata" style="">최근 검색어가 없습니다.</p>
                                <button class="btn btn-delall" id="del-all-history" style="display: none;">
                                    <span>전체삭제</span></button>
                            </div>
                        </div>
                        <div class="autoarticle rightarea">
                            <div class="popular-area" id="popular-list" aria-label="인기검색어">
                                <p class="stitle">인기 검색어</p>
                                <ol class="num-list">
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('삼립빵');">삼립빵<em><i
                                            class="icon keep"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('여성원피스');">여성원피스<em><i
                                            class="icon keep"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('써스데이아일랜드');">써스데이아일랜드<em><i
                                            class="icon keep"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('SPC삼립');">SPC삼립<em><i
                                            class="icon new"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('용평리조트패키지');">용평리조트패키지<em><i
                                            class="icon keep"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('여성샌들');">여성샌들<em><i
                                            class="icon new"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('여성여름자켓');">여성여름자켓<em><i
                                            class="icon new"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('여성골프웨어');">여성골프웨어<em><i
                                            class="icon new"></i><span class="hiding">유지</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('안나수이원피스');">안나수이원피스<em><i
                                            class="icon down"></i><span class="hiding">하락</span></em></a></li>
                                    <li><a href="javascript:void(0);"
                                           onclick="javascript:clickPopSrch('보테가베네타가방');">보테가베네타가방<em><i
                                            class="icon down"></i><span class="hiding">하락</span></em></a></li>
                                </ol>
                            </div>
                            <div class="focusclick-area" id="fcsClick" aria-label="포커스클릭" style="display:none">
                                <p class="stitle">포커스 클릭</p>
                                <span class="flag-da">AD</span>
                            </div>
                        </div>
                        <button class="btn searchclose" id="close-btn"><i class="hiding">검색
                            레이어</i><span>닫기</span></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="personal-menu">
            <ul>
                <li>
                    <a class="cart" ga-category="헤더" ga-action="장바구니"
                       href="${contextPath}/basket/basketList">
                        <span>장바구니</span>
                    </a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal" var="pinfo" />
                    <c:choose>
                        <c:when test="${pinfo.userVO.authList[0].user_auth_authority eq 'ROLE_ADMIN'}">
                            <li><a class="mypage" href="/mypageOrder"><span>주문관리</span></a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a class="mypage" href="/mypage"><span>마이페이지</span></a></li>
                        </c:otherwise>
                    </c:choose>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <li><a class="mypage" href="/mypage"><span>마이페이지</span></a></li>
                </sec:authorize>
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
            <div class="header-util">
                <h2 class="hiding">유틸메뉴</h2>
                <!-- 로그인 전 -->
                <ul style="display: flex;">
                    <sec:authorize access="isAnonymous()">
                        <li><a ga-category="헤더" ga-action="로그인" href="${contextPath}/customLogin">로그인</a></li>
                        <li><a href="${contextPath}/user/user_agree">회원가입</a></li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <c:choose>
                            <c:when test="${pinfo.userVO.authList[0].user_auth_authority eq 'ROLE_ADMIN'}">
                                <li><a href="mypageOrder">관리자 ${pinfo.userVO.user_name}님</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${contextPath}/mypage">${pinfo.userVO.user_name}님</a></li>
                            </c:otherwise>
                        </c:choose>
                        <li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
                        <form id="logout-form" action='<c:url value='/customLogout'/>' method="POST">
                            <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
                        </form>
                        <li><a href="/level">멤버십존</a></li>
                    </sec:authorize>
                    <li><a ga-category="헤더" ga-action="고객센터" href="${contextPath}/customer">고객센터</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<script>
    function showLoginPopup() {
        window.open("${contextPath}/customLogin", "a", "width=550, height=700, left=100, top=50");
    }
</script>
