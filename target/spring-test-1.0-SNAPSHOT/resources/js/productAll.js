function searchAutoCate(obj, first_category, second_category) {
    $(".autoCate").removeClass("ui-active");
    $(obj).closest("li").addClass("ui-active");

    let search_text = $("#searchKeyword").val();
    let sort = $(".active").attr("sort");

    location.href = `/product/all/?first_category=${first_category}&second_category=${second_category}&sort=${sort}&search_text=${search_text}&page_num=1`
}

function searchSortProc(obj, first_category) {

    let search_text = $("#searchKeyword").val();
    let sort = $(obj).attr("sort");
    let second_category = $(".autoCate.ui-active").val()

    location.href = `/product/all/?first_category=${first_category}&second_category=${second_category}&sort=${sort}&search_text=${search_text}&page_num=1`
}

function search(keyword, first_category, second_category) {
    let sort = $(".active").attr("sort");
    location.href = `/product/all/?first_category=${first_category}&second_category=${second_category}&sort=${sort}&search_text=${keyword}&page_num=1`
}

function initKeyword(keyword, first_category, second_category) {
    let sort = $(".active").attr("sort");
    location.href = `/product/all/?first_category=${first_category}&second_category=${second_category}&sort=${sort}&search_text=&page_num=1`
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
    $.ajax({
        type: "get",
        url: `http://localhost:8080/api/product/${product_seq}`,
        dataType: "json",
        crossDomain: true,
        success: function (data) {
            $(".ui-title").text(data.product_name + " 상세보기")
        }
    })

    // 이미지 확대 모달
    $.ajax({
        type: "get"
        , url: `http://localhost:8080/api/image/?product_seq=${product_seq}`
        , dataType: "json"
        , crossDomain: true
        , success: function (data) {
            if (data.length !== 0) {
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
            } else {
                $(".slick-track").append(
                    `
                        <div class="slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true" style="width: 520px;" tabindex="-1">
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
                        <div class="slick-slide slick-current slick-active" data-slick-index=${index} aria-hidden="true" style="width: 520px;" tabindex="-1">
                                <div>
                                    <div class="item" data-item=""
                                         data-outputsrc="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"
                                         onerror="this.src='https://image.hmall.com/hmall/pd/no_image_600x600.jpg'"
                                         style="width: 100%; display: inline-block; vertical-align: top;">
                                        <a href="javascript:;"
                                           onclick="goGaEvent('상품상세','상단_이미지확대','')"
                                           tabindex="-1"><img
                                                src="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"
                                                alt="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"
                                                onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=520x520&amp;AR=0')"></a>
                                    </div>
                                </div>
                            </div>
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
            }
        }, complete: function () {
        }, error: function (e) {
            console.log("error")
        }
    });


}

function paging(obj, curr_page) {
    let first_category = $(".title30").attr("first_category")
    let second_category = $(".autoCate.ui-active").val()
    let search_text = $("#searchKeyword").val();
    let prev_pageNum = $(".checkedPage").text()
    let curr_pageNum = $(this).text()
    let sort = $(".active").attr("sort");

    $(".checkedPage").replaceWith($('<a id=page' + prev_pageNum + ' onClick=paging(this)' + '>' + prev_pageNum + '</a>'))
    $(obj).replaceWith($('<strong class="checkedPage" id="page"' + curr_pageNum + '>' + obj.innerHTML + '</strong>'));

    $(".pdlist-wrap ul li").remove();

    location.href = `/product/all/?first_category=${first_category}&second_category=${second_category}&sort=${sort}&search_text=${search_text}&page_num=${curr_page}`
}
