<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
				<form name="gnbPdeSearchForm" method="get" accept-charset="UTF-8" class="main-search" onsubmit="event.preventDefault();">
					<div class="inputbox">
						<label class="inplabel">
							<input type="text" id="gnbSearchKeyword" name="searchTerm"
								   value=""
								   autocomplete="off" title="검색어" size="88"/>
						</label>
						<button class="btn ico-clearabled" type="button" onclick="javascript:clearWord();"><i id="searchDeleteX" class="icon"></i><span class="hiding">지우기</span></button>
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
								<ul class="recent-list" id="keyword-list" >
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

						<button class="btn searchclose" id="close-btn"><i class="hiding">검색 레이어</i><span>닫기</span></button>
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

			$("#gnbSearchKeyword").focus(function(){
				$(".header .search").addClass("selected");

				if($("#gnbSearchKeyword").val() == gv_gnbHomeBnnrTitl){
					$("#gnbSearchKeyword").val('');
				}

				$("#search-popup").css({ display : "" });  // 최근검색어 탭 노출
				if($("#keyword-list li").length==0){
					$("#nodata").css({display:""});
					$("#keyword-list").css({display:"none"});
				}

				//검색창 입력전 광고
				fn_searchAdKeywordDefault();
				$("#search-recommend").css({ display : "none" });
				$("#search-autowrap").show();

				//퀵 메뉴 숨김 처리
				$('.quick-menu-more').removeClass('on');

				// 2020.12.17 icj : 텍스트 광고 입력이 없을시 재노출 (하선윤)
			}).focusout(function(){
				var $keyword = $("#gnbSearchKeyword");
				if($keyword.val() == ''){
					$keyword.val(gv_gnbHomeBnnrTitl);
				}
			});

		</script>

		<!-- 개인화 메뉴 -->
		<div class="personal-menu">
			<ul>
				<li>
					<a class="cart" ga-category="헤더" ga-action="장바구니" href="javascript:bizSpringTag('https://www.hmall.com/p/odb/basktList.do','^헤더^장바구니');">
						<span>장바구니</span>






					</a>
				</li>
				<li><a class="mypage" href="${contextPath}/mypage"><span>마이페이지</span></a></li>
				<li>
					<a href="javascript:;" class="recently" id="recentlyImg" onclick="openRecentShopping(); return false;">
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
							<a href="/p/bmc/brodPordPbdv.do?type=03?_IC_=tab1&mainDispSeq=2&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="편성표">편성표</a></li>

						<li class=" ">
							<a href="/p/home.do?_IC_=tab2&mainDispSeq=1&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="스토어">스토어</a></li>

						<li class="current ">
							<a href="/p/tvMainR.do?_IC_=tab3&mainDispSeq=3&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="홈">홈</a></li>

						<li class=" ">
							<a href="/p/mktgMain.do?_IC_=tab4&mainDispSeq=62&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="슈퍼H페스타">슈퍼H페스타</a></li>

						<li class=" ">
							<a href="/p/dsMainR.do?_IC_=tab5&mainDispSeq=6&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="백화점">백화점</a></li>

						<li class=" ">
							<a href="/p/todayOpenDeal.do?_IC_=tab6&mainDispSeq=48&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="오늘추천">오늘추천</a></li>

						<li class=" ">
							<a href="/pevent/eva/evntMainPage.do?_IC_=tab7&mainDispSeq=7&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="이벤트">이벤트</a></li>

						<li class=" point">
							<a href="/p/dpd/wkBestTypeTot.do?_IC_=tab8&mainDispSeq=21&" class="gp_className" ga-category="메인 홈" ga-action="상단탭" ga-label="주간베스트">주간베스트</a></li>

					</ul>
				</div>

			</div>
			<!-- // 퀵메뉴-->
			<script>

				/*function setTitle() {
                    if($('.quick-menu-list .current a').length < 1) {
                        return;
                    }

                    var tabname = $('.quick-menu-list .current a').first().text();

                    document.title = tabname + " - 현대Hmall";

                    if(tabname == '홈' || tabname == 'HMALL') {
                        document.title = '당신의 모든 취향을 읽다 - 현대Hmall';
                    }
                }

                setTitle();*/

			</script>

			<!-- 유틸메뉴 -->
			<div class="header-util">
				<h2 class="hiding">유틸메뉴</h2>
				<!-- 로그인 전 -->
				<ul style="display: flex">
					<sec:authorize access="isAnonymous()">
					<li><a ga-category="헤더" ga-action="로그인" href="${contextPath}/customLogin" onclick="openLoginTag('','^헤더^로그인');return false;">로그인</a></li>
						<li><a href="${contextPath}/user/signup">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal" var="pinfo" />
						<li><a href="mypage"> ${pinfo.userVO.user_name}님</a></li>
						<li><a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a></li>
						<form id="logout-form" action='<c:url value='/customLogout'/>' method="POST">
							<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
						<li><a href="level">멤버십존</a> </li>
					</sec:authorize>


					<li><a ga-category="헤더" ga-action="고객센터" href="javascript:bizSpringTag('/p/cca/main.do','^헤더^고객센터');">고객센터</a></li>
				</ul>
			</div>

		</div>

	</div>
</header>
</html>