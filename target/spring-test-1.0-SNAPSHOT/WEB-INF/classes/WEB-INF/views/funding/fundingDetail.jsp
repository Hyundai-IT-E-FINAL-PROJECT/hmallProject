<%--
Created by IntelliJ IDEA.
User: user
Date: 2022-06-08
Time: 오후 11:49
To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<main class="cmain main" role="main" id="mainContents">
    <div>
            <div>
                <div>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="reward_community_partner mt40 mb10 xs-mt25">해당 프로젝트는 <a
                                        href="/c/apfs2022"><span
                                        class="crowdy-color-blue">[ 2022 농식품 펀딩 전용관 ]</span></a>과 함께 합니다
                                </div>
                                <div class="reward_title mb30 xs-mb15">#100% 식물성 너겟 #치킨 없는 치킨 너겟 &lt;댓츠잇&gt;</div>
                                <!----></div>
                            <div>
                                <div class="col-sm-8 xs-pl0 xs-pr0" style="margin: 0px -9px;">
                                    <div id="slider-for" class="slick-initialized slick-slider">
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track" style="opacity: 1; width: 631px;" role="listbox">
                                                <figure class="slick-slide slick-current slick-active"
                                                        data-slick-index="0" aria-hidden="false"
                                                        style="width: 621px; height: 400px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;"
                                                        tabindex="-1" role="option" aria-describedby="slick-slide00">
                                                    <!---->
                                                    <div class="embed-responsive embed-responsive-16by9"><img
                                                            src="//image-se.ycrowdy.com/20220519/CROWDY_202205191412510018_DWVHL.png/ycrowdy/resize/!740x!417"
                                                            class="img-responsive"></div>
                                                </figure>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="slider-nav" class="slick-initialized slick-slider">
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track"
                                                 style="opacity: 1; width: 73px; transform: translate3d(0px, 0px, 0px);"
                                                 role="listbox">
                                                <figure class="slick-slide slick-current slick-active"
                                                        style="width: 63px;" tabindex="-1" role="option"
                                                        aria-describedby="slick-slide10" data-slick-index="0"
                                                        aria-hidden="false"><img
                                                        src="//image-se.ycrowdy.com/20220519/CROWDY_202205191412510018_DWVHL.png/ycrowdy/resize/!200x!150"
                                                        class="img-responsive"></figure>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 mb30 xs-mt25 xs-mb20 pl45 pr15 xs-pl15 xs-pr15">
                                    <div class="reward-info-box">
                                        <div class="reward-info-name">리워드</div>
                                        <div class="reward-info-amount"><fmt:formatNumber type="number" maxFractionDigits="0" value="${list[0].FUND_PRODUCT_PR_COST}"/>원
                                            <!----> <span class="reward-info-status">펀딩 중</span> <!----></div>
                                        <div class="mt20"><span class="reward-info-text">달성률</span> <span
                                                class="reward-info-now"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(list[0].FUND_PRODUCT_PR_COST / list[0].FUND_PRODUCT_GOAL_COST)* 100}"/>% &nbsp;</span> <span
                                                class="reward-info-goal">목표금액 &nbsp;500,000원</span></div>
                                        <div class="mt5"><span class="reward-info-text">남은기간</span> <span
                                                class="reward-info-now mr5"> 3일</span> <span class="reward-info-goal"><fmt:formatDate value="${list[0].FUND_PRODUCT_END_DATE}" pattern="yyyy-MM-dd"/></span>
                                        </div>
                                        <div class="mt5"><span class="reward-info-text">참여자</span> <span
                                                class="reward-info-now">7명</span></div>
                                        <div class="reward-info-share mt10 xs-mt15"><span class="reward-share-icon" style="margin-top: 12;"></span></span> <span>프로젝트 공유하기</span></div>
                                        <div class="common-flex-between mt30 xs-mt40 reward-order0-1">
                                            <div class="reward-info-group">
                                                <div class="reward-info-nowStatus reward-icon-1"></div>
                                                <div class="reward-info-text2 mt5">펀딩 종료일</div>
                                                <div class="reward-info-text3">22.06.12</div>
                                            </div>
                                            <div class="reward-info-statusLine"></div>
                                            <div class="reward-info-group">
                                                <div class="reward-info-nowStatus reward-icon-2"></div>
                                                <div class="reward-info-text2 mt5">결제 예정일</div>
                                                <div class="reward-info-text3">22.06.13</div>
                                            </div>
                                            <div class="reward-info-statusLine"></div>
                                            <div class="reward-info-group">
                                                <div class="reward-info-nowStatus reward-icon-3"></div>
                                                <div class="reward-info-text2 mt5">발송 예정일</div>
                                                <div class="reward-info-text3">22.06.13</div>
                                            </div>
                                        </div>
                                        <div class="detail_order_info mt25 xs-mt15 reward-order1-0"><a href="#">
                                            <div class="detail_order_info_head">
                                                <div class="mr8 m-auto">
                                                    <div class="imgava"><!----></div>
                                                </div>
                                                <div class="ivs-info-profile">
                                                    <div>
                                                        <div class="ivs-info-pjName">주식회사 베지스푼</div>
                                                        <div class="ivs-info-pjlink">진행자에게 문의하기</div>
                                                    </div>
                                                    <div class="mt10"><span
                                                            class="ivs-info-arrow arrow-left ml10"></span></div>
                                                </div>
                                            </div>
                                        </a></div>
                                        <div class="reward-info-desc mt15 xs-mt40 reward-order2-2">
                                            펀딩을 마치면 <span class="crowdy-font-bold">결제 예약 상태</span>입니다. 종료일에 100% 이상이
                                            달성되었을 경우에만 결제예정일에 결제가 됩니다.
                                            <!----></div>
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
                            <a id="news_page" class="pointerCursor" onclick="pagingsort('news');"><span class="webcrowdy-font-bold">새소식 <em>0</em></span></a>
                            <a id="reply_page" class="pointerCursor" onclick="pagingsort('reply');"><span class="webcrowdy-font-bold">댓글 <em>1</em></span></a>
                            <a id="inf_page" class="pointerCursor" onclick="pagingsort('inf');"><span class="webcrowdy-font-bold">안내</span></a>
                        </div>
                    </div>
                </div>
                <div class="mt40 xs-mt20 mb100" >
                    <div class="container mce-content-body"><!---->
                        <!--메인 정보 시작-->
                        <div id="main_information"style="display: block">
                            <p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191732450179_KzNXDzEEuz.gif" alt=""></p>
                            <p class="al_center"><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191400360549_fRalXx6nrC.png" alt=""></p>
                            <blockquote class="blockquote_left">리워드 구성</blockquote>
                            <p class="al_center"><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191400450854_Pjy9v2dQaJ.png" alt=""></p>
                            <h6>[나혼산 세트] 댓츠잇 너겟 2개입 (달콤양념 1 + 청양간장 1) 가격: 16,600원</h6>
                            <h6>[홈파티 세트] 댓츠잇 너겟 4개입 (달콤양념 2&nbsp;+ 청양간장 2) 가격: 29,900원</h6>
                            <h6>[온가족 세트] 댓츠잇 너겟 6개입 (달콤양념 3&nbsp;+ 청양간장 3) 가격: 41,400원</h6>
                            <h6><strong>*배송비 3,000원 별도</strong><strong><br></strong></h6>
                        </div>
                        <!--메인 정보 끝 !-->
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
                                            <form class="form-horizontal pt15 xs-pt10 xs-pl5 xs-pr5">
                                                <div class="form-group row-mobile-n mb5">
                                                    <div class="col-sm-12 text-right"><span class="textarea_text_leng xs-mt5"><span>0</span> /500자</span></div>
                                                    <div class="col-sm-12"><textarea rows="3" cols="5" name="crpyContent" maxlength="500"
                                                                                     placeholder="주식회사 베지스푼님의 프로젝트 성공을 응원합니다!"
                                                                                     class="textarea-form-control form-control" style="height: 100px;"></textarea>
                                                        <!---->
                                                    </div>
                                                </div>
                                                <div class="form-group row-mobile-n mb20 xs-mb10 xs-pb3 displayFlex">
                                                    <div class="col-xs-12">
                                                        <div class="text-right"><a href="javascript:void(0)" class="btn btn-primary-outline font15">댓글 달기</a></div>
                                                    </div>
                                                </div>
                                                <hr style="border-top: 1px dashed rgb(234, 235, 237);">
                                            </form>
                                        </div>
                                    </div>
                                    <div class="mt20 mb30">
                                        <!---->
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
                                            <div class="textRight" style="margin-bottom: -24px; margin-top: 4px;">
                                                <a href="#14976" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="14976" class="blue-800 mr5">답글달기</a></div>
                                            <div>
                                                <form id="14976" class="collapse comment-reply">
                                                    <div class="replay-layout">
                                                        <div class="replay-dasi"></div>
                                                        <div class="mb10 ivs-comment-replay">
                                                            <div class="text-right"><span class="textarea_text_leng xs-mt5"><span>0</span> /500자</span></div>
                                                            <textarea cols="25" maxlength="500" placeholder="답글 입력" class="textarea-form-control form-control" style="resize: vertical;"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row-mobile-n mb20 xs-mb10 xs-pb3 displayFlex">
                                                        <div class="col-xs-12">
                                                            <div class="text-right">
                                                                <a href="#14976" role="button" data-toggle="collapse" aria-expanded="false" aria-controls="14976" class="btn btn-sm btn-default-outline">답글 취소</a>
                                                                <a href="javascript:void(0)" role="button" data-toggle="collapse" aria-expanded="false" class="btn btn-sm btn-primary-outline">답글 달기</a></div>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div>
                                                    <div class="replay-layout">
                                                        <div class="replay-dasi"></div>
                                                        <div class="replay-container mt5">
                                                            <div class="replay-box">
                                                                <div class="displayFlex">
                                                                    <div href="javascript:void(0)" class="reward-policy-profileImg">
                                                                        <!---->
                                                                    </div>
                                                                    <div class="ivs-comment-nameBox"><span class="comment-id">주식회사 베지스푼</span>
                                                                        <span class="comment-user ml5">진행자</span>
                                                                        <div class="comment-date">
                                                                            <!---->1일 전
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="mt5">안녕하세요 유나님, <br>문의주셔서 감사합니다. :)<br><br>영양성분표 링크 첨부드립니다. <br>상품소개
                                                                    제일 하단에 링크 확인하시면 영양성분표를 확인 수 있습니다.
                                                                    <br>https://www.sixshop.com/bgreen21/product/6e5bb1e4-c967-4ab4-946d-36adf6a244c1
                                                                </div>
                                                                <!---->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--댓글 달기 종료-->
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
                        <div class="reward-choice-projectTitle">#100% 식물성 너겟 #치킨 없는 치킨 너겟 &lt;댓츠잇&gt;</div>
                        <div class="reward-choice-contentArea reward-choice-margin">
                            <div class="reward-choice-desc">
                                펀딩을 마치면 <b>결제 예약 상태</b>입니다. 종료일에 100%<br>
                                이상 달성되었을 경우에만 결제예정일에 결제가 됩니다
                            </div>
                                <div class="reward-choice-margin">
                                    <div class="common-flex-between" style="align-items: center;"><span
                                            class="reward-choice-title mt10 xs-mt0 mb25">리워드 선택</span> <!----></div>
                                    <c:forEach items="${list}" var="reward" varStatus="status">
                                        <div class="reward-choice-optionBox-white rewad-chocie-active" style="display: flex;">
                                            <div style="align-items: center; display: flex; margin-right: 20px;">
                                                <input type="radio" name="checkRewardSeq" value=""/>
                                            </div>
                                            <div>
                                                <div class="reward-choice-boxlabel"><!----> <!----> <!----> <!----> <!----></div>
                                                <div class="reward-choice-boxamount"><fmt:formatNumber type="number" maxFractionDigits="0" value="${reward.FUND_REWARD_COST}"/> 원 펀딩</div>
                                                <div class="reward-choice-boxrow"><!----> <span><b><fmt:formatNumber type="number" maxFractionDigits="0" value="${reward.FUND_REWARD_COUNT}"/> </b></span> <span>&nbsp;&nbsp;|&nbsp;&nbsp;1개 펀딩</span>
                                                    <b class="pl20">예상 배송일</b> <span><fmt:formatDate value="${reward.FUND_PRODUCT_ESTIMATE_DATE}" pattern="yyyy-MM-dd"/></span>
                                                    <i class="fas fa-caret-right" aria-hidden="true"></i></div>
                                                <div class="reward-choice-boxtitle">${reward.FUND_REWARD_TITLE}</div>
                                                <div class="reward-choice-boxdesc">${reward.FUND_REWARD_CONTENT}</div>
                                            </div>
                                        </div>
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
                                        <div class="reward-option-bottomStepBtn" style="width: 200px;">다음단계</div>
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
                        <div class="reward-option-bottomStepBtn">다음단계</div>
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
        const info = document.getElementById("main_information");
        const reply = document.getElementById("reply_board");
        $(".reward-menu a").removeClass("active");
        if(a === 'story'){
            document.getElementById('story_page').classList.add("active");
            info.style.display = 'block';
            reply.style.display = 'none';
        } else if(a === 'news'){
            document.getElementById('news_page').classList.add("active");
        }else if(a === 'reply'){
            document.getElementById('reply_page').classList.add("active");
            info.style.display = 'none';
            reply.style.display = 'block';
        }else{
            document.getElementById('inf_page').classList.add("active");
        }
    }
</script>
