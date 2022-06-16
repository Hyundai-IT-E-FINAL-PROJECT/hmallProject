<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: gimjihye
  Date: 2022/06/15
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<sec:authentication property="principal" var="pinfo" />
<html>
<head>
    <title>리뷰 작성</title>
</head>
<body>
<div class="popup-win wd540 review-write">
    <input type="hidden" name="slitmCd" value="2137807436">
    <input type="hidden" name="itemLCsfCd" value="S5">
    <!--  <input type="hidden" id="itemEvalAtclNo" name="pDCItemEvalAtclVO.itemEvalAtclNo" value="0"/>  -->
    <input type="hidden" name="pDCItemEvalAtclVO.ordNo" value="20220513295854">
    <input type="hidden" name="pDCItemEvalVO.ordNo" value="20220513295854">
    <input type="hidden" name="pDCItemEvalAtclVO.uitmCd" value="00008">
    <input type="hidden" name="pDCItemEvalAtclVO.venCd" value="013817">
    <input type="hidden" name="pDCItemEvalAtclVO.slitmCd" value="2137807436">
    <input type="hidden" name="itemEvalTypeGbcd">
    <input type="hidden" id="qaYn" value="N">
    <input type="hidden" id="qnaYn" value="N">

    <input type="hidden" name="pDCItemEvalAtclVO.itemEvalSavePath" value="">
    <input type="hidden" name="itemEvalAtclNo" value="48122178045219">
    <input type="hidden" name="wrtItntId" value="alstn2631">
    <!--
      <input type="hidden" name="slitmCd" value="2137807436"/>
      <input type="hidden" name="uitmCd" value="00008"/>
      <input type="hidden" name="itemEvalTitl" value=""/>
      <input type="hidden" name="itemEvalCntn" value=""/>
     -->

    <input type="hidden" name="pDCItemEvalAtclVO.itemEvalTitl">
    <input type="hidden" name="pDCItemEvalAtclVO.itemEvalCntn">

    <input type="hidden" id="itemEvalAvgScrg" name="pDCItemEvalAtclVO.itemEvalAvgScrg" value="5">

    <input type="hidden" name="attach_image" id="hiddenImg1">
    <input type="hidden" name="attach_image" id="hiddenImg2">
    <input type="hidden" name="attach_image" id="hiddenImg3">
    <input type="hidden" name="attach_image" id="hiddenImg4">
    <input type="hidden" name="modify_image" id="hiddenModifyImg1" value="I,0">
    <input type="hidden" name="modify_image" id="hiddenModifyImg2" value="I,0">
    <input type="hidden" name="modify_image" id="hiddenModifyImg3" value="I,0">
    <input type="hidden" name="modify_image" id="hiddenModifyImg4" value="I,0">


    <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg1" value='꼼꼼해요'>
    <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg2" value='빨라요'>
    <input type="hidden" name="itemEvalScrg" id="hdnItemEvalScrg3" value='만족해요'>

    <input type="hidden" name="pDCItemEvalAtclVO.uitmPtcDescExpsYn" value="">

    <input type="hidden" name="pDCItemEvalAtclVO.svmtBsicAmt" id="svmtBsicAmt" value="5000">
    <!--pop-wrap-->
    <div class="pop-wrap" tabindex="0" style="width: 1081px; margin: 0 auto 80px;">
        <!--pop-content-wrap-->
        <div class="pop-content-wrap">
            <strong class="pop-title">상품평 쓰기</strong>
            <!--pop-content-->
            <div class="pop-content">
                <div class="content">
                    <div class="pd-list">
                        <figure>
                            <div class="thumb">
                                <a href="javascript:;">
                                    <img src="/resources/img/${productVO.image_name}.jpg"
                                         onerror="noImage(this, 'https://image.hmall.com/hmall/pd/no_image_600x600.jpg')">
                                </a>
                            </div>
                            <figcaption>
                                <a href="${contextPath}/product/detail?product_seq=${productVO.product_seq}&page_num=1">
                                    <div class="pdname" aria-label="제품명">${productVO.product_name}</div>
                                </a>
                            </figcaption>
                        </figure>
                    </div>

                    <h3 class="ctypo17 inline-block">별점</h3>
                    <div class="star-score-box">
                              <span class="star-ratingwrap" data-modules-starrating="">
                                  <a href="#" id="starRate1" onclick="setStarRate(1)" class="star ui-active"><strong>아쉬워요</strong></a>
                                  <a href="#" id="starRate2" onclick="setStarRate(2)" class="star ui-active"><strong>보통이에요</strong></a>
                                  <a href="#" id="starRate3" onclick="setStarRate(3)" class="star ui-active"><strong>괜찮아요</strong></a>
                                  <a href="#" id="starRate4" onclick="setStarRate(4)"
                                     class="star ui-active"><strong>좋아요</strong></a>
                                  <a href="#" id="starRate5" onclick="setStarRate(5)"
                                     class="star ui-active fix"><strong>아주 좋아요</strong></a>
                              </span>
                    </div>


                    <h3 class="ctypo17">만족도</h3>
                    <dl class="dlwrap">

                        <dt>포장상태</dt>
                        <dd>
                            <div class="radio-box">
                                              <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,1);" name="26;42"
                                                         data="26;42;5" checked="" aria-checked="true" id="rad-2642"
                                                         class="on">
                                                  <label for="rad-2642" class="sm50"><span
                                                          class="text">꼼꼼해요</span></label>
                                              </span>
                                <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,1);" name="26;42"
                                                         data="26;15;3" aria-checked="false" id="rad-2615">
                                                  <label for="rad-2615" class="sm50"><span
                                                          class="text">보통이에요</span></label>
                                              </span>
                                <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,1);" name="26;42"
                                                         data="26;49;1" aria-checked="false" id="rad-2649">
                                                  <label for="rad-2649" class="sm50"><span
                                                          class="text">별로예요</span></label>
                                              </span>
                            </div>
                        </dd>

                        <dt>배송상태</dt>
                        <dd>
                            <div class="radio-box">
                                              <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,2);" name="25;43"
                                                         data="25;43;5" checked="" aria-checked="true" id="rad-2543"
                                                         class="on">
                                                  <label for="rad-2543" class="sm50"><span
                                                          class="text">빨라요</span></label>
                                              </span>
                                <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,2);" name="25;43"
                                                         data="25;15;3" aria-checked="false" id="rad-2515">
                                                  <label for="rad-2515" class="sm50"><span
                                                          class="text">보통이에요</span></label>
                                              </span>
                                <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,2);" name="25;43"
                                                         data="25;53;1" aria-checked="false" id="rad-2553">
                                                  <label for="rad-2553" class="sm50"><span
                                                          class="text">늦어요</span></label>
                                              </span>
                            </div>
                        </dd>

                        <dt>제품상태</dt>
                        <dd>
                            <div class="radio-box">
                                              <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,3);" name="17;31"
                                                         data="17;31;5" checked="" aria-checked="true" id="rad-1731"
                                                         class="on">
                                                  <label for="rad-1731" class="sm50"><span
                                                          class="text">만족해요</span></label>
                                              </span>
                                <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,3);" name="17;31"
                                                         data="17;46;3" aria-checked="false" id="rad-1746">
                                                  <label for="rad-1746" class="sm50"><span
                                                          class="text">보통이에요</span></label>
                                              </span>
                                <span>
                                                  <input type="radio" onclick="setItemEvalCsf(this,3);" name="17;31"
                                                         data="17;33;1" aria-checked="false" id="rad-1733">
                                                  <label for="rad-1733" class="sm50"><span
                                                          class="text">별로예요</span></label>
                                              </span>
                            </div>
                        </dd>

                    </dl>


                    <div class="bg-gray-box">
                        <h4 class="ctypo15">확인해주세요</h4>
                        <!-- [12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) -->
                        <ul class="dotlist">
                            <li>작성하신 상품평은 현대Hmall에 귀속됩니다.</li>

                            <!-- <li>과장이나 욕설 등 운영원칙에 어긋난 상품평은 통보 없이 삭제될 수 있습니다.</li> -->
                        </ul>
                        <!-- //[12/15]_수정(위키 383 내용 - 문구 추가 및 버튼 추가로 인한 레이어 팝업 생성) -->

                        <h4 class="ctypo15">상품평 작성 혜택</h4>


                        <h3 class="ctypo15">지급기준</h3>
                        <ul class="dotlist">
                            <li>구매일로부터 60일 이내 작성된 상품평·동일 상품 여러 번 주문 시, 상품 기준 1회 부여</li>
                            <li><strong>'SPC삼립 돌아온 포켓몬빵 8종 10봉 랜덤배송 (피카츄/푸린/파이리/로켓단/디그다/꼬부기/고오스/발챙이)'</strong>는 최저 구매금액
                                <strong>5,000</strong>원 이상 구매 시 작성 혜택이 지급됩니다.
                            </li>
                            <li>H.Point는 상품평 최초 등록 시점에 자동 부여되며, 수정 시 추가 H.Point가 부여되지 않습니다.</li>
                            <li>식품/의료기기 및 일부 상품의 경우 고객만족도 평가만 가능하며, 평가 시 H.Point 10P가 부여됩니다.</li>
                        </ul>


                    </div>

                    <div class="btngroup">
                        <button class="btn btn-linelgray medium" onclick="window.close()"><span>취소</span></button>
                        <button class="btn btn-default medium" onclick="javascript:review_submit();"><span>저장</span>
                        </button>
                    </div>
                    <script>
                        function review_submit() {
                            const csrfHeaderName = "${_csrf.headerName}";
                            const csrfTokenValue = "${_csrf.token}";

                            let user_seq = ${pinfo.userVO.no};
                            let product_seq = ${productVO.product_seq};
                            let reply_package = $("#hdnItemEvalScrg1").val();
                            let reply_post = $("#hdnItemEvalScrg2").val();
                            let reply_satis = $("#hdnItemEvalScrg3").val();
                            let star = $(".star.ui-active").length;

                            $.ajax({
                                type		: "POST",
                                url 		: "/reply/",
                                data		:  JSON.stringify({
                                                    user_seq: user_seq,
                                                    product_seq: product_seq,
                                                    reply_package: reply_package,
                                                    reply_post: reply_post,
                                                    reply_satis: reply_satis,
                                                    star: star
                                                }),
                                contentType : "application/json",
                                beforeSend: function(xhr) {
                                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
                                },
                                success 	: function(data) {
                                    alert("상품 만족도 평가를 완료하였습니다.")
                                    window.location.href='/product/detail?product_seq=${productVO.product_seq}&page_num=1'
                                },
                                error		: function(error) {
                                    console.log(error);
                                }
                            });
                        }
                    </script>
                </div>
            </div>
            <!--//pop-content-->
        </div>
        <!--//pop-content-wrap-->
    </div>
    <!--//pop-wrap-->
</div>
</body>
<script>
    function setItemEvalCsf(obj, i) {
        if (i == 1) {
            $("#hdnItemEvalScrg1").val($(obj).parent().children("label").children("span").text());
        } else if (i == 2) {
            $("#hdnItemEvalScrg2").val($(obj).parent().children("label").children("span").text());
        } else if (i == 3) {
            $("#hdnItemEvalScrg3").val($(obj).parent().children("label").children("span").text());
        }
    }
</script>
</html>
