<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap display-exhibition exhibition-marketing">
    <main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
        <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
        <div class="container">
            <div class="contents">
                <!-- 동영상 상품 영역 -->
                <div class="pdtype-wrap mov-area" style="background:#ffe816;">
                    <div class="inner-wrap">
                        <div class="tit-area">
                            <h3>[슈퍼H페스타] 히트예감</h3>
                            <img id="btnKakao" class="link-icon kakao" onclick="shareKakao();" src="${contextPath}/resources/img/exhibitions/kakao.png" width="25" height="25" style="float: right"/>
                        </div>

                        <div class="pdlist-wrap pdmov">
                            <div class="hash-txt">
                                <strong>시선 강탈 HIT 상품 </strong>
                                <span class="line" style="background:#ffe816;"></span>
                            </div>
                            <ul class="mov-list ">
                                <c:forEach items="${list}" var="hit" varStatus="status">
                                    <li>
                                        <div class="mov-area">
                                            <a href="javascript:;">
                                                <div class="thumb">
                                                    <div class="mov169">
                                                        <img src="${contextPath}/resources/img/exhibitions/${hit.IMAGE_NAME}.jpg" alt="여에스더 글루타치온 다이렉트 3X 12박스(12개월)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=400x400&amp;AR=0')">
                                                    </div>
                                                    <div class="taglabel card"><span>현대5%</span></div> <!--// [10/27] 뱃지 추가 -->
                                                </div>
                                                <strong class="pdtit">얼굴이 하얗게 변하는 마법같은 순간!</strong>
                                            </a>
                                        </div>
                                        <div class="sub-pdlist">
                                                <ul>
                                                    <li class="pdthumb" onclick="fnGoMove('/p/pda/itemPtc.do?sectId=2477712&amp;slitmCd=2140098197');">
                                                        <a href="javascript:;">
                                                            <div class="thumb">
                                                                <img src="${contextPath}/resources/img/exhibitions/${hit.IMAGE_NAME}.jpg" alt="여에스더 글루타치온 다이렉트 3X 12박스(12개월)" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=400x400&amp;AR=0')">
                                                            </div>
                                                            <div class="figcaption">
                                                                <div class="pdname" aria-label="제품명">${hit.PRODUCT_NAME}</div>
                                                                <div class="pdprice">
                                                                    <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                        <em class="rate" aria-label="할인율">${hit.COUPON_RATIO}<i>%</i></em>
                                                                        <p class="discount" aria-label="할인가"><em><fmt:formatNumber value="${hit.DISCOUNTED_COST}" pattern="#,###"/></em>원</p>
                                                                        <del class="normal" aria-label="정상가"><fmt:formatNumber value="${hit.PRODUCT_COST}" pattern="#,###"/></del>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--// 동영상 상품영역 -->

                <div class="display-list-wrap">
                    <div class="tit-area">
                        <h3></h3>
                    </div>
                </div>
            </div>
            <!-- //.container -->
        </div>
    </main>
</div>
<script>
    function shareKakao() {
        // 사용할 앱의 JavaScript 키 설정
        Kakao.init('caf33407aea23e6cbd7ad732e602b5ad');

        // 카카오링크 버튼 생성
        Kakao.Link.createDefaultButton({
            container: '#btnKakao', // 카카오공유버튼ID
            objectType: 'feed',
            content: {
                title: "[슈퍼H페스타] 히트예감", // 보여질 제목
                description: "시선 강탈 HIT 상품", // 보여질 설명
                imageUrl: "${contextPath}/resources/img/exhibitions/mainImg_3.jpeg", // 콘텐츠 URL
                link: {
                    mobileWebUrl: "http://localhost:8080/exhibition/hit?exhibit_num=3",
                    webUrl: "http://localhost:8080/exhibition/hit?exhibit_num=3"
                }
            }
        });
    }
</script>