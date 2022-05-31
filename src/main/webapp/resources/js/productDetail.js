function plusOrdQty(obj, limitCnt) {
    console.log("plusOrdQty")
    var thisIdx = $(obj).parents(".pditem").index();
    var targetObj = $(obj).closest(".count");
    var ordQty = Number($(targetObj).find("input[name=ordQty]").val());
    var orgSlitmCd = "";
    var sellPrc = $("input[name='sellPrc']").val();

    if(dealYn == "Y") {
        limitCnt = $(obj).closest(".pditem").find("input[name=dluMaxBuyQty]").val();
        orgSlitmCd = $(obj).closest(".pditem").find("input[name=slitmCd]").val();
        sellPrc = $(obj).closest(".pditem").find("input[name=uitmSellPrc]").val();
    }

    if(isEmpty(limitCnt)) {
        limitCnt = 99;
    }

    var parentObj = "";
    if($(obj).closest(".product-option-wrap").length > 0) {
        parentObj = $(".product-option-wrap .select-product-list .pditem");
    } else if($(obj).closest(".right-option-area").length > 0) {
        parentObj = $(".right-option-area .select-product-list .pditem");
    } else if($(obj).closest(".option-deal-wrap").length > 0) {
        parentObj = $(".option-deal-wrap .select-product-list .pditem");
    }

    var totalQty = fn_calTotalQty(0, orgSlitmCd, parentObj);
    if(totalQty >= limitCnt) {
        alert("본상품은 " + limitCnt + "개 이상 주문할 수 없습니다.");
        return false;
    }

    var prc = Number(sellPrc) * (ordQty + 1);

    changeQty(obj, prc, ordQty + 1);

    calcSellPrc();
}

/*
 * 수량 변경 공통
 */
function changeQty(obj, prc, ordQty) {
    console.log("changeQty")
    var parentObj = "";
    if($(obj).closest(".product-option-wrap").length > 0) {
        parentObj = $(".product-option-wrap .select-product-list .pditem");
    } else if($(obj).closest(".right-option-area").length > 0) {
        parentObj = $(".right-option-area .select-product-list .pditem");
    } else if($(obj).closest(".option-deal-wrap").length > 0) {
        parentObj = $(".option-deal-wrap .select-product-list .pditem");
    }

    var selIndex = Number($(parentObj).index($(obj).closest(".pditem")));

    var targetObj = $(obj).closest(".count");
    var copyBasketObj = $(targetObj).closest(".pditem");
    $(copyBasketObj).find(".pdprice em").text(gfn_appendComma(prc));
    $(copyBasketObj).find("input[name=ordQty]").val(ordQty + 1);

    $(".product-option-wrap .select-product-list .pditem:eq("+selIndex+")").find(".pdprice em").text(gfn_appendComma(prc));
    $(".right-option-area .select-product-list .pditem:eq("+selIndex+")").find(".pdprice em").text(gfn_appendComma(prc));
    if(dealYn == 'Y') {
        $(".option-deal-wrap .select-product-list .pditem:eq("+selIndex+")").find(".pdprice em").text(gfn_appendComma(prc));
    }
    $(".product-option-wrap .select-product-list .pditem:eq("+selIndex+")").find("input[name=ordQty]").val(ordQty);
    $(".right-option-area .select-product-list .pditem:eq("+selIndex+")").find("input[name=ordQty]").val(ordQty);
    if(dealYn == 'Y') {
        $(".option-deal-wrap .select-product-list .pditem:eq("+selIndex+")").find("input[name=ordQty]").val(ordQty);
    }
}


/*
 * 속성 수량  빼기
 */
function minusOrdQty(obj, limitCnt) {
    var thisAreaIdx = $(obj).data("area-id");
    var thisCssHeader = ".product-option-wrap";
    var otherCssHeader = ".option-scroll";

    if($(obj).closest(".option-scroll").length > 0) {
        thisAreaIdx = "2";
        thisCssHeader = ".option-scroll";
        otherCssHeader = ".product-option-wrap";
    }

    var thisIdx = $(obj).parents(".pditem").index();
    var anotherObj = $(otherCssHeader+" .select-product-list .btn.btn-plus:eq("+thisIdx+")");

    var targetObj = $(obj).closest(".count");
    var ordQty = Number($(targetObj).find("input[name=ordQty]").val());
    var orgSlitmCd = "";
    var sellPrc = $("input[name='sellPrc']").val();

    if(dealYn == "Y") {
        limitCnt = $(obj).closest(".pditem").find("input[name=dluMaxBuyQty]").val();
        orgSlitmCd = $(obj).closest(".pditem").find("input[name=slitmCd]").val();
        sellPrc = $(obj).closest(".pditem").find("input[name=uitmSellPrc]").val();
    }

    if(isEmpty(limitCnt)) {
        limitCnt = 99;
    }

    var parentObj = "";
    if($(obj).closest(".product-option-wrap").length > 0) {
        parentObj = $(".product-option-wrap .select-product-list .pditem");
    } else if($(obj).closest(".right_group").length > 0) {
        parentObj = $("#layer_popup .right_group .selResultInfo .copyBasket");
    } else if($(obj).closest(".left_side").length > 0) {
        parentObj = $(".handiness .left_side .selResultInfo .copyBasket");
    }

    var totalQty = fn_calTotalQty(0, orgSlitmCd, parentObj);

    if(ordQty <= 1) {
        return false;
    }

    var prc = Number(sellPrc) * (ordQty - 1);

    changeQty(obj, prc, ordQty - 1);

    calcSellPrc();
}