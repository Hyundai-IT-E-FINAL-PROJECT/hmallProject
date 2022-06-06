function searchAutoCate(obj, first_category, second_category) {
    console.log(obj);
    $(".autoCate").removeClass("ui-active");
    $(obj).closest("li").addClass("ui-active");
    console.log(first_category)
    console.log(second_category)
    if (second_category === 0) {
        second_category = ''
    }
    $(".pdlist-wrap ul li").remove();
    $.ajax({
        url: `http://localhost:8080/api/product/all?first_category=${first_category}&second_category=${second_category}`
        , type: "get"
        , dataType: "json"
        , success: function (data) {
            console.log("success")
            console.log(data)
            for (let productVO of data) {
                console.log(productVO)

                if (productVO.PRODUCT_COST === productVO.DISCOUNTED_COST) {
                    $(".pdlist-wrap ul").append(
                        `
                    <li class="pdthumb">
                                        <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->

                                        <a href="/product/detail?product_seq=${productVO.PRODUCT_SEQ}" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141512848&amp;sectId=431541', 'DV0001_U02', 'A');">
                                            <div class="thumb">

                                                <img src="/resources/img/${productVO.IMAGE_NAME}.jpg" alt="[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm" id="2141512848_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="제품명">
                                                        ${productVO.PRODUCT_NAME}
                                                </div>

                                                <div class="pdprice">
                                                            <span class="rateprice" aria-label="정상가 가격">
                                                                <p class="discount" aria-label="정상가"><em>${productVO.PRODUCT_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}</em>원</p>
                                                            </span>
                                                        </div>

                                                <div class="pdinfo">
                                                    <div class="benefits" style="line-height: 20px;">
                                                        <span class="flag hdshop"> <em>적립금</em></span>
                                                        <span>${(productVO.DISCOUNTED_COST * 0.05).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</span>
                                                    </div>
                                                    <p class="like-count">
                                                        <em>4.5점</em>
                                                        <b>(2)</b>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                            <i class="icon"></i>새창열기
                                        </a>
                                        <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                            <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','011870','129084','2141512848', event);">
                                                <i class="icon"></i><span class="hiding">찜</span></a>
                                        </div>
                                    </li>
                    `
                    )
                } else {
                    $(".pdlist-wrap ul").append(
                        `
                    <li class="pdthumb">
                                        <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->

                                        <a href="/product/detail?product_seq=${productVO.PRODUCT_SEQ}" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141512848&amp;sectId=431541', 'DV0001_U02', 'A');">
                                            <div class="thumb">

                                                <img src="/resources/img/${productVO.IMAGE_NAME}.jpg" alt="[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm" id="2141512848_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="제품명">
                                                        ${productVO.PRODUCT_NAME}
                                                </div>

                                                        <div class="pdprice">
                                                            <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                <p class="discount" aria-label="할인가"><em>${productVO.DISCOUNTED_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}</em>원</p>
                                                                <em class="rate" aria-label="할인율">${productVO.COUPON_RATIO}<i>%</i></em>
                                                                <del class="normal" aria-label="정상가">${productVO.PRODUCT_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}</del>
                                                            </span>
                                                        </div>

                                                <div class="pdinfo">
                                                    <div class="benefits" style="line-height: 20px;">
                                                        <span class="flag hdshop"> <em>적립금</em></span>
                                                        <span>${(productVO.DISCOUNTED_COST * 0.05).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</span>
                                                    </div>
                                                    <p class="like-count">
                                                        <em>4.5점</em>
                                                        <b>(2)</b>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                            <i class="icon"></i>새창열기
                                        </a>
                                        <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                            <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','011870','129084','2141512848', event);">
                                                <i class="icon"></i><span class="hiding">찜</span></a>
                                        </div>
                                    </li>
                    `
                    )
                }
            }
        }
        , error: function (e) {
            console.log('error', e);
        }
    });
}

function clickFilter(filter) {
    var filterNm = $(filter).attr("data-filter-nm");
    var filterId = $(filter).prop("id");

    var isChcked = $(filter).is(':checked');
    var isCategory = $(filter).is("[class*=csfCategory]");
    var isNotAllCategory = $(filter).is("#allCate");
    var isPrice = $(filter).is("#priceRangeVal");
    var isBrand = $(filter).is("[name=makecoInfo]");
    var isBrandPopup = $(filter).is("#brndApply");
    var isSelected = isChcked || isCategory || isNotAllCategory || isPrice;

    if (isPrice) { // 가격직접입력
        filterNm = getDirPriceFilterNm();
    }

    if (isBrand) {
        filterId = $(filter).attr("data-filter-id");
    }

    // 브랜드 팝업 적용
    if (isBrandPopup) {
        $(".brands-show").find("input[name='makecoInfo']:checked").each(function () {
            filterNm = $(this).attr("data-filter-nm");
            filterId = $(this).attr("data-filter-id");

            appendSelectedFilter(filterNm, filterId);
        });
    } else if (filterNm != undefined && filterId != undefined) {
        if (isCategory) {
            $("[data-filter-id*='csfCategory']").detach();
        }
        if (isSelected) {
            appendSelectedFilter(filterNm, filterId);
        } else {
            $("[data-filter-id='" + filterId + "']").detach();
        }
    }

    reArrangeFilter();
}

function reArrangeFilter() {

    // 언체크된 필터 제거
    removeUncheckedFilter($(".selected-filter-list .sel"));

    // 선택필터 영역 노출 여부
    let $selectedList = $(".selected-filter-list");
    var len = $selectedList.find(".sel").length;
    if (len > 0) {
        $selectedList.css("display", "flex");
    } else {
        $selectedList.css("display", "none");
    }

    setSimpleFilter();
}

function appendSelectedFilter(filterNm, filterId) {
    if (existsFilter(filterId)) {
        return false;
    }
    $(".selected-filter-list").find("ul").append('<li class="ui-nav sel" data-filter-id="' + filterId + '" data-filter-nm="' + filterNm + '"><span>' + filterNm + ' <button class="del" onclick="uncheckFilter(this);"><span class="hiding">삭제</span></button></span></li>');
}

function existsFilter(filterId) {
    try {
        return $(".selected-filter-list").find('[data-filter-id="' + filterId + '"]').length > 0;
    } catch (e) {

    }
    return false;
}

function removeUncheckedFilter(filterList) {
    $(filterList).each(function () {
        var filterId = $(this).attr("data-filter-id");
        if (filterId == undefined) {
            $(this).detach();
            return true;
            // 카테고리
        } else if (filterId.indexOf("csfCategory") >= 0) {
            return true;
            // 가격직접입력
        } else if (filterId.indexOf("priceRangeVal") >= 0) {
            if (getDirPriceFilterNm() == undefined) {
                $(this).detach();
            }
            return true;
            // 브랜드
        } else if (filterId.indexOf("brnd") >= 0) {
            if (!isCheckedBrnd(filterId)) {
                $(this).detach();
            }
            return true;
        }
        // 체크여부
        var isChecked = $("#" + filterId).prop("checked");
        if (!isChecked) {
            $(this).detach();
        }
    });
}

function setSimpleFilter() {
    // 선택필터 영역 세션에 저장
    if ($(".selected-filter-list").css("display") != "none") {
        var simpleFilter = $(".selected-filter-list").html();
        sessionStorage.setItem("selected-filter-list", saveHtmlDataEdit(simpleFilter));
    } else {
        sessionStorage.removeItem("selected-filter-list");
    }
}

function search(keyword, first_category, second_category) {
    console.log(keyword)
    console.log(first_category)
    console.log(second_category)
    if (second_category === 0) {
        second_category = ''
    }
    $(".pdlist-wrap ul li").remove();
    $.ajax({
        url: `http://localhost:8080/api/product/all?first_category=${first_category}&second_category=${second_category}&search_text=${String(keyword)}`
        , type: "get"
        , dataType: "json"
        , success: function (data) {
            console.log("success")
            console.log(data)
            for (let productVO of data) {
                console.log(productVO)

                if (productVO.PRODUCT_COST === productVO.DISCOUNTED_COST) {
                    $(".pdlist-wrap ul").append(
                        `
                    <li class="pdthumb">
                                        <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->

                                        <a href="/product/detail?product_seq=${productVO.PRODUCT_SEQ}" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141512848&amp;sectId=431541', 'DV0001_U02', 'A');">
                                            <div class="thumb">

                                                <img src="/resources/img/${productVO.IMAGE_NAME}.jpg" alt="[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm" id="2141512848_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="제품명">
                                                        ${productVO.PRODUCT_NAME}
                                                </div>

                                                <div class="pdprice">
                                                            <span class="rateprice" aria-label="정상가 가격">
                                                                <p class="discount" aria-label="정상가"><em>${productVO.PRODUCT_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}</em>원</p>
                                                            </span>
                                                        </div>
                                                <div class="pdinfo">
                                                    <div class="benefits" style="line-height: 20px;">
                                                        <span class="flag hdshop"> <em>적립금</em></span>
                                                        <span>${(productVO.DISCOUNTED_COST * 0.05).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</span>
                                                    </div>
                                                    <p class="like-count">
                                                        <em>4.5점</em>
                                                        <b>(2)</b>
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                        <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                            <i class="icon"></i>새창열기
                                        </a>
                                        <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                            <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','011870','129084','2141512848', event);">
                                                <i class="icon"></i><span class="hiding">찜</span></a>
                                        </div>
                                    </li>
                    `
                    )
                } else {
                    $(".pdlist-wrap ul").append(
                        `
                    <li class="pdthumb">
                                        <!-- 2020.11.26 icj 가중치 weightYn 옵션시에 이미지 위에 상품코드 노출, a 태그로 이동하지 않도록 밖으로 배치 -->

                                        <a href="/product/detail?product_seq=${productVO.PRODUCT_SEQ}" onclick="itemDetailLinkProc('/p/pda/itemPtc.do?slitmCd=2141512848&amp;sectId=431541', 'DV0001_U02', 'A');">
                                            <div class="thumb">

                                                <img src="/resources/img/${productVO.IMAGE_NAME}.jpg" alt="[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm" id="2141512848_img" onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">
                                            </div>
                                            <div class="figcaption">
                                                <div class="pdname" aria-label="제품명">
                                                        ${productVO.PRODUCT_NAME}
                                                </div>

                                                        <div class="pdprice">
                                                            <span class="rateprice" aria-label="할인율이 적용된 가격">
                                                                <p class="discount" aria-label="할인가"><em>${productVO.DISCOUNTED_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}</em>원</p>
                                                                <em class="rate" aria-label="할인율">${productVO.COUPON_RATIO}<i>%</i></em>
                                                                <del class="normal" aria-label="정상가">${productVO.PRODUCT_COST.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}</del>
                                                            </span>
                                                        </div>

                                                        <div class="pdinfo">
                                                            <div class="benefits" style="line-height: 20px;">
                                                                <span class="flag hdshop"> <em>적립금</em></span>
                                                                <span>${(productVO.DISCOUNTED_COST * 0.05).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')}원</span>
                                                            </div>
                                                            <p class="like-count">
                                                                <em>4.5점</em>
                                                                <b>(2)</b>
                                                            </p>
                                                        </div>
                                            </div>
                                        </a>
                                        <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                            <i class="icon"></i>새창열기
                                        </a>
                                        <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                            <a href="javascript:;" class="btn btn-like" onclick="javascript:goChioceProcess('00','011870','129084','2141512848', event);">
                                                <i class="icon"></i><span class="hiding">찜</span></a>
                                        </div>
                                    </li>
                    `
                    )
                }
            }
        }
        , error: function (e) {
            console.log('error', e);
        }
    });
}

function image_show(productVO) {
    // 이미지 확대 모달
    $.ajax({
        type: "get"
        , url: "http://localhost:8080/category/"
        , dataType: "json"
        , crossDomain: true
        , success: function (data) {

        }, complete: function () {

        }, error: function (e) {
            //cors 오류 시 기존 ajax 타도록 수정
            console.log("error")
        }
    });
}