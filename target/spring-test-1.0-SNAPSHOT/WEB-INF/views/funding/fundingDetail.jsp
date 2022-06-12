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
            <div id="main_info" class="mt40 xs-mt20 mb100" style="display: block">
                <div class="container mce-content-body"><!---->
                    <div><p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191732450179_KzNXDzEEuz.gif"
                                 alt=""></p>
                        <p class="al_center"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191400360549_fRalXx6nrC.png"
                                alt=""></p>
                        <blockquote class="blockquote_left">리워드 구성</blockquote>
                        <p class="al_center"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191400450854_Pjy9v2dQaJ.png"
                                alt=""></p>
                        <h6>[나혼산 세트] 댓츠잇 너겟 2개입 (달콤양념 1 + 청양간장 1) 가격: 16,600원</h6>
                        <h6>[홈파티 세트] 댓츠잇 너겟 4개입 (달콤양념 2&nbsp;+ 청양간장 2) 가격: 29,900원</h6>
                        <h6>[온가족 세트] 댓츠잇 너겟 6개입 (달콤양념 3&nbsp;+ 청양간장 3) 가격: 41,400원</h6>
                        <h6><strong>*배송비 3,000원 별도</strong><strong><br></strong></h6>
                        <h3 class="blockquote_left">식물성 비건 너겟, 핵심 포인트</h3>
                        <h6><strong>✔ <strong class="FundingDetailEditorParagraph_title__2o5M9">‘매콤달콤’, ‘겉바속촉’ 식물성
                            너겟!</strong></strong></h6>
                        <h6><strong>✔ <strong class="FundingDetailEditorParagraph_title__2o5M9">단백질 함량은 높이고 지방은 낮게,
                            콜레스테롤은 제로!</strong></strong></h6>
                        <h6><strong>✔ <strong class="FundingDetailEditorParagraph_title__2o5M9">환경과 나에게 모두
                            길트프리(Guilt Free)!</strong></strong></h6>
                        <h6><strong>✔ <strong class="FundingDetailEditorParagraph_title__2o5M9">한국적인 소스로 다양한 맛 즐기기
                            가능!</strong></strong></h6>
                        <h6><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191407230573_CsSJ7j0GBc.png"
                                 alt=""></h6>
                        <h4><strong>POINT 1.<br><strong class="FundingDetailEditorParagraph_title__2o5M9">‘매콤달콤’,
                            ‘겉바속촉’ 식물성 너겟!</strong><br></strong></h4>
                        <h6 class="al_left">환경을 생각해 시도해보겠다고 한 식물성 식단, 입안의 즐거움도 지킬 수 있어야 지속적으로 지향할 수 있지 않을까요? 댓츠잇은 이런
                            고민을 덜어주기 위해 한국적인 재료와 음식에서 영감을 받은 다양한 식물성 식품들을 제안하는 푸드테크 브랜드입니다. <span
                                    class="custom_underline">‘매콤달콤’ ‘겉바속촉’ 댓츠잇 비건 너겟과 함께 지속가능한 일상에 조금 더 가까워져보세요.</span>
                        </h6>
                        <h6 class="al_left"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191412220884_qna03ZyU2Z.jpg"
                                alt=""></h6>
                        <p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191751250980_Q2QyEuE85w.png"
                                alt=""></p>
                        <h4><strong>POINT 2.<br><strong class="FundingDetailEditorParagraph_title__2o5M9">단백질 함량은
                            높이고 지방은 낮게, 콜레스테롤은 제로!</strong><br></strong></h4>
                        <h6>식물성 재료만으로 만들었지만 <span class="custom_underline">단백질 함량은 높이고 콜레스테롤은 제로(ZERO)</span>로 건강하고
                            맛있게 만들었습니다. 유탕처리가 되어 나와 조리시간을 보다 짧게 줄였습니다. 가족, 친구들과 함께 즐겨보세요!</h6>
                        <h6><span class="custom_underline">Non-GMO 원료로 만든 너겟</span>과 <span class="custom_underline">국내산 발아현미가루</span>로
                            더 바삭하게 즐길 수 있습니다.<br>(<span
                                    class="custom_underline">Non-GMO 원료는 유전자조작 농산물을 사용하지 않은 식재료</span>를 의미합니다.)</h6>
                        <p>
                            <img src="https://image-se.ycrowdy.com/20220519/CROWDY_0_202205191753240245_j3YnEyzjxp.png"
                                 alt=""></p>
                        <p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191411230395_cF3EQeOSFa.png"
                                alt=""></p>
                        <p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191412100713_nVscBcnjIy.jpg"
                                alt=""></p>
                        <h4><strong>POINT 3.<br></strong><strong><strong
                                class="FundingDetailEditorParagraph_title__2o5M9">환경과 나에게 모두 길트프리(Guilt
                            Free)!</strong></strong></h4>
                        <h6>채식을 시작하는 많은 이유 중 하나가 건강을 위해서이기도 한데요, <span class="custom_underline">환경도 나도 모두 아끼는 좋은 습관을 시작하기 위한 길트프리(Guilt Free) 식단</span>.
                            고칼로리에 콜레스테롤, 과도한 지방, 포화지방산에서 벗어나,&nbsp;<u>길티 플레져(Guilty pleasure)*</u>를 즐긴 다음날도 편안하게
                            보내보세요.</h6>
                        <h6>*길티 플레져(Guilty pleasure): 죄책감을 느끼거나 하면 안된다는것을 알지만 자신에게 만족감을 가져다주는 것 또는 그러한 행위</h6>
                        <p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191754280736_80GlLSQuFB.png"
                                alt=""></p>
                        <p class="al_center"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191731570818_han9H2ixzU.png"
                                alt=""></p>
                        <p class="al_center"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191732170636_fqfqFcphLM.gif"
                                alt=""></p>
                        <h4><strong>POINT 4.<br><strong class="FundingDetailEditorParagraph_title__2o5M9">한국적인 소스로
                            다양한 맛 즐기기 가능<br></strong>&amp;간단한 조리 법!</strong></h4>
                        <h6 class="0">한국인이 가장 사랑하는 맛, <span
                                class="custom_underline">한국적인 소스 2종(달콤양념, 청양간장)을 비건으로 연구</span>해봤어요. 친구, 가족들끼리 모여 각자
                            취향에 맞는 소스를 선택해 함께 즐겨요.</h6>
                        <p class="al_center"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191750400396_pvghwFgXp9.png"
                                alt=""></p>
                        <p class="al_center"><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191750180896_qzdgqht8my.gif"
                                alt=""></p>
                        <h6 class="al_left">댓츠잇 비건 너겟은 <span class="custom_underline">조리법과 조리시간도 간단</span>해 편리하게 드실
                            수 있습니다.</h6>
                        <p class="al_center"><img
                                src="https://image-se.ycrowdy.com/20220519/CROWDY_0_202205191804100992_H1eijzyAUw.png"
                                alt=""></p>
                        <blockquote class="blockquote_left">배송일정</blockquote>
                        <p class="al_center"><strong><img
                                src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191412460814_bdKjyXpbQz.png"
                                alt=""><br></strong></p>
                        <blockquote class="blockquote_left">진행자 소개</blockquote>
                        <p><img src="//image-se.ycrowdy.com/20220519/CROWDY_0_202205191414140019_wUgBPuhGOE.png"
                                alt=""></p>
                        <h6>안녕하세요, 그린 라이프스타일을 만들어가는 (주)베지스푼입니다.</h6>
                        <h6>2019년 비건 그로서리 샵인 비밀샵을 시작으로, 2020년 비건 밀크티 우쥬라익미,&nbsp;그리고 비건 너겟 댓츠잇까지.&nbsp;</h6>
                        <h6>지속가능한 식탁을 좀 더 쉽고 맛있게 즐길 수 있도록 다양한 식물성 식품을 소개하고 또 연구 및 출시하고 있습니다.&nbsp;</h6>
                        <h6>앞으로 크라우디를 통해 더 많은 식물성 식품을 소개해 나가고 싶습니다.&nbsp;</h6>
                        <h6>많은 응원과 관심 부탁드립니다.&nbsp;</h6>
                        <h6>고맙습니다.&nbsp;</h6>
                        <blockquote class="blockquote_left">FAQ</blockquote>
                        <h4><strong>Q. 유통기한은 어떻게 되나요?</strong></h4>
                        <h6>댓츠잇 너겟의 유통기한은 제조일로부터 12개월입니다.<br>개봉 후에는 가급적 다 드시는 것을 추천드리며 잘못된 보관 또는 장기 보관 시 상할 수 있습니다.
                        </h6>
                        <h4><strong>Q. 보관방법은 어떻게 되나요?</strong></h4>
                        <h6>배송 받으신 후 바로 냉동보관 해주세요(영하 18도). 냉동 식품으로 상온 보관 시 상할 수 있습니다.</h6>
                        <h4><strong>Q. 비건이 맞나요?</strong></h4>
                        <h6>댓츠잇은 순식물성 식품을 제조, 생산합니다. 동물성 원료는 들어가있지 않습니다.</h6>
                        <h4><strong>Q. 해동이 필요한가요?</strong></h4>
                        <h6>별도의 해동시간이 필요하지 않습니다. 편하신 조리법을 선택하여 바로 조리해주시면 됩니다.</h6>
                        <h4><strong>Q. 알레르기 사항이 있다면 알려주세요.</strong></h4>
                        <h6>대두, 밀을 함유하고 있습니다. 글루텐 프리 제품입니다.<br>대두, 밀에 알레르기 증상이 있는 분들께서는 알레르기를 유발할 수 있으므로 펀딩을 진행해주시지
                            않기를 부탁드립니다.</h6>
                        <h4><strong>Q. 튀김인데 콜레스테롤 제로가 맞나요?</strong></h4>
                        <h6>댓츠잇 너겟의 속 재료는 모두 식물성으로서 콜레스테롤이 전혀 함유되지 않으나 튀김옷과 유탕 처리 과정에서 발생하는 콜레스테롤이 미량 함유될 수
                            있습니다.</h6>
                        <h4>Q. 모금액 사용계획은 어떻게 되시나요?</h4>
                        <h6>모소중한 펀딩금은 댓츠잇의 유통을 위한 생산과 또 다른 대중적인 식물성 식품의 개발에 활용될 예정입니다.&nbsp;</h6></div>
                    <strong>프로젝트 신고하기</strong>
                    <p class="report-description" style="word-break: keep-all;">
                        크라우디는 여러분의 제보를 바탕으로 진행자가 제공한 내용이 허위이거나 <br class="hidden-xs"> 지적재산권을 침해하는 경우 이를 적극 반영하고
                        있습니다.
                    </p>
                    <a href="https://docs.google.com/forms/d/e/1FAIpQLSehniTpe3cUgaS0XKpt-rYIOry4y8-MwHegspyqeY5Rf2MFGQ/viewform"
                       target="_blank" class="btn-detail btn-report">신고하기</a></div>
                <hr class="crowdy-row-line mt40 mb40 xs-mt30 xs-mb30">
                <div class="container reward-content-body">
                    <div class="ivs-story-content3">
                        <div class="ivs-story-title1 xs-mb0">이런 프로젝트는<br>어때요?</div>
                        <div class="card-story-list">
                            <div class="card-row-02">
                                <div class="col-sm-3 col-xs-6">
                                    <figure><a href="/r/wwwlalaitscom" class="card-story-item">
                                        <div class="card-story-img"><img
                                                src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226"
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
                                                <div class="card-story-title">#100% 식물성 너겟 #치킨 없는 치킨 너겟
                                                    &lt;댓츠잇&gt;
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
                                        <input type="radio" name="checkRewardSeq" value="${reward.FUND_REWARD_SEQ}|${reward.FUND_PRODUCT_SEQ}"/>
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
                                    <div class="reward-option-bottomStepBtn" style="width: 200px;" onClick="loadFundingProcess();">펀딩하기</div>
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
        $(".reward-menu a").removeClass("active");
        if(a === 'story'){
            main_info.style.display = 'block';
            reply_board.style.display = 'none';
            document.getElementById('story_page').classList.add("active");
        } else if(a === 'news'){
            document.getElementById('news_page').classList.add("active");
        }else if(a === 'reply'){
            document.getElementById('reply_page').classList.add("active");
            main_info.style.display = 'none';
            reply_board.style.display = 'block';
        }else{
            document.getElementById('inf_page').classList.add("active");
        }
    }

    //펀딩하기 프로세스
    function loadFundingProcess(){

        var fundProduct=$("input[name=checkRewardSeq]:checked").val();
        var fund_reward_seq=fundProduct.split('|')[0];
        var fund_product_seq=fundProduct.split('|')[1];
        var fund_reward_count=$("input[name=reward_count]").val();

        console.log("reward_seq: "+fund_reward_seq);
        console.log("product_seq: "+fund_product_seq);
        console.log("fund_reward_count: "+fund_reward_count);



    }
</script>