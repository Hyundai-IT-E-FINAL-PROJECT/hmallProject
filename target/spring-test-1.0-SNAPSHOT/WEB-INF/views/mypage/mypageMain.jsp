<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-19
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">

            <!--20170816 박승택 추가 -->
            <form name="upntLeftForm" method="post" target="uPnt">
                <input type="hidden" name="mcustNo" value=""/>
            </form>
            <!-- 마이페이지 사이드바 있던 곳-->

            <%@ include file="mypageSide.jsp" %>


            <div class="contents">
                <div class="mypage-order-wrap zzim">
                    <!--
                    * 회원등급 지정 클래스
                        - TOP CLASS 등급 : topclass-lv
                        - DIAMOND 등급 : diamond-lv
                        - PLATINUM 등급 : platinum-lv
                        - GOLD 등급 : gold-lv
                        - SILVER 등급 : silver-lv
                    -->


                    <div class="myinfo-area






		                                silver-lv


                    ">
                        <div>
                            <p class="myname"><a href="/mypage/mypageUpdate"
                                                 class="btn-link"><em>김민수님</em></a></p>
                            <div class="rating">


                                <span class="silver-lv"><i class="icon"></i><em>실버</em></span>


                                <div class="btngroup">
                                    <a href="/mypage/level"
                                       class="btn btn-benefit sm"><span>혜택보기</span></a>
                                </div>
                            </div>
                            <!-- //.rating -->
                        </div>

                        <ul class="infowrap">
                            <li>
                                <a href="/mypage/mypageCoupon">
                                    <span class="link"><b>0</b>장</span>
                                    <span class="txt">보유 쿠폰</span>
                                </a>
                            </li>
                            <li>
                                <a href="/mypage/mypagePoint" onclick="doSearchUPntMainPop()">
                                <%--<a href="javascript://" onclick="doSearchUPntMainPop()">--%>
                                    <span class="link">
                                    <b>1,143</b>P</span>
                                    <span class="txt">포인트</span>
                                </a>
                            </li>
                            <li>
                                <a href="/mypage/mypagePoint">
                                    <span class="link"><b>1231</b>원</span>
                                    <span class="txt">예차금</span>
                                </a>
                            </li>
                           <%-- <li>
                                <a href="https://www.hmall.com/p/mpb/selectItemEvalAtclListPagingByCondtion.do">
                                    <span class="link"><b>1</b>건</span>
                                    <span class="txt">작성 가능한 상품평</span>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.hmall.com/p/mpe/evntEntryDtl.do">
                                    <span class="link"><b>0</b>건</span>
                                    <span class="txt">참여한 이벤트</span>
                                </a>
                            </li>--%>
                        </ul>
                        <!-- //.infowrap -->

                    </div>
                    <!-- //.myinfo-area -->

                    <div id="bannerWrap" class="banner-template">
                        <!--배너의 경우 관리자에서 등록 // bg칼러와 이미지가 들어간 배너만 등록-->
                        <a href="javascript:;" data-background="#F2EDF8|#EFF6FC|#F8F8EA|#F9F2ED|#FFF2F4|#F3EBEA|#F0F6EA"
                           style="display:none" id="mktgBanner" onClick="bannerClick()">
                            <div class="banner" id="bannerImg">
                            </div>
                            <div class="banner-txt">
                                <p class="tit" id="sogu1"></p>
                                <p class="txt" id="sogu2"></p>
                            </div>
                        </a>
                    </div>

                    <h3 class="title22">
                        최근 주문/배송 현황
                        <div class="btngroup abs">
                            <a href="/mypage/mypageOrder" class="btn atext"><span>전체보기</span><i
                                    class="arrow right"></i></a>
                        </div>
                    </h3>


                    <div class="order-list">
                        <!-- 결제완료 -->


                        <dl>
                            <dt>
                                <div class="date">
                                    <span>2022.05.13 (주문번호 : 20220513295854)</span>
                                </div>

                                <div class="abs">
                                    <a href="/p/mpa/selectOrdPTCPup.do?ordNo=20220513295854" class="btn alink"><span>주문/배송 상세</span></a>
                                </div>

                            </dt>
                            <input type="hidden" name="paymentYnOrdNo" value=""/>

                            <!-- 가장최근주문 1건, 최대 10개 상품 -->

                            <dd>

                                <a href="https://www.hmall.com/p/pda/itemPtc.do?slitmCd=2137807436&ordpreview=true">


                                    <input type="hidden" name="slitmCd" value="2137807436">
                                    <span class="img">
	    	                                <img src="https://image.hmall.com/static/4/7/80/37/2137807436_0.jpg?RS=300x300&AR=0"
                                                 alt="SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)"
                                                 onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&AR=0')"/>
	                                    </span>
                                    <div class="box">
	                                        <span class="state sky">



															배송완료



                                            <em class="color-999">

                                            </em>
                                            </span>
                                        <span class="tit">
	                                        	SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)
	                                        </span>
                                        <div class="info">
                                            <ul>
                                                <li>10봉 랜덤구성</li>
                                                <li>


                                                    1


                                                    개
                                                </li>
                                            </ul>
                                        </div>
                                        <span class="price">

																<strong>15,000</strong>원


											</span>
                                    </div>
                                </a>

                                <div class="btngroup">

                                    <!-- 20180626_특화배송조유진 -->


                                    <button class="btn btn-linelgray small30" type="button"
                                            onclick="openCnslAcptPup('20220513295854','1','rtp');"><span>반품신청</span>
                                    </button>


                                    <button class="btn btn-linelgray small30" type="button"
                                            onclick="openCnslAcptPup('20220513295854','1','exch');"><span>교환신청</span>
                                    </button>

                                    <button class="btn btn-linelgray small30" type="button"
                                            onClick="openDlvTrcUrlPup('20220513295854', '1')"><span>배송조회</span></button>

                                    <input type="hidden" name="copnStlmFixYn" value=""/>
                                </div>

                            </dd>


                        </dl>
                        <!-- // 결제완료 -->

                    </div>


                    <!-- 추후 상품전시 레이아웃 마크업으로 변경 필요 -->


                    <h3 class="title22">
                        찜
                        <div class="btngroup abs">
                            <a href="/p/mpc/sltdItemList.do" class="btn atext" onclick="gaTagging(this, '', '', '');"
                               ga-custom-name="마이페이지" ga-custom-position="찜한 상품" ga-custom-creative="전체보기"
                               ga-custom-title="마이페이지>메인" ga-custom-etc="urlAction"><span>전체보기</span><i
                                    class="arrow right"></i></a>
                        </div>
                    </h3>
                    <div class="pdlist-wrap col4"> <!--// 4xn class="col4" 추가 -->

                        <!-- [12/08]_수정(위키 342 관련 내용 수정 - 찜한 상품이 없을 경우 추가) -->
                        <div class="nodata">
                            <p>찜한 상품이 없습니다.</p>
                        </div>


                    </div>

                </div>
            </div>
            <!-- // .contents -->


        </div>
    </div>
</main>
</body>
</html>
