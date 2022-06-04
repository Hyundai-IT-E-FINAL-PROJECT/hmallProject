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