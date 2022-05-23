<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-20
  Time: 오후 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<body>
<div class="wrap wing-none mp-membership"><!-- wing banner 미노출 시 : wing-none 클래스 추가 -->
    <div class="nav-skip"><a href="#mainContents">본문 콘텐츠로 건너뛰기</a></div>

    <!-- gnb setting -->
    <!-- header -->

    <script type="text/javascript" src="//image.hmall.com/gen/js/searchPopKeyWordList.js?ver=052011"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchADTextList.js?ver=052011"
            charset="UTF-8"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchADLinkList.js?ver=052011"
            charset="UTF-8"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchSpecialShopLinkList.js?ver=052011"
            charset="UTF-8"></script>
    <script type="text/javascript" src="//image.hmall.com/gen/js/searchBrndShopLinkList.js?ver=052011"
            charset="UTF-8"></script>


    <script type="text/javascript" src="//image.hmall.com/gen/js/new_main_data.js?ver=052011" charset="UTF-8"></script>


    <!-- TODO 곽희섭 20170523 통합포인트 추가 -->
    <script type="text/javascript" src="//image.hmall.com/p/js/cu/SsoAjax.js?version=1"></script>

    <main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
        <div class="container">
            <div class="contents">
                <!--
                    * 회원등급 지정 클래스
                        - TOP CLASS 등급 : topclass-lv
                        - DIAMOND 등급 : diamond-lv
                        - PLATINUM 등급 : platinum-lv
                        - GOLD 등급 : gold-lv
                        - SILVER 등급 : silver-lv
                        - 비회원 클래스 X
                -->

                <h3 class="title22">멤버십 등급안내 <em class="txt-gray">멤버십 혜택은 H.Point 통합회원인 경우에만 제공됩니다.</em></h3>
                <div class="membership-grade-info">

                    <table>
                        <caption>멤버십 등급안내 항목</caption>
                        <colgroup>
                            <col style="width:auto;">
                            <col style="width:184px;">
                            <col style="width:184px;">
                            <col style="width:184px;">
                            <col style="width:184px;">
                            <col style="width:184px;">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">멤버십 등급</th>
                            <td><span class="initial top"><i class="icon">T</i><em>탑클래스</em></span></td>
                            <td><span class="initial diamond"><i class="icon">D</i><em>다이아몬드</em></span></td>
                            <td><span class="initial platinum"><i class="icon">P</i><em>플래티넘</em></span></td>
                            <td><span class="initial gold"><i class="icon">G</i><em>골드</em></span></td>
                            <td><span class="initial silver"><i class="icon">S</i><em>실버</em></span></td>
                        </tr>
                        <tr>
                            <th scope="row">등급기준</th>
                            <td><p class="txt">20회 & 200만원 <br>이상 구매</p></td>
                            <td><p class="txt">10회 & 100만원 <br>이상 구매</p></td>
                            <td><p class="txt">5회 & 50만원 <br>이상 구매</p></td>
                            <td><p class="txt">1회 이상 구매</p></td>
                            <td><p class="txt">미주문</p></td>
                        </tr>
                        <tr>
                            <th scope="row">결제금액쿠폰 <em>(바로접속 전용)</em></th>
                            <td>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </a>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>3,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x2</em></div>
                                </a>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5</strong>%</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </a>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>3,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x2</em></div>
                                </a>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5</strong>%</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </a>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>3,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x2</em></div>
                                </a>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5</strong>%</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                </a>
                            </td>
                            <td>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>3,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x2</em></div>
                                </a>
                            </td>
                            <td></td>
                        </tr>

                        <tr class="coupon-down ">
                            <th scope="row">
                                H.Point 지급 혜택
                                <!-- [12/10]_수정(위키 358, PC_마이페이지_v1.51 처리내용 툴팁 추가 - 디자인에는 x버튼이 있지만 마우스 오버일때는 x버튼이 없는 구조) -->
                                <a href="javascript:;" class="qinfo">
                                    <i class="icon qmark"></i>
                                    <span class="hiding">상세내용</span>
                                    <div class="tooltipwrap">
                                        <div class="tooltip">
                                            <p><strong>회차 별 1회씩<br>총 2회 다운로드 가능</strong></p>
                                            <p>1회차 : 매월 3일~15일</p>
                                            <p>2회차 : 16일 ~ 익월 2일</p>
                                        </div>
                                    </div>
                                </a>
                                <em>(매월 3일, 16일 2회 지급)</em>
                            </th>
                            <td>
                                <div class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>5,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x2</em></div>
                                    <!-- coupon-down disabled 이면 버튼 문구 다운완료로 변경 -->
                                </div>


                            </td>
                            <td>
                                <div class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong>2,000</strong>원</p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x2</em></div>
                                </div>


                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row">무료배송 쿠폰</th>
                            <td>
                                <a href="javascript:;" class="coupon-box">
                                    <div class="coupon">
                                        <div class="coupon-info">
                                            <p class="title"><strong class="f-15">무료배송</strong></p>
                                        </div>
                                    </div>
                                    <div class="coupon-bg">
                                        <div></div>
                                        <div></div>
                                    </div>
                                    <div class="badge"><em>x3</em></div>
                                </a>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>

                        <tr>
                            <th scope="row">상품평작성 H.Point <em>(자동부여)</em></th>
                            <td>
                                <div class="ticket">
                                    <p class="txt">50자 초과</p>
                                    <p class="point"><strong>200</strong>P</p>
                                </div>
                                <div class="ticket">
                                    <p class="txt">50자 이하</p>
                                    <p class="point"><strong>10</strong>P</p>
                                </div>
                            </td>
                            <td>
                                <div class="ticket">
                                    <p class="txt">50자 초과</p>
                                    <p class="point"><strong>200</strong>P</p>
                                </div>
                                <div class="ticket">
                                    <p class="txt">50자 이하</p>
                                    <p class="point"><strong>10</strong>P</p>
                                </div>
                            </td>
                            <td>
                                <div class="ticket">
                                    <p class="txt">50자 초과</p>
                                    <p class="point"><strong>100</strong>P</p>
                                </div>
                                <div class="ticket">
                                    <p class="txt">50자 이하</p>
                                    <p class="point"><strong>10</strong>P</p>
                                </div>
                            </td>
                            <td>
                                <div class="ticket">
                                    <p class="txt">50자 초과</p>
                                    <p class="point"><strong>100</strong>P</p>
                                </div>
                                <div class="ticket">
                                    <p class="txt">50자 이하</p>
                                    <p class="point"><strong>10</strong>P</p>
                                </div>
                            </td>
                            <td>
                                <div class="ticket">
                                    <p class="txt">50자 초과</p>
                                    <p class="point"><strong>100</strong>P</p>
                                </div>
                                <div class="ticket">
                                    <p class="txt">50자 이하</p>
                                    <p class="point"><strong>10</strong>P</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">결제금액 H.Point <em>(자동부여)</em></th>
                            <td colspan="5">
                                <div class="topclass-box">
                                    <div class="box">
                                        <p class="tit">결제금액 0.1% H.Point 적립</p>
                                        <p class="txt">* 단, TV방송 상품, 순금 등 일부 상품은 적립률이 상이합니다.
                                            <br>
                                            * 정확한 적립 포인트는 주문서 및 마이페이지에서 확인 가능합니다.
                                        </p>
                                    </div>
                                </div>
                            </td>
                        </tr>

                    </table>
                </div>

                <!-- <div class="info-benefit">
                    <a href="/pevent/eva/selectTopClassView.do">
                        <span>클래스가 다른 혜택</span>
                        <strong>탑클래스 LOUNGE</strong>
                        <i class="icon"></i>
                    </a>
                </div> -->


                <h3 class="title22">멤버십 등급 선정 기준안내</h3>
                <div class="tblwrap">
                    <table>
                        <caption>멤버십 등급 선정 기준안내 항복</caption>
                        <colgroup>
                            <col style="width:140px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">반영 시기</th>
                            <td><span class="color-ff5340">매월 3일</span> <br>※ 단, 탑클래스 등급은 연 2회(1월, 7월) 변경 후, 6개월간 등급 유지
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">등급 기준</th>
                            <td>최근 6개월 현대홈쇼핑에서 주문한 <span class="color-ff5340">횟수와 금액</span> 기준</td>
                        </tr>
                        <tr>
                            <th scope="row">대상 고객</th>
                            <td>현대홈쇼핑 모든 회원 <span class="color-ff5340">(H.Point 회원 가입 필수)</span></td>
                        </tr>
                        <tr>
                            <th scope="row">대상 주문</th>
                            <td>
                                현대홈쇼핑에서 주문한 모든 주문 건<br>
                                ※ 인터넷, 모바일, 전화(상담원/ARS), TV 리모콘, 데이터방송 등<br>
                                단, 금융(보험) / 렌탈 / 모바일 쿠폰 등 일부 주문 및 취소 · 반품 건 제외
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">유의사항</th>
                            <td>
                                <ul class="hyphenlist">
                                    <li>등급별 혜택은 H.Point (현대백화점그룹 통합멤버십) 가입 고객에 한해 누리실 수 있습니다.</li>
                                    <li>VIP LOUNGE 이벤트 참여는 마케팅 수신동의 고객에 한해 참여할 수 있습니다.</li>
                                    <li>부당한 방법(대리주문, 상업적 목적의 대량 등)에 의한 참여가 밝혀질 경우, 심사 후 <br>등급 재조정 될 수 있습니다.</li>
                                    <li>등급별 혜택은 당사 사정에 따라 변경될 수 있습니다.</li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <h3 class="title22">멤버십 혜택 이용안내</h3>
                <div class="tblwrap">
                    <table>
                        <caption>멤버십 등급 선정 기준안내 항복</caption>
                        <colgroup>
                            <col style="width:140px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">멤버십 혜택 안내</th>
                            <td>
                                <ul class="hyphenlist">
                                    <li>탑클래스, 다이아몬드 등급 : 매월 3일 혜택 자동 부여 (H.Point 2회차는 16일 부여)</li>
                                    <li>플래티넘, 골드 등급 : 멤버십존에서 혜택 직접 다운로드</li>
                                    <li>탑클래스, 다이아몬드 혜택 직접 다운로드는 4일부터 가능합니다. (플래티넘, 골드는 3일부터 가능)</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">H.Point 지급 혜택</th>
                            <td>
                                <ul class="hyphenlist">
                                    <li>탑클래스, 다이아몬드 등급 회원님께만 드리는 혜택</li>
                                    <li>매월 3일, 16일 총 2회 지급됩니다.</li>
                                    <li>3일 지급된 H.Point 유효기간 : 당월 15일</li>
                                    <li>16일 지급된 H.Point 유효기간 : 익월 2일</li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">결제금액쿠폰 <em>(바로접속 전용)</em></th>
                            <td>
                                <ul class="hyphenlist">
                                    <li>유효기간 : 당월 3일 ~ 익월 2일</li>
                                    <li>Hmall에 바로접속 시에만 사용 가능
                                        <button type="button"
                                                onclick="window.open('https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2049451')"
                                                class="btn btn-linelgray small25"><span>바로접속 자세히 보기</span></button>
                                    </li>
                                    <li>일부 상품은 적용 불가하며, 적용 제외 상품이 포함되면 해당 주문에 적용 불가</li>
                                    <li>주문 취소/반품 시 재부여 불가</li>
                                    <li>최소결제금액 : 5,000원 쿠폰 - 50,000원 / 3,000원 쿠폰 - 30,000원 / 5% 쿠폰 - 1원</li>
                                    <li>최대할인금액 : 5% 쿠폰 - 20,000원</li>
                                </ul>
                            </td>
                        </tr>

                        <tr>
                            <th scope="row">무료배송 쿠폰 <em>(바로접속 전용)</em></th>
                            <td>
                                <ul class="hyphenlist">
                                    <li>유효기간 : 당월 3일 ~ 익월 2일</li>
                                    <li>Hmall 바로접속 시에만 사용 가능
                                        <button type="button"
                                                onclick="window.open('https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2049451')"
                                                class="btn btn-linelgray small25"><span>바로접속 자세히 보기</span></button>
                                    </li>
                                    <li>기본 배송비 포함 상품에 대하여, 주문 건당 1개 사용 가능</li>
                                    <li>일부 상품 적용 불가</li>
                                    <li>주문 취소/반품 시 재부여 불가</li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
</div>
<!-- //.container -->

</main>
<!-- //.cmain -->

</body>
</html>