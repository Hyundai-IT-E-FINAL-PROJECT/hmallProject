<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: SM-PC
  Date: 2022-05-25
  Time: 오후 5:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrap product-detail">
    <!-- 브랜드 검색 : 추천 브랜드  -->
    <div class="layer-popup brand" style="display:none;">
        <!-- style 임시 적용 : 확인용 -->
        <div class="pop-wrap">
            <div class="pop-content-wrap">
                <strong class="pop-title">브랜드 검색</strong>
                <!-- 검색 영역 -->
                <div class="search" role="search">
                    <div class="field">
                        <div class="inputbox">
                            <label class="inplabel"><input type="text" name="brndTp" placeholder="브랜드를 입력해 주세요"
                                                           title="브랜드 검색"></label>
                            <button class="btn ico-clearabled" onclick="javascript:brnClear();" id="CEOBrndSearchClear">
                                <i class="icon"></i><span class="hiding">지우기</span></button>

                        </div>
                    </div>
                    <button class="btn btn-search"><span>검색</span></button>
                </div>
                <!-- // 검색 영역 -->
                <div class="pop-content">
                    <!-- 팝업 컨텐츠 -->
                    <div class="middle-content">
                        <div class="recommend-brand">
                            <p class="title"><strong>추천 브랜드</strong></p>
                            <ul id="brand-list">
                                <!-- 추천 브랜드 목록 -->
                            </ul>
                        </div>
                        <div class="result-brand" style="display:none;">
                            <p class="title"><strong>'가구' 검색결과</strong><span>총 <em></em>건</span></p>
                            <ul id="hangulSrchResult">

                            </ul>
                        </div>
                        <div class="nodata" style="display:none;">
                            <span class="bgcircle"><i class="icon nodata-type10"></i></span>
                            <p>브랜드 검색결과가 없습니다.</p>
                        </div>
                    </div>
                    <!-- //팝업 컨텐츠 -->
                </div>
            </div>
            <!-- // .pop-content-wrap -->
            <button class="btn-close" onclick="javascript:$('.layer-popup.brand').css('display','none');">
                <span>팝업 닫기</span></button>
        </div>
    </div>
    <!-- TODO action 변경필요 -->
    <form name="brndSearchMoveForm" action="/p/pde/brndSearchL.do" method="get">
        <input type="hidden" name="srchBrndCd" value="">
        <input type="hidden" name="sort" value="SELL_QTY@DESC">   <!-- 많이 팔린 순 정렬 기본-->
        <input type="hidden" name="moveGbn" value="first">
    </form>

    <form name="registMemberForm" method="post">
        <input type="hidden" name="email" value="">
        <input type="hidden" name="emailCertNo">
        <input type="hidden" name="langType" value="korean">

        <!-- 전자상거래 규제 개선 -->
        <input type="hidden" name="isOverseasSectPup" value="N">
        <input type="hidden" name="popupYn" value="N">
        <input type="hidden" name="redirectUrl"
               value="/p/pda/itemPtc.do?slitmCd=2122712699&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A">
        <input type="hidden" name="errorMessage" value="">
        <input type="hidden" name="token">
        <input type="hidden" name="snsType">
    </form>

    <script type="text/javascript">
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        window.fbAsyncInit = function () {
            FB.init({
                appId: '532674750212632',
                cookie: true,
                status: true,
                xfbml: true,
                version: 'v3.2'
            });
        };

        function fbLogin() {
            var pathVal = "^헤더^마이페이지 레이어^페이스북 로그인";

            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch (e) {
            }

            //현재 페이스북 로그인 여부 확인 후 FB.login fuction 호출 여부 구분
            FB.getLoginStatus(function (response) {

                if (response.status == "connected") {
                    var token = response.authResponse.accessToken;
                    FB.api('/me', {fields: 'email'}, function (response) {
                        //opener.name = "parent";
                        if (response.email !== undefined) {
                            var form = $("form[name='registMemberForm']")[0];
                            //form.target = opener.name;
                            form.setAttribute("action", "https://www.hmall.com/p/cob/snsAuth.do");

                            $("input[name='token']").val(token);
                            $("input[name='snsType']").val("10");

                            form.submit();
                            showLoadingBar("180px", "150px");
                        } else {
                            // 페이스북 가입 마지막 단계(가입확인 메일 체크) 확인 안한 계정 로그인시
                            alert("check your confirmation email");
                        }
                        //window.close();
                    });
                } else {
                    FB.login(function (response) {
                        if (response.authResponse) {
                            var token = response.authResponse.accessToken;
                            FB.api('/me', {fields: 'email'}, function (response) {
                                //opener.name = "parent";
                                if (response.email !== undefined) {
                                    var form = $("form[name='registMemberForm']")[0];
                                    //form.target = opener.name;
                                    form.setAttribute("action", "https://www.hmall.com/p/cob/snsAuth.do");

                                    $("input[name='token']").val(token);
                                    $("input[name='snsType']").val("10");

                                    form.submit();
                                    showLoadingBar("180px", "150px");
                                } else {
                                    // 페이스북 가입 마지막 단계(가입확인 메일 체크) 확인 안한 계정 로그인시
                                    alert("check your confirmation email");
                                }
                                //window.close();
                            });
                        }
                    }, {scope: 'email'});
                }
            });
        }
    </script>

    <script type="text/javascript">
        function naverLogin() {
            var pathVal = "^헤더^마이페이지 레이어^네이버 로그인";

            try {
                _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch (e) {
            }

            var returnURL = "/p/pda/itemPtc.do?slitmCd=2122712699&bdTrkArea=34&bdTrkAlgrth=11&bdTrkOpt=A";
            var redirect_uri = 'https://www.hmall.com';
            /* if(returnURL.indexOf("&") > -1){
            returnURL = returnURL.replace(/&amp;/g,"||");
        } */

            var gnbLoginYn = "Y";
            redirect_uri += '/p/cob/naverLoginChk.do?gnbLoginYn=' + gnbLoginYn + '&returnUrl=' + returnURL;

            var url = "/p/cob/naverLogin.do?redirect_uri=" + encodeURIComponent(redirect_uri);
            var popName = "NaverLogin";
            var popOption = "height=760, width=795, fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no, top=0, left=0, status=no";
            window.open(url, popName, popOption);
        }

        setTopBanner();

        loadPCdirect();
        ajaxCallback();
    </script>

    <script type="text/javascript" defer="defer">
        (function () {
            function gaUseWinload() {
                //for google analytics click event
                useWinload();
            }

            if (window.attachEvent) {
                window.attachEvent('onload', gaUseWinload);
            } else {
                window.addEventListener('load', gaUseWinload, false);
            }
        })();
    </script>

    <main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
        <div class="container">
            <!-- 로케이션 메뉴 시작 -->
            <div class="location" data-modules-menus="">
                <ul>
                    <li data-menu="" class="home"><a href="https://www.hmall.com">홈</a></li>
                    <li data-menu="">
                        <a href="/p/dpa/searchSectItem.do?sectId=2731190" class="cate">
                            농산
                        </a>


                        <div class="category-wrap" data-submenu="" style="left:55px">

                            <ul class="category-list">
                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726024">세제/세정/탈취제</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726025">바디/헤어/구강</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726026">휴지/생리대/마스크</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726032">수납정리/소품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726027">수납/청소/생활잡화</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726028">건강관리/안마/실버</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726029">조리용기 / 도구</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726030">식기/접시/홈세트</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726031">보관용기</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2726033">와인/커피용품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731129">생활/미용가전</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731130">주방가전</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731131">계절가전</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731132">영상/음향 가전</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731133">카메라/렌즈/캠코더</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731134">노트북/PC/게임</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731135">스마트기기/OA</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731136">리퍼 가전</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731137">가방/지갑</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731138">신발</a>
                                </li>
                            </ul>

                            <ul class="category-list">
                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731139">패션소품/ACC</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731140">명품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731141">거실가구</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731142">침실가구/드레스룸</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731143">주방가구/테이블</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731144">학생/서재가구</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731145">리모델링 시공/DIY</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731146">침구</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731147">커튼/카페트</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731148">인테리어소품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731159">스킨케어</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731160">헤어케어</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731161">바디케어</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731162">메이크업</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731163">향수</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731164">기기/소품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731165">스포츠 의류</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731166">스포츠신발</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731167">스포츠패션잡화</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731168">골프용품</a>
                                </li>
                            </ul>

                            <ul class="category-list">
                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731169">골프의류</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731170">구기/라켓/격투</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731171">등산/ 아웃도어</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731172">캠핑</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731173">낚시</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731174">헬스/요가</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731175">수영/물놀이</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731176">스키/스노보드</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731177">자전거/인라인/퀵보드</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731178">자동차</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731183">원예/꽃배달</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731184">보석</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731185">반지</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731186">목걸이/귀걸이</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731187">팔찌/발찌</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731188">시계</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731189">기타 ACC</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731190">농산</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731191">축산</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731192">수산</a>
                                </li>
                            </ul>

                            <ul class="category-list">
                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731193">간편식/반찬</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731194">면/캔/오일/소스</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731195">떡/베이커리/과자</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731196">유제품/유아식</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731197">생수/음료</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731198">커피/차</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731199">홍삼/전통건강식품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731200">비타민/영양제</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731201">유산균/콜라겐</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731203">여성의류</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731204">남성의류</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731205">캐주얼의류</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731206">언더웨어</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731207">임신/출산</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731208">기저귀/물티슈</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731209">스킨케어/위생/소독</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731210">유아 침구/가구/매트</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731211">유모차/카시트/외출용품</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731212">유아 의류/잡화</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731213">완구</a>
                                </li>
                            </ul>

                            <ul class="category-list">
                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731214">렌탈</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731215">보험/상조</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731216">여행/숙박</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731217">서비스/e쿠폰/상품권</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2732613">유아동 도서</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2743455">주방가전</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731128">도서/음반</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=216428">명품잡화</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2222295">반려동물(H펫샵)</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2379016">대형/생활가전</a>
                                </li>
                            </ul>

                        </div>


                    </li>
                    <li data-menu="">
                        <a href="/p/dpa/searchSectItem.do?sectId=2731643" class="cate">
                            과일/건과/냉과
                        </a>


                        <div class="category-wrap" data-submenu="" style="left:55px">

                            <ul class="category-list">
                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731640">쌀/백미</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731641">잡곡/혼합곡</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731642">견과류</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731643">과일/건과/냉과</a>
                                </li>


                                <li>
                                    <a href="/p/dpa/searchSectItem.do?sectId=2731644">채소/버섯</a>
                                </li>
                            </ul>

                        </div>


                    </li>
                </ul>
            </div>
            <script language="javascript">
                $(".location li").each(function () {
                    if (isEmpty($.trim($(this).html()))) {
                        $(this).remove();
                    }
                });
            </script>
            <!--로케이션 메뉴 끝 -->
            <div class="contents">
                <!-- 본문 컨텐츠 영역 시작 -->
                <div class="product-detail-wrap">
                    <!-- pdr_wrap -->
                    <div class="pdr_wrap">
                        <div class="product-info-wrap">
                            <!--.left-info-->
                            <!-- 좌측메뉴 -->
                            <div class="left-info">
                                <!-- 상품 이미지 영역 시작 --> <!--20200902 ui 변경-->
                                <div class="product-banner-wrap">
                                    <div data-modules-imageviewer="">
                                        <div class="product-mainbanner slick-initialized slick-slider"
                                             data-modules-slick="draggable:false; dots:false; infinite:true; thumbnaiList:.slider-thumbnaii;thumbnailsToShow:5;">
                                            <div class="slick-list">
                                                <div class="slick-track" style="opacity: 1; width: 3640px; transform: translate(-520px, 0px);">
                                                    <div class="slick-slide slick-cloned" data-slick-index="-1"
                                                         aria-hidden="true" style="width: 520px;" tabindex="-1">
                                                        <div>
                                                            <div class="item" data-item=""
                                                                 data-outputsrc="/resources/img/image_example1.jpg"
                                                                 onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                 style="width: 100%; display: inline-block; vertical-align: top;">
                                                                <a href="javascript:;"
                                                                   onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                   tabindex="-1"><img
                                                                        src="/resources/img/image_example1.jpg"
                                                                        alt="2139858205_4.png"
                                                                        onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <c:forEach items="${imageVOList}" var="imageVO" varStatus="status">
                                                        <c:choose>
                                                            <c:when test="${status.index == 0}">
                                                                <div class="slick-slide slick-current slick-active" data-slick-index="${status.index}" aria-hidden="true"
                                                                     style="width: 520px;" tabindex="-1">
                                                                    <div>
                                                                        <div class="item" data-item=""
                                                                             data-outputsrc="/resources/img/${imageVO.IMAGE_NAME}.jpg"
                                                                             onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                             style="width: 100%; display: inline-block; vertical-align: top;">
                                                                            <a href="javascript:;"
                                                                               onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                               tabindex="-1"><img
                                                                                    src="/resources/img/${imageVO.IMAGE_NAME}.jpg"
                                                                                    alt="/resources/img/${imageVO.IMAGE_NAME}.jpg"
                                                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="slick-slide" data-slick-index="${status.index}" aria-hidden="true"
                                                                     style="width: 520px;" tabindex="-1">
                                                                    <div>
                                                                        <div class="item" data-item=""
                                                                             data-outputsrc="/resources/img/${imageVO.IMAGE_NAME}.jpg"
                                                                             onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                             style="width: 100%; display: inline-block; vertical-align: top;">
                                                                            <a href="javascript:;"
                                                                               onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                               tabindex="-1"><img
                                                                                    src="/resources/img/${imageVO.IMAGE_NAME}.jpg"
                                                                                    alt="/resources/img/${imageVO.IMAGE_NAME}.jpg"
                                                                                    onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    <div class="slick-slide slick-cloned" data-slick-index="5"
                                                         aria-hidden="true" style="width: 520px;" tabindex="-1">
                                                        <div>
                                                            <div class="item" data-item=""
                                                                 data-outputsrc="/resources/img/image_example1.jpg"
                                                                 onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                 style="width: 100%; display: inline-block; vertical-align: top;">
                                                                <a href="javascript:;"
                                                                   onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                   tabindex="-1"><img
                                                                        src="/resources/img/image_example1.jpg"
                                                                        alt="2139858205_0.png"
                                                                        onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="ui-angle" style="display: none; width: 260px; height: 260px; top: 57px; left: 260px;"></div>
                                    </div>
                                    <div class="slider-thumbnaii no-slick">
                                        <ul>
                                            <c:forEach var="imageVO" items="${imageVOList}" varStatus="status">
                                                <c:choose>
                                                    <c:when test="${imageVO.IMAGE_TYPE eq 'MAIN'}">
                                                        <li class="ui-thumbnaii ui-active">
                                                            <a href="javascript:;"
                                                               onclick="image_slide(this, ${status.index});"
                                                               draggable="false">
                                                                <img src="/resources/img/thumb/${imageVO.IMAGE_NAME}.jpg"
                                                                     alt="2122712699_0.jpg"
                                                                     onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=100x100&amp;AR=0')">
                                                            </a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="ui-thumbnaii"><a href="javascript:;"
                                                                                    onclick="image_slide(this, ${status.index});"
                                                                                    draggable="false"><img
                                                                src="/resources/img/thumb/${imageVO.IMAGE_NAME}.jpg"
                                                                alt="2122712699_0.jpg"
                                                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=100x100&amp;AR=0')"></a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach >
                                        </ul>
                                    </div>
                                </div>
                                <!-- // 상품 이미지 영역 끝 -->

                                <div class="customer-use-wrap">
                                    <div class="customer-use-info">
                                        <!-- 상품코드 -->
                                        <div class="product-code">
                                            <span class="code-number">상품코드 : 122712699</span>
                                            <a href="javascript:;" class="code-copy"
                                               onclick="copySlitmCd('122712699');">복사하기</a>
                                        </div>
                                        <!--//상품코드 -->
                                        <!--SNS-->
                                        <!--20200925 금요일이후 sns-link 추후 디자인 나올 경우 트위터 페이스북 작업 예정[ui변경가능성있음] -->
                                        <div class="sns-link">
                                            <ul>
                                                <li><a href="javascript:;" class="url"
                                                       onclick="copyShortenUrl('2122712699');"><i
                                                        class="icon url-circle"></i></a></li>
                                                <li><a href="javascript:;" class="qrcode" onclick="qrCode()"><i
                                                        class="icon qr-circle"></i></a></li>
                                                <li><a href="#tooltipInfo" class="tooltip" data-modules-tooltip=""><i
                                                        class="icon que-mark"></i></a></li>
                                                <div class="qrCodeWrap" id="qrCodeWrap"
                                                     style="position:absolute; right:0px; top:-123px; display:none;border: 1px solid #fd5a3b;z-index:110;"></div>
                                            </ul>
                                            <div class="tooltip-box" id="tooltipInfo">
                                                <dl>
                                                    <dt>단축URL이란?</dt>
                                                    <dd>
                                                        기존의 긴 URL 대신 20 ~ 30자(byte)의 짧은 주소로 표현된 URL입니다.
                                                        좌측의 단축URL버튼을 클릭하시면, 해당 단축URL이 클립보드에 복사되오니, 다른 사이트 게시판이나 트위터 등에서
                                                        붙여넣기 하시면 됩니다.
                                                    </dd>
                                                    <dt>QR코드란?</dt>
                                                    <dd>
                                                        좌측의 QR코드를 클릭하면, 정사각형 모양의 QR코드가 나타납니다.
                                                        이를 스마트폰의 QR코드스캔용 프로그램(ex. Hsearch)으로 인식하시면, 손쉽게 문자나 이메일을 통해 지인에게
                                                        추천하거나, 모바일 현대Hmall을 통해서도 쇼핑하실 수 있습니다.
                                                    </dd>
                                                </dl>

                                                <button class="btn-close"><i class="icon"></i><span
                                                        class="hiding">닫기</span></button>
                                            </div>
                                            <!--//tooltip-box-->
                                            <iframe id="logchk_frame" title="웹로그체크용빈프레임" src=""
                                                    style="position:absolute; top:-9999px; left:-9999px"></iframe>
                                        </div>
                                        <!--//SNS-->
                                    </div>
                                    <!-- // .customer-use-info -->
                                </div>
                            </div>
                            <div class="right-info">
                                <div data-viewercontent="" class="">
                                    <p class="guide-txt">마우스 휠을 움직이면 상품 이미지를 더욱 상세히 보실 수 있습니다.</p>
                                </div>
                                <form id="itemInfForm" name="itemInfForm" action="#" method="post">
                                    <input type="hidden" name="slitmCd" value="2122712699">
                                    <input type="hidden" name="packOpenRtpNdmtYn" value="N">
                                    <input type="hidden" name="ordMakeYn" value="N">
                                    <input type="hidden" name="ordMakeExcldMCsfYn" value="N">
                                    <input type="hidden" name="bsitmCd" value="2101984300">
                                    <input type="hidden" name="sellPrc" value="29900">
                                    <input type="hidden" name="dluMaxBuyQty" value="99">
                                    <input type="hidden" name="sectId" value="2731643">
                                    <input type="hidden" name="slitmNm"
                                           value="[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )">
                                    <input type="hidden" name="uitmCombYn" value="N">
                                    <input type="hidden" name="uitmChocPossYn" value="Y">
                                    <input type="hidden" name="sdlvcVenMinStlmAmt" value="">
                                    <input type="hidden" name="sdlvcVenBsicAmtBuyPossYn" value="">
                                    <input type="hidden" name="hpntPrtyStlmYn" value="N">
                                    <input type="hidden" name="dawnDlvYn" value="N">
                                    <input type="hidden" name="freshFoodYn" value="N">
                                    <input type="hidden" name="giftOrderYn" value="N">
                                    <input type="hidden" name="boxPrsnPackGbcd" value="0">
                                    <input type="hidden" name="spbgPrsnPackGbcd" value="0">
                                    <input type="hidden" name="uitmMacYn" value="N">


                                    <textarea name="sdlvcVenItemPtcCntn" class="hidden"
                                              style="display: none"></textarea>
                                    <input type="hidden" name="rcmmType" value="">

                                    <input type="hidden" name="gaCategory" value="식품/농산물/국내청과/사과">
                                    <input type="hidden" name="brndNm" value="아이사랑">
                                    <input type="hidden" name="stpicCartYn" value="N">
                                    <input type="hidden" name="stpicOrderYn" value="N">
                                    <input type="hidden" name="stpicPickUpDt" value="">
                                    <input type="hidden" name="fundingYn" value="N">
                                    <input type="hidden" name="uitmCdInf" value="0^00002|1"></form>
                                <div class="basic-info">


                                    <!-- 브랜드샵 -->


                                    <div class="brand-info">
                                        <a href="javascript://" ga-custom-name="상품상세" ga-custom-position="브랜드샵"
                                           ga-custom-creative="아이사랑" ga-custom-id="" ga-custom-title="상품>상품상세>메인"
                                           onclick="gaTagging(this, '/p/pde/brndSearchL.do?srchBrndCd=M14717', '', '');"
                                           ga-custom-etc="urlAction">

                                            <span class="img"><img
                                                    src="/resources/img/${imageVOList[0].IMAGE_NAME}.jpg"
                                                    alt="아이사랑"
                                                    onerror="noImage(this, 'http:////image.hmall.com/p/img/co/logo-brand-default.jpg')"></span>

                                            <span class="brand-name">${productVO.product_brand}<i
                                                    class="icon icon-arrow"></i></span>
                                        </a>
                                    </div>
                                    <div class="prduct-title-info">


                                        <strong class="prduct-name">${productVO.product_name}</strong>
                                        <p class="prduct-origin">
                                            원산지 : 상세설명 / 기본정보 참고
                                        </p>
                                        <div class="prd-rawmater">
                                            <a href="#tooltipRawMater" class="tooltip" data-modules-tooltip=""><span>원재료 함량/포장별 용량<i
                                                    class="icon arrow"></i></span></a>
                                            <div class="tooltip-box" id="tooltipRawMater">
                                                <dl>
                                                    <dt>원재료 및 함량</dt>
                                                    <dd>
                                                        ${productVO.product_country}
                                                    </dd>
                                                </dl>
                                                <button class="btn-close"><i class="icon"></i><span
                                                        class="hiding">닫기</span></button>
                                                <button class="btn-close"><i class="icon"></i><span
                                                        class="hiding">닫기</span></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pdinfo">
                                        <div class="benefits">
                                            <span class="flag bold tvplus">TV+샵</span>
                                        </div>
                                        <a href="#none" onclick="gotoPageLink(2);return false;" class="gp_className"
                                           ga-category="상품상세" ga-action="별점" ga-label="">
                                            <div class="grade">
                                                <div class="starbg pt9">
                                                    <p class="score"><span class="hiding">90점</span></p>
                                                </div>
                                                <p class="like-count"><em>4.4</em>(4,441)</p>
                                            </div>
                                        </a>
                                        <script type="text/javascript">
                                            function gotoPageLink(n) {//별점 클릭시 탭이동
                                                $('[data-modules-scrollspy] .ui-spynav li:eq(' + n + ') a').trigger('click')
                                                return false;
                                            }
                                        </script>
                                    </div>
                                    <c:choose>
                                        <c:when test="${productVO.coupon_ratio == 0}">
                                            <div class="pdprice">
                                        <span class="rateprice" aria-label="할인율이 적용된 가격">
                                        <p class="discount" aria-label="할인가">
                                            <em class="product-discount">${productVO.product_cost}</em><b>원</b>
                                        </p>
                                    </span>
                                                <div class="tooltip-box" id="tooltipDiscount">
                                                    <div class="thead">
                                                        <p class="tit">할인내역</p>
                                                    </div>
                                                    <dl class="cost-wrap">
                                                        <dt>판매가</dt>
                                                        <dd>
                                                            <span class="enroll-price">${productVO.product_cost}<em>원</em></span>
                                                        </dd>
                                                    </dl>
                                                    <dl class="sumcost-wrap">
                                                        <dt>혜택가</dt>
                                                        <dd>
                                                            <span class="sum-cost">${productVO.product_cost}<em>원</em></span>
                                                            <p class="saleprice-per">
                                                                0
                                                                <em>원 할인</em>
                                                            </p>
                                                        </dd>
                                                    </dl>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:when test="${productVO.coupon_ratio != 0}">
                                            <div class="pdprice">
                                                    <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                        <em class="rate"
                                                            aria-label="할인율">${productVO.coupon_ratio}%</em>
                                                    <p class="discount" aria-label="할인가">
                                                        <em class="product-discount">
                                                            <fmt:formatNumber value="${productVO.discounted_cost}"
                                                                              pattern="#,###"/>
                                                        </em>
                                                        <b>원</b>
                                                        <a href="#tooltipDiscount" data-modules-tooltip=""><i
                                                                class="icon que-mark"></i></a>
                                                    </p>
                                                        <del class="normal" aria-label="정상가">
                                                                                                        <em>
                                                            <fmt:formatNumber value="${productVO.product_cost}"
                                                                              pattern="#,###"/>
                                                        </em>
                                                        <b>원</b>
                                                        </del>
                                                    </span>
                                                <div class="tooltip-box" id="tooltipDiscount">
                                                    <div class="thead">
                                                        <p class="tit">할인내역</p>
                                                    </div>
                                                    <dl class="cost-wrap">
                                                        <dt>판매가</dt>
                                                        <dd>
                                                            <span class="enroll-price">30,900<em>원</em></span>
                                                        </dd>
                                                        <dt class="sale-name">TV방송할인</dt>
                                                        <dd>
                                                            <span class="enroll-price">1,000<em>원</em></span>
                                                        </dd>
                                                    </dl>
                                                    <dl class="sumcost-wrap">
                                                        <dt>혜택가</dt>
                                                        <dd>
                                                            <span class="sum-cost">29,900<em>원</em></span>
                                                            <p class="saleprice-per">
                                                                1,000
                                                                <em>원 할인</em>
                                                            </p>
                                                        </dd>
                                                    </dl>
                                                    <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                    <div class="box-type">
                                        <dl class="inf-reward">
                                            <dt>
                                                <span class="tag hpoint" style="background-color: #e68714">
                                                    <em>H.Point</em>
                                                </span>
                                            </dt>
                                            <dd>
                                                <!--20200928 월요일 tooltip > 링크로 이동[i 클래스 변경] // 포인트안내 페이지로 이동-->
                                                <a href="/pevent/eva/evntHPointDtl.do?prmoNo=P202204269410"
                                                   target="_blank">릴레이 푸드 최대 1.6만 H.Point 적립<i
                                                        class="icon icon-arrow"></i>
                                                </a>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="pdprice-info">
                                    <dl class="baroOnOff" id="crdImdDlTagTmp">
                                        <dt>
                                            즉시할인
                                        </dt>
                                        <dd>
                                            <p><strong>[모바일 구매혜택]</strong></p>
                                            <p>
                                                <a href="#" data-modules-modal="target:#modalImmeDiscount-02;"
                                                   onclick="image_slide('상품상세','구매혜택 더보기','즉시할인');">
                                                    <em>5</em>% KB국민카드 (<em>50,000</em>원↑)<i
                                                        class="icon icon-arrow"></i>
                                                </a>
                                            </p>
                                            <script type="text/javascript">
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

                                        </dd>
                                    </dl>


                                    <!-- 청구할인 안내영역 -->


                                    <!-- 무이자할부 안내영역 -->


                                    <dl>
                                        <dt>무이자할부</dt>
                                        <dd>


                                            <p><a href="#" onclick="image_slide('상품상세','구매혜택 더보기','무이자할부');"
                                                  data-modules-modal="target:#modalInterestFree;">카드 무이자 특별행사 안내<i
                                                    class="icon icon-arrow"></i></a></p>

                                        </dd>
                                    </dl>


                                    <!-- 제휴카드 할인 안내영역 -->

                                    <dl>
                                        <dt>제휴카드 할인</dt>
                                        <dd><p>


                                            3~5%

                                            추가할인

                                        </p></dd>
                                    </dl>


                                    <!-- 결제수단 혜택 안내영역 -->


                                    <!-- 카드혜택 추가 광고배너관리.. itemPtc.bnnrInfR065List -->


                                    <dl>
                                        <dt>카드추가 혜택</dt>
                                        <dd>
                                            <a href="https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2718492&amp;eventCode=HHS39">
                                                <strong>현대홈쇼핑 현대카드 자세히보기</strong>
                                                <br>첫이용 3만원 즉시할인 (05.01~31)
                                                <i class="icon icon-arrow"></i>
                                            </a>
                                        </dd>
                                    </dl>


                                    <!-- 적립혜택 안내영역 -->

                                    <dl>
                                        <dt>적립혜택</dt>
                                        <dd>


                                            <a href="#" onclick="image_slide('상품상세','구매혜택 더보기','H.Point');"
                                               data-modules-modal="target:#modalAccumBenefit;">H.Point 40P<i
                                                    class="icon icon-arrow"></i></a>


                                        </dd>
                                    </dl>


                                    <!-- 다건사은품 -->

                                    <dl id="o9EvntTmpl" style="display:none;">

                                    </dl>


                                    <!-- 상품상세 최적화.. 쿠폰, 미리계산기 삭제, 쿠폰 다운로드로 변경 -->

                                    <dl class="download-coupon" style="display:none;">
                                        <dt>쿠폰할인</dt>
                                        <dd>
                                            <button class="btn btn-linelgray sm" data-popup-name="open-popup-coupon"
                                                    onclick="getCopnList('checkY')"><span>쿠폰 다운로드</span></button>
                                        </dd>
                                    </dl>


                                    <!--  광고배너관리(폣샵혜택) -->


                                </div>
                                <!-- // 구매 혜택 끝  -->

                                <!-- 배송 정보 시작 csahn!-->


                                <div class="delivery-info">
                                    <dl>
                                        <dt>


                                            배송정보

                                        </dt>


                                        <dd class="deliver-save">


                                            <p>


                                                <strong>무료배송</strong>


                                            </p>
                                        </dd>
                                        <!-- 추가배송비 선결제 2020.07.17 -->


                                        <dd><strong>CJ대한통운</strong></dd>


                                        <!-- 배송도착 확률 -->


                                        <dd class="deliver-percent">


                                            <a href="javascript://" onclick="image_slide('상품상세','배송 더보기','배송확률');"
                                               class="deliver-percent" data-modules-modal="target:#modalDeliverPercent">06/03(금)까지
                                                배송 확률 <strong>62%</strong><i class="icon icon-arrow"></i></a>
                                            <a href="#tooltipCont2" class="deliver-day" data-modules-tooltip=""><i
                                                    class="icon que-mark"></i></a>
                                            <div class="tooltip-box" id="tooltipCont2">
                                                <div class="thead">
                                                    <p class="tit">배송 확률</p>
                                                </div>
                                                <p class="txt">최근 배송된 주문건 대상으로, 가장 배송 확률이 높은 날짜를 예측했습니다.<br>실제 배송 완료일은
                                                    예측치와 다를 수 있습니다.<br><br>일부상품은 지역에 따라 차이가 있을 수 있습니다.</p>
                                                <button class="btn-close"><i class="icon"></i><span
                                                        class="hiding">닫기</span></button>
                                            </div>


                                            <!--//tooltip-box-->
                                        </dd>


                                        <!-- 새벽배송/픽업서비스인 경우 20180626 조유진 -->

                                    </dl>

                                    <div class="delivery-info">
                                        <dl>
                                            <dt>


                                                배송불가지역


                                            </dt>

                                            <dd>


                                                도서/산간지역 불가

                                                ,
                                                제주불가


                                            </dd>

                                        </dl>
                                    </div>

                                </div>
                                <div class="product-option-wrap">
                                    <div class="stock-item select-product-list item-normal-product">
                                        <div class="pditem">
                                            <input type="hidden" name="uitmCd" value="00002">
                                            <div class="product-info">
                                                <div class="figcaption">
                                                    <div class="pdoption" aria-label="옵션/수량">
                                                            <span class="option">색상/속성 : <em>
                                                                    6kg(3kg * 2박스)
                                                           </em>
                                                           </span>
                                                        <span class="stock-num">남은수량 : <em>83,464</em></span>
                                                    </div>
                                                    <div class="quantity">
                                                        <div class="count">
                                                            <button class="btn btn-minus" data-area-id="1"
                                                                    aria-label="수량 감소"
                                                                    onclick="minusOrdQty(this, '99');"><i
                                                                    class="icon"></i><span class="hiding">감소</span>
                                                            </button>
                                                            <div class="inputbox">
                                                                <label class="inplabel"><input type="number"
                                                                                               data-area-id="1"
                                                                                               name="ordQty"
                                                                                               onkeyup="changeOrdQty(this, 99)"
                                                                                               value="1" maxlength="3"
                                                                                               title="입력하세요"></label>
                                                            </div>
                                                            <button class="btn btn-plus" data-area-id="1"
                                                                    aria-label="수량 증가"
                                                                    onclick="plusOrdQty(this, '99');"><i
                                                                    class="icon"></i><span class="hiding">증가</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="popup id_duplicate posA hiding" id="stock_cnt"
                                         style="width:469px; right:0; bottom:1px;"></div>
                                </div>
                                <input type="hidden" value="0/0">
                                <!-- 총 상품 금액 시작 -->
                                <div class="sum-price" style="">
                                    <div class="sum-title">
                                        <!--20200916 수요일 변경 : pc레이아웃 공통 icon class 변경-->
                                        <strong>총 상품 금액<a href="#tooltipCont6" data-modules-tooltip=""><i
                                                class="icon que-mark"></i></a></strong>
                                        <!--tooltip-box 20200916 수요일 추가 pc레이아웃 공통-->
                                        <div class="tooltip-box" id="tooltipCont6">
                                            <div class="thead"><p class="tit">총 상품금액 안내</p></div>
                                            <p class="txt">선택하실 수 있는 할인혜택이 모두 적용된 금액입니다.<br>배송비가 포함이 되어 있지 않은 금액으로, 결제시
                                                배송비가 추가될 수 있습니다.</p>
                                            <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span>
                                            </button>
                                            <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span>
                                            </button>
                                        </div>
                                        <!--//tooltip-box-->
                                    </div>

                                    <div class="price-wrap">
                                        <p class="total-price">
                                            <strong><fmt:formatNumber value="${productVO.discounted_cost}"
                                                                      pattern="#,###"/></strong>원
                                        </p>
                                    </div>
                                </div>
                                <!-- // 총 상품 금액 시작 끝 -->

                                <div class="btngroup prdBtnBoxGroup type00">

                                </div>
                                <!-- btngroup -->
                                <div class="btngroup prdBtnBoxGroup pd_shipping_type_nomral type05">


                                    <button class="btn btn-linelgray large btn-like"
                                            onclick="goChioceProcess('','007818','','2122712699', event);">
                                        <i class="icon"></i><span class="count">267</span>
                                    </button>


                                    <!--방송알림등록-->


                                    <button class="btn btn-linelgray large btn-alarm"
                                            onclick="bitemAlrimPopupNew('[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )','2122712699','2101984300')">
                                        <i class="icon"></i><span>알림</span></button>


                                    <!-- div id="pop_likes" class="pop_warehousings" style="display: none;">
                                    </div>
                                    <div id="pop_likes_keeping" class="pop_warehousings" style="display: none;">
                                    </div-->


                                    <input type="hidden" name="buyYn" value="Y">
                                    <!-- 엄지펀딩의 경우 장바구니 비노출 시작-->


                                    <button class="btn btn-linelgray large btn-cart">
                                        <a href="${contextPath}/basket/basketList"><span>장바구니</span></a></button>


                                    <!-- 엄지펀딩의 경우 장바구니 비노출 끝-->
                                    <!-- 선물하기 시작-->

                                    <button class="btn btn-linelgray large btn-gift"
                                            onclick="setGiftOrder('Y');buyDirect();"><span>선물하기</span></button>

                                    <!-- 선물하기 끝-->


                                    <button class="btn btn-default large btn-buy" onclick="buyDirect();">
                                        <span>바로구매</span></button>


                                </div>
                                <div class="btngroup prdBtnBoxGroup pd_shipping_type_storePick type02"
                                     style="display: none;">
                                    <button class="btn btn-linelgray large btn-like"
                                            onclick="goChioceProcess('','007818','','2122712699', event);">
                                        <i class="icon"></i><span class="count">267</span>
                                    </button>
                                    <button class="btn btn-default large storepick" onclick="javascript:storepick();">
                                        <span>스토어픽</span></button>
                                </div>


                                <script language="javascript">
                                    $(".prdBtnBoxGroup").each(function () {
                                        $(this).addClass("type0" + $(this).find("> button").length);
                                    });
                                </script>
                                <input type="hidden" name="existMultiOption" value="0">
                            </div>
                        </div>
                    </div>
                    <div class="ui-modal" id="modalImmeDiscount-02" tabindex="-1" role="dialog" aria-label="즉시할인가">
                        <div class="ui-modal-dialog immediscount" role="document">
                            <div class="content">
                                <p class="ui-title">즉시할인가</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <ul class="payment-list">
                                        <li>
                                            <div class="tit-wrap">
                        <span style="line-height: 20px;"><img class="card " style="height: 20px;" src="

                                                    https://image.hmall.com/p/img/co/ico-card_kb.png











                        "></span>
                                                <h3>KB국민카드</h3> <span class="point"><em>5% </em></span>

                                            </div>
                                            <dl>
                                                <dt>

                                                    즉시할인
                                                </dt>


                                                <dd>

                                                    KB국민카드
                                                    <span class="point"><em>5</em></span>
                                                    %


                                                </dd>


                                                <dt>행사기간</dt>
                                                <dd>05/30 ~ 05/30</dd>
                                                <dt>기준금액</dt>
                                                <dd><em>50,000</em>원 이상 구매</dd>
                                                <dt>최대 할인금액</dt>
                                                <dd>


                                                    <span class="numberByStrNew">20만원</span>(1일 1인 기준)

                                                </dd>

                                                <!-- 적용조건..주문채널 pc미체크시.. -->
                                                <dt>적용조건</dt>
                                                <dd>모바일 구매시</dd>

                                            </dl>

                                            <a onclick="image_slide('상품상세', '즉시할인가', 'KB국민카드 5%');"
                                               id="bizItemPtc_discount-imme-detail"
                                               href="https://www.hmall.com/p/dpa/crdDmndDcPrmo.do?prmoNo=P202204280848"
                                               class="more-info" target="_blank">자세히 보기</a>
                                            <!-- <button class="btn btn-linelgray small"><span>자세히보기</span></button> -->

                                        </li>
                                    </ul>
                                    <div class="desc-box">
                                        <ul class="dotlist">
                                            <li>신용카드로 혜택가 전액 결제 시 즉시할인이 적용되며, 실제 인출되는 예상 금액입니다.</li>
                                        </ul>
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

                    <!--//팝업 즉시할인가-->
                    <!-- @청구할인 -->


                    <!-- //@청구할인 -->
                    <!--팝업 무이자할부-->
                    <div class="ui-modal" id="modalInterestFree" tabindex="-1" role="dialog" aria-label="무이자할부">
                        <div class="ui-modal-dialog interrest-free" role="document">
                            <div class="content">
                                <p class="ui-title">무이자할부</p>
                                <!-- //.content-head -->
                                <div class="content-body">


                                    <div class="benefit-wrap">
                                        <p class="ctypo17 bold">카드 무이자 특별행사 안내</p>
                                        <div class="tblwrap">
                                            <table>
                                                <caption>카드 무이자 특별 행사 안내</caption>
                                                <colgroup>
                                                    <col style="width:134px">
                                                    <col style="width:128px">
                                                    <col style="width:128px">
                                                    <col style="width:130px">
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th class="regular" scope="col">카드명</th>
                                                    <th class="regular" scope="col">결제수단</th>
                                                    <th class="regular" scope="col">금액기준(이상)</th>
                                                    <th class="regular" scope="col">행사개월수</th>
                                                </tr>
                                                </thead>
                                                <tbody>

                                                <tr>

                                                    <td class="txt-center" rowspan="4">비씨</td>

                                                    <td class="txt-center">스마일페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">H.PointPay</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">카카오페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="5">KB국민</td>

                                                    <td class="txt-center">신용카드</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">스마일페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">H.PointPay</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">카카오페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="3">삼성</td>

                                                    <td class="txt-center">스마일페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">카카오페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="4">현대</td>

                                                    <td class="txt-center">스마일페이</td>
                                                    <td class="txt-center">1만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">1만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">H.PointPay</td>
                                                    <td class="txt-center">1만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">카카오페이</td>
                                                    <td class="txt-center">1만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="3">롯데</td>

                                                    <td class="txt-center">스마일페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">H.PointPay</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="4">신한</td>

                                                    <td class="txt-center">스마일페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">H.PointPay</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">카카오페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="3">NH농협</td>

                                                    <td class="txt-center">신용카드</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7, 8</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center">카카오페이</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7, 8</td>
                                                </tr>

                                                <tr>

                                                    <td class="txt-center" rowspan="1">하나</td>

                                                    <td class="txt-center">토스결제</td>
                                                    <td class="txt-center">5만원</td>
                                                    <td class="txt-center">2, 3, 4, 5, 6, 7, 8</td>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <ul class="dotlist">
                                        <li>

                                            - 간편결제 (네이버페이/페이코/카카오페이/스마일페이/토스/삼성페이 등) 이용시 해당 간편결제의 무이자 할부 정책 적용<br> (일반
                                            신용카드 무이자 혜택 불가)<br>- 법인(개인사업자카드 포함)/체크/기프트카드 등 일부 카드 제외<br>- 카드사 제휴몰을 통해 접속
                                            경우 적용 불가<br>- BC카드는 NON-BC카드 불가 <br>- 제휴사이트를 통한 접속 시 무이자 혜택이 제외될 수 있음 <br>※
                                            별도 고지없이 행사 내용/기간 변경될 수 있으며, 자세한 문의는 각 카드사로 부탁드립니다.

                                        </li>
                                    </ul>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--//팝업 무이자할부-->
                    <!--팝업 결제수단-->


                    <!--팝업 적립혜택-->
                    <div class="ui-modal" id="modalAccumBenefit" tabindex="-1" role="dialog" aria-label="적립혜택">
                        <div class="ui-modal-dialog accumbenefit" role="document">
                            <div class="content">
                                <p class="ui-title">적립혜택</p>
                                <div class="content-body">

                                    <ul class="accbenefit-list">

                                        <li>
                                            <div class="tit-wrap">
                                                <h3>기본 H.Point</h3>
                                                <span class="point"><em>40</em>P</span>
                                            </div>
                                            <ul class="dotlist">
                                                <li>구매 시 적립받을 수 있는 최대 혜택</li>
                                                <li>상품 출고 기준 7일 후에 자동 적립되며, 현대백화점 그룹 통합멤버십 H.Point 회원에 한하여 적립됩니다. <br>
                                                    (유효기간 마이페이지에서 확인가능)
                                                </li>
                                                <li>상기 적립금액은 최종 결제금액에서 배송비 · H.Point · 적립금 사용분을 제외한 금액을 바탕으로 계산되어 표시된
                                                    금액보다 적을 수 있습니다.
                                                </li>
                                            </ul>
                                        </li>


                                    </ul>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--//팝업 적립혜택-->
                    <!-- @쿠폰 다운로드 ajax호출로 변경 -->

                    <!--팝업 사은품안내-->


                    <!--팝업 도착확률-->
                    <div class="ui-modal" id="modalDeliverPercent" tabindex="-1" role="dialog" aria-label="도착확률안내">
                        <div class="ui-modal-dialog deliverpercent" role="document">
                            <div class="content">
                                <p class="ui-title">배송 확률 안내</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <!-- <p class="ctypo15">배송비 : 무료</p>
                                    <p class="ctypo15">2일 후 도착 확률 98% <span>(단, 가구/설치/주문제작 제외)</span></p> -->
                                    <p class="ctypo15">
                                        <strong>


                                            배송비 :


                                            무료


                                        </strong><br>
                                        06/02(목)까지 배송 확률 62% <span>(단, 가구/설치/주문제작 제외)</span>
                                    </p>
                                    <!--gauge-list-->

                                    <ul class="gauge-list">
                                        <li>
                                            <p class="data"><span class="deliver-date">05/31(화)</span></p>
                                            <div class="gauge-box">
                                                <p class="gauge-bar">
                                                    <span class="gauge" style="width:20%;"></span>
                                                </p>
                                                <p class="rate">20%</p>
                                            </div>
                                        </li>
                                        <li class="top">
                                            <p class="data"><span class="deliver-date">06/02(목)</span></p>
                                            <div class="gauge-box">
                                                <p class="gauge-bar">
                                                    <span class="gauge" style="width:42%;"></span>
                                                </p>
                                                <p class="rate">42%</p>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="data"><span class="deliver-date">06/03(금)</span></p>
                                            <div class="gauge-box">
                                                <p class="gauge-bar">
                                                    <span class="gauge" style="width:19%;"></span>
                                                </p>
                                                <p class="rate">19%</p>
                                            </div>
                                        </li>
                                        <li>
                                            <p class="data"><span class="deliver-date">06/07(화) 이후</span></p>
                                            <div class="gauge-box">
                                                <p class="gauge-bar">
                                                    <span class="gauge" style="width:19%;"></span>
                                                </p>
                                                <p class="rate">19%</p>
                                            </div>
                                        </li>
                                    </ul>
                                    <!--//gauge-list-->
                                    <ul class="dotlist">
                                        <li>최근 배송된 주문건 대상으로, 가장 배송 확률이 높은 날짜를 예측했습니다. 실제 배송 완료일은 예측치와 다를 수 있습니다.</li>
                                        <li>일부상품은 지역에 따라 차이가 있을 수 있습니다.</li>
                                    </ul>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--//팝업 도착확률-->
                    <script type="text/javascript" defer="defer">
                        (function () {
                            console.log("${productVO}")

                            function injectScript() {
                                var _TRK_InSc = document.createElement('script');
                                _TRK_InSc.type = 'text/javascript';
                                _TRK_InSc.async = true;
                                _TRK_InSc.src = '//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js';
                                try {
                                    document.body.appendChild(_TRK_InSc);
                                } catch (e) {
                                }
                            }

                            try {
                                if (window.attachEvent) {
                                    window.attachEvent('onload', injectScript);
                                } else {
                                    window.addEventListener('load', injectScript, false);
                                }
                            } catch (e) {
                            }
                        })();
                    </script>
                    <!--팝업 백화점별재고현황-->
                    <div class="ui-modal" id="modalDeoartmentStock" tabindex="-1" role="dialog" aria-label="백화점관별재고현황">
                        <div class="ui-modal-dialog department-stock" role="document">
                            <div id="popup-modalDeoartmentStock" style="display:none">
                            </div>
                        </div>
                        <!-- //.content -->
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--//팝업 백화점별재고현황-->
                    <div class="ui-modal" id="modalReserPurchase" tabindex="-1" role="dialog" aria-label="예약구매">
                        <div class="ui-modal-dialog reserpurchase" role="document">
                            <div class="content">
                                <p class="ui-title">예약구매 안내</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <p class="ctypo15">구매하시는 상품 중 예약 구매 상품이 포함되어 있습니다. <br> 아래 예약 구매 상품을 확인 하시기 바랍니다.
                                    </p>
                                    <div class="reserv-itemlist"></div>
                                    <div class="btngroup">
                                        <!-- button class="btn btn-linelgray"><span>방송알리미 리스트</span></button -->


                                        <button class="btn btn-default" onclick="buyDirectFormSubmit()"><span>확인</span>
                                        </button>


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
                    <!--팝업 방송알리미-->
                    <div class="ui-modal" id="modalTvAlarm" tabindex="-1" role="dialog" aria-label="방송알리미">
                        <div class="ui-modal-dialog tvalarmwrap" role="document">
                            <div class="content">
                                <p class="ui-title">방송알리미</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <dl class="tv-alarm">
                                        <dt>상품명</dt>
                                        <dd class="pdname"></dd>
                                        <dt>수신방법</dt>
                                        <dd>
                                            <div class="radiobox">
                                                <label class="radlabel sm"><input type="radio" name="rad1" checked=""
                                                                                  aria-checked="true"><i
                                                        class="icon"></i><span>앱푸시 (PUSH)</span></label>
                                                <label class="radlabel sm btn-box"><input type="radio" name="rad1"><i
                                                        class="icon"></i> <span>-****-</span></label>
                                                <button class="btn btn-linelgray small25"><span>수정</span></button>
                                            </div>
                                        </dd>
                                        <dt>알림기간</dt>
                                        <dd>
                                            <div class="radio-box">
                            <span>
                                <input type="radio" name="rad1" checked="" aria-checked="true" id="rad1-1">
                                <label for="rad1-1" class="sm50">
                                    <span class="method-month">1개월</span>
                                </label>
                            </span>
                                                <span>
                                <input type="radio" name="rad1" aria-checked="false" id="rad1-2">
                                <label for="rad1-2" class="sm50">
                                    <span class="method-month">2개월</span>
                                </label>
                            </span>
                                                <span>
                                <input type="radio" name="rad1" aria-checked="false" id="rad1-3">
                                <label for="rad1-3" class="sm50">
                                    <span class="method-month">3개월</span>
                                </label>
                            </span>
                                            </div>
                                        </dd>
                                        <dt>알림횟수</dt>
                                        <dd>
                                            <div class="radio-box method-type">
                            <span>
                                <input type="radio" name="rad2" checked="" aria-checked="true" id="rad2-1">
                                <label for="rad2-1" class="sm50">
                                    <span class="method">1회</span>
                                </label>
                            </span>
                                                <span>
                                <input type="radio" name="rad2" aria-checked="flase" id="rad2-2">
                                <label for="rad2-2" class="sm50">
                                    <span class="method">방송시 마다</span>
                                </label>
                            </span>
                                            </div>
                                        </dd>
                                    </dl>
                                    <!--dotlist-->
                                    <ul class="dotlist">
                                        <li>방송알리미는 방송시작 30분 전 발송됩니다.</li>
                                        <li>21시 ~ 익일 8시 30분 편성상품의 방송알리미는 21시 이전에 사전 발송됩니다. 단, 야간 알림 PUSH 수신 동의시에는 방송 시작
                                            30분 전에 발송됩니다.
                                        </li>
                                        <li>앱푸시(PUSH)는 수신 동의가 되어 있어야 발송됩니다. (확인 및 수신동의 : Hmall앱 &gt; 설정 &gt; 알림설정 &gt;
                                            혜택 알림받기 ON)
                                        </li>
                                        <li>휴대폰 문자(SMS)수신 동의가 되어 있어야 등록이 가능합니다. (확인 및 수신동의 : 마이페이지 &gt; 회원정보 변경 &gt;
                                            휴대폰번호)
                                        </li>
                                        <li>방송편성은 현대홈쇼핑 사정에 따라 변경될 수 있습니다.</li>
                                    </ul>
                                    <!--//dotlist-->
                                    <div class="btngroup">
                                        <button class="btn btn-linegray"><span>방송알리미 리스트</span></button>
                                        <button class="btn btn-default"><span>등록하기</span></button>
                                        <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
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
                    <!--//팝업 방송알리미-->

                    <!--팝업 쿠폰다운로드-->
                    <div class="ui-modal" id="modalCouponDownload" tabindex="-1" role="dialog" aria-label="쿠폰다운로드">
                        <div class="ui-modal-dialog coupon-download" role="document">
                            <div class="content">
                                <p class="ui-title">쿠폰다운로드</p>
                                <!-- //.content-head -->
                                <div class="content-body">


                                    <div id="popup-coupon" style="display:none"></div>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--//팝업 쿠폰다운로드-->
                    <!--20200929 화요일 팝업 장바구니 담기-->
                    <div class="ui-modal" id="modalShopBasket" tabindex="-1" role="dialog" aria-label="장바구니담기">
                        <div class="ui-modal-dialog shopbasket" role="document">
                            <div class="content">
                                <p class="ui-title">장바구니 담기</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <div class="basket-item">
                                        <div class="thumbswrap">
                                            <img src="/resources/img/${imageVOList[0].IMAGE_NAME}.jpg"
                                                 alt="[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )"
                                                 onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=600x600&amp;AR=0')">
                                        </div>
                                        <div class="txtwrap">
                                            <strong class="ctypo15 bold" id="basktMessage">장바구니에 상품을 담았습니다.</strong>
                                            <!--장바구니에 담겨있는 상품을 다시 담은 경우-->
                                            <!-- <strong class="ctypo15 bold">이미 장바구니에 담긴 상품입니다.</strong> -->
                                            <p class="ctypo14">장바구니로 이동하시겠습니까?</p>
                                        </div>
                                    </div>
                                    <div class="btngroup">
                                        <button class="btn btn-linegray" data-dismiss="modal"><span>쇼핑 계속하기</span>
                                        </button>
                                        <button class="btn btn-default"
                                                onclick="location.href='https://www.hmall.com/p/odb/basktList.do'">
                                            <span>장바구니 가기</span></button>
                                        <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
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
                    <!--//팝업 장바구니 담기-->

                    <!--팝업 속성별선호도-->
                    <div class="ui-modal" id="modalCusMethPre" tabindex="-1" role="dialog" aria-label="속성별선호도">
                        <div class="ui-modal-dialog cusmethprefer" role="document">
                            <div class="content">
                                <p class="ui-title">고객님들의 속성별 선호도</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <!--gauge-list-->
                                    <ul class="gauge-list prefer">
                                        <div id="popup-modalCusMethPre" style="display:none">
                                        </div>
                                    </ul>
                                    <!--//gauge-list-->
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--//팝업 속성별선호도-->

                    <div class="ui-modal" id="modalGiftNoti" tabindex="-1" role="dialog" aria-label="선물포장안내">
                        <div id="gift-popup-content" class="ui-modal-dialog giftnoti" role="document">
                            <div class="content">
                                <p class="ui-title">선물포장안내</p>
                                <div class="content-body">
                                    <p class="ctypo17 bold" id="gift-popup-p">구매 하시는 상품은 선물포장, <br> <span>쇼핑백신청</span>이
                                        가능한 상품입니다.</p>
                                    <p class="ctypo14" id="gift-popup-p-two">선물 포장을 신청하시겠습니까?</p>
                                    <div id="gift-popup-button" class="btngroup">
                                        <button class="btn btn-linegray"
                                                onclick="setBoxPrsnPackGbcd('0');setSpbgPrsnPackGbcd('0');buyDirect();">
                                            <span>아니오</span></button>
                                        <button class="btn btn-default"
                                                onclick="setBoxPrsnPackGbcd('1');setSpbgPrsnPackGbcd('1');buyDirect();">
                                            <span>예</span></button>
                                    </div>
                                </div>
                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                        </div>
                    </div>


                    <!-- //.ui-modal -->
                    <!--// [11/04] 수정(선물포장안내)-->
                    <!--//팝업-->
                    <script>
                        var html = '';
                        var arrData = [
                            {
                                per: 85,
                                txt: '싸게 11'
                            },
                            {
                                per: 15,
                                txt: '괜찮아 33'
                            },
                            {
                                per: 25,
                                txt: '조금비싸 22'
                            }

                        ]
                        var arr = arrData.sort(function (a, b) {
                            return b.per - a.per
                        });
                        for (var i = 0; i < arr.length; i++) {
                            html += '<div class="part">' +
                                '<p class="data"><span>' + arr[i].txt + '</span></p>' +
                                '<div class="gauge-box">' +
                                '    <p class="gauge-bar">' +
                                '        <span class="gauge" style="width:' + arr[i].per + '%;"></span>' +
                                '    </p>' +
                                '    <p class="rate">' + arr[i].per + '<span>%</span></p>' +
                                '</div>' +
                                '</div>';
                        }
                        $('#rateItem').append(html);

                        // $()
                        $(document).on('click', '.item-box-list a', function () {
                            $(this).closest('.dropdown-menu').siblings('[data-modules-dropdown]').dropdown('toggle');
                        })
                    </script>
                    <!--//팝업 장바구니 담기-->
                    <div class="ui-modal" id="modalSpecialDeliver" tabindex="-1" role="dialog" aria-label="특화배송서비스">
                        <div class="ui-modal-dialog specialdeliver" role="document">
                            <div class="content">
                                <p class="ui-title">스토어픽</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <div class="tabgroup">


                                        <div class="tab-content">
                                            <!--20201008 목요일 아이디값 수정-->

                                            <!--20201008 목요일 아이디값 수정-->

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

                    <script>
                        function specialDeliveryPopup(tabIdx) {
                            var uiTitle = ['스토어픽', '특화배송서비스'];
                            var miniTabText = ['스토어픽', '편의점 픽업', '안심 택배함'];
                            setTimeout(function () {
                                $('#modalSpecialDeliver .ui-title').text(uiTitle[tabIdx]);
                                $('#modalSpecialDeliver #modalSpecialDeliverTab li:eq(' + (tabIdx) + ') a').click();
                            }, 300);
                        }

                        function changeSpecialDeliveryTitle(tabIdx) {
                            var uiTitle = ['스토어픽', '특화배송서비스'];
                            if (tabIdx == 0) {
                                $('#modalSpecialDeliver #tabCnt1 .early-deliver .tab-pick li').each(function (index) {
                                    if ($(this).hasClass('ui-active')) {
                                        changeSpecialDeliverySubTitle(index);
                                    }
                                });
                            } else {
                                $('#modalSpecialDeliver .ui-title').text(uiTitle[tabIdx]);
                            }
                        }

                        function changeSpecialDeliverySubTitle(tabIdx) {
                            var miniTabText = ['스토어픽', '편의점 픽업', '안심 택배함'];
                            $('#modalSpecialDeliver .ui-title').text(miniTabText[tabIdx]);
                        }
                    </script>

                    <!--팝업 방송알리미등록-->
                    <div class="ui-modal" id="modalTvAlarmEnroll" tabindex="-1" role="dialog" aria-label="방송알리미등록">
                        <div class="ui-modal-dialog tvalarm-enroll" role="document">
                            <div class="content">
                                <p class="ui-title">방송알리미 등록</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <!--20200924 목요일 class추가 // 기타팝업에서 공통으로 방송알리미 등록 팝업 사용 예정-->
                                    <dl class="pd-tvalarm-enroll">


                                        <dt>전체</dt>
                                        <dd class="pdname">SHOW핑 라이브 방송 전체</dd>


                                        <dt>수신방법</dt>


                                        <dd>앱푸시(PUSH)</dd>


                                        <dt>알림기간</dt>


                                        <dd>1개월</dd>


                                        <dt>알림횟수</dt>


                                        <dd>1회</dd>


                                    </dl>
                                    <div class="btngroup">
                                        <button class="btn btn-linelgray" id="btn_cancel"><span>방송알리미 리스트</span>
                                        </button>
                                        <button class="btn btn-default" id="btn_receive"><span>확인</span></button>
                                        <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
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
                    <div class="ui-modal" id="modalRestockAlarm" tabindex="-1" role="dialog" aria-label="재입고알리미">
                        <div class="ui-modal-dialog restockalarm" role="document">
                            <div class="content">
                                <p class="ui-title">재입고 알리미</p>
                                <!-- //.content-head -->
                                <div class="content-body">
                                    <div class="form-list">
                                        <!--휴대폰번호-->
                                        <div class="inputbox md">
                                            <label class="inplabel"><input type="text" id="smsHpIdntNo"
                                                                           name="smsHpIdntNo" value=""
                                                                           placeholder="휴대폰 번호 (예 : 01012345678)"
                                                                           title="휴대폰번호" selected=""></label>
                                            <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span>
                                            </button>
                                        </div>
                                        <!--//휴대폰번호-->
                                        <button class="btn btn-linegray" onclick="restockAlarm('add');"><span>신청</span>
                                        </button>
                                    </div>
                                    <ul class="dotlist">
                                        <li>재고가 다시 소진되는 경우 품절이 될 수 있습니다.</li>
                                    </ul>
                                </div>
                                <!-- //.content-body -->

                                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span
                                        class="hiding">레이어 닫기</span></button>
                            </div>
                            <!-- //.content -->
                        </div>
                        <!-- //.ui-modal-dialog -->
                    </div>
                    <!--팝업 스토어픽신청-->
                    <div class="ui-modal" id="modalStorePick" tabindex="-1" role="dialog" aria-label="스토어픽신청">
                        <div class="ui-modal-dialog storepick-enroll" role="document">
                            <div class="content">
                                <p class="ui-title">스토어픽 신청
                                    <input type="hidden" name="tempStpicYn" id="tempStpicYn" value="N">
                                    <!-- //.content-head -->
                                </p>
                                <div class="content-body">
                                    <p class="ctypo17 bold">픽업날짜 선택
                                        <!--radio-box-->
                                    </p>
                                    <div class="radio-box">


                                    </div>
                                    <input type="hidden" name="pickUpDt" id="pickUpDt" value="">

                                    <!--//radio-box-->
                                    <!--bgbox-->
                                    <div class="bgbox pick">
                                        <dl>
                                            <dt>픽업지점</dt>
                                            <dd class="pick-loca"></dd>
                                            <dt>픽업매장</dt>
                                            <dd class="pick-store"></dd>
                                        </dl>
                                    </div>
                                    <!--//bgbox-->
                                    <!--dotlist-->
                                    <ul class="dotlist">
                                        <li>당일 픽업 : 4시 (15:59) 이전 주문건(당일 픽업 불가 상품 제외)</li>
                                        <li>자동취소 : 픽업 예정일 경과시</li>
                                    </ul>
                                    <!--//dotlist-->
                                    <div class="btngroup">
                                        <button class="btn btn-linegray" onclick="addStpicCart(this);">
                                            <span>스토어픽 장바구니</span></button>
                                        <button class="btn btn-default" onclick="stpicBuyDirect(this);">
                                            <span>스토어픽 바로구매</span></button>
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
                    <!--//팝업 스토어픽신청-->

                    <!-- 방송 전사 통합 프로모션 배너 -->


                    <!-- 상품상세(마케팅용) 상단배너 R023 BG컬러o -->


                    <a class="banner-template event img" style="background-color:#f1e0b5"
                       onclick="javascript:gaTagging(this, 'https://www.hmall.com/mevent/eva/evntView.do?prmoNo=00057107', '', '');"
                       ga-custom-name="상품상세" ga-custom-position="상세가로배너(마케팅용)" ga-custom-creative="105155_슈퍼H페스타"
                       ga-custom-id="" ga-custom-title="상품>상품상세>메인" ga-custom-etc="urlAction">


                        <div class="banner">
                            <img src="https://image.hmall.com/HM/HM026/20220429/130922/event.png" alt="슈퍼H페스타">
                        </div>

                        <div class="banner-txt">
                            <p class="tit">5월 방송상품 혜택 마감임박</p>
                            <p class="txt">3회&amp;40만원, 5회&amp;60만원<br>구매로 독보적 혜택 찬스♥</p>
                        </div>
                    </a>


                    <!-- //상품상세(마케팅용) 상단배너 -->

                    <!-- 상품상세 마케팅 공지용 배너 R022 -->

                    <!-- //상품상세 마케팅 공지용 배너 -->
                    <script type="text/javascript">
                        //상품상세 배너 링크
                        function goToBnnrLink(bnnrUrl) {
                            window.location.href = bnnrUrl;
                        }
                    </script>

                    <!--함께 방송중인 다른 상품-->
                    <div class="product-wrap pdslide" id="onair-prd-all-view">


                    </div>
                    <!--//함께 방송중인 다른 상품-->


                    <!-- 이 상품을 본 고객님들이 함께 본 다른 상품 시작 -->
                    <div class="product-wrap pdslide" style="display:none;" id="rcmmSectShowTogetherArea">

                    </div>
                    <!-- // 이 상품을 본 고객님들이 함께 본 다른 상품 끝 -->

                    <!-- product-detail-content --> <!--20200911 금요일 공통 레이아웃으로 변경-->
                    <div class="product-detail-content">
                        <!--scrollspy-wrap-->
                        <div class="scrollspy-wrap">
                            <!--scrollspy-tab-->
                            <div class="scroll-observer"></div>
                            <div class="scrollspy-tab" data-modules-scrollspy="padding:103" style="height: 63.9941px;">
                                <div class="inner">
                                    <ul class="nav-tabs ui-spynav" role="tablist" style="margin-top: 0px;">
                                        <li role="presentation" class="ui-active"><a href="#viewPage01"
                                                                                     class="gp_className"
                                                                                     ga-category="상품상세" ga-action="탭"
                                                                                     ga-label="상세설명"><span>상세설명</span></a>
                                        </li> <!--class="ui-active"시 현재페이지 보여줌-->
                                        <li role="presentation"><a href="#viewPage02" class="gp_className"
                                                                   ga-category="상품상세" ga-action="탭"
                                                                   ga-label="기본정보"><span>기본정보</span></a></li>


                                        <li role="presentation"><a href="#viewPage03" class="gp_className"
                                                                   ga-category="상품상세" ga-action="탭"
                                                                   ga-label="만족도"><span>고객만족도<em>4,441</em></span></a>
                                        </li>


                                    </ul>
                                </div>
                            </div>
                            <!--//scrollspy-tab-->
                            <div class="pages page1" id="viewPage01">


                                <!-- PC 상세가로배너(MD용) 신규_20200402 R021 -->

                                <!--content-area // 상품구매안내-->


                                <!-- 2019.01.29 storepick -->


                                <!-- 엄지 펀딩 시작-->


                                <div class="prod_buy_info">
                                    <div class="content-area noti-guide">
                                        <p class="noti-guide">상품구매 안내</p>


                                        <div class="cnt-txt">


                                            <p>
                                                <br></p>

                                        </div>


                                    </div>


                                    <div class="content-area prod_detail_view open">
                                        <div class="view_cont">
                                            <div class="mt25" style="overflow:hidden" id="guidance">
                                                <table width="100%" summary="제품설명입니다">
                                                    <caption>제품설명</caption>
                                                    <colgroup>
                                                        <col width="">
                                                    </colgroup>
                                                    <thead>
                                                    <tr>
                                                        <th></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>


                                                            <p>&nbsp;</p>
                                                            <p>
                                                                <%--                                                                <img src="http://image.hyundaihmall.com/CO/EDITOR/20210302/140909557/26s1w.jpg">--%>
                                                                ${productVO.product_detail}
                                                            </p>
                                                            <p>&nbsp;</p>
                                                            <p>&nbsp;</p>


                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- 안전인증 태그 노출 -->

                                    </div>

                                    <!-- 상품기술서사진노출-->
                                    <div class="content-area">
                                        <div class="product-banner-wrap vertical">
                                            <div class="product-mainbanner slick-initialized slick-slider"
                                                 data-modules-slick="dots:false; arrows:false; infinite:true; thumbnaiList:.slider-thumbnaii-ver;">
                                                <div class="slick-list draggable">
                                                    <div class="slick-track"
                                                         style="opacity: 1; width: 3640px; transform: translate(-2600px, 0px);">
                                                        <div class="slick-slide slick-cloned" data-slick-index="-1"
                                                             aria-hidden="true" style="width: 520px;" tabindex="-1">
                                                            <div>
                                                                <div class="item" data-item=""
                                                                     data-outputsrc="/resources/img/image_example1.jpg"
                                                                     onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                     style="width: 100%; display: inline-block; vertical-align: top;">
                                                                    <a href="javascript:;"
                                                                       onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                       tabindex="-1"><img
                                                                            src="https://image.hmall.com/static/2/8/85/39/2139858205_4.png?RS=520x520&amp;AR=0"
                                                                            alt="2139858205_4.png"
                                                                            onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <c:forEach items="${imageVOList}" var="imageVO"
                                                                   varStatus="status">
                                                            <div class="slick-slide" data-slick-index="${status.index}"
                                                                 aria-hidden="true"
                                                                 style="width: 520px;" tabindex="-1">
                                                                <div>
                                                                    <div class="item" data-item=""
                                                                         data-outputsrc="/resources/img/image_example1.jpg"
                                                                         onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                         style="width: 100%; display: inline-block; vertical-align: top;">
                                                                        <a href="javascript:;"
                                                                           onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                           tabindex="-1"><img
                                                                                src="/resources/img/${imageVO.IMAGE_NAME}"
                                                                                alt="2139858205_0.png"
                                                                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <div class="slick-slide slick-cloned" data-slick-index="5"
                                                             aria-hidden="true" style="width: 520px;" tabindex="-1">
                                                            <div>
                                                                <div class="item" data-item=""
                                                                     data-outputsrc="/resources/img/image_example1.jpg"
                                                                     onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                                                     style="width: 100%; display: inline-block; vertical-align: top;">
                                                                    <a href="javascript:;"
                                                                       onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                                                       tabindex="-1"><img
                                                                            src="https://image.hmall.com/static/2/8/85/39/2139858205_0.png?RS=520x520&amp;AR=0"
                                                                            alt="2139858205_0.png"
                                                                            onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slider-thumbnaii-ver">
                                                <ul>

                                                    <li class="ui-thumbnaii ui-active">


                                                        <img src="/resources/img/${imageVOList[0].IMAGE_NAME}.jpg"
                                                             id="smallPic_1" alt="상품이미지"
                                                             style="width:100px; height:100px;"
                                                             onerror="this.src='https://image.hmall.com/hmall/pd/no_image_100x100.jpg'">


                                                    </li>

                                                    <li class="ui-thumbnaii">


                                                        <img src="/resources/img/${imageVOList[0].IMAGE_NAME}.jpg"
                                                             id="smallPic_2" alt="상품이미지"
                                                             style="width:100px; height:100px;"
                                                             onerror="this.src='https://image.hmall.com/hmall/pd/no_image_100x100.jpg'">


                                                    </li>

                                                    <li class="ui-thumbnaii">


                                                        <img src="/resources/img/${imageVOList[0].IMAGE_NAME}.jpg"
                                                             id="smallPic_3" alt="상품이미지"
                                                             style="width:100px; height:100px;"
                                                             onerror="this.src='https://image.hmall.com/hmall/pd/no_image_100x100.jpg'">


                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>


                                    <!-- 190402 안하영 - 운동기구 상품상세 안내 권고사항 추가 -->

                                    <!-- 190523 - 고데기 상품군 주의사항 인포그래픽 추가 -->

                                    <!-- 결제정보 -->
                                    <div class="content-area">
                                        <div class="cnt-txt">
                                            <h3>결제 정보</h3>
                                            <p>주문 후 확인과정에서 카드 도난, 카드 도용, 상업적 재판매 등 비정상적인 주문의 우려가 있다고 판단되는 경우에는 임의로 배송이
                                                보류되거나, 주문이 취소될 수 있습니다.</p>
                                        </div>
                                    </div>
                                    <!-- 반품 배송비 안내 -->

                                    <br>


                                </div>

                                <div class="pages page2" id="viewPage02">

                                    <div id="PDAItemOptBasicInfoHtml">


                                        <script type="text/javascript">
                                            //쇼핑가이드 제거 후 팝업으로 안내 변경
                                            function openPopupShopping(popup) {
                                                $('#modalSpecialDeliverTab li').eq(0).find('a').click();
                                                $('#modalSpecialDeliverTab').hide();
                                                $('#modalSpecialDeliver').modal().show();
                                                if (popup == 'type1') {
                                                    $('#modalSpecialDeliver .ui-tab.tab-pick li').eq(1).find('a').click();
                                                } else if (popup == 'type2') {
                                                    $('#modalSpecialDeliver .ui-tab.tab-pick li').eq(2).find('a').click();
                                                }
                                                $('#modalSpecialDeliver').modal().show();
                                            }
                                        </script>


                                        <!--content-area // 상품정보-->
                                        <div class="content-area">
                                            <div class="tblwrap">
                                                <table>
                                                    <caption>상품필수정보및인증정보</caption>
                                                    <colgroup>
                                                        <col style="width:220px">
                                                        <col style="width:auto">
                                                    </colgroup>
                                                    <tbody>
                                                    <tr>
                                                        <th scope="row" class="txt-left">상품코드</th>
                                                        <td>122712699</td>
                                                    </tr>


                                                    <tr>
                                                        <th scope="row" class="txt-left">가격</th>


                                                        <td>29,900원</td>
                                                    </tr>


                                                    <tr>


                                                        <th scope="row" class="txt-left">배송비</th>


                                                        <td><p>


                                                            무료


                                                            <!-- 추가배송비 선결제 2020.07.17 -->


                                                        </p>


                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <th scope="row" class="txt-left">택배사</th>
                                                        <td>CJ대한통운</td>
                                                    </tr>


                                                    <tr>
                                                        <th scope="row" class="txt-left">배송확률</th>
                                                        <td>
                                                            <div class="deliver-percent-wrap">


                                                                <a href="javascript://" class="deliver-percent"
                                                                   data-modules-modal="target:#modalDeliverPercent2">06/02(목)까지
                                                                    배송 확률 <strong>62%</strong><i
                                                                            class="icon icon-arrow"></i></a>
                                                                <a href="#tooltipDeliverPer" class="deliver-day"
                                                                   data-modules-tooltip=""><i class="icon que-mark"></i></a>
                                                                <div class="tooltip-box" id="tooltipDeliverPer"
                                                                     style=""> <!--임시로 style적용 / 사용시 style 걷어주세요!-->
                                                                    <div class="thead">
                                                                        <p class="tit">배송 확률</p>
                                                                    </div>
                                                                    <p class="txt">최근 배송된 주문건 대상으로, 가장 배송 확률이 높은 날짜를
                                                                        예측했습니다.<br>실제 배송 완료일은 예측치와 다를 수 있습니다.<br><br>일부상품은
                                                                        지역에 따라 차이가 있을 수 있습니다.</p>
                                                                    <button class="btn-close"><i class="icon"></i><span
                                                                            class="hiding">닫기</span></button>
                                                                    <button class="btn-close"><i class="icon"></i><span
                                                                            class="hiding">닫기</span></button>
                                                                </div>


                                                            </div>
                                                        </td>
                                                    </tr>


                                                    <tr>
                                                        <th scope="row" class="txt-left">배송지역</th>
                                                        <td>


                                                            <p>도서/산간지역 불가,제주불가</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <th scope="row" class="txt-left">반품/교환</th>
                                                        <td>
                                                            상품확인 후 환불
                                                            <!--
                                                                                    <a class="getHelp renewToolTip" href="javascript:;" data-toolindex="7"></a>
                                                                                    <div class="tooltip tip_2 renewToolTip7">반품상품이 도착하면 상품상태 확인 후 환불 및 교환이 진행됩니다.</div>
                                                             -->
                                                            /

                                                            반품관련배송비 없음
                                                            /

                                                            교환관련배송비 없음

                                                            <!-- 추가배송비 선결제 2020.07.17 -->

                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!--//content-area // 상품정보-->


                                        <!--content-area // 상품필수정보 및 유의사항-->
                                        <div class="content-area">
                                            <!--accparent-->
                                            <div class="accparent">
                                                <!--01: -h3/accordion-panel에 selected 시 열림-->
                                                <h3 class="selected">
                                                    <button onclick="image_slide('상품상세','기본정보','상품 필수정보 및 인증정보')"
                                                            data-modules-collapse="parent:.accparent;"
                                                            class="accordion-trigger" aria-expanded="true"><i
                                                            class="icon question"></i><span>상품 필수정보 및 인증정보</span><i
                                                            class="icon acc-arrow"></i></button>
                                                </h3>
                                                <div class="accordion-panel basic basic-txt01 selected"
                                                     role="basic-txt01" aria-label="상품 필수정보 및 인증정보">

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">품목 또는 명칭</strong>
                                                        <p>[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">포장단위별 내용물 용량(중량),수량,크기</strong>
                                                        <p>1박스 3kg (11∼14과) <br><br>총 2박스<br></p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">제조자 및 제조자 소재지(수입의 경우 수입자명
                                                            함께표기)</strong>
                                                        <p>농업회사법인주식회사 참</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">원산지</strong>
                                                        <p>한국, 한국</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">제조연월일(포장일또는생산연도),유통기한</strong>
                                                        <p>2021년 10월이후 수확/포장</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">관련법상표시사항</strong>
                                                        <p>해당사항없음</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">상품구성</strong>
                                                        <p>[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">보관방법 또는
                                                            취급방법</strong>
                                                        <p>서늘한곳에 보관하시거나 <br><br>냉장보관 하시면 됩니다.</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">소비자상담 관련
                                                            전화번호</strong>
                                                        <p>현대홈쇼핑 080-040-0000</p>
                                                    </div>

                                                    <div class="txt-info">
                                                        <strong class="ctypo15 bold">소비자안전을 위한 주의사항(식품 등의 표시·광고에 관한
                                                            법률)</strong>
                                                        <p>해당사항 없음 </p>
                                                    </div>


                                                </div>
                                                <!--01-->
                                                <!--02: -h3/accordion-panel에 selected 시 열림-->

                                                <h3>
                                                    <button onclick="image_slide('상품상세','기본정보','배송/교환/환불/AS/유의사항')"
                                                            data-modules-collapse="parent:.accparent;"
                                                            class="accordion-trigger" aria-expanded="false"><i
                                                            class="icon question"></i><span>배송/교환/환불/AS/유의사항</span><i
                                                            class="icon acc-arrow"></i></button>
                                                </h3>
                                                <div class="accordion-panel basic basic-txt02" role="basic-txt02"
                                                     aria-label="배송/교환/환불/AS/유의사항">


                                                    <div class="txt-info"><p><strong>전자상거래 소비자보호에 관한 법률에 의한 반품/교환 규정이
                                                        상품공급업체가 지정한 반품/교환 조건보다 우선합니다.</strong></p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙ 배송소요일<br></strong>&nbsp; · 결제 완료일 다음날로부터 2 ~
                                                            7일(토요일/공휴일 제외, 도서지역 4~8일)<br>&nbsp; · 설치 및 주문제작상품 :
                                                            5일~15일(최장 30일, 토요일/공휴일 제외)<br>&nbsp; · 본 상품은 협력사 사정에 따라 주문 후
                                                            "품절"이 발생 될 수 있으며, 이 경우 즉시 연락을 드려 환불해 드리오니<br>&nbsp;&nbsp;&nbsp;
                                                            이 점 양해 바랍니다.&nbsp; </p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙ 교환/반품/취소</strong><br>&nbsp; · 상품을 인도 받은 날로부터 7일 이내에
                                                            당해 계약에 관한 청약철회(반품) 가능합니다.<br>&nbsp;&nbsp;&nbsp; 상품명 주변에
                                                            [TV쇼핑]이 표시된 상품은 상품 인도일 이후 30일 <br>&nbsp;&nbsp;&nbsp;
                                                            (의류,보석,핸드백,슈즈,선글라스는 15일,농산물 수산물 축산물 등 신선식품:7일) 이내 청약 철회 가능
                                                        </p>
                                                        <p><span style="FONT-SIZE: 10pt" ar-sa?="" mso-bidi-language:=""
                                                                 ko;="" mso-fareast-language:="" en-us;=""
                                                                 mso-ansi-language:="" minor-bidi;=""
                                                                 mso-bidi-theme-font:="" roman\?;="" new="" \?times=""
                                                                 mso-bidi-font-family:="" minor-latin;=""
                                                                 mso-hansi-theme-font:="" minor-fareast;=""
                                                                 mso-fareast-theme-font:="" mso-ascii-theme-font:=""
                                                                 11.0pt;="" mso-bidi-font-size:="" 115%;=""
                                                                 line-height:="" red;="" color:="" 고딕\?;="" 맑은=""><span
                                                                style="COLOR: #123456">&nbsp;&nbsp;&nbsp; ※ <span
                                                                style="FONT-SIZE: 10pt; FONT-FAMILY: &quot;맑은 고딕&quot;; COLOR: red; LINE-HEIGHT: 115%; mso-bidi-font-size: 11.0pt; mso-ascii-theme-font: minor-latin; mso-fareast-theme-font: minor-fareast; mso-hansi-theme-font: minor-latin; mso-bidi-font-family: &quot;Times New Roman&quot;; mso-bidi-theme-font: minor-bidi; mso-ansi-language: EN-US; mso-fareast-language: KO; mso-bidi-language: AR-SA"><span
                                                                style="COLOR: #123456">단</span><span lang="EN-US"
                                                                                                     style="COLOR: #123456">, </span><span
                                                                style="COLOR: #123456">식품의 경우</span><span lang="EN-US"
                                                                                                          style="COLOR: #123456">, </span><span
                                                                style="COLOR: #123456">상품 출고 이후 상품의 변질 및 유통기간 단축 등으로 인해 재판매가 어려운 경우는 교환</span><span
                                                                lang="EN-US" style="COLOR: #123456">/</span><span
                                                                style="COLOR: #123456">반품이 불가할 수 있습니다</span><span
                                                                lang="EN-US"
                                                                style="COLOR: #123456">.</span></span></span></span>&nbsp;<br>&nbsp;
                                                            · 교환시, 교환 상품이 도착 한 후에 상품을 배송해드립니다. <br>&nbsp; · 반품시, 반품 상품이
                                                            도착 한 후에 결제가 취소됩니다.<br>&nbsp; · 일부상품은 고객변심에 의한 반품/교환시 배송비
                                                            고객부담(상품설명에 명시된 상품)<br>&nbsp; · 교환/반품/취소신청방법 : 인터넷 주문/배송조회
                                                        </p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙ 신선/냉동식품 교환/반품 안내<br></strong>&nbsp; · 상품의 특성상 배송이
                                                            시작되면 취소/반품이 불가합니다.(단 상품 불량인 경우 제외)</p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙교환/반품 불가사유(상품하자시 제외)</strong><br>&nbsp; · 반품/교환
                                                            가능기간을 초과하였을 경우 <br>&nbsp; · 상품 및 구성품을 사용하였거나 부주의로 인하여 상품이
                                                            훼손(파손/고장/오염 등)된 경우<br>&nbsp; · 상품 사용 시 상품설명에 기재된 주의사항을 지키지
                                                            않는 경우<br>&nbsp; · 상품택을 파손하였거나 분실했을 경우<br>&nbsp; · 배달 후 설치완료된
                                                            상품인 경우<br>&nbsp; · 기타, '전자상거래 등에서의 소비자보호에 관한 법률'이 정하는 청약철회
                                                            제한사유에 해당되는 경우.</p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙교환/반품 참고사항</strong><br>&nbsp; · 교환/반품은 청약철회 기간내에만
                                                            가능하며, 청약철회 기간 이후에는 상품의 하자시에만 가능합니다.<br>&nbsp; · 반품/교환시 고객님
                                                            귀책사유로 인해 수거가 지연될 경우에는 반품이 제한될 수 있습니다.<br>&nbsp; · 일부 상품은 트러블
                                                            발생시 소견서, 진료확인서 중 1가지를 첨부하셔야 반품이 가능합니다.<br>&nbsp; · 가격변동으로 인한
                                                            반품 및 가격보상은 불가합니다.<br>&nbsp; · 판매하는 협력사별로 동일 상품이어도 가격에 차이가 있을
                                                            수 있으며, 이로인한 반품이나 교환은 불가합니다.</p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙A/S 안내</strong><br>&nbsp; · 상품불량에 의한 반품, 교환, A/S,
                                                            환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁해결기준<br>&nbsp;&nbsp; (공정거래위원회
                                                            고시)에 따라 받으실 수 있습니다.</p>
                                                        <p>&nbsp;</p>
                                                        <p><strong>⊙ 미성년자 권리보호 안내<br></strong>&nbsp;<u> · 구매자가 미성년자일 경우,
                                                            법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인 또는&nbsp;법정 대리인이 그 계약을 취소할 수
                                                            있습니다. </u></p>
                                                        <p>&nbsp;</p></div>

                                                </div>
                                                <!--02-->
                                            </div>
                                            <!--//accparent-->
                                        </div>
                                        <!--//content-area // 상품필수정보 및 유의사항-->


                                        <div class="ui-modal" id="modalDeliverPercent2" tabindex="-1" role="dialog"
                                             aria-label="도착확률안내">
                                            <div class="ui-modal-dialog deliverpercent" role="document">
                                                <div class="content">
                                                    <p class="ui-title">배송 확률 안내</p>
                                                    <!-- //.content-head -->
                                                    <div class="content-body" id="content-body">
                                                        <p class="ctypo15">


                                                            배송비 :


                                                            무료


                                                        </p>
                                                        <p class="ctypo15">06/02(목)까지 배송 확률 62%
                                                            <span>(단, 가구/설치/주문제작 제외)</span></p>
                                                        <!--gauge-list-->

                                                        <ul class="gauge-list">
                                                            <li>
                                                                <p class="data">
                                                                    <span class="deliver-date">05/31(화)</span>
                                                                </p>
                                                                <div class="gauge-box">
                                                                    <p class="gauge-bar">
                                                                        <span class="gauge" style="width:20%;"></span>
                                                                    </p>
                                                                    <p class="rate">20%</p>
                                                                </div>
                                                            </li>
                                                            <li class="top">
                                                                <p class="data">
                                                                    <span class="deliver-date">06/02(목)</span>
                                                                </p>
                                                                <div class="gauge-box">
                                                                    <p class="gauge-bar">
                                                                        <span class="gauge" style="width:42%;"></span>
                                                                    </p>
                                                                    <p class="rate">42%</p>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <p class="data">
                                                                    <span class="deliver-date">06/03(금)</span>
                                                                </p>
                                                                <div class="gauge-box">
                                                                    <p class="gauge-bar">
                                                                        <span class="gauge" style="width:19%;"></span>
                                                                    </p>
                                                                    <p class="rate">19%</p>
                                                                </div>
                                                            </li>
                                                            <li>
                                                                <p class="data">
                                                                    <span class="deliver-date">06/07(화) 이후</span>
                                                                </p>
                                                                <div class="gauge-box">
                                                                    <p class="gauge-bar">
                                                                        <span class="gauge" style="width:19%;"></span>
                                                                    </p>
                                                                    <p class="rate">19%</p>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                        <!--//gauge-list-->
                                                        <ul class="dotlist">
                                                            <li>배송 확률은 결제완료 후 고객님께 상품이 도착할때까지 걸리는 배송 소요일자별 확률 중 가장 높은
                                                                확률입니다.
                                                            </li>
                                                            <li>배송기간은 영업일 기준(주말,공휴일 제외)입니다.</li>
                                                        </ul>
                                                    </div>
                                                    <!-- //.content-body -->

                                                    <button class="btn btn-close" data-dismiss="modal"><i
                                                            class="icon xico"></i><span class="hiding">레이어 닫기</span>
                                                    </button>
                                                </div>
                                                <!-- //.content -->
                                            </div>
                                            <!-- //.ui-modal-dialog -->
                                        </div>

                                    </div>
                                </div>

                                <!-- 상품평 tab -->
                                <div class="pages page3" id="viewPage03">


                                    <!-- 상품평 프로모션 배너 -->

                                    <!-- 상품평 배너 R024 -->


                                    <div class="content-area">
                                        <div class="tit-wrap review satisfaction">


                                            <button ga-category="상품상세" ga-action="만족도" ga-label="만족도 평가"
                                                    class="btn btn-lineblack small itemEvalRegBtn gp_className"><span><i
                                                    class="icon review"></i>만족도 평가</span></button>
                                            <input type="hidden" value="2122712699">


                                        </div>

                                        <!-- 상품평 딜/옵션 combobox -->

                                    </div>

                                    <input type="hidden" name="prodOptYn" id="prodOptYn" value="">

                                    <div id="itemOptEvalInfo">


                                        <!-- 2018.04 상품평 개선 ADD -->
                                        <!-- default media server path -->
                                        <!-- N :  :  : :  : N :  -->


                                        <script>
                                            var globalSlitmCd = '2122712699';
                                        </script>
                                        <!-- 상품평 -->

                                        <!--// 상품평 -->

                                        <!-- 만족도 -->

                                        <input type="hidden" name="test" value="0">


                                        <!-- 만족도 딜이 아닌 경우 -->
                                        <!-- start custmrSatisfy -->
                                        <div class="content-area review-point">
                                            <h3>구매고객 총 만족도</h3>
                                            <!--review-star -->


                                            <div class="review-star">
                                                <div class="starbg type-big pt9">
                                                    <p class="score"><span class="hiding">90점</span></p>
                                                </div>
                                                <span class="like-point" aria-label="포인트"><em>4.5</em></span>
                                            </div>

                                            <!-- //.review-star -->
                                            <!--review-rate -->
                                            <div class="review-rate ui-active">
                                                <strong class="hiding">평가 비율</strong>
                                                <div class="rate-list">
                                                    <!--2018.04 상품평 개선 , 상품평 항목에 따라 part 갯수 1~3개로 운용. 자동 중앙 정렬 -->


                                                    <div class="rate-item" id="rateItem0">
                                                        <!--20200909 수요일 pc레이아웃 공통 rate-item 추가-->
                                                        <p class="rate-tit">신선도</p>
                                                        <div class="part">
                                                            <p class="data"><span>신선해요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:56%;"></span>
                                                                </p>
                                                                <p class="rate">56<span>%</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="part">
                                                            <p class="data"><span>적당해요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:31%;"></span>
                                                                </p>
                                                                <p class="rate">31<span>%</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="part">
                                                            <p class="data"><span>별로예요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:13%;"></span>
                                                                </p>
                                                                <p class="rate">13<span>%</span></p>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="rate-item" id="rateItem1">
                                                        <!--20200909 수요일 pc레이아웃 공통 rate-item 추가-->
                                                        <p class="rate-tit">맛</p>
                                                        <div class="part">
                                                            <p class="data"><span>맛있어요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:51%;"></span>
                                                                </p>
                                                                <p class="rate">51<span>%</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="part">
                                                            <p class="data"><span>평범해요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:32%;"></span>
                                                                </p>
                                                                <p class="rate">32<span>%</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="part">
                                                            <p class="data"><span>맛없어요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:17%;"></span>
                                                                </p>
                                                                <p class="rate">17<span>%</span></p>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="rate-item" id="rateItem2">
                                                        <!--20200909 수요일 pc레이아웃 공통 rate-item 추가-->
                                                        <p class="rate-tit">포장상태</p>
                                                        <div class="part">
                                                            <p class="data"><span>꼼꼼해요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:76%;"></span>
                                                                </p>
                                                                <p class="rate">76<span>%</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="part">
                                                            <p class="data"><span>보통이에요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:20%;"></span>
                                                                </p>
                                                                <p class="rate">20<span>%</span></p>
                                                            </div>
                                                        </div>
                                                        <div class="part">
                                                            <p class="data"><span>별로예요</span></p>
                                                            <div class="gauge-box">
                                                                <p class="gauge-bar">
                                                                    <span class="gauge" style="width:4%;"></span>
                                                                </p>
                                                                <p class="rate">4<span>%</span></p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="more-btn">
                                                    <a href="#"
                                                       data-modules-customtoggle="openText:자세히보기;parent:.review-rate;"><span
                                                            data-text="">닫기</span><i class="icon arrow"></i></a>
                                                </div>
                                            </div>
                                            <!-- //.review-rate -->
                                        </div>


                                        <div class="content-area txt-review" id="reviewContentArea">

                                            <h3>고객만족도 <em class="total-num">4,441</em>건</h3>

                                            <div class="selectwrap">
                                                <div class="custom-selectbox sm"
                                                     onchange="searchEvalSort('/p/pdc/selectItemEvalList.do?dealYn=N')"
                                                     id="posRightDiv" data-modules-selectbox="">
                                                    <select id="posRight">
                                                        <option value="01">최신순</option>
                                                        <option value="16">별점 높은순</option>
                                                        <option value="17">별점 낮은순</option>
                                                    </select>
                                                    <div class="ui-label"><a href="#1">최신순</a></div>
                                                    <div class="ui-selectbox">
                                                        <div class="selectbox_area">
                                                            <ul>
                                                                <li><a href="#1">최신순</a></li>
                                                                <li><a href="#2">별점 높은순</a></li>
                                                                <li><a href="#3">별점 낮은순</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <ul class="txt-review-list">


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">hee****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-30</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177637977">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">hee****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-30</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177637975">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">alt****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-30</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177637644">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">den****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-30</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177627442">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">005****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-30</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177626954">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">ass****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-29</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177625179">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>적당해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>평범해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>보통이에요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">eun****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-29</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177624257">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">hyj****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-29</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177615066">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>신선해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>맛있어요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">yjy****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-29</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177614465">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>별로예요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>평범해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>별로예요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>


                                                <li class="review-item">
                                                    <div class="review-top">
                                                        <div class="top-left">
                                                            <div class="starbg pt10">
                                                                <p class="score"><span class="hiding">100점</span></p>
                                                            </div>
                                                            <span class="nick">yjy****</span>

                                                        </div>
                                                        <div class="top-right">
                                                            <span class="date">2022-05-29</span>
                                                            <input type="hidden" name="ITEM_EVAL_COMT_NO"
                                                                   value="48122177614462">
                                                            <input type="hidden" name="SLITM_CD" value="2122712699">
                                                        </div>
                                                    </div>
                                                    <!--//review-top-->

                                                    <!--review-option-->
                                                    <div class="review-option">


                                                        6kg(3kg * 2박스)

                                                    </div>
                                                    <!--//review-option-->

                                                    <!--review-content-->

                                                    <div class="review-content">
                                                        <ul class="user-rate">


                                                            <li>
                                                                <strong>신선도</strong>
                                                                <span>적당해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>맛</strong>
                                                                <span>평범해요</span>
                                                            </li>


                                                            <li>
                                                                <strong>포장상태</strong>
                                                                <span>꼼꼼해요</span>
                                                            </li>


                                                        </ul>
                                                    </div>

                                                    <!--//review-content-->
                                                </li>

                                            </ul>

                                            <div class="paging itemEvalPaging">


                                                <div class="page-prevarea">


                                                    <strong>1</strong>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=2')"
                                                       href="javascript://" class="">2</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=3')"
                                                       href="javascript://" class="">3</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=4')"
                                                       href="javascript://" class="">4</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=5')"
                                                       href="javascript://" class="">5</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=6')"
                                                       href="javascript://" class="">6</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=7')"
                                                       href="javascript://" class="">7</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=8')"
                                                       href="javascript://" class="">8</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=9')"
                                                       href="javascript://" class="">9</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=10')"
                                                       href="javascript://" class="">10</a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=11')"
                                                       class="page-next" aria-label="다음페이지 이동" href="javascript://">
                                                        <i class="icon"></i><span class="hiding">다음페이지 이동</span>
                                                    </a>


                                                    <a onclick="searchEvalPaging('/p/pdc/selectItemEvalList.do?dealYn=N&amp;page=445')"
                                                       class="page-last" aria-label="마지막페이지 이동" href="javascript://">
                                                        <i class="icon"></i><span class="hiding">마지막페이지 이동</span>
                                                    </a>

                                                </div>


                                            </div>


                                        </div>


                                        <!--// 만족도 -->

                                        <script type="text/javascript">


                                            $(document).on('click', '.video-thumb', function () {
                                                setBizSpring("review_play_btn");
                                            });

                                            $(document).on('click', '.user-info-alarm', function () {
                                                setBizSpring("user_info_alram", "", "", "");
                                            });

                                            $(document).on('click', '.recommend-btn', function () {
                                                if ($(this).hasClass('on') == true) {
                                                    setBizSpring("recommend_btn_off");
                                                } else {
                                                    setBizSpring("recommend_btn_on");
                                                }
                                            });


                                            /* 포토상품평 - sb - demoscript */
                                            /*
                                            $(document).on('click',".Popup_alarm.gallery .photoList .btn_layer_close", function(){
                                                $(this).parents(".photoList").addClass("fold");
                                            });

                                            $(document).on('click',".Popup_alarm.gallery > .btn_layer_close", function(){
                                                $("#pop_photo_gallery").hide();
                                            });

                                            var  page = 1;
                                            var  listSize = 20;
                                            var optionYn = "N";
                                            var optYn = "";
                                            */
                                            /* 포토상품평 더보기 */
                                            /*
                                            function morePhotoBtn(){

                                                if(optYn == 'Y'){
                                                   slitmCd = "2122712699";
                                                }
                                                if(optYn == 'N'){
                                                   if($('#photoSlitmCd').val() != null){
                                                       slitmCd = $('#photoSlitmCd').val();
                                                   }
                                                }
                                                page = Number(page) +1;

                                                $.ajax({
                                                    type: "get"
                                                    ,url: "/p/pdc/selectItemEvalPhotoPaing.do"
                                                    ,data: {page:page, listSize:listSize, slitmCd:slitmCd, optionYn:optionYn, optYn:optYn}
                                                    ,dataType: "html"
                                                    ,success: function(data) {
                                                     $(".more-btn").remove();
                                                     $(".gallery_thumbs").append(data);

                                                    }
                                                    ,error : function(e){
                                                          console.log('error');
                                                         }
                                                    });
                                            }
                                            */
                                        </script>
                                    </div>


                                </div>
                                <!--// 상품평 tab -->

                                <!-- Q&A -->

                                <!--// Q&A -->

                                <!-- 추천 영역 -->
                                <div class="compd-wrap">
                                    <div class="content-area pick-keyword-wrap" id="rcmmKeywordSearch"
                                         style="display:none;">
                                    </div>


                                    <!--content-area // 현대Hmall 엠디가 추천하는 딜-->

                                    <!--//content-area // 현대Hmall 엠디가 추천하는 딜-->

                                    <!--content-area // 연관추천상품 삭제!!-->
                                    <div class="content-area product-wrap pdslide" style="display:none;"
                                         id="rcmmSectRelateArea">

                                    </div>
                                    <!--//content-area // 연관추천상품 삭제!!-->

                                    <!--content-area // 이상품을본고객이구매한다른상품-->
                                    <div class="content-area product-wrap pdslide" style="display:none;"
                                         id="rcmmSectShowBuyArea">

                                    </div>
                                    <!--//content-area // 이상품을본고객이구매한다른상품-->

                                    <!--content-area // 패션잡화추천상품-->
                                    <div class="content-area product-wrap pdslide" style="display:none;"
                                         id="rcmmSectFashionArea">

                                    </div>
                                    <!--//content-area // 패션잡화추천상품-->

                                    <!--content-area // 매장추천상품-->

                                    <!--//content-area // 매장추천상품-->

                                    <!--content-area // 추천기획전-->

                                    <!--//content-area // 추천기획전-->

                                    <!-- PC 상품상세(마케팅용) 하단배너 R023 BG컬러x -->

                                    <div class="content-area banner-template-wrap">


                                    </div>

                                    <!-- // PC 상품상세(마케팅용) 하단배너 -->

                                </div>
                                <!--// 추천 영역 -->
                            </div>
                            <!--//scrollspy-wrap-->
                            <!--option-->
                            <div class="sticky-ui-wrapper product-option-sticky">
                                <div class="sticky-placeholder"></div>
                                <div class="util-option sticky right-option-area"
                                     data-modules-sticky="padding:-20;breakPoint:.product-detail-content;className:product-option-sticky;">
                                    <div class="sticky-inner">
                                        <div class="util-inner"><!-- 2020-09-18_스크립트수정 [구조 추가] -->
                                            <div class="option-scroll">


                                                <strong class="prduct-name">[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스
                                                    )</strong>


                                                <div class="ui-dropdown-group">
                                                </div>
                                                <div class="selprduct-list select-product-list">
                                                    <div class="pditem">
                                                        <div class="product-info">
                                                            <div class="figcaption">
                                                                <div class="pdoption" aria-label="옵션/수량">
                                                            <span class="option">색상/속성 : <em>



                                                                    6kg(3kg * 2박스)


                                                           </em>
                                                           </span>
                                                                    <span class="stock-num">남은수량 : <em>83,469</em></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="quantity">
                                                            <div class="count">
                                                                <button class="btn btn-minus" data-area-id="1"
                                                                        aria-label="수량 감소"
                                                                        onclick="minusOrdQty(this, '99');"><i
                                                                        class="icon"></i><span class="hiding">감소</span>
                                                                </button>
                                                                <div class="inputbox">
                                                                    <label class="inplabel"><input type="number"
                                                                                                   data-area-id="1"
                                                                                                   name="ordQty"
                                                                                                   onkeyup="changeOrdQty(this, 99)"
                                                                                                   value="1"
                                                                                                   maxlength="3"
                                                                                                   title="입력하세요"></label>
                                                                </div>
                                                                <button class="btn btn-plus" data-area-id="1"
                                                                        aria-label="수량 증가"
                                                                        onclick="plusOrdQty(this, '99');"><i
                                                                        class="icon"></i><span class="hiding">증가</span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!--total-->
                                            <div class="total-wrap">
                                                <div class="total-price sum-price" style="">
                                                    <!--20201006 화요일 tooltip 레이아웃 공통으로 변경 완료-->
                                                    <p class="btn-total"><span>총 상품금액</span><a href="#tooltipCont4"
                                                                                               data-modules-tooltip=""><i
                                                            class="icon que-mark"></i></a></p>
                                                    <ins><em>29,900</em><b>원</b></ins>
                                                    <!--20201006 화요일 tooltip 레이아웃 공통으로 변경 완료-->
                                                    <div class="tooltip-box" id="tooltipCont4">
                                                        <div class="thead btn-only">
                                                            <!-- <button class="btn-close"><i class="icon"></i><span class="hiding">닫기</span></button> -->
                                                        </div>
                                                        <p class="txt">선택하실 수 있는 할인혜택이 모두 적용된 금액입니다.<br>배송비가 포함이 되어 있지
                                                            않은 금액으로, 결제시 배송비가 추가 될 수 있습니다.</p>
                                                        <button class="btn-close"><i class="icon"></i><span
                                                                class="hiding">닫기</span></button>
                                                    </div>
                                                </div>
                                                <div class="pick-method"></div>
                                                <div class="button-wrap pd_shipping_type_nomral">
                                                    <div class="btngroup">
                                                        <button class="btn medium btn-default buy-now"
                                                                onclick="buyDirect();"><span>바로구매</span></button>
                                                        <button class="btn small btn-linelgray"
                                                                onclick="addCart(this);"><span>장바구니</span></button>
                                                        <button class="btn small btn-linelgray"
                                                                onclick="setGiftOrder('Y');buyDirect();">
                                                            <span>선물하기</span></button>
                                                    </div>
                                                </div>
                                                <div class="button-wrap pd_shipping_type_storePick"
                                                     style="display:none">
                                                    <div class="btngroup">
                                                        <button class="btn medium btn-default buy-now"
                                                                onclick="javascript:storepick();"><span>스토어픽</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--//total-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//option-->
                            <!-- .// product-detail-content -->
                        </div>
                        <!-- // 본문 컨텐츠 영역 끝 -->
                    </div>
                    <!--//contents-->
                </div>
                <!-- //.container -->
            </div>


            <script type="text/javascript" defer="defer">
                (function () {
                    <%--console.log(${productVO});--%>

                    function injectScript() {
                        var _TRK_InSc = document.createElement('script');
                        _TRK_InSc.type = 'text/javascript';
                        _TRK_InSc.async = true;
                        _TRK_InSc.src = '//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js';
                        document.body.appendChild(_TRK_InSc);


                        var _TRK_InTagSc = document.createElement('script');
                        _TRK_InTagSc.type = 'text/javascript';
                        _TRK_InTagSc.async = true;
                        _TRK_InTagSc.src = '//image.hmall.com/p/js/co/tagging.collector-1.3.min.js';
                        document.body.appendChild(_TRK_InTagSc);
                    }

                    if (window.attachEvent) {
                        window.attachEvent('onload', injectScript);
                    } else {
                        window.addEventListener('load', injectScript, false);
                    }
                })();
            </script>
            <!-- 2019.04.29 Facebook Pixel Code 삽입 -->
            <script>
                !function (f, b, e, v, n, t, s) {
                    if (f.fbq) return;
                    n = f.fbq = function () {
                        n.callMethod ?
                            n.callMethod.apply(n, arguments) : n.queue.push(arguments)
                    };
                    if (!f._fbq) f._fbq = n;
                    n.push = n;
                    n.loaded = !0;
                    n.version = '2.0';
                    n.queue = [];
                    t = b.createElement(e);
                    t.async = !0;
                    t.src = v;
                    s = b.getElementsByTagName(e)[0];
                    s.parentNode.insertBefore(t, s)
                }(window, document, 'script',
                    'https://connect.facebook.net/en_US/fbevents.js');
                fbq('init', '307742333494098');
                fbq('track', 'PageView');
            </script>
            <noscript><img height="1" width="1" style="display:none"
                           src="https://www.facebook.com/tr?id=307742333494098&ev=PageView&noscript=1"
            /></noscript>
            <!-- End Facebook Pixel Code -->

            <!-- Naver Premium Log -->
            <script type="text/javascript">
                var _NGUL = "wcs.naver.net/wcslog.js";
                var _NPR = location.protocol == "https:" ? "https://" + _NGUL : "http://" + _NGUL;
                document.writeln("<scr" + "ipt type='text/ja" + "vascript' src='" + _NPR + "'></scr" + "ipt>");
            </script>
            <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>


            <script type="text/javascript">
                if (!wcs_add) var wcs_add = {};
                wcs_add["wa"] = "s_5117770cb5ce";    // 네이버프리미엄로그 키값 변경(이호정선임) -> PC/MO 도메인 통일로 같은 값 사용(기존 : s_33f688a7b8a5)

                if (!_nasa) var _nasa = {};

                wcs.inflow();
                wcs_do(_nasa);
            </script>
            <!-- End Naver Premium Log -->

            <!-- Google analytics -->
            <script type="text/javascript"
                    src="//image.hmall.com/p/js/co/GoogleAnalyticsBuilder.js?ver=053014"></script>
            <script type="text/javascript" src="//image.hmall.com/p/js/co/ScreenNameObj.js?ver=053014"></script>

            <script type="text/javascript">


                var oneClickFlag = 0;

                function setDimension() {

                    if (oneClickFlag != 0) {
                        return false;
                    }

                    oneClickFlag = 1;

                    if (location.pathname.indexOf("/p/cob/memberLogin.do") > -1) {
                        return;
                    }
                    var GA_info = {};


                    GA_info = setDimenData(GA_info);


                    GA_Init(GA_info);


                    if (location.pathname.replace("//", "/") == '/m/pda/smItemDetailR.do' || location.pathname.replace("//", "/") == '/p/pda/itemPtc.do' && pdaItemPtcCnt == 0) {
                        pdaItemPtcCnt = 1;
                        var product_array = [];
                        product_array.push(
                            {
                                'id': '2122712699',
                                'name': '[아이사랑] 세척사과(부사) 6kg ( 3kg(11∼14과) * 2박스 )',
                                'brand': '209964(아이사랑)',
                                'category': '식품/농산물/국내청과/사과',
                                'dimension51': 'default',
                                'dimension52': '현대홈쇼핑',
                                'dimension53': '07(식품)',
                                'dimension54': '0703(농산물)',
                                'dimension55': '070305(국내청과)',
                                'dimension56': '07030501(사과)',
                                'dimension57': '5042식품1(윤석우)',
                                'dimension58': '데이터생활MD팀',
                                'dimension59': '007818((주)좋은꿈마케팅)',

                                'dimension60': 'default',
                                'dimension62': '유형상품',
                                'dimension63': '일반상품',
                                'dimension64': '2731643(과일/건과/냉과)'
                            }
                        );

                        var ecommerce_hit = new Object();
                        ecommerce_hit[GAHitKey.NonInteraction] = '1';
                        var action_obj = new Object();


                        GADataSend_Ecommerce(GAEcommerceStepKey.Detail, action_obj, product_array, ecommerce_hit);

                    } else if (location.pathname == '/p/oda/orderComplete.do' && ordCompleteCnt == 0) {
                        ordCompleteCnt = 1;
                        var product_array = [];


                        var ecommerce_hit = new Object();
                        ecommerce_hit[GAHitKey.NonInteraction] = '1';
                        ecommerce_hit[GAHitKey.currencyCode] = 'KRW';


                        ecommerce_hit[GACustomKey.Metric1] = 0;

                        ecommerce_hit[GACustomKey.Metric2] = 0;


                        ecommerce_hit['dimension74'] = '';
                        ecommerce_hit['dimension75'] = '';


                        var action_obj = new Object();
                        action_obj[GAActionFieldKey.TransactionID] = '';
                        action_obj[GAActionFieldKey.TransactionRevenue] = '0';
                        action_obj[GAActionFieldKey.TransactionShipping] = '0';

                        action_obj[GAActionFieldKey.TransactionCouponCode] = '';


                        GADataSend_Ecommerce(GAEcommerceStepKey.Purchase, action_obj, product_array, ecommerce_hit);
                        oneClickFlag = 0;
                    } else if (location.pathname == '/p/cua/registMemberComplete.do') { //회원가입완료 페이지 로드

                        try {
                            if (!gaLoad.APP) {
                                var GAInfo = {};
                                GAInfo.title = "회원가입/로그인>회원가입완료";
                                GAInfo[GACustomKey.Dimension31] = "회원가입/로그인";
                                GAInfo[GACustomKey.Dimension32] = "회원가입/로그인>회원가입완료";
                                GAInfo[GACustomKey.Dimension33] = "회원가입/로그인>회원가입완료";
                                GAInfo[GACustomKey.Dimension34] = "회원가입/로그인>회원가입완료";


                                GAInfo.hitType = 'event';
                                GAInfo.eventCategory = '회원가입';
                                GAInfo.eventAction = 'Step3. 가입완료';
                                GAInfo.eventLabel = 'Hmall 간편회원가입';
                                ga('gp.send', GAInfo);
                            } else {
                                var emptyObject = JSON.parse(JSON.stringify(CustomObject));
                                emptyObject.type = 'E';
                                if (getCookieGAB('ReferCode') !== null) {
                                    emptyObject.dimension[GACustomKey.Dimension20] = getCookieGAB('ReferCode');
                                }
                                if (getCookieGAB('TcCode') !== null) {
                                    var tmpTcCode = getCookieGAB('TcCode');
                                    if (tmpTcCode.split('|').length == 1) {
                                        emptyObject.dimension[GACustomKey.Dimension21] = getCookieGAB('TcCode');
                                    } else if (tmpTcCode.split('|').length == 2) {
                                        emptyObject.dimension[GACustomKey.Dimension21] = tmpTcCode.split('|')[0];
                                    }
                                }

                                emptyObject['category'] = '회원가입';
                                emptyObject['action'] = 'Step3. 가입완료';
                                emptyObject['label'] = 'Hmall 간편회원가입';


                                GAInfo.title = "회원가입/로그인>회원가입완료";
                                GAInfo[GACustomKey.Dimension31] = "회원가입/로그인";
                                GAInfo[GACustomKey.Dimension32] = "회원가입/로그인>회원가입완료";
                                GAInfo[GACustomKey.Dimension33] = "회원가입/로그인>회원가입완료";
                                GAInfo[GACustomKey.Dimension34] = "회원가입/로그인>회원가입완료";


                                if (browserInfo.indexOf(AndroidWebview) > -1 && window.AndroidJS && emptyObject['title'] !== undefined && emptyObject['title'].trim().length > 0)
                                    window.AndroidJS.GA_DATA(JSON.stringify(emptyObject));
                                else if (typeof pageTemplateNm !== 'undefined' && browserInfo.indexOf(AndroidWebview) > -1 && window.AndroidJS) {
                                    window.AndroidJS.GA_DATA(JSON.stringify(emptyObject));
                                } else if (browserInfo.indexOf(iOS_Webview_WK) > -1 && window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.gascriptCallbackHandler)
                                    webkit.messageHandlers.gascriptCallbackHandler.postMessage(JSON.stringify(emptyObject));
                                else if (browserInfo.indexOf(iOS_WebView_UI) > -1) doRequest(Scheme + encodeURIComponent(JSON.stringify(emptyObject)));
                            }
                        } catch (e) {

                        }
                        oneClickFlag = 0;
                    }
                }


                function setDimenData(GA_info) {
                    var _ga = getCookieGA('_ga');
                    if (_ga != null) {
                        GA_info[GACustomKey.Dimension1] = _ga;
                    }

                    var uid = "";
                    if (getCookieGA('ENCEHCustNO') != null && getCookieGA('ENCEHCustNO') != "") {
                        uid = getCookieGA('ENCEHCustNO');
                    }

                    if (uid == "" || uid.length != 32) {

                    } else {
                        GA_info[GACustomKey.Dimension2] = uid;
                        GA_info[GAHitKey.UserId] = uid;


                    }

                    GA_info[GACustomKey.Dimension3] = "20200705";
                    GA_info[GACustomKey.Dimension4] = "일반";
                    GA_info[GACustomKey.Dimension5] = "563eb54b391b42b87e55b0157c72dc00";
                    GA_info[GACustomKey.Dimension6] = "Y";
                    GA_info[GACustomKey.Dimension7] = "Y";
                    GA_info[GACustomKey.Dimension8] = "20220529";
                    GA_info[GACustomKey.Dimension9] = "20220522";

                    var _gaid = getCookieGA('GAID');
                    if (_gaid != null) {
                        GA_info[GACustomKey.Dimension11] = _gaid;
                    }

                    GA_info[GACustomKey.Dimension12] = "Y";
                    GA_info[GACustomKey.Dimension24] = "";


                    GA_info[GACustomKey.Dimension13] = "F";
                    GA_info[GACustomKey.Dimension14] = "2";


                    GA_info[GACustomKey.Dimension22] = "동시가입";
                    GA_info[GACustomKey.Dimension23] = "20200705";
                    GA_info[GACustomKey.Dimension25] = "20200705";

                    GA_info[GACustomKey.Dimension27] = "20200705";
                    GA_info[GACustomKey.Dimension28] = "20220529";

                    GA_info[GACustomKey.Dimension30] = "N";
                    GA_info[GACustomKey.Dimension36] = "1천P이상";
                    GA_info[GACustomKey.Dimension37] = "0";
                    GA_info[GACustomKey.Dimension38] = "N";
                    GA_info[GACustomKey.Dimension39] = "방송";
                    GA_info[GACustomKey.Dimension40] = "인터넷";
                    GA_info[GACustomKey.Dimension41] = "PCWEB";
                    GA_info[GACustomKey.Dimension47] = "N";
                    GA_info[GACustomKey.Dimension78] = "X+BxAFmge2IwXv1jl2ozuA==";

                    if (location.pathname == '/p/pde/search.do') {


                        GA_info[GACustomKey.Dimension19] = "N";


                    }

                    GA_info[GACustomKey.Dimension16] = "PCWEB";

                    GA_info[GACustomKey.Dimension35] = location.href.replace("http://", "").replace("https://", "");

                    return GA_info;
                }


                function setGaDataSend_Event(evntType, product_array) {
                    /* var product_array = [];
            if(product_array_param != null && product_array_param != undefined){
                product_array = product_array_param;
            } */
                    var ecommerce_hit = new Object();
                    var action_obj = new Object();


                    if (location.pathname == '/m/pda/smItemDetailR.do' || location.pathname == '/p/pda/itemPtc.do') {

                        if (evntType == GAEcommerceStepKey.Checkout) {
                            action_obj[GAActionFieldKey.CheckoutStep] = '1';
                            GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                        } else {
                            ecommerce_hit[GAHitKey.NonInteraction] = '1';
                            GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                        }

                    } else if (location.pathname == '/p/oda/order.do') {

                        try {
                            var itemGbcd = ""; // 무형상품체크, 유/무형 상품 같이 구매 불가하므로..

                        } catch (e) {

                        }

                        if (evntType == GAEcommerceStepKey.Checkout) {
                            var ecommerce_hit = new Object();
                            var action_obj = new Object();
                            action_obj[GAActionFieldKey.CheckoutStep] = '2';

                            var selOrderType = $("input[name='payType']:checked").val();

                            if (selOrderType == '10') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '01 카드';
                                ecommerce_hit['dimension75'] = '01 카드';
                            } else if (selOrderType == '20') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '02 현금';
                                ecommerce_hit['dimension75'] = '02 현금';
                            } else if (selOrderType == '40') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '12 휴대폰결제';
                                ecommerce_hit['dimension75'] = '12 휴대폰결제';
                            } else if (selOrderType == '91') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '15 페이코';
                                ecommerce_hit['dimension75'] = '15 페이코';
                            } else if (selOrderType == '30') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '20 현금(실시간)';
                                ecommerce_hit['dimension75'] = '20 현금(실시간)';
                            } else if (selOrderType == '95') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '21 네이버페이';
                                ecommerce_hit['dimension75'] = '21 네이버페이';
                            } else if (selOrderType == '96') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '22 스마일페이';
                                ecommerce_hit['dimension75'] = '22 스마일페이';
                            } else if (selOrderType == '97') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '23 카카오페이';
                                ecommerce_hit['dimension75'] = '23 카카오페이';
                            } else if (selOrderType == '81') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '25 토스';
                                ecommerce_hit['dimension75'] = '25 토스';
                            } else if (selOrderType == '99') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '24 현금간편결제';
                                ecommerce_hit['dimension75'] = '24 현금간편결제';
                            } else if (selOrderType == '50') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '98 카드+현금';
                                ecommerce_hit['dimension75'] = '98 카드+현금';
                            } else if (selOrderType == '93') {
                                action_obj[GAActionFieldKey.CheckoutOptions] = '99 삼성페이';
                                ecommerce_hit['dimension75'] = '99 삼성페이';
                            } else {
                                action_obj[GAActionFieldKey.CheckoutOptions] = 'default';
                                ecommerce_hit['dimension75'] = 'default';
                            }

                            // 무형상품이면 고정 - 이호정선임요청 2021.01.28 김기호
                            if (itemGbcd == "04") {
                                console.log("무형상품이므로 Dimension75:무형상품");
                                action_obj[GAActionFieldKey.CheckoutOptions] = '무형상품';
                                ecommerce_hit[GACustomKey.Dimension75] = '무형상품';
                            } else {

                                ecommerce_hit[GACustomKey.Dimension74] = '일반구매';

                            }
                            GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                        }
                    } else {
                        GADataSend_Ecommerce(evntType, action_obj, product_array, ecommerce_hit);
                    }

                }


                function sendSlitmClick(slitmNm, slitmCd, tabNm) {

                    if (slitmNm == "" || slitmCd == "" || tabNm == "")
                        return;

                    var product_array = [];
                    product_array.push({'id': slitmCd, 'name': slitmNm});

                    var action_obj = new Object();
                    action_obj[GAActionFieldKey.ProductActionList] = tabNm;

                    var ecommerce_hit = new Object();
                    GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);
                }


                function getParameterByName(url, name) {
                    if (url == "" || name == "" || url == undefined || name == undefined) {
                        return;
                    }

                    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                        results = regex.exec(url);
                    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
                }

                function setGaPromotion(title, name, position, creative, id) {
                    var action_obj = new Object();
                    var ecommerce_hit = new Object();
                    var tabNm = title;
                    if (tabNm.length > 0) {
                        tabNm = tabNm.substring(tabNm.indexOf(">") + 1, tabNm.length);
                    }

                    ecommerce_hit[GAHitKey.Title] = title;

                    action_obj["promo1"] = {};
                    action_obj["promo1"][GAActionFieldKey.PromotionName] = name;
                    action_obj["promo1"][GAActionFieldKey.PromotionPosition] = position;
                    action_obj["promo1"][GAActionFieldKey.PromotionCreative] = creative;
                    action_obj["promo1"][GAActionFieldKey.PromotionID] = id;

                    if (name.substring(0, name.indexOf("_")) == "메인") {
                        console.log("setGaPromotion()................4");
                        ecommerce_hit[GACustomKey.Dimension31] = '메인';
                        ecommerce_hit[GACustomKey.Dimension32] = '메인>' + tabNm;
                        ecommerce_hit[GACustomKey.Dimension33] = '메인>' + tabNm;
                        ecommerce_hit[GACustomKey.Dimension34] = '메인>' + tabNm;
                    }

                    GADataSend_Ecommerce(GAEcommerceStepKey.PromotionClick, action_obj, null, ecommerce_hit);
                }

                function getCookieGA(name) {
                    var cname = name + "=";
                    var dc = document.cookie;
                    if (dc.length > 0) {
                        begin = dc.indexOf(cname);
                        if (begin != -1) {
                            begin += cname.length;
                            end = dc.indexOf(";", begin);
                            if (end == -1) end = dc.length;
                            if ("EHCustName" == name || "LAST_SECT" == name) {
                                return decodeURIComponent(dc.substring(begin, end));
                            } else {
                                return unescape(dc.substring(begin, end)).replace('GA1.2.', '');
                            }
                        }
                    }
                    return null;
                }

                function sendSlitmClickGo(slitmNm, slitmCd, tabNm, url) {

                    if (slitmNm == "" || slitmCd == "" || tabNm == "" || url == "")
                        return;

                    var product_array = [];
                    product_array.push({'id': slitmCd, 'name': slitmNm});

                    var action_obj = new Object();
                    action_obj[GAActionFieldKey.ProductActionList] = tabNm;

                    var ecommerce_hit = new Object();
                    GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);

                    document.location.href = url;
                }

                function sendSlitmClickNewWin(slitmNm, slitmCd, tabNm, url) {

                    if (slitmNm == "" || slitmCd == "" || tabNm == "" || url == "")
                        return;

                    var product_array = [];
                    product_array.push({'id': slitmCd, 'name': slitmNm});

                    var action_obj = new Object();
                    action_obj[GAActionFieldKey.ProductActionList] = tabNm;

                    var ecommerce_hit = new Object();
                    GADataSend_Ecommerce(GAEcommerceStepKey.Click, action_obj, product_array, ecommerce_hit);

                    try {
                        _trk_flashEnvView('_TRK_PI=LYRNWN');
                    } catch (e) {
                    }

                    try {
                        _trk_clickTrace("EVT", "상품리스트_새창");
                    } catch (e) {
                    }
                    window.open(url, '_blank');
                }

                function bizSpringTagForHome(url, tag, pathVal) {

                    location.href = url
                }

                function gaTagging(obj_GA, msg1, msg2, msg3) {
                    console.log("gaTagging()................");
                    var title = $(obj_GA).attr("ga-custom-title") == undefined ? "" : $(obj_GA).attr("ga-custom-title");
                    var name = $(obj_GA).attr("ga-custom-name") == undefined ? "" : $(obj_GA).attr("ga-custom-name");
                    var position = $(obj_GA).attr("ga-custom-position") == undefined ? "" : $(obj_GA).attr("ga-custom-position");
                    var creative = $(obj_GA).attr("ga-custom-creative") == undefined ? "" : $(obj_GA).attr("ga-custom-creative");
                    var id = $(obj_GA).attr("ga-custom-id") == undefined ? "" : $(obj_GA).attr("ga-custom-id");
                    var etc = $(obj_GA).attr("ga-custom-etc") == undefined ? "" : $(obj_GA).attr("ga-custom-etc");
                    var etc2 = $(obj_GA).attr("ga-custom-etc2") == undefined ? "" : $(obj_GA).attr("ga-custom-etc2");

                    setGaPromotion(title, name, position, creative, id);
                    //마케팅플랫폼 전용 >>> 마케팅 플랫폼은 Tab명이 다르기 때문에 if문 처리
                    /*
            if(gaForTabNm != "" && gaForTabNm != null && gaForTabNm != undefined && etc2 == "Y"){
                title = "메인>"+gaForTabNm;
                name = "메인_"+gaForTabNm+"탭";
            }

            if(etc2 == "N"){//마케팅플랫폼 전용 >>> 마케팅플랫폼 jsp가 기획전에도 쓰이기 때문에 if문 처리.(mainTabYn)
                //추후 이곳에 마케팅플랫폼 기획전일 경우 분기분 넣는다...

            }else{
                console.log("setGaPromotion()................1");
                setGaPromotion(title, name, position, creative, id);
            }
        */

                    if (etc == "home") {
                        bizSpringTagForHome(msg1, msg2, msg3);
                    } else {
                        if (msg1 != null && msg1 != "" && msg1.length > 0) {
                            location.href = msg1;
                        }
                    }
                }


            </script> <!-- GA Custum lib -->
            <script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-1066206974"></script>
            <script>
                try {
                    window.dataLayer = window.dataLayer || [];

                    function gtag() {
                        dataLayer.push(arguments);
                    }

                    gtag('js', new Date());
                    gtag('config', 'AW-1066206974');
                    gtag('config', 'AW-937000404');
                } catch (e) {
                }

                //Google Analytics
                var init_Obj = new Object();

                $(window).on("load", function () {
                    //GA 맞춤측정 데이터 전송 및 클릭이벤트 초기화
                    console.log("setDimension and useWindload 호출");
                    setDimension();
                    useWinload();
                });
            </script>
            <!-- Google analytics end -->


            <script type="text/javascript" src="//image.hmall.com/p/js/co/netfunnel.js"></script>
            <script type="text/javascript">
                try {
                    NetFunnel_AliveNotice({action_id: "hmall_1"});
                } catch (e) {
                }
                var cValue = document.cookie.match('(^|;) ?' + 'ck_nfn_p' + '=([^;]*)(;|$)');
                var ck_nfn = cValue ? cValue[2] : null;
                if (ck_nfn != "" && ck_nfn != null) {
                    var d = new Date();
                    d.setTime(d.getTime() + (3 * 60 * 1000));
                    var expires = "expires=" + d.toUTCString();
                    var cname = "ck_nfn_p";
                    var cvalue = "check";
                    document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/;domain=.hmall.com";
                }

            </script>
            <!--//footer -->
            <!-- Alert 레이어 -->
            <div class="ui-modal alert" id="pec001-01" tabindex="-1" role="dialog" aria-label="H.Point Pay 통합회원 안내">
                <div class="ui-modal-dialog" role="document">
                    <div class="content">
                        <p class="ctypo15">H.Point Pay는 H.Point 통합회원만<br> 이용하실 수 있습니다.</p>
                        <p class="ctypo17 bold mt10px">H.Point 통합회원으로<br>가입하시겠습니까?</p>
                    </div>
                    <!-- //.content -->
                    <!-- alert은 버튼 위치 변경 -->
                    <div class="btngroup">
                        <button class="btn btn-linegray" data-dismiss="modal"><span>취소</span></button>
                        <button class="btn btn-default" onclick="fn_upntPopupOpen();"><span>확인</span></button>
                        <!-- 데이터 전송 후 닫힘 $(element).modal().hide() -->
                    </div>
                    <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span>
                    </button>
                </div>
                <!-- //.ui-modal-dialog -->
            </div>
            <!-- //footer -->


            <!-- 스카이스크래퍼 -->


            <script type="text/javascript">

                var skySclbrodEndTime = "";
                var skyScldtvEndTime = "";

                function setOnAirSkySc() {
                    try {
                        $.ajax({
                            type: "get"
                            , url: "https://wwwca.hmall.com/p/coe/onAirList.do?time=053014"
                            , dataType: "html"
                            , async: true
                            , success: function (data) {
                                $('#skyScOnAirArea').append(data);

                                if ($('#onAirHtime').length > 0) {
                                    skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
                                    onAirTimerSkySc();
                                }

                                if ($('#onAirHdtime').length > 0) {
                                    skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

                                    // TV+샵은 마직막이 '00' 으로 끝남
                                    if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
                                        skyScldtvEndTime = skyScldtvEndTime.substring(0, 12) + "00";

                                    onAirTimer2SkySc();
                                }

                                // 카드 프로모션
                                setCardPromotion();

                            }
                            , error: function (e) {

                                if ("https://wwwca.hmall.com" == "")
                                    return;

                                $.ajax({
                                    type: "get"
                                    , url: "/p/coe/onAirList.do?time=053014"
                                    , dataType: "html"
                                    , async: true
                                    , success: function (data) {
                                        $('#skyScOnAirArea').append(data);

                                        if ($('#onAirHtime').length > 0) {
                                            skySclbrodEndTime = "" + $('#onAirHtime').data("brodenddtm");
                                            onAirTimerSkySc();
                                        }

                                        if ($('#onAirHdtime').length > 0) {
                                            skyScldtvEndTime = "" + $('#onAirHdtime').data("brodenddtm");

                                            // TV+샵은 마직막이 '00' 으로 끝남
                                            if (skyScldtvEndTime != "" && skyScldtvEndTime.length > 12)
                                                skyScldtvEndTime = skyScldtvEndTime.substring(0, 12) + "00";

                                            onAirTimer2SkySc();
                                        }

                                        // 카드 프로모션
                                        setCardPromotion();

                                    }
                                    , error: function (e) {
                                    }
                                });
                            }
                        });
                    } catch (err) {
                    }
                }

                function setCardPromotion() {
                    try {
                        $.ajax({
                            type: "get"
                            , url: "https://wwwca.hmall.com/p/coe/onAirCardPrmoList.do?time=053014"
                            , dataType: "html"
                            , async: true
                            , success: function (data) {
                                $('#skyScCardArea').append(data);
                                $('body').commonUi('initLibrary'); //PC인경우
                            }
                            , error: function (e) {

                                if ("https://wwwca.hmall.com" == "")
                                    return;

                                $.ajax({
                                    type: "get"
                                    , url: "/p/coe/onAirCardPrmoList.do?time=053014"
                                    , dataType: "html"
                                    , async: true
                                    , success: function (data) {
                                        $('#skyScCardArea').append(data);
                                        $('body').commonUi('initLibrary'); //PC인경우
                                    }
                                    , error: function (e) {

                                    }
                                });
                            }
                        });
                    } catch (err) {
                    }
                }

                function onAirTimerSkySc() {
                    var now = new Date();
                    var lbrdEndTime = new Date();
                    lbrdEndTime.setHours(skySclbrodEndTime.substring(8, 10));
                    lbrdEndTime.setMinutes(skySclbrodEndTime.substring(10, 12));
                    lbrdEndTime.setSeconds(skySclbrodEndTime.substring(12, 14));

                    var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
                    var leftTime = "";

                    if (gap <= 0) {
                        leftTime = "00:00:00";
                        $("#onAirHtime").text(leftTime);
                        return;
                    }

                    var hour = parseInt(gap / 3600);
                    var min = parseInt((gap % 3600) / 60);
                    var sec = parseInt(gap % 60);

                    leftTime += ((hour < 10) ? "0" : "") + hour;
                    leftTime += ((min < 10) ? ":0" : ":") + min;
                    leftTime += ((sec < 10) ? ":0" : ":") + sec;

                    $("#onAirHtime").text(leftTime);
                    setTimeout("onAirTimerSkySc()", 1000);

                }

                function onAirTimer2SkySc() {
                    var now = new Date();
                    var lbrdEndTime = new Date();
                    lbrdEndTime.setHours(skyScldtvEndTime.substring(8, 10));
                    lbrdEndTime.setMinutes(skyScldtvEndTime.substring(10, 12));
                    lbrdEndTime.setSeconds(skyScldtvEndTime.substring(12, 14));

                    var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
                    var leftTime = "";

                    if (gap <= 0) {
                        leftTime = "00:00:00";
                        $("#onAirHdtime").text(leftTime);
                        return;
                    }

                    var hour = parseInt(gap / 3600);
                    var min = parseInt((gap % 3600) / 60);
                    var sec = parseInt(gap % 60);

                    leftTime += ((hour < 10) ? "0" : "") + hour;
                    leftTime += ((min < 10) ? ":0" : ":") + min;
                    leftTime += ((sec < 10) ? ":0" : ":") + sec;

                    $("#onAirHdtime").text(leftTime);
                    setTimeout("onAirTimer2SkySc()", 1000);
                }

            </script>

            <!-- 스카이 스크래퍼 -->
            <div class="sticky-ui-wrapper wing-banner-sticky">
                <div class="sticky-placeholder"></div>
                <div class="wing-banner banner-right"
                     data-modules-sticky="padding:0;breakPoint:.header-menu-wrap;className:wing-banner-sticky">
                    <!-- fixed 클래스 추가 시 고정 -->
                    <a href="/pevent/eva/evntTmplDivideView.do?prmoNo=00049341">
                        <div class="visit-indicator">바로접속


                            <span class="visit-staus on" style="margin-left: 0px">ON</span>

                        </div>
                    </a>
                    <div class="recent-view-area" id="skyScOnAirArea">


                        <a class="recent-view-title">ON AIR</a>
                        <ul id="banner-onair">


                            <li>

                                <a href="javascript:;" class="tv-shopping"
                                   onclick="gaTagging(this, &quot;/p/pda/itemPtc.do?sectId=1003&amp;slitmCd=2134575678&amp;bfmtNo=202205303006&amp;brodDt=20220530&amp;brodStrtDtm=13:30&amp;brodType=P&quot;, &quot;etvhm_etv&quot;, &quot;eTV온에어^영상상품^DB손해보험 (무)참좋은 100세 건강보험&quot;)"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="TV쇼핑"
                                   ga-custom-creative="방송상품" ga-custom-id="2134575678_DB손해보험 (무)참좋은 100세 건강보험"
                                   ga-custom-etc="home">
                                    <img src="https://image.hmall.com/static/6/5/57/34/2134575678_0.png?RS=140x140&amp;AR=0"
                                         alt="DB손해보험 (무)참좋은 100세 건강보험"
                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
                                    <span class="over-box">
		                            <strong class="onair-kind shopping">TV쇼핑</strong>
		                            <em class="onair-time" id="onAirHtime"
                                        data-brodenddtm="20220530143000">00:00:00</em>
		                        </span>
                                </a>


                            </li>


                            <li>

                                <a href="javascript:;" class="tv-shopping"
                                   onclick="gaTagging(this, &quot;/p/pda/itemPtc.do?sectId=1003&amp;slitmCd=2139646971&amp;bfmtNo=202205305009&amp;brodDt=20220530&amp;brodStrtDtm=13:40&amp;brodType=P&quot;, &quot;etvhm_etv&quot;, &quot;eTV온에어^영상상품^한국금거래센터 24K 순금 남녀공용 스퀘어 체인 목걸이 + 특별구성 호랑이 오브제&quot;)"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="TV쇼핑"
                                   ga-custom-creative="방송상품"
                                   ga-custom-id="2139646971_한국금거래센터 24K 순금 남녀공용 스퀘어 체인 목걸이 + 특별구성 호랑이 오브제"
                                   ga-custom-etc="home">
                                    <img src="https://image.hmall.com/static/9/6/64/39/2139646971_0.jpg?RS=140x140&amp;AR=0"
                                         alt="한국금거래센터 24K 순금 남녀공용 스퀘어 체인 목걸이 + 특별구성 호랑이 오브제"
                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=140x140&amp;AR=0')">
                                    <span class="over-box">
		                            <strong class="onair-kind shop">TV+샵</strong>
		                            <em class="onair-time" id="onAirHdtime"
                                        data-brodenddtm="20220530145959">00:23:26</em>
		                        </span>
                                </a>


                            </li>

                        </ul>

                    </div>
                    <div class="qr_view_area">
                        <span class="qr_txt">쇼핑라이브</span>
                        <span class="img_qr"><img src="https://image.hmall.com/p/img/co/img-qr.jpg"
                                                  alt="쇼핑라이브 qr이미지"></span>
                    </div>
                    <div class="wing-slide exhibition01" id="skyScCardArea">


                        <ul>


                            <li style="">


                                <a href="https://www.hmall.com/p/dpa/crdDmndDcPrmo.do?prmoNo=P202204280848">
                                    <span class="img"><img src="//image.hmall.com/p/img/ev/icon/ico-card-kb.png"
                                                           alt="KB국민카드"></span>
                                    <span class="card-txt">
		                            <strong class="card-name">KB국민카드</strong>
		                            <span class="benefit-txt">
		                              <em class="point-red">

		                                      5%


		                              </em>

                                               즉시 할인



		                            </span>
		                        </span>
                                </a>
                            </li>

                        </ul>
                        <!-- 페이징 -->


                        <!-- // 페이징 -->
                    </div>
                    <!-- // .wing-slide -->

                    <div class="btn-top"><a href="javascript:;">TOP</a></div>
                </div>
            </div>
            <!-- // 스카이 스크래퍼 -->
            <script type="text/javascript">

                setTimeout(function () {
                    setOnAirSkySc();
                }, 100);

                /*
            setTimeout(function() {
                setCardPromotion();
            }, 300);
            */
            </script>
            <!-- 스카이스크래퍼 -->


            <!-- 최근 본 쇼핑 -->
            <div class="layer-popup recently" style="display:none;"><!-- style 임시 적용 : 확인용 -->
                <div class="pop-wrap">
                    <div class="pop-content-wrap">
                        <strong class="pop-title">최근본쇼핑
                            <button class="btn btn-linelgray sm"><span>편집</span></button>
                        </strong>
                        <!-- <strong class="pop-title">최근본쇼핑<button class="btn btn-linelgray sm"><span>편집취소</span></button> </strong> -->
                        <div class="pop-content">
                            <!-- 팝업 컨텐츠 -->

                            <!-- 최근 본 쇼핑이 없는 경우  -->
                            <div class="top-area">
                                <p class="recently-none"><span>최근본쇼핑이 없습니다.</span></p>
                                <p class="best-title">지금 BEST 상품을 만나보세요.</p>
                            </div>
                            <!-- // 최근 본 쇼핑이 없는 경우  -->

                            <!-- 탭 리스트 -->
                            <div class="sort-group tab-recent">
                                <ul class="sort-menu" role="tablist">
                                    <li class="selected" role="presentation">
                                        <button role="tab" aria-selected="true" class="sort-total"><span>전체</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-product"><span>상품</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-search"><span>검색어</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-brand"><span>브랜드</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-categody"><span>카테고리</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-exhibition">
                                            <span>기획전</span></button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-event"><span>이벤트</span>
                                        </button>
                                    </li>
                                </ul>

                                <!-- 편집 시 분류 비활성화 - 각 button에 disabled 추가 -->
                                <ul class="sort-menu" role="tablist" style="display:none">
                                    <li class="selected" role="presentation">
                                        <button role="tab" aria-selected="true" class="sort-total" disabled="">
                                            <span>전체</span></button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-product" disabled=""><span>상품</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-search" disabled=""><span>검색어</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-brand" disabled=""><span>브랜드</span>
                                        </button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-categody" disabled="">
                                            <span>카테고리</span></button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-exhibition" disabled="">
                                            <span>기획전</span></button>
                                    </li>
                                    <li role="presentation">
                                        <button role="tab" aria-selected="false" class="sort-event" disabled=""><span>이벤트</span>
                                        </button>
                                    </li>
                                </ul>
                                <!-- //.sort-menu -->
                            </div>
                            <!-- 탭 리스트  -->

                            <div class="sort-content" role="tabpanel" aria-label="전체" aria-selected="true">
                                <!-- 최근 본 쇼핑 -->
                                <div class="recently-list-wrap">
                                    <ul>
                                        <!-- 최근 본 쇼핑 리스트 없는 경우 베스트 상품 -->
                                        <li>
                                            <a href="javascript:;">
                                                <span class="img"><img
                                                        src="//image.hmall.com/p/img/co/sample/img-recently01.jpg"
                                                        alt="2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상"></span>
                                                <span class="prd-info">
                                            <span class="name">2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상</span>
                                            <span class="price-wrap">
                                                <span class="prd-price"><strong>27,000</strong>원</span>
                                            </span>
                                        </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <span class="img"><img
                                                        src="//image.hmall.com/p/img/co/sample/img-recently01.jpg"
                                                        alt="2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상"></span>
                                                <span class="prd-info">
                                            <span class="name">2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈
                                                최신상</span>
                                            <span class="price-wrap">
                                                <span class="prd-price"><strong>27,000</strong>원</span>
                                            </span>
                                        </span>
                                            </a>
                                        </li>
                                        <!-- // 최근 본 쇼핑 리스트 없는 경우 베스트 상품 -->

                                        <!-- 최근 본 상품 있는 경우 -->
                                        <li>
                                            <a href="javascript:;">
                                                <span class="img"><img
                                                        src="//image.hmall.com/p/img/co/sample/img-recently01.jpg"
                                                        alt="2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상"></span>
                                                <span class="prd-info">
                                            <span class="name">2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈
                                                최신상</span>
                                            <span class="price-wrap">
                                                <span class="prd-price"><strong>27,000</strong>원</span>
                                            </span>
                                        </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <em class="shop-type product">상품</em>
                                                <span class="recently-text">나이키</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <em class="shop-type search">검색어</em>
                                                <span class="recently-text">남자양말</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <em class="shop-type brand">브랜드</em>
                                                <span class="recently-text">나이키</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <em class="shop-type category">카테고리</em>
                                                <span class="recently-text">카카오페이 5천원 즉석 할인</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <em class="shop-type exhibition">기획전</em>
                                                <span class="recently-text">골든듀 x Hmall 최대 40% 할인골든듀 x Hmall 최대 40% 할인골든듀 x Hmall 최대 40% 할인골든듀 x Hmall 최대 40% 할인</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;">
                                                <em class="shop-type event">이벤트</em>
                                                <span class="recently-text">카카오페이 5천원 즉석 할인</span>
                                            </a>
                                        </li>
                                        <!-- // 최근 본 상품 있는 경우 -->

                                        <!-- 최근 본 상품 편집 시 : 체크박스 추가  -->
                                        <li>
                                            <!-- 체크박스 -->
                                            <span class="checkbox">
                                        <label class="chklabel">
                                            <input type="checkbox" name="" checked="">
                                            <i class="icon"></i>
                                            <span>2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상</span>
                                        </label>
                                    </span>
                                            <!-- // 체크박스 -->

                                            <a href="javascript:;">
                                                <span class="img"><img
                                                        src="//image.hmall.com/p/img/co/sample/img-recently01.jpg"
                                                        alt="2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상"></span>
                                                <span class="prd-info">
                                            <span class="name">2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상</span>
                                            <span class="price-wrap">
                                                <span class="prd-price"><strong>27,000</strong>원</span>
                                            </span>
                                        </span>
                                            </a>
                                        </li>
                                        <li>
                                            <!-- 체크박스 -->
                                            <span class="checkbox">
                                        <label class="chklabel">
                                            <input type="checkbox" name="">
                                            <i class="icon"></i>
                                            <span>2020 S/S 가버(Gabor) 스퀘어 쥬얼 샌들 독일 프리미엄 슈즈 최신상</span>
                                        </label>
                                    </span>
                                            <!-- // 체크박스 -->

                                            <a href="javascript:;">
                                                <em class="shop-type brand">브랜드</em>
                                                <span class="recently-text">나이키</span>
                                            </a>
                                        </li>
                                        <!-- // 최근 본 상품 편집 시 : 체크박스 추가 -->
                                    </ul>
                                </div>
                                <!-- // 최근 본 쇼핑 -->
                            </div>

                            <!-- 버튼 영역 -->

                            <!-- // 버튼 영역 -->

                            <!-- //팝업 컨텐츠 -->
                        </div>
                    </div>
                    <!-- // .pop-content-wrap -->
                    <button class="btn-close"><span>팝업 닫기</span></button>
                </div>
            </div>
            <!-- // 최근 본 쇼핑 -->

            <!-- 레이어 팝업 영역 시작 -->
            <div class="layer-popup alert" style="display:none;">
                <!-- style 임시 적용 : 확인용 -->
                <div class="pop-wrap">
                    <div class="pop-content-wrap">
                        <strong class="pop-title">※ 쿠키 사용 안내</strong>
                        <div class="pop-content">
                            <!-- 팝업 컨텐츠 -->
                            <p class="text-type01">Hmall은 최상의 사용자 경험을 제공하기 위해 최근본쇼핑 정보 매체연동을 위한 쿠키를 수집합니다.</p>
                            <p class="text-type01">동의를 클릭하시면 이러한 쿠키의 사용에 동의하게 됩니다.</p>
                            <p class="text-type01">언제든지 설정에서 변경/취소 할 수 있습니다.</p>
                            <!-- // 팝업 컨텐츠-->
                        </div>
                        <!-- 버튼 영역 -->
                        <div class="btngroup">
                            <button class="btn-disagree"><span>미동의</span></button>
                            <button class="btn-agree"><span>동의</span></button>
                        </div>
                        <!-- // 버튼 영역 -->
                    </div>
                    <!-- // .pop-content-wrap -->
                </div>
            </div>

            <div class="layer-popup cookie-bottom" style="display:none">
                <div class="layer-bottom-inner">
                    <p class="title"><strong>쿠키 사용 안내</strong></p>
                    <div class="bottom-text">
                        <p>Hmall은 최상의 사용자 경험을 제공하기 위해 최근본쇼핑 정보 매체연동을 위한 쿠키를 수정합니다.</p>
                        <p>동의를 클릭하시면 이러한 쿠키의 사용에 동의하게 됩니다. 언제든지 설정에서 변경/취소 할 수 있습니다.</p>
                    </div>

                    <div class="btngroup txt-center">
                        <button class="btn btn-linelgray xl lyclose"><span>미동의</span></button>
                        <button class="btn btn-default xl"><span>동의</span></button>
                    </div>
                </div>
            </div>
            <!-- // 쿠키 사용 안내 -->
        </div>
        <script type="text/javascript" async="" src="//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js"></script>
        <script type="text/javascript" async="" src="//image.hmall.com/p/js/co/901_Insight_WebAnalytics.js"></script>
        <script type="text/javascript" async="" src="//image.hmall.com/p/js/co/tagging.collector-1.3.min.js"></script>
    </main>
</div>
<script src="/resources/js/productDetail.js"></script>
