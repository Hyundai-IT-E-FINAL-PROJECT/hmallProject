const IMAGE_WIDTH = 640;
/*
 * 속성 수량  더하기
 */
function plusOrdQty() {
    let ordQtyObj = $("input[name=ordQty]");
    let ordQty = Number(ordQtyObj.val());
    let sellPrc = Number(removeComma($(".product-discount").text()));
    ordQty += 1

    $(".sum-price .total-price strong").text(gfn_appendComma(sellPrc * ordQty));
    $(".total-wrap .total-price ins em").text(gfn_appendComma(sellPrc * ordQty));
    $(".sum-price").show();

    ordQtyObj.val(ordQty);
}

/*
 * 속성 수량  빼기
 */
function minusOrdQty() {
    let ordQtyObj = $("input[name=ordQty]");
    let ordQty = Number(ordQtyObj.val());
    let sellPrc = Number(removeComma($(".product-discount").text()));
    ordQty -= 1

    $(".sum-price .total-price strong").text(gfn_appendComma(sellPrc * ordQty));
    $(".total-wrap .total-price ins em").text(gfn_appendComma(sellPrc * ordQty));
    $(".sum-price").show();

    ordQtyObj.val(ordQty);
}

function image_slide(obj, curPos){

    // 하이라이팅
    $(".ui-active.ui-active").removeClass("ui-active")
    $(obj).parent("li").addClass("ui-active")

    // default 이미지
    $(".slick-current").removeClass("slick-active")
    $(".slick-current").removeClass("slick-current")
    $(`.slick-slide[data-slick-index=${curPos}]`).addClass("slick-active")
    $(`.slick-slide[data-slick-index=${curPos}]`).addClass("slick-current")

    // 이미지
    $(".slick-track").css('transform', `translateX(${-520 + (curPos * -520)}px)`).css('transition', `all 0.7s ease 0s`)

}