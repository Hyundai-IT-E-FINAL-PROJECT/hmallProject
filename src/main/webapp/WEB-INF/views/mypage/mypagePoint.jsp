<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오전 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">
            <!-- LNB 시작 -->
            <%@ include file="mypageSide.jsp" %>
            <script type="text/javascript">
                var upntCustYn = "N";
                $(document).ready(function() {
                    $.ajax({
                        type: "get"
                        ,url: "/p/mpf/chkUpntCustYn.do"
                        ,dataType: "json"
                        ,async: false
                        ,success : function(data) {
                            upntCustYn = data.upntCustYn;
                        }
                        , error: function (data) {
                            console.log("chkUpntCustYn_error", data);
                        }
                    });
                });

                <!--HPAY임대진 추가 -->
                function openHPayTag(pathVal) {
                    var url = "http://" + location.host + "/p/mpf/hpayManage.do";
                    try {
                        _trk_flashEnvView('_TRK_CP=' + pathVal);
                    } catch(e){}

                    openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());
                }

                //H.Point Pay 관리 통합회원 확인 후 후 화면 분기
                function fn_HppManage(){
                    if(upntCustYn == "Y"){
                        location.href = "https://www.hmall.com/p/mpd/hhpPmntManage.do";
                    }else{
                        $("#pec001-01").modal().show();
                    }
                }

                function fn_upntPopupOpen(){
                    location.href='/p/cua/registUpnt.do';
                }

                function fn_upntPopupClose(){
                    $("#pec001-01").modal().hide();
                }
            </script>
            <!--20170816 박승택 추가 -->
            <form name="upntLeftForm" method="post" target="uPnt">
                <input type="hidden" name="mcustNo" value="">
            </form>
            <!-- // LNB 끝 -->
            <div class="contents">
                <div class="hpoint-wrap">
                    <h2 class="hiding">포인트</h2>
                    <div class="point-head">
                        <p>김민수님의 포인트</p>
                    </div>
                    <!--tabgroup-->
                    <div class="tabgroup point-tab">

                        <!--ui-tab-->
                        <ul class="ui-tab" role="tablist">
                            <li role="presentation"><a href="/p/mpe/selectHPntTabPage.do" role="tab" aria-controls="viewReserve"><span>적립금 <em>0원</em></span></a></li>
                            <li role="presentation"><a href="/p/mpe/selectCdpstTabPage.do" role="tab" aria-controls="viewDeposit"><span>예치금 <em>0원</em></span></a></li>
                        </ul>
                        <!--//ui-tab-->
                        <!--Tab panes-->
                        <div class="tab-content">
                            <!--viewHpoint-->
                            <div role="tabpanel" class="tab-pane ui-active" id="viewReserve">
                                <!--boxtbl-->
                                <div class="boxtbl">
                                    <div class="point-wrap">
                                        <div class="point-fl">
                                            <span class="ctypo17 bold"><em class="name">김민수</em>님의 적립금</span>
                                            <span class="txt-point"><em class="myreserve">0</em>원</span>
                                        </div>
                                        <div class="point-fr">
                                            <dl>
                                                <dt>적립예정</dt>
                                                <dd>
                                                    <span><em class="prepoint" id="totPromoExpectSvmt">0</em>P</span>
                                                </dd>
                                                <dt>당월 소멸예정</dt>
                                                <dd>
                                                    <span><em class="delpoint" id="thisMonSumEndSvmt">0</em>P</span>
                                                </dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <!--//boxtbl-->

                                <!--point-progresstxt-->
                                <div class="point-progresstxt">
                                    <div class="tit-wrap btn-with"> <!--버튼과 함께 사용될 경우 class="btn-with" 추가-->
                                        <h3>적립금 보유 &amp; 사용 현황</h3>
                                        <div class="btngroup">
                                            <button class="btn btn-linelgray small34" data-modules-modal="target:.pop-phc038;" onclick="javascript:openHPntVlidTermPup();return false;"><span>적립금 유효기간 조회</span></button>
                                        </div>
                                    </div>
                                </div>
                                <!--//point-progresstxt-->

                                <!--filter-box-->
                                <div class="filter-box">
                                    <div class="search-filter rel">
                                        <!-- 2020-09-28 마크업 수정 -->
                                        <ul id="searchTermCondition" class="radiolist abs only">
                                            <li id="1">
                                                <input type="radio" name="filter1" id="filter1-01" aria-checked="true">
                                                <label for="filter1-01">최근 14일</label>
                                            </li>
                                            <li id="2">
                                                <input type="radio" name="filter1" id="filter1-02" aria-checked="false">
                                                <label for="filter1-02">최근 3개월</label>
                                            </li>
                                            <li id="3">
                                                <input type="radio" name="filter1" id="filter1-03" aria-checked="false">
                                                <label for="filter1-03">최근 6개월</label>
                                            </li>
                                            <li id="4">
                                                <input type="radio" name="filter1" id="filter1-04" aria-checked="false">
                                                <label for="filter1-04">2022년</label>
                                            </li>
                                            <li id="5">
                                                <input type="radio" name="filter1" id="filter1-05" aria-checked="false">
                                                <label for="filter1-05">2021년</label>
                                            </li>
                                            <li id="6">
                                                <input type="radio" name="filter1" id="filter1-06" aria-checked="false">
                                                <label for="filter1-06">2020년</label>
                                            </li>
                                            <li id="7">
                                                <input type="radio" name="filter1" id="filter1-07" aria-checked="false">
                                                <label for="filter1-07">전체</label>
                                            </li>
                                        </ul>
                                        <!-- // 2020-09-28 마크업 수정 -->
                                    </div>
                                </div>
                                <!--//filter-box-->

                                <!--유효한 적립금만 보기-->
                                <div class="checkbox" id="checkbox_view_valid">

                                    <label class="chklabel">
                                        <input id="checkbox_valid_yn" type="checkbox">
                                        <i class="icon"></i>
                                        <span>유효한 적립금만 보기</span>
                                    </label>

                                </div>
                                <!--//유효한 적립금만보기-->


                                <!--hpoint list-->
                                <div class="list-wrap">

                                    <!--내역이 없을 경우-->
                                    <div class="nodata">
                                        <span class="bgcircle"><i class="icon nodata-type18"></i></span>
                                        <p>사용 가능한 적립금 내역이 없습니다.</p>
                                    </div>
                                    <!--//내역이 없을 경우-->



                                </div>
                                <!--hpoint list-->

                            </div>
                    </div>
                    <!--//tabgroup-->
                </div>
            </div>
            <!-- // .contents -->
        </div>
    </div>
</main>