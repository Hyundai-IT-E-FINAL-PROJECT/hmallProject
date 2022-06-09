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
                                        <div class="reward-info-amount">251,500원
                                            <!----> <span class="reward-info-status">펀딩 중</span> <!----></div>
                                        <div class="mt20"><span class="reward-info-text">달성률</span> <span
                                                class="reward-info-now">50% &nbsp;</span> <span
                                                class="reward-info-goal">목표금액 &nbsp;500,000원</span></div>
                                        <div class="mt5"><span class="reward-info-text">남은기간</span> <span
                                                class="reward-info-now mr5"> 3일</span> <span class="reward-info-goal">2022.06.12 종료</span>
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
                        <div class="reward-menu"><a class="pointerCursor active"><span
                                class="webcrowdy-font-bold">스토리</span></a> <a class="pointerCursor"><span
                                class="webcrowdy-font-bold">새소식 <em>0</em></span></a> <a class="pointerCursor"><span
                                class="webcrowdy-font-bold">댓글 <em>1</em></span></a> <a class="pointerCursor"><span
                                class="webcrowdy-font-bold">안내</span></a></div>
                    </div>
                </div>
                <div class="mt40 xs-mt20 mb100">
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
                <div>
                    <div class="reward-choice-container">
                        <div class="reward-choice-shareBtn"></div>
                        <div class="reward-choice-btn">펀딩하기<span aria-hidden="true"
                                                                 class="ml10 glyphicon glyphicon-chevron-up"></span>
                        </div>
                        <div class="option-space-shadow"></div>
                    </div>
                    <div id="choiceBox" class="reward-choice-box" style="display: none;">
                        <div class="reward-choice-contentArea">
                            <div class="reward-choice-boxBack-pc">
                                <div class="reward-choice-storyBackBtn"><i class="fa fa-angle-left"
                                                                           aria-hidden="true"></i>
                                    <div class="reward-choice-storyBackText">스토리 돌아가기</div>
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
                                <div class="reward-choice-optionBox-white rewad-chocie-active">
                                    <div class="reward-choice-boxlabel"><!----> <!----> <!----> <!----> <!----></div>
                                    <div class="reward-choice-boxamount">19,600 원 펀딩</div>
                                    <div class="reward-choice-boxrow"><!----> <span><b>199개 남음</b></span> <span>&nbsp;&nbsp;|&nbsp;&nbsp;1개 펀딩</span>
                                        <b class="pl20">예상 배송일 &nbsp;&nbsp;</b> <span>2022-06-13</span> <i
                                                class="fas fa-caret-right" aria-hidden="true"></i></div>
                                    <div class="reward-choice-boxtitle">[나혼산 세트] 댓츠잇 너겟 2개입</div>
                                    <div class="reward-choice-boxdesc">달콤양념 1 + 청양간장 1</div>
                                </div>
                                <div class="reward-choice-optionBox-white rewad-chocie-active">
                                    <div class="reward-choice-boxlabel"><!----> <!----> <!----> <!----> <!----></div>
                                    <div class="reward-choice-boxamount">32,900 원 펀딩</div>
                                    <div class="reward-choice-boxrow"><!----> <span><b>97개 남음</b></span> <span>&nbsp;&nbsp;|&nbsp;&nbsp;3개 펀딩</span>
                                        <b class="pl20">예상 배송일 &nbsp;&nbsp;</b> <span>2022-06-13</span> <i
                                                class="fas fa-caret-right" aria-hidden="true"></i></div>
                                    <div class="reward-choice-boxtitle">[홈파티 세트] 댓츠잇 너겟 4개입</div>
                                    <div class="reward-choice-boxdesc">달콤양념 2 + 청양간장 2</div>
                                </div>
                                <div class="reward-choice-optionBox-white rewad-chocie-active">
                                    <div class="reward-choice-boxlabel"><!----> <!----> <!----> <!----> <!----></div>
                                    <div class="reward-choice-boxamount">44,400 원 펀딩</div>
                                    <div class="reward-choice-boxrow"><!----> <span><b>47개 남음</b></span> <span>&nbsp;&nbsp;|&nbsp;&nbsp;3개 펀딩</span>
                                        <b class="pl20">예상 배송일 &nbsp;&nbsp;</b> <span>2022-06-13</span> <i
                                                class="fas fa-caret-right" aria-hidden="true"></i></div>
                                    <div class="reward-choice-boxtitle">[온가족 세트] 댓츠잇 너겟 6개입</div>
                                    <div class="reward-choice-boxdesc">달콤양념 3 + 청양간장 3</div>
                                </div> <!----> <!----></div>
                        </div>
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
                    <div id="authModal" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false"
                         class="modal fade authModal">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" aria-label="Close" class="xButton"></button>
                                </div>
                                <div class="modal-body" style="height: 564px;">
                                    <div class="agree-body">
                                        <div class="agree-subtitle">제1조 (목적)</div>
                                        본 약관은 NICE평가정보(주) (이하 "회사"라 한다)이 제공하는 본인확인서비스(이하 "서비스"라 한다)에 관한 이용조건 및 절차 등 기본적인
                                        사항을 규정함을 목적으로 합니다.
                                        <br><br>
                                        <div class="agree-subtitle">제2조 (약관의 효력 및 변경)</div>
                                        1. 본 약관은 "이용자"에게 "서비스" 화면에 게시하거나, 기타의 방법으로 공지하는 것으로 효력이 발생합니다.<br>
                                        2. "회사"는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정할 수 있으며, 변경된 경우에는
                                        제1항과 같은 방법으로 공지합니다. 다만 "이용자"의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.<br>
                                        3. "이용자"는 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 "회사"가 책임을 지지 않습니다.
                                        <br><br>
                                        <div class="agree-subtitle">제3조 (약관 외 준칙)</div>
                                        본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률등 기타 관련 법령 또는 상관례에 따릅니다.
                                        <br><br>
                                        <div class="agree-subtitle">제4조 (용어의 정의)</div>
                                        본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
                                        1. "본인확인서비스"라 함은 "이용자"가 인터넷상에서 휴대폰 등의 인증수단을 이용하여, 본인임을 안전하게 식별 및 확인해 주는 서비스를
                                        말합니다.<br>
                                        2. "이용자"라 함은 "회사"에서 제공하는 "서비스"의 이용을 위해 자신의 "본인확인정보"를 "회사" 및 "본인확인기관" 등에게 제공하고,
                                        본인임을 확인 받고자 하는 자를 말합니다.<br>
                                        3. "본인확인정보"라 함은 "이용자"가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 "이용자"의
                                        정보를 말합니다.<br>
                                        4. "본인확인기관"이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 서비스를 제공하는 자로 방송통신위원회로부터
                                        본인확인기관으로 지정을 받은 자를 의미합니다.<br>
                                        5. "인터넷사업자"라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 "회사"와 계약을 통해
                                        운영하며, 인터넷 웹사이트의 "이용자"에 대한 "본인확인정보"를 제공 받는 사업체를 말합니다.<br>
                                        6. "중복가입확인정보"라 함은 웹사이트에 가입하고자 하는 이용자의 중복 확인을 위해 제공되는 정보를 말합니다.<br>
                                        7. "연계정보" 라 함은 "인터넷사업자"의 온ㆍ오프라인 서비스 연계 등의 목적으로 "이용자"를 식별하기 위해 제공되는 정보를 말합니다.
                                        <br><br>
                                        <div class="agree-subtitle">제5조 (회사의 의무)</div>
                                        1. "회사"는 "서비스" 제공과 관련하여 인지한 "이용자"의 "본인확인정보"를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단,
                                        국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지
                                        않습니다.<br>
                                        2. "회사"는 "이용자"에게 안전한 "서비스" 제공을 위하여 지속적으로 "서비스"의 예방점검, 유지보수 등을 이행하며, "서비스"의 장애가
                                        발생하는 경우, 이를 지체 없이 수리 및 복구합니다.<br>
                                        3. "회사"는 "이용자"가 제기한 의견, 불만이 타당하다고 인정되는 경우 적절한 절차를 거쳐 이를 지체 없이 처리하거나 처리에 관한 일정을
                                        통지하여야 합니다.<br>
                                        4. "회사"는 접근매체의 발급 주체가 아닌 경우에는 접근 매체의 위조나 변조로 발생한 사고로 인하여, "이용자"에게 발생한 손해에 대하여
                                        배상책임이 없습니다.
                                        <br><br>
                                        <div class="agree-subtitle">제6조 (이용자의 의무)</div>
                                        1. "이용자"는 "서비스"를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, "회사"는 위반 행위에 따르는 일체의 법적 책임을
                                        지지 않습니다.<br>
                                        1) 타 "이용자"의 "본인확인정보"를 부정하게 사용 및 도용하는 행위<br>
                                        2) "회사"의 저작권, 제3자의 저작원 등 기타 권리를 침해하는 행위<br>
                                        3) 범죄 행위<br>
                                        4) 기타 관련 법령에 위배되는 행위<br>
                                        2. "이용자"는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근 매체의 도용이나 위조 또는 변조를 방지하기 위하여
                                        충분한 주의를 기울여야 합니다.<br>
                                        3. "이용자"는 본 약관에서 규정하는 사항과 "서비스"에 대한 이용안내 또는 주의사항을 준수하여야 합니다.
                                        <br><br>
                                        <div class="agree-subtitle">제7조 (서비스의 내용)</div>
                                        1. "서비스"는 "이용자"가 주민등록번호의 입력 없이, 본인명의로 된 인증수단(휴대폰 등)을 이용하여 본인 확인이 가능한 인증 서비스 입니다.<br>
                                        2. "인터넷사업자"는 회원가입, ID/PW찾기, 성인인증, 기타 본인확인이 필요한 컨텐츠 요청 시 "이용자"에게 "서비스"를 제공
                                        합니다.<br>
                                        3. "이용자"는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력 후, 입력한 정보가 일치한 경우 해당
                                        휴대폰번호로 1회성 비밀번호(승인번호)가 발송되며, 수신된 승인번호를 정확하게 입력하는 것으로 본인 확인이 이루어 집니다.
                                        <br><br>
                                        <div class="agree-subtitle">제8조 (서비스 제공시간)</div>
                                        1. "서비스"의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 "서비스"가 일시 중지될 수 있고
                                        또한, 운영상의 목적으로 "회사"가 정한 기간에도 일시 중지될 수 있습니다.<br>
                                        2. "회사"는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 "서비스"를 일정 범위로 분할 하여 각 범위 별로 이용가능 시간을 달리
                                        정할 수 있으며, 이 경우 그 내용을 공지 합니다.
                                        <br><br>
                                        <div class="agree-subtitle">제9조 (서비스 제공의 중지)</div>
                                        1."회사"는 다음 각 호에 해당하는 사유가 있는 경우 "서비스" 제공의 전부 또는 일부를 중지할 수 있습니다.<br>
                                        1) "서비스"를 위한 설비의 보수 등 공사로 인한 부득이한 경우<br>
                                        2) 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 "서비스" 이용에 지장이 있는 경우<br>
                                        3) "서비스" 계약종료 등과 같은 "인터넷사업자"의 제반 사정으로 "서비스"를 유지할 수 업는 경우<br>
                                        4) 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우<br>
                                        2. "회사"는 "서비스"의 변경, 중지로 발생하는 문제에 대해서는 어떠한 책임도 지지 않습니다.
                                        <br><br>
                                        <div class="agree-subtitle">제10조 (서비스의 안전성 확보)</div>
                                        1. "회사"는 "서비스"의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보처리시스템 및 전산자료의 관리 등의 관리적
                                        조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취하고 있습니다.<br>
                                        2. "회사"는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖추고
                                        있습니다.<br>
                                        3. "회사"는 해킹 침해 방지를 위하여 다음 각 호의 시스템 및 프로그램을 설치하여 운영합니다.<br>
                                        1) 침입차단시스템 설치<br>
                                        2) 침입탐지시스템 설치<br>
                                        3) 그 밖에 필요한 보호장비 또는 암호프로그램 등 정보보호시스템 설치<br>
                                        1. "회사"는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.<br>
                                        1) 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료
                                        후 사용할 것<br>
                                        2) 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것<br>
                                        3) 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것
                                        <br><br>
                                        <div class="agree-subtitle">제11조 (이용자의 개인정보보호)</div>
                                        "회사"는 관련법령이 정하는 바에 따라서 "이용자"의 개인정보를 보호하기 위하여 노력합니다. "이용자"의 개인정보보호에 관한 사항은 관련법령 및
                                        "회사"가 정하는 "개인정보취급방침"에 정한 바에 따릅니다.
                                        <br><br>
                                        <div class="agree-subtitle">제12조 (개인정보의 위탁)</div>
                                        "회사"는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 "회사"가 선정한
                                        회사에 위탁할 수 있습니다. 개인정보의 위탁에 관한 사항은 관련법령 및 "회사"가 정하는 "개인정보취급방침"에 정한 바에 따릅니다.
                                        <br><br>
                                        <div class="agree-subtitle">제13조 (손해배상)</div>
                                        "회사"는 "서비스"의 이용과 관련하여 "이용자"에게 발생한 "회사"측의 중과실에 의한 손해를 제외한 어떠한 손해에 관하여도 책임을 지지
                                        않습니다.
                                        <br><br>
                                        <div class="agree-subtitle">제14조 (회사와 인터넷사업자와의 관계)</div>
                                        1. "회사"는 "인터넷사업자"가 제공하는 서비스 상품 또는 용역 등에 대하여 보증책임을 지지 않습니다.<br>
                                        2. "회사"와 "인터넷사업자"는 독자적으로 사이트를 운영하며, "인터넷사업자"와 "이용자"간에 행해진 거래에 대하여 고의 또는 중과실이 있는
                                        경우를 제외하고는 어떠한 책임도 지지 않습니다.
                                        <br><br>
                                        <div class="agree-subtitle">제15조 (면책)</div>
                                        1. "회사"의 고의 또는 과실 없이 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.<br>
                                        2. "회사"는 "이용자" 또는 제3자 측의 사정으로 인한 "서비스" 이용의 장애에 대하여 책임을 지지 않습니다.<br>
                                        3. "회사"는 고의 또는 중과실이 없는 한 "이용자"가 "서비스"를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에
                                        "서비스"를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.<br>
                                        4. "회사"는 "이용자"가 "서비스"에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 고의 또는 중과실이 없는 한 일체의
                                        책임을 지지 않습니다.<br>
                                        5. 계약만료 또는 요금 미납의 결과로 사용자계정이 정지되거나, 보관 파일이 삭제된 후 이에 따르는 손해에 대하여 책임을 지지 않습니다.
                                        <br><br>
                                        <div class="agree-subtitle">제16조 (관할 법원)</div>
                                        1. "회사"와 "이용자"는 "서비스"와 관련하여 분쟁이 발생한 경우, 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.<br>
                                        2. 제1항의 협의에서도 분쟁이 해결되지 않은 경우 등, 약관과 관련하여 분쟁으로 인한 소송이 제기될 경우 동 소송은 서울중앙지방법원을 관할
                                        법원으로 합니다.
                                        <br><br>
                                        <div class="agree-subtitle">부칙</div>
                                        (시행일) 이 약관은 공시한 날로부터 시행합니다.

                                        <!----> <!----> <!----> <!----></div>
                                </div>
                                <div class="modal-footer">
                                    <div class="row not-space"><a class="btn btn-block btn-primary-outline">확인</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</main>
<script src="/resources/js/productAll.js"></script>
