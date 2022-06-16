<%@ page import="java.util.Date" %><%--
Created by IntelliJ IDEA.
User: user
Date: 2022-06-08
Time: 오후 11:49
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/slick.min.css?v=20220222_02">
<link href="/resources/vendor/bootstrap-tokenfield/bootstrap-tokenfield.min.css" rel="stylesheet">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/custom_shinhan.min.css?v=20220222_02">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/custom-tinymce.min.css">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/common.min.css?v=20220513_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/theme.min.css?v=20220331_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/custom.min.css?v=20220513_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/datepickerCustom.css">
<style>
    .link-icon { position: relative; display: inline-block; width: auto;    font-size: 14px; font-weight: 500; color: #333; margin-right: 10px; padding-top: 50px; }
    .link-icon.twitter { background-image: url(${contextPath}/resources/img/sns/icon-twitter.png); background-repeat: no-repeat; }
    .link-icon.facebook { background-image: url(${contextPath}/resources/img/sns/icon-facebook.png); background-repeat: no-repeat; }
    .link-icon.kakao { background-image: url(${contextPath}/resources/img/sns/icon-kakao.png); background-repeat: no-repeat; }
    .embed-responsive-16by9 {
        padding-bottom: 100%;
    }

</style>
<main class="cmain main" role="main" id="mainContents">
    <div>
        <div>
            <div>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="reward_title mb30 xs-mb15" style="margin-top: 30px; margin: 30px 0 0 60px;">${list[0].FUND_PRODUCT_TITLE}</div>
                            <!----></div>
                        <div>
                            <div class="col-sm-8 xs-pl0 xs-pr0" style="margin: 0px -9px;">
                                <div id="slider-for" class="slick-initialized slick-slider">
                                    <div aria-live="polite" class="slick-list draggable">
                                        <div class="slick-track" style="opacity: 1; width: 631px;" role="listbox">
                                            <figure class="slick-slide slick-current slick-active"
                                                    data-slick-index="0" aria-hidden="false"
                                                    style="width: 550px; height: 550px; position: relative; left: 38px; top: 0px; z-index: 999; opacity: 1;"
                                                    tabindex="-1" role="option" aria-describedby="slick-slide00">
                                                <!---->
                                                <div class="embed-responsive embed-responsive-16by9"><img
                                                        src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${list[0].FUND_PRODUCT_MAIN_IMG}"
                                                        class="img-responsive"></div>
                                            </figure>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 mb30 xs-mt25 xs-mb20 pl45 pr15 xs-pl15 xs-pr15" style="margin-left: -20px;">
                                <div class="reward-info-box">
                                    <div class="reward-info-name">리워드</div>
                                    <div class="reward-info-amount"><fmt:formatNumber type="number" maxFractionDigits="0" value="${list[0].FUND_PRODUCT_PR_COST}"/>원
                                        <!----> <span class="reward-info-status">펀딩 중</span> <!----></div>
                                    <div class="mt20"><span class="reward-info-text">달성률</span> <span class="reward-info-now">
                                        <fmt:formatNumber type="number" maxFractionDigits="0" value="${list[0].FUND_PRODUCT_PR_COST * 100 / list[0].FUND_PRODUCT_GOAL_COST}"/>% &nbsp;</span>
                                        <span class="reward-info-goal">목표금액 &nbsp;${list[0].FUND_PRODUCT_GOAL_COST}원</span>
                                    </div>
                                    <div class="mt5"><span class="reward-info-text">남은기간</span>
                                        <jsp:useBean id="today" class="java.util.Date" />
                                        <fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd"/>
                                        <fmt:formatDate var="itDate" value="${list[0].FUND_PRODUCT_END_DATE}" pattern="yyyyMMdd" />
                                        <span
                                            class="reward-info-now mr5">${itDate-now} 일</span> <span class="reward-info-goal"><fmt:formatDate value="${list[0].FUND_PRODUCT_END_DATE}" pattern="yyyy-MM-dd"/></span>
                                    </div>
                                    <input type="hidden" value="${list[0].FUND_PRODUCT_END_DATE}" name="fund_end_date"/>
                                    <div class="mt5"><span class="reward-info-text">참여자</span> <span
                                            class="reward-info-now"><fmt:formatNumber type="number" maxFractionDigits="0" value="${list[0].FUND_PRODUCT_PARTICIPANTS}"/>명</span></div>


                                    <div class="common-flex-between mt30 xs-mt40 reward-order0-1">
                                        <div class="reward-info-group">
                                            <div class="reward-info-nowStatus reward-icon-1"></div>
                                            <div class="reward-info-text2 mt5">펀딩 종료일</div>
                                            <div class="reward-info-text3"><fmt:formatDate value="${list[0].FUND_PRODUCT_END_DATE}" pattern="yyyy.MM.dd"/></div>
                                        </div>
                                        <div class="reward-info-statusLine"></div>
                                        <div class="reward-info-group">
                                            <div class="reward-info-nowStatus reward-icon-2"></div>
                                            <div class="reward-info-text2 mt5">결제 예정일</div>
                                            <fmt:parseDate value="${list[0].FUND_PRODUCT_END_DATE}}" var="strPlanDate" pattern="yyyy-MM-dd"/>
                                            <fmt:parseNumber value="${strPlanDate.time + (60*60*24*1000)}" integerOnly="true" var="strDate"/>
                                            <jsp:useBean id="myDate" class="java.util.Date"/>
                                            <c:set target="${myDate}" property="time" value="${strDate}"/>
                                            <div class="reward-info-text3"><fmt:formatDate value="${myDate}" pattern="yyyy.MM.dd"/></div>
                                        </div>
                                        <div class="reward-info-statusLine"></div>
                                            <div class="reward-info-group">
                                                <div class="reward-info-nowStatus reward-icon-3"></div>
                                                <div class="reward-info-text2 mt5">발송 예정일</div>
                                                <div class="reward-info-text3"><fmt:formatDate value="${list[0].FUND_PRODUCT_ESTIMATE_DATE}" pattern="yyyy.MM.dd"/></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="reward-info-desc mt15 xs-mt40 reward-order2-2">
                                        펀딩을 마치면 <span class="crowdy-font-bold">결제 예약 상태</span>입니다. 종료일에 100% 이상이
                                        달성되었을 경우에만 결제예정일에 결제가 됩니다.
                                        <!----></div>

                                <div id="share_sns" style="text-align: right; margin-top: 20px;">
                                    <a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter(${list[0].FUND_PRODUCT_SEQ});"><div style="width: 42px;"></div></a>
                                    <a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook(${list[0].FUND_PRODUCT_SEQ});"><div style="width: 42px;"></div></a>
                                    <a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao(${list[0].FUND_PRODUCT_SEQ}, '${list[0].FUND_PRODUCT_TITLE}', '${list[0].FUND_PRODUCT_MAIN_IMG}');"><div style="width: 42px;"></div></a>
                                </div>
                                <script type="text/javascript">
                                    function shareTwitter(SEQ) {
                                        var sendText = "같이 참여해봐요!"; // 전달할 텍스트
                                        var sendUrl = "http://34.64.63.2:8080/fund/detail/"+SEQ; // 전달할 URL
                                        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
                                    }

                                    function shareFacebook(SEQ) {
                                        var sendUrl = "http://34.64.63.2:8080/fund/detail/"+SEQ; // 전달할 URL
                                        window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
                                    }

                                    function shareKakao(SEQ, TITLE, IMG) {
                                        // 사용할 앱의 JavaScript 키 설정
                                        Kakao.init('caf33407aea23e6cbd7ad732e602b5ad');

                                        // 카카오링크 버튼 생성
                                        Kakao.Link.createDefaultButton({
                                            container: '#btnKakao', // 카카오공유버튼ID
                                            objectType: 'feed',
                                            content: {
                                                title: TITLE, // 보여질 제목
                                                description: "같이 참여해봐요!", // 보여질 설명
                                                imageUrl: "https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/"+IMG, // 콘텐츠 URL
                                                link: {
                                                    mobileWebUrl: "http://34.64.63.2:8080/fund/detail/"+SEQ,
                                                    webUrl: "http://34.64.63.2:8080/fund/detail/"+SEQ
                                                }
                                            }
                                        });
                                    }
                                </script>
                                </div>
                                <div id="profileModal" tabindex="-1" role="dialog" class="modal fade">
                                    <div role="document" class="modal-dialog modal-sm">
                                        <div class="modal-content">
                                            <div class="modal-padding">
                                                <div class="reward_policy_title">진행자에게 문의하기</div>
                                                <div class="reward-policy-profilebox-1 mt5 xs-mt20">
                                                    <div class="reward-policy-profileImg"><!----></div>
                                                    <div>
                                                        <div class="reward-info-projectName">주식회사 베지스푼</div>
                                                        <div id="link-icon" data-clipboard-target="#copy-link"
                                                             class="reward-policy-email mb5">
                                                            contact@veggiespoon.co.kr
                                                        </div>
                                                        <br>
                                                        <div id="copy-link">contact@veggiespoon.co.kr</div>
                                                        <a href="https://www.bgreen.co.kr/" target="_blank"
                                                           class="reward-policy-email">
                                                            <div class="website-icon reward-icon-setting"></div>
                                                            <!----> <!----> <!----> <!----></a></div>
                                                </div>
                                            </div>
                                            <div class="modal-footer ">
                                                <div class="row not-space"><a data-dismiss="modal"
                                                                              class="modalBlueBtn">확인</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="list_category" style="border-top: 1px solid rgb(221, 221, 221);">
                <div class="common_sub_top_menu common_stm_detail">
                    <div class="reward-menu">
                        <a id="story_page" class="pointerCursor active" onclick="pagingsort('story');"><span class="webcrowdy-font-bold">스토리</span></a>
                        <a id="news_page" class="pointerCursor" onclick="pagingsort('news');"><span class="webcrowdy-font-bold">새소식 </span></a>
                        <a id="reply_page" class="pointerCursor" onclick="pagingsort('reply');"><span class="webcrowdy-font-bold">댓글 </span></a>
                        <a id="inf_page" class="pointerCursor" onclick="pagingsort('inf');"><span class="webcrowdy-font-bold">안내</span></a>
                    </div>
                </div>
            </div>
            <div id="main_info" class="mt40 xs-mt20 mb100" style="display: block">
                <div class="container mce-content-body"><!---->
                    <div style="margin-top: 0">

                        ${list[0].FUND_PRODUCT_CONTENT}
                    </div>

                </div>
                <hr class="crowdy-row-line mt40 mb40 xs-mt30 xs-mb30">
                <div class="container reward-content-body">
                    <div class="ivs-story-content3">
                        <div class="ivs-story-title1 xs-mb0">이런 프로젝트는<br>어때요?</div>
                        <div class="card-story-list">
                            <div class="card-row-02">
                                <div class="col-sm-3 col-xs-6">
                                    <figure><a href="/r/wwwlalaitscom" class="card-story-item">
                                        <div class="card-story-img"><img
                                                src="https://hmallbucket.s3.ap-northeast-2.amazonaws.com/mainImage/${list[0].FUND_PRODUCT_MAIN_IMG}"
                                                alt="..." class="img-responsive"> <!----> <!----></div>
                                        <figcaption>
                                            <div class="card-story-content">
                                                <div class="card-story-name"><span
                                                        class="card-story-type">리워드</span> (주) 라라잇츠
                                                </div>
                                                <div class="card-story-title">[앵콜펀딩] 제주 용암해수를 먹은 스피루리나 미백 주름 페이셜
                                                    기능성크림
                                                </div>
                                            </div>
                                        </figcaption>
                                    </a></figure>
                                </div>
                                <div class="col-sm-3 col-xs-6">
                                    <figure><a href="/r/doranwon" class="card-story-item">
                                        <div class="card-story-img"><img
                                                src="//image-se.ycrowdy.com/20220531/CROWDY_202205311444420998_6Ch29.png/ycrowdy/resize/!340x!226"
                                                alt="..." class="img-responsive"> <!----> <img
                                                src="//image-se.ycrowdy.com/crowdyCss/img/adult2.png/ycrowdy/resize/!60x!40"
                                                style="position: absolute; top: 10px; right: 0px; width: 20%;">
                                        </div>
                                        <figcaption>
                                            <div class="card-story-content">
                                                <div class="card-story-name"><span
                                                        class="card-story-type">리워드</span> 도란원
                                                </div>
                                                <div class="card-story-title">[샤토미소 와인] 영동에서 직접 생산한 7가지 과일로 만든 와인!
                                                </div>
                                            </div>
                                        </figcaption>
                                    </a></figure>
                                </div>
                                <div class="col-sm-3 col-xs-6">
                                    <figure><a href="/r/goodtomorrow00" class="card-story-item">
                                        <div class="card-story-img"><img
                                                src="//image-se.ycrowdy.com/20220602/CROWDY_202206021600520041_fp35m.png/ycrowdy/resize/!340x!226"
                                                alt="..." class="img-responsive"> <!----> <!----></div>
                                        <figcaption>
                                            <div class="card-story-content">
                                                <div class="card-story-name"><span
                                                        class="card-story-type">리워드</span> 농업회사법인 우포의아침 주식회사
                                                </div>
                                                <div class="card-story-title">우리 가족을 위한! 창녕 단감의 달달한 맛 그대로 담은 단감주스
                                                </div>
                                            </div>
                                        </figcaption>
                                    </a></figure>
                                </div>
                                <div class="col-sm-3 col-xs-6">
                                    <figure><a href="/r/thatseat" class="card-story-item">
                                        <div class="card-story-img"><img
                                                src="//image-se.ycrowdy.com/20220519/CROWDY_202205191359000626_8rXVa.png/ycrowdy/resize/!340x!226"
                                                alt="..." class="img-responsive"> <!----> <!----></div>
                                        <figcaption>
                                            <div class="card-story-content">
                                                <div class="card-story-name"><span
                                                        class="card-story-type">리워드</span> 주식회사 베지스푼
                                                </div>
                                                <div class="card-story-title">
                                                </div>
                                            </div>
                                        </figcaption>
                                    </a></figure>
                                </div><!----><!----><!----><!----></div>
                        </div>
                        <div>
                            <div class="crowdy-btn-01 crowdy-btn-layout01">더 보기</div>
                        </div>
                    </div>
                </div>
            </div> <!----> <!----> <!---->
            <!--댓글 달기 !!-->
            <div id="reply_board" class="mt40 xs-mt35 mb100" crpy-idxs="0" style="display: none">
                <div class="reward-detail-container">
                    <div class="reward-content-body">
                        <div class="reward_page_title">
                            여러분의 한마디가<br>
                            진행자에게 큰 힘이 됩니다
                        </div>
                        <div class="reward-comment-danger mt25 xs-mt20">댓글 작성 시 유의사항</div>
                        <ul class="reward-list-circle mt10 mb25" style="word-break: keep-all;">
                            <li>프로젝트와 관계없는 글, 광고성, 욕설, 비방, 도배 등의 글은 내부 검토 후 삭제됩니다.</li>
                            <li>리워드 관련 문의 및 배송문의는 프로젝트 진행자에게 문의하시면 정확한 답변을 받을 수 있습니다.</li>
                        </ul>
                        <!---->
                        <div id="comment-collapse">
                            <div class="mp-body">
                                <form id="reply_form" class="reply_form">
                                    <input id="fund_num" type="hidden" value="${list[0].FUND_PRODUCT_SEQ}">
                                    <sec:authentication property="principal" var="pinfo" />
                                    <input id="user_seq" type="hidden" value="${pinfo.userVO.no}">
                                    <div class="form-group row-mobile-n mb5">
                                        <div class="col-sm-12">
                                            <label for="reply_content"></label><textarea id="reply_content" rows="3" cols="5" name="crpyContent" maxlength="500" placeholder="주식회사 베지스푼님의 프로젝트 성공을 응원합니다!" class="textarea-form-control form-control" style="height: 100px; margin-bottom: 20px"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row-mobile-n mb20 xs-mb10 xs-pb3 displayFlex">
                                        <div class="col-xs-12">
                                            <div class="text-right"><a href="javascript:void(0)" class="btn btn-primary-outline font15" onclick="insert_reply();">댓글 달기</a></div>
                                        </div>
                                    </div>
                                    <hr style="border-top: 1px dashed rgb(234, 235, 237);">
                                </form>
                            </div>
                        </div>
                        <div class="mt20 mb30">
                            <!---->
                            <div class="reply_area">
                                <div class="mb10" style="margin-top: 30px;">
                                    <div class="comment-box">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">김유나</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">영양성분표는 없나요?</div>
                                        <!---->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--댓글 달기 종료-->
            <!--새소식-->
            <div id="new_info" class="reward-detail-container" style="display: none">
                <div class="reward-content-body" style="margin-top: 40px">
                    <div class="reward_page_title">프로젝트 새소식을<br>알려드립니다. </div>
                    <form id="information_form" class="information_form">
                        <input id="fund_num_info" type="hidden" value="${list[0].FUND_PRODUCT_SEQ}">
                        <sec:authentication property="principal" var="pinfo" />
                        <input id="user_seq_info" type="hidden" value="${pinfo.userVO.no}">
                            <c:if test="${list[0].USER_SEQ eq pinfo.userVO.no}">
                                <div class="form-group row-mobile-n mb5">
                                    <div class="col-sm-12">
                                        <label for="reply_content"></label><textarea id="information_context" rows="3" cols="5" name="crpyContent" maxlength="500" placeholder="기획자님 새소식을 작성해주세요!" class="textarea-form-control form-control" style="height: 100px; margin-bottom: 20px"></textarea>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n mb20 xs-mb10 xs-pb3 displayFlex">
                                    <div class="col-xs-12">
                                        <div class="text-right info">
                                            <a href="javascript:void(0)" class="btn btn-primary-outline font15" onclick="insert_info();">작성 하기</a></div>
                                    </div>
                                </div>
                                <hr style="border-top: 1px dashed rgb(234, 235, 237);">
                            </c:if>
                    </form>
                    <div class="mt30 mb40">
                        <div class="info_area">
                            <div class="mb30" style="margin-top: 30px;">
                                <div class="comment-box info">
                                    <div class="displayFlex">
                                        <div href="javascript:void(0)" class="reward-policy-profileImg">
                                        </div>
                                        <div class="ivs-comment-nameBox"><span class="comment-id">김유나</span>
                                            <div class="comment-date">
                                                22-06-08
                                            </div>
                                       </div>
                                 </div>
                                  <div class="mt5">영양성분표는 없나요?</div>
                                </div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--새소식 종료-->
            <!--안내 페이지-->
            <div id="info_page" class="mt40 mb80" style="display: none">
                <div class="reward-detail-container reward-content-body">
                    <div class="reward_page_title">프로젝트 진행 관련<br>안내사항입니다.</div>
                    <div class="mt30 reward-policy-date">
                        <font class="reward-policy-date-title">펀딩 종료일</font>
                        <font class="ml10 reward-policy-date-body"><fmt:formatDate value="${list[0].FUND_PRODUCT_END_DATE}" pattern="yyyy.MM.dd"/></font>
                        <font class="reward-policy-date-title ml22">결제 예정일</font>
                        <font class="ml10 reward-policy-date-body"><fmt:formatDate value="${myDate}" pattern="yyyy.MM.dd"/></font>
                        <font class="reward-policy-date-title ml22">발송 예정일</font>
                        <font class="ml10 reward-policy-date-body"><fmt:formatDate value="${list[0].FUND_PRODUCT_ESTIMATE_DATE}" pattern="yyyy.MM.dd"/></font>
                    </div>
                </div>
                <hr class="crowdy-row-line crowdy-row-line10 mt50">
            </div>
            <!--안내 페이지 종료-->
            <div>
                <div class="reward-choice-container">
                    <div class="reward-choice-shareBtn"></div>
                    <div id="displayFunding" class="reward-choice-btn" onclick="displayFunding();">펀딩하기<span aria-hidden="true"
                                                                                                             class="ml10 glyphicon glyphicon-chevron-up"></span>
                    </div>
                    <div class="option-space-shadow"></div>
                </div>
                <div id="choiceBox" class="reward-choice-box" style="display: none;">
                    <div class="reward-choice-contentArea">
                        <div class="reward-choice-boxBack-pc">
                            <div class="reward-choice-storyBackBtn"><i class="fa fa-angle-left"
                                                                       aria-hidden="true"></i>
                                <div class="reward-choice-storyBackText" onclick="closeFunding();">스토리 돌아가기</div>
                            </div> <!----></div>
                        <div class="reward-choice-boxBack-mobile"><!----> <!---->
                            <div class="menu-trigger mt5 active_1"><span></span><span></span><span></span></div>
                        </div>
                    </div>
                    <div class="reward-choice-projectTitle">${list[0].FUND_PRODUCT_TITLE}</div>
                    <div class="reward-choice-contentArea reward-choice-margin">
                        <div class="reward-choice-desc">
                            펀딩을 마치면 <b>결제 예약 상태</b>입니다. 종료일에 100%<br>
                            이상 달성되었을 경우에만 결제예정일에 결제가 됩니다
                        </div>
                        <div class="reward-choice-margin">
                            <div class="common-flex-between" style="align-items: center;"><span
                                    class="reward-choice-title mt10 xs-mt0 mb25">리워드 선택</span> <!----></div>
                            <c:forEach items="${list}" var="reward" varStatus="status">
                                <c:choose>
                                    <c:when test="${reward.FUND_REWARD_COUNT eq 0}">
                                    <div class="reward-choice-optionBox-white rewad-chocie-active" style="display: flex; background-color: whitesmoke">
                                        <div style="align-items: center; display: flex; margin-right: 20px;">
                                            <input type="radio" name="checkRewardSeq" value="${reward.FUND_REWARD_SEQ}|${reward.FUND_PRODUCT_SEQ}|${reward.FUND_REWARD_COST}" disabled/>
                                        </div>
                                        <div>
                                            <div class="reward-choice-boxlabel"><!----> <!----> <!----> <!----> <!----></div>
                                            <input type="hidden" name="reward_cost" value="${reward.FUND_REWARD_COST}"/>
                                            <div class="reward-choice-boxamount"><fmt:formatNumber type="number" maxFractionDigits="0" value="${reward.FUND_REWARD_COST}"/> 원 펀딩</div>
                                            <div class="reward-choice-boxrow"><!----> <span><b><fmt:formatNumber type="number" maxFractionDigits="0" value="${reward.FUND_REWARD_COUNT}"/> </b></span> <span>&nbsp;&nbsp;|&nbsp;&nbsp;1개 펀딩</span>
                                                <b class="pl20">예상 배송일</b> <span><fmt:formatDate value="${reward.FUND_PRODUCT_ESTIMATE_DATE}" pattern="yyyy-MM-dd"/></span>
<%--                                                <i class="fas fa-caret-right" aria-hidden="true"></i>--%>
                                            </div>
                                            <div class="reward-choice-boxtitle">${reward.FUND_REWARD_TITLE}</div>
                                            <div class="reward-choice-boxdesc">${reward.FUND_REWARD_CONTENT}</div>
                                        </div>
                                    </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="reward-choice-optionBox-white rewad-chocie-active" style="display: flex;">
                                            <div style="align-items: center; display: flex; margin-right: 20px;">
                                                <input type="radio" name="checkRewardSeq" value="${reward.FUND_REWARD_SEQ}|${reward.FUND_PRODUCT_SEQ}|${reward.FUND_REWARD_COST}"/>
                                            </div>
                                            <div>
                                                <div class="reward-choice-boxlabel"><!----> <!----> <!----> <!----> <!----></div>
                                                <input type="hidden" name="reward_cost" value="${reward.FUND_REWARD_COST}"/>
                                                <div class="reward-choice-boxamount"><fmt:formatNumber type="number" maxFractionDigits="0" value="${reward.FUND_REWARD_COST}"/> 원 펀딩</div>
                                                <div class="reward-choice-boxrow"><!----> <span><b><fmt:formatNumber type="number" maxFractionDigits="0" value="${reward.FUND_REWARD_COUNT}"/> </b></span> <span>&nbsp;&nbsp;|&nbsp;&nbsp;1개 펀딩</span>
                                                    <b class="pl20">예상 배송일</b> <span><fmt:formatDate value="${reward.FUND_PRODUCT_ESTIMATE_DATE}" pattern="yyyy-MM-dd"/></span>
<%--                                                    <i class="fas fa-caret-right" aria-hidden="true"></i>--%>
                                                </div>
                                                <div class="reward-choice-boxtitle">${reward.FUND_REWARD_TITLE}</div>
                                                <div class="reward-choice-boxdesc">${reward.FUND_REWARD_CONTENT}</div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                        <div id="reward-qty" class="common-flex-center mt25 xs-mt10" style="justify-content: right;">
                            <div>
                                <div style="display: flex;">
                                    <div style="display: flex; align-items: center; margin-right: 10px;">
                                        <span class="qty-minus" onclick="fnCalCount('m');"></span>
                                        <label for="qtyInput"></label>
                                        <input type="tel" autocomplete="new-password" pattern="[0-9]*" inputmode="numeric" readonly
                                               id="reward_count"  name="reward_count" value="1" maxlength="11" class="qty-input">
                                        <span class="qty-add" onclick="fnCalCount('p');"></span>
                                    </div>
                                    <div id="fundBtn" class="reward-option-bottomStepBtn" style="width: 250px;" onClick="loadFundingProcess(); color: #ffffff; font-size: 20px;">
                                        <span>펀딩하기</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        function fnCalCount(type){
                            var  reward_count= $("input[name='reward_count']").val();
                            if(type==='p'){
                                $("#reward_count").val(Number(reward_count)+1);
                            }else{
                                if(reward_count-1>0){$("#reward_count").val(Number(reward_count)-1);}
                            }
                        }
                    </script>
                </div>
                <div class="reward-option-bottomBtn">
                    <div class="reward-option-bottomStepBtn">펀딩하기</div>
                </div>
                <div id="beforeFundingMd" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false"
                     class="modal fade">
                    <div role="document" class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="xButtonGray"></button>
                            </div>
                            <div class="modal-body">
                                <div class="modal-body-title mt15">펀딩 전에 꼭 확인하세요!</div>
                                <hr class="mt15 mb15">
                                <div>
                                    <div class="crowdy-confirm-checkbox">
                                        <div class="check-black"><input type="checkbox" id="txt0"> <label for="txt0"
                                                                                                          style="height: 100%;">
                                            <div class="check-black-svg">
                                                <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <rect x="0.5" y="0.5" width="15" height="15" rx="0.5"
                                                          fill="white" stroke="#B5B5B5"></rect>
                                                </svg>
                                            </div>
                                            <div class="check-black-text" style="width: 90%;">
                                                <div class="crowdy-check-container-title mb10">크라우드펀딩은 일반적인 구매와 다름을
                                                    이해했습니다.
                                                </div>
                                                <div class="crowdy-check-container-description mb40">크라우드펀딩은 제조사가
                                                    확보되지 않은 스타트업의 초기 제작 제품이거나 국내에 알려지지 않은 서비스, 우리가 살고 있는 이 세상에 도움이
                                                    되는 프로젝트 등을 선보이므로 전자상거래법이 대상으로 삼는 매매거래와 그 성격이 매우 다릅니다. <br><br>
                                                    리워드로 제공받은 제품, 서비스에 문제가 있을 경우 프로젝트 상세페이지 → 교환 및 환불 → 진행자의 교환 및 환불
                                                    내용을 확인해 주세요.
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </label></div>
                                    </div>
                                    <div class="crowdy-confirm-checkbox">
                                        <div class="check-black"><input type="checkbox" id="txt1"> <label for="txt1"
                                                                                                          style="height: 100%;">
                                            <div class="check-black-svg">
                                                <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <rect x="0.5" y="0.5" width="15" height="15" rx="0.5"
                                                          fill="white" stroke="#B5B5B5"></rect>
                                                </svg>
                                            </div>
                                            <div class="check-black-text" style="width: 90%;">
                                                <div class="crowdy-check-container-title mb10">프로젝트 종료일, 결제 예정일, 리워드
                                                    발송 예정일을 확인했습니다.
                                                </div>
                                                <div class="crowdy-check-container-description mb40">펀딩이 완료되면 결제 예약
                                                    상태가 됩니다. 실제 결제는 프로젝트 종료일에 100% 이상 달성되었을 경우에만 결제 예정일에 진행되며, 그렇지
                                                    않은 경우에는 예약된 결제가 모두 취소됩니다. <br><br> 또한 프로젝트 종료일 이후에는 프로젝트의 목적 달성을
                                                    위해 어떠한 경우에도 결제 취소가 되지 않습니다. 리워드는 진행자가 미리 명시한 날짜에 발송됩니다.
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </label></div>
                                    </div>
                                    <div class="crowdy-confirm-checkbox">
                                        <div class="check-black"><input type="checkbox" id="txt2"> <label for="txt2"
                                                                                                          style="height: 100%;">
                                            <div class="check-black-svg">
                                                <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                    <rect x="0.5" y="0.5" width="15" height="15" rx="0.5"
                                                          fill="white" stroke="#B5B5B5"></rect>
                                                </svg>
                                            </div>
                                            <div class="check-black-text" style="width: 90%;">
                                                <div class="crowdy-check-container-title mb10">적극적인 참여를 약속합니다.</div>
                                                <div class="crowdy-check-container-description mb40">새로운 아이디어의 실현을
                                                    위해 노력하는 진행자에게 여러분의 의견만큼 훌륭한 지원은 없습니다. 세상을 바꿔나가는 일에 함께한다는 자부심을
                                                    가지고 프로젝트에 참여해주세요. <br><br> 크라우디 또한 여러분의 제보를 바탕으로 진행자가 제공한 내용이
                                                    허위일 경우 이를 적극 반영하여 펀딩을 취소하는 등 건전한 크라우드펀딩 문화를 만들어가는 것에 함께 하겠습니다.
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </label></div>
                                    </div>
                                </div>
                                <div>
                                    <button id="confirmBtn" type="button" disabled="disabled"
                                            class="btn btn-block btn-primary btn-disabled-gray">펀딩하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="shareModal" role="dialog" tabindex="-1" data-backdrop="static" data-keyboard="false"
                 class="modal fade">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-padding modal-order">
                            <div class="reward-info-desc1 mb15 mt10">더 많이 알릴 수록 프로젝트는<br>성공에 가까워집니다!</div>
                            <div class="reward-modal-share">
                                <div id="link-reward-icon" data-clipboard-target="#copy-reward-link"
                                     class="link-icon reward-icon-setting1 mr20"></div>
                                <div class="kakao-icon reward-icon-setting1 mr20"></div>
                                <div class="facebook-icon reward-icon-setting1"></div>
                            </div>
                            <div id="copy-reward-link" style="height: 0px; opacity: 0; font-size: 0px;">
                                https://www.ycrowdy.com/r/thatseat?utm_source=url&amp;utm_medium=share&amp;utm_campaign=thatseat
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row not-space"><a data-dismiss="modal" class="modalBlueBtn">확인</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div id="adCertiMd" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false"
                     class="modal fade deliveryModal adCertiMd">
                    <div role="document" class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="headerTitle" style="width: 100px;">휴대폰 본인인증</div>
                                <button type="button" aria-label="Close" class="xButton"></button>
                            </div>
                            <div class="modal-body innerScroll">
                                <div class="innerDiv">
                                    <div>
                                        <div style="text-align: center;"><img
                                                src="//image-se.ycrowdy.com/crowdyCss/img/adult3.png"
                                                style="margin: 0px auto;"></div>
                                        <div style="margin-top: 31px; text-align: center; font-size: 19px; font-weight: bold; line-height: 1.47; letter-spacing: -0.7px; color: rgb(70, 70, 70);">
                                            이 프로젝트는 만 19세 이상의<br> 성인만 참가할 수 있습니다.
                                        </div>
                                        <div style="margin-top: 25px; font-size: 13px; font-weight: normal; line-height: 1.54; letter-spacing: -0.7px; color: rgb(70, 70, 70);">
                                            본 프로젝트는 청소년 유해매체물로서 '정보통신망 이용촉진 및 정보보호 등에 관한 법률' 및 '청소년보호법'에 따라 만 19세
                                            미만의 청소년이 이용할 수 없습니다.
                                            프로젝트에 펀딩하려면 연 1회 '휴대폰 본인인증'이 필요합니다.
                                        </div>
                                    </div>
                                    <div class="mt35"><a class="btn btn-block btn-primary">휴대폰 본인인증</a></div>
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
<script>
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";
    $("input[name=checkRewardSeq]").click(function(){
        var  reward_count= $("input[name='reward_count']").val();
        var fundProduct=$("input[name=checkRewardSeq]:checked").val();
        var reward_cost=fundProduct.split('|')[2];
        var totalFundCost=parseInt(reward_count)*parseInt(reward_cost);
        $('#fundBtn span').text(totalFundCost.toLocaleString('ko-KR')+'원 펀딩하기');
    });
    function fnCalCount(type){
        var  reward_count= $("input[name='reward_count']").val();
        var fundProduct=$("input[name=checkRewardSeq]:checked").val();
        var reward_cost=fundProduct.split('|')[2];
        var totalFundCost=parseInt(reward_count)*parseInt(reward_cost);
        if(type==='p'){
            $("#reward_count").val(Number(reward_count)+1);
            reward_count= $("input[name='reward_count']").val();
            totalFundCost=parseInt(reward_count)*parseInt(reward_cost);
            $('#fundBtn span').text(totalFundCost.toLocaleString('ko-KR')+'원 펀딩하기');
        }else{
            if(reward_count-1>0){
                $("#reward_count").val(Number(reward_count)-1);
                reward_count= $("input[name='reward_count']").val();
                totalFundCost=parseInt(reward_count)*parseInt(reward_cost);
                $('#fundBtn span').text(totalFundCost.toLocaleString('ko-KR')+'원 펀딩하기');
            }
        }
    }
    function displayFunding(){
        console.log("funding display click!!");
        const element = document.getElementById("choiceBox");
        console.log(element);
        console.log(element.style.display);
        if(element.style.display === 'none'){
            element.style.display = 'block';
        }else{
            element.style.display = 'none';
        }
    }
    function closeFunding(){
        const element = document.getElementById("choiceBox");
        if(element.style.display === 'block'){
            element.style.display = 'none';
        }
    }
    function pagingsort(a){
        console.log(a);
        const main_info = document.getElementById("main_info");
        const reply_board = document.getElementById("reply_board");
        const new_info = document.getElementById("new_info");
        const info_page = document.getElementById("info_page");
        $(".reward-menu a").removeClass("active");
        if(a === 'story'){
            main_info.style.display = 'block';
            reply_board.style.display = 'none';
            new_info.style.display = 'none';
            info_page.style.display ='none';
            document.getElementById('story_page').classList.add("active");
        } else if(a === 'news'){
            main_info.style.display = 'none';
            reply_board.style.display = 'none';
            new_info.style.display = 'block';
            info_page.style.display ='none';
            document.getElementById('news_page').classList.add("active");
        }else if(a === 'reply'){
            document.getElementById('reply_page').classList.add("active");
            main_info.style.display = 'none';
            reply_board.style.display = 'block';
            new_info.style.display = 'none';
            info_page.style.display ='none';
        }else{
            main_info.style.display = 'none';
            reply_board.style.display = 'none';
            new_info.style.display = 'none';
            info_page.style.display ='block';
            document.getElementById('inf_page').classList.add("active");
        }
        if(a === 'reply'){
            replySelect();
        }
        if(a === 'news'){
            selectInfo();
        }
    }
    //펀딩하기 프로세스
    function loadFundingProcess(){
        var fundProduct=$("input[name=checkRewardSeq]:checked").val();
        var fund_reward_seq=fundProduct.split('|')[0];
        var fund_product_seq=fundProduct.split('|')[1];
        var reward_cost=fundProduct.split('|')[2];
        var fund_reward_count=$("input[name=reward_count]").val();
        console.log(fundProduct);
        console.log("reward_seq: "+fund_reward_seq);
        console.log("product_seq: "+fund_product_seq);
        console.log("fund_reward_count: "+fund_reward_count);
        console.log("reward_cost: "+reward_cost);
        var data={
            fund_product_seq:fund_product_seq,
            fund_reward_seq:fund_reward_seq,
            fund_reward_cost:reward_cost,
            fund_reward_count:fund_reward_count
        };
        $.ajax({
            url:'${contextPath}/fund/fundingProcess',
            type:'post',
            data:data,
            beforeSend:function (xhr){
                xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
            },
            success:function(){
                alert("펀딩이 완료되었습니다!");
                location.href='${contextPath}/fund/detail/'+fund_product_seq;
            },
            error: function (request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }

    function replySelect(){

        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        console.log("댓글 목록 가져오기 버튼 클릭");
        const fund_board_seq = document.getElementById("fund_num").value;
        const user_seq = document.getElementById("user_seq").value;
        console.log("펀드상품번호: "+fund_board_seq);
        console.log("유저 시퀀스: "+user_seq);

        const loginUser_name = "${pinfo.userVO.no}";

        $(".reply_area .mb10 .comment-box").remove();
        $(".reply_area .mb10 .textRight").remove();
        $.ajax({
            url:"${contextPath}/fund/selectReply",
            method:"post",
            data:{"board_num":fund_board_seq, "user_num":user_seq},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },
            success: function (data){
                console.log(data);
                for(let reply of data){
                    var rcontent = reply.FUND_REPLY_CONTENT;
                    var rname = reply.USER_NAME;
                    var rseq = reply.FUND_REPLY_SEQ;
                    var ruser_seq = reply.USER_SEQ;
                    console.log(rcontent);
                    console.log(rname);
                    console.log(rseq);
                    if(ruser_seq === parseInt(loginUser_name)){
                        $(".reply_area .mb10").append(
                            `
                                    <input id="deleteReply`+rseq+`" type="hidden" value="`+rseq+`">
                                    <div class="comment-box">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+rname+`</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+rcontent+`</div>
                                        <!---->
                                    </div>
                                    <div class="textRight" style="margin-bottom: 20px; margin-top: 4px;">
                                        <a  role="button" data-toggle="collapse" aria-expanded="false"  class="blue-800 mr5 collapsed" onclick="deleteReply(`+rseq+`);">삭제하기</a>
                                    </div>
                            `
                        )
                    }else{
                        $(".reply_area .mb10").append(
                            `
                                    <input id="deleteReply`+rseq+`" type="hidden" value="`+rseq+`">
                                    <div class="comment-box">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+rname+`</span>
                                                <!——>
                                                <div class="comment-date">
                                                    <!——>22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+rcontent+`</div>
                                        <!——>
                                    </div>
                                    <div class="textRight" style="margin-bottom: 40px; margin-top: 4px;">
                                    </div>
                            `
                        )
                    }
                }
            }
        })
    }
    function insert_reply(){
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        console.log("댓글 달기 버튼 클릭");
        const fund_board_seq = document.getElementById("fund_num").value;
        const user_seq = document.getElementById("user_seq").value;
        const reply_content =document.getElementById("reply_content").value;

        //로그인 한 유저 이름
        const loginUser_name = "${pinfo.userVO.no}";

        //textarea 영역 비우기
        document.getElementById("reply_content").value = "";

        console.log("펀드상품번호: "+fund_board_seq);
        console.log("유저 시퀀스: "+user_seq);
        $(".reply_area .mb10 .comment-box").remove();
        $(".reply_area .mb10 .textRight").remove();
        $.ajax({
            url:"${contextPath}/fund/insertReply",
            method:"post",
            data:{"fund_board_seq":fund_board_seq, "user_seq":user_seq, "fund_reply_content_num":reply_content},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },
            success: function (data){
                console.log(data);
                for(let reply of data){
                    var rcontent = reply.FUND_REPLY_CONTENT;
                    var rname = reply.USER_NAME;
                    var rseq = reply.FUND_REPLY_SEQ;
                    var ruser_seq = reply.USER_SEQ;
                    console.log(rcontent);
                    console.log(rname);
                    console.log(rseq);
                    console.log("작성자 시퀀스 :"+ruser_seq);
                    console.log("로그인 한 사람 시퀀스: "+loginUser_name);
                    if(ruser_seq === parseInt(loginUser_name)){
                        $(".reply_area .mb10").append(
                            `
                                    <input id="deleteReply`+rseq+`" type="hidden" value="`+rseq+`">
                                    <div class="comment-box">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+rname+`</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+rcontent+`</div>
                                        <!---->
                                    </div>
                                    <div class="textRight" style="margin-bottom: 20px; margin-top: 4px;">
                                        <a href="#14987" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="14987" class="blue-800 mr5 collapsed" onclick="deleteReply(`+rseq+`)">삭제하기</a>
                                    </div>
                            `
                        )
                    }else{
                        $(".reply_area .mb10").append(
                            `
                                    <input id="deleteReply`+rseq+`" type="hidden" value="`+rseq+`">
                                    <div class="comment-box">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!——>
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+rname+`</span>
                                                <!——>
                                                <div class="comment-date">
                                                    <!——>22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+rcontent+`</div>
                                        <!——>
                                    </div>
                                    <div class="textRight" style="margin-bottom: 40px; margin-top: 4px;">
                                    </div>
                            `
                        )
                    }
                }
            }
        })
    }

    function deleteReply(deleteReplyNum){
        console.log(deleteReplyNum);
        var delete_seq = deleteReplyNum;
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        $.ajax({
            url:"${contextPath}/fund/deleteReply",
            method:"post",
            data:{"delete_seq": delete_seq},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },success: function (data) {
                if(data === 1){
                    console.log(data);
                    replySelect();
                }
            }
        })
    }

    function insert_info(){
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        console.log("공지사항 작성하기 버튼 클릭");
        const fund_board_seq = document.getElementById("fund_num_info").value;
        const user_seq = document.getElementById("user_seq_info").value;
        const info_content =document.getElementById("information_context").value;
        console.log(fund_board_seq+" "+user_seq+" "+info_content);
        $(".info_area .mb30 .comment-box").remove();
        $(".info_area .mb30 .text-right").remove();

        document.getElementById("information_context").value = "";

        //로그인 한 유저 이름
        const loginUser_name = "${pinfo.userVO.no}";
        $.ajax({
            url:"${contextPath}/fund/insertInfo",
            method:"post",
            data:{"fund_board_seq_info": fund_board_seq,"user_seq_info":user_seq,"fund_reply_content_info":info_content},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },success: function (data){
                console.log(data);
                for(let info of data){
                    var infocontent = info.FUND_NOTICE_CONTENT;
                    var infoname = info.USER_NAME;
                    var infoseq = info.FUND_NOTICE_SEQ;
                    var userseq = info.USER_SEQ;
                    console.log(infocontent);
                    console.log(infoname);
                    console.log(infoseq);
                    if(userseq === parseInt(loginUser_name)){
                        $(".info_area .mb30").append(
                            `
                                    <input id="deleteInfo`+infoseq+`" type="hidden" value="`+infoseq+`">
                                    <div class="comment-box info">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+infoname+`</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+infocontent+`</div>
                                        <!---->
                                    </div>
                                    <div class="text-right info" style="margin-bottom: 20px; margin-top: 4px;">
                                        <a href="#14987" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="14987" class="blue-800 mr5 collapsed" onclick="deleteInfo(`+infoseq+`);">삭제하기</a>
                                    </div>
                        `
                        )
                    }else{
                        $(".info_area .mb30").append(
                            `
                                    <input id="deleteInfo`+infoseq+`" type="hidden" value="`+infoseq+`">
                                    <div class="comment-box info">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+infoname+`</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+infocontent+`</div>
                                        <!---->
                                    </div>
                                    <div class="textRight" style="margin-bottom: 40px; margin-top: 4px;">
                                    </div>
                        `
                        )
                    }
                }
            }
        })
    }

    function selectInfo(){
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        console.log("공지사항 작성하기 버튼 클릭");
        const fund_board_seq = document.getElementById("fund_num_info").value;
        const user_seq = document.getElementById("user_seq_info").value;
        // const info_content =document.getElementById("information_context").value;
        console.log(fund_board_seq+" "+user_seq);
        $(".info_area .mb30 .comment-box").remove();
        $(".info_area .mb30 .text-right").remove();

        //로그인 한 유저 시퀀스
        const loginUser_name = "${pinfo.userVO.no}";

        $.ajax({
            url:"${contextPath}/fund/selectInfo",
            method:"post",
            data:{"fund_board_seq_info": fund_board_seq,"user_seq_info":user_seq},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },success: function (data){
                console.log(data);
                for(let info of data){
                    var infocontent = info.FUND_NOTICE_CONTENT;
                    var infoname = info.USER_NAME;
                    var infoseq = info.FUND_NOTICE_SEQ;
                    var userseq = info.USER_SEQ;
                    console.log(infocontent);
                    console.log(infoname);
                    console.log(infoseq);
                    if(userseq === parseInt(loginUser_name)){
                        $(".info_area .mb30").append(
                            `
                                    <input id="deleteInfo`+infoseq+`" type="hidden" value="`+infoseq+`">
                                    <div class="comment-box info">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+infoname+`</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+infocontent+`</div>
                                        <!---->
                                    </div>
                                    <div class="text-right info" style="margin-bottom: 20px; margin-top: 4px;">
                                        <a href="#14987" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="14987" class="blue-800 mr5 collapsed" onclick="deleteInfo(`+infoseq+`);">삭제하기</a>
                                    </div>
                        `
                        )
                    }else{
                        $(".info_area .mb30").append(
                            `
                                    <input id="deleteInfo`+infoseq+`" type="hidden" value="`+infoseq+`">
                                    <div class="comment-box info">
                                        <div class="displayFlex">
                                            <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                <!---->
                                            </div>
                                            <div class="ivs-comment-nameBox"><span class="comment-id">`+infoname+`</span>
                                                <!---->
                                                <div class="comment-date">
                                                    <!---->22.06.08
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt5">`+infocontent+`</div>
                                        <!---->
                                    </div>
                                    <div class="textRight" style="margin-bottom: 40px; margin-top: 4px;">
                                    </div>
                        `
                        )
                    }

                }
            }
        })
    }

    function deleteInfo(deleteNoticeNum){
        console.log(deleteNoticeNum)
        var delete_seq = deleteNoticeNum;
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";

        $.ajax({
            url:"${contextPath}/fund/deleteInfo",
            method:"post",
            data:{"delete_seq": delete_seq},
            dataType:"json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },success: function (data) {
                if(data == 1){
                    console.log(data);
                    selectInfo();
                }
            }
        })
    }

    //안내 페이지 각종 date값 가져오기

    <%--function selectDate(){--%>
    <%--    const product_seq = document.getElementById('fund_num').value;--%>
    <%--    console.log(product_seq);--%>
    <%--    var csrfHeaderName = "${_csrf.headerName}";--%>
    <%--    var csrfTokenValue = "${_csrf.token}";--%>
    <%--    $.ajax({--%>
    <%--        url:"${contextPath}/fund/selectDate",--%>
    <%--        method:"post",--%>
    <%--        data:{"product_seq":product_seq},--%>
    <%--        dataType:"json",--%>
    <%--        beforeSend: function(xhr) {--%>
    <%--            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)--%>
    <%--        },success: function (data) {--%>
    <%--            console.log(data);--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>

</script>