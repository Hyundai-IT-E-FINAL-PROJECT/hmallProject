$(document).ready(function() {
    console.log("hello")
    var first_category = $(".title30").attr("first_category")
    console.log(first_category)
    $(".pdlist-wrap ul li").remove();
    $.ajax({
        url: `http://localhost:8080/api/product/all?first_category=${first_category}&second_category=&sort=date`
        , type: "get"
        , dataType: "json"
        , success: function (data) {
            console.log("success")
            console.log(data)
            for (let productVO of data) {
                if (productVO.PRODUCT_COST === productVO.DISCOUNTED_COST) {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">
        
                                    <a href="javascript:;" class="btn btn-like"
                                       data-modules-modal="target:#broadcast-channel-info"
                                       onclick="image_show(${productVO.PRODUCT_SEQ})">
                                        <i class="icon"></i><span class="hiding">찜</span></a>
                                </div>
                            </li>
                        `
                    )
                } else {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                    <a href="javascript:;" class="btn btn-like"
                                               data-modules-modal="target:#broadcast-channel-info"
                                               onclick="image_show(${productVO.PRODUCT_SEQ})">
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
});

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
                if (productVO.PRODUCT_COST === productVO.DISCOUNTED_COST) {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">
        
                                    <a href="javascript:;" class="btn btn-like"
                                       data-modules-modal="target:#broadcast-channel-info"
                                       onclick="image_show(${productVO.PRODUCT_SEQ})">
                                        <i class="icon"></i><span class="hiding">찜</span></a>
                                </div>
                            </li>
                        `
                    )
                } else {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                    <a href="javascript:;" class="btn btn-like"
                                               data-modules-modal="target:#broadcast-channel-info"
                                               onclick="image_show(${productVO.PRODUCT_SEQ})">
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

function searchSortProc(obj, first_category) {
    console.log(obj);
    $(".sortOption .active").removeClass("active")
    $(obj).addClass("active")

    // 변수
    var second_category = $(".autoCate.ui-active").val()
    console.log(second_category)
    if (second_category === 0) {
        second_category = ''
    }
    $(".pdlist-wrap ul li").remove();
    $.ajax({
        url: `http://localhost:8080/api/product/all?first_category=${first_category}&second_category=${second_category}&sort=${$(obj).attr("sort")}`
        , type: "get"
        , dataType: "json"
        , success: function (data) {
            console.log("success")
            console.log(data)
            for (let productVO of data) {
                if (productVO.PRODUCT_COST === productVO.DISCOUNTED_COST) {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">
        
                                    <a href="javascript:;" class="btn btn-like"
                                       data-modules-modal="target:#broadcast-channel-info"
                                       onclick="image_show(${productVO.PRODUCT_SEQ})">
                                        <i class="icon"></i><span class="hiding">찜</span></a>
                                </div>
                            </li>
                        `
                    )
                } else {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                    <a href="javascript:;" class="btn btn-like"
                                               data-modules-modal="target:#broadcast-channel-info"
                                               onclick="image_show(${productVO.PRODUCT_SEQ})">
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

function search(keyword, first_category, second_category, sort) {
    console.log(keyword)
    console.log(first_category)
    console.log(second_category)
    console.log(sort)
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
                                                <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                <b>(${productVO.SELL_COUNT})</b>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                    <a href="javascript:;" class="btn btn-like"
                                       data-modules-modal="target:#broadcast-channel-info"
                                       onclick="image_show(${productVO.PRODUCT_SEQ})">
                                        <i class="icon"></i><span class="hiding">찜</span></a>
                                </div>
                            </li>
                    `
                    )
                } else {
                    $(".pdlist-wrap ul").append(
                        `
                            <li class="pdthumb">
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
                                                        <em>${new Date(productVO.CREATED_AT).format("yyyy-MM-dd")}</em>
                                                        <b>(${productVO.SELL_COUNT})</b>            
                                                    </p>
                                                </div>
                                    </div>
                                </a>
                                <a href="javascript://" onclick="sendSlitmClickNewWin('[2HOT] 윌맥스 잉글랜드 줄리아 면기 20cm','2141512848','검색결과','/p/pda/itemPtc.do?slitmCd=2141512848&amp;overL=nw');" class="hoverview">
                                    <i class="icon"></i>새창열기
                                </a>
                                <div class="alimlike" data-slitmcd="2141512848" data-bsitmcd="2141512848">

                                    <a href="javascript:;" class="btn btn-like"
                                       data-modules-modal="target:#broadcast-channel-info"
                                       onclick="image_show(${productVO.PRODUCT_SEQ})">
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

function image_slide(obj, curPos) {

    // 하이라이팅
    $(".ui-active.ui-active").removeClass("ui-active")
    $(obj).parent("li").addClass("ui-active")

    // 이미지
    $(".slick-track").css('transform', `translateX(${-520 + (curPos * -520)}px)`).css('transition', `all 0.7s ease 0s`)

}

function image_show(product_seq) {
    console.log("image show")
    console.log(product_seq)
    $(".slick-track").empty()
    $(".slider-thumbnaii ul").empty()

    // 이미지 확대 모달
    $.ajax({
        type: "get"
        , url: `http://localhost:8080/api/image/?product_seq=${product_seq}`
        , dataType: "json"
        , crossDomain: true
        , success: function (data) {
            for (const [index, element] of data.entries()) {
                console.log(element)
                if (index === 0) {
                    $(".slick-track").append(
                        `
                            <div class="slick-slide slick-current slick-active" data-slick-index=${index} aria-hidden="true" style="width: 520px;" tabindex="-1">
                                <div>
                                    <div class="item" data-item=""
                                         data-outputsrc="/resources/img/${element.IMAGE_NAME}.jpg"
                                         onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                         style="width: 100%; display: inline-block; vertical-align: top;">
                                        <a href="javascript:;"
                                           onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                           tabindex="-1"><img
                                                src="/resources/img/${element.IMAGE_NAME}.jpg"
                                                alt="/resources/img/${element.IMAGE_NAME}.jpg"
                                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                    </div>
                                </div>
                            </div>
                        `
                    )
                    $(".slider-thumbnaii ul").append(
                        `
                            <li class="ui-thumbnaii ui-active">
                                <a href="javascript:;"
                                   onclick="image_slide(this, ${index});"
                                   draggable="false">
                                    <img src="/resources/img/thumb/${element.IMAGE_NAME}.jpg"
                                         alt="2122712699_0.jpg"
                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=100x100&amp;AR=0')">
                                </a>
                            </li>
                        `
                    )
                } else {
                    $(".slick-track").append(
                        `
                            <div class="slick-slide" data-slick-index="${index}" aria-hidden="true" style="width: 520px;" tabindex="-1">
                                <div>
                                    <div class="item" data-item=""
                                         data-outputsrc="/resources/img/${element.IMAGE_NAME}.jpg"
                                         onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                         style="width: 100%; display: inline-block; vertical-align: top;">
                                        <a href="javascript:;"
                                           onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                           tabindex="-1"><img
                                                src="/resources/img/${element.IMAGE_NAME}.jpg"
                                                alt="/resources/img/${element.IMAGE_NAME}.jpg"
                                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                    </div>
                                </div>
                            </div>
                        `
                    )
                    $(".slider-thumbnaii ul").append(
                        `
                            <li class="ui-thumbnaii">
                                <a href="javascript:;"
                                   onclick="image_slide(this, ${index});"
                                   draggable="false">
                                    <img src="/resources/img/thumb/${element.IMAGE_NAME}.jpg"
                                         alt="2122712699_0.jpg"
                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=100x100&amp;AR=0')">
                                </a>
                            </li>
                        `
                    )
                }
            }
        }, complete: function () {
            $(".slick-track").prepend(
                `
            <div class="slick-slide slick-cloned" data-slick-index="-1"
                                                         aria-hidden="true" style="width: 520px;" tabindex="-1">
                <div>
                    <div class="item" data-item=""
                         data-outputsrc="/resources/img/image_example1.jpg"
                         onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                         style="width: 100%; display: inline-block; vertical-align: top;">
                        <a href="javascript:;"
                           onclick="goGaEvent('상품상세','상단_이미지확대','')"
                           tabindex="-1"><img
                                src="/resources/img/image_example1.jpg"
                                alt="2139858205_4.png"
                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                    </div>
                </div>
            </div>
        `
            )
            $(".slick-track").append(
                `
            <div class="slick-slide slick-cloned" data-slick-index="-1"
                                                         aria-hidden="true" style="width: 520px;" tabindex="-1">
                <div>
                    <div class="item" data-item=""
                         data-outputsrc="/resources/img/image_example1.jpg"
                         onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                         style="width: 100%; display: inline-block; vertical-align: top;">
                        <a href="javascript:;"
                           onclick="goGaEvent('상품상세','상단_이미지확대','')"
                           tabindex="-1"><img
                                src="/resources/img/image_example1.jpg"
                                alt="2139858205_4.png"
                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                    </div>
                </div>
            </div>
        `
            )
        }, error: function (e) {
            console.log("error")
        }
    });


}

