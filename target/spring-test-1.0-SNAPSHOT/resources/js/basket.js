$(function sayHello() {
    console.log("basket js!")
})

function check(obj, gbcd, slitmCd, uitmCd) {
    var checkFlag = $(obj).prop("checked");
    var checkCount = 0;

    // 품절은 구매가능한 상품과는 별도로 처리.
    if ( gbcd == "soldout" ) {
        if ( slitmCd == "all" ) {
            $("input[name=soldOutSlitm]").each(function() {
                $(this).prop("checked", checkFlag);
                if ( $(this).prop("checked") ) {
                    checkCount++;
                }
            });

            // 현재 all을 제외한 all을 해제한다.
            $("input[name=all]").not($(obj)).each(function() {
                $(this).prop("checked", false);
                $(this).parents("div.cart-check").find("span.cart-count strong").html("0");
            });

            // basktInf전체 선택 해제.
            $("input[name=basktInf]").each(function() {
                $(this).prop("checked", false);
            });

        } else {
            var allFlag = true;
            $("input[name=soldOutSlitm]").each(function() {
                if ( !$(this).prop("checked") ){
                    allFlag = false;
                } else {
                    checkCount++;
                }
            });

            // 현재 all을 제외한 all을 해제한다.
            $("input[name=all]").not($(obj)).each(function() {
                $(this).prop("checked", false);
                $(this).parents("div.cart-check").find("span.cart-count strong").html("0");
            });

            // basktInf전체 선택 해제.
            $("input[name=basktInf]").each(function() {
                $(this).prop("checked", false);
            });

            $("input[name=soldout_all]").prop("checked", allFlag);
        }
        $("#soldoutSelectCount").html(checkCount);

    } else if ( slitmCd == "all" ) { // 전체선택!
        // 현재 all을 제외한 all을 해제한다.
        $("input[name=all]").not($(obj)).each(function() {
            $(this).prop("checked", false);
            $(this).parents("div.cart-check").find("span.cart-count strong").html("0");
        });

        // basktInf전체 선택 해제.
        $("input[name=basktInf]").each(function() {
            $(this).prop("checked", false);
        });

        // 품절/판매 종료된 상품의 all을 해제한다.
        $("input[name=soldout_all]").not($(obj)).each(function() {
            $(this).prop("checked", false);
            $(this).parents("div.cart-check").find("span.cart-count strong").html("0");
        });

        // soldOutSlitm전체 선택 해제.
        $("input[name=soldOutSlitm]").each(function() {
            $(this).prop("checked", false);
        });

        // 선택된거면... 그 아래를 선택한다.
        if ( checkFlag ) {
            $("div#"+gbcd+" input[name=basktInf]").each(function() {
                if ( $(this).parent().parent().parent().css("display") == "block" ) {
                    $(this).prop("checked", true);
                    checkCount++;
                }
            });
        }
        $(obj).parents("div.shipping-listwrap").find("span.cart-count strong").html(checkCount);
    } else {
        // * 상품이 선택된경우 all에 체크된것을 해제/선택 한다.

        // 모든 all을 체크 해제.
        // - 선택된 상품 그룹과 다른 all 아래 상품의 체크를 해제한다.
        var selGrpId = $(obj).parents("div.shipping-list").prop("id");
        $(".shipping-listwrap").not("#soldout").each(function() {

            $(this).find("input[name=all]").prop("checked", false);
            if ( selGrpId != $(this).find("div.shipping-list").prop("id") ) {
                $(this).find("input[name=basktInf]").prop("checked", false);
            }
            $(this).find("span.cart-count strong").html("0");
        });

        // 품절/판매 종료된 상품의 all을 해제한다.
        $("input[name=soldout_all]").not($(obj)).each(function() {
            $(this).prop("checked", false);
            $(this).parents("div.cart-check").find("span.cart-count strong").html("0");
        });
        // soldOutSlitm전체 선택 해제.
        $("input[name=soldOutSlitm]").each(function() {
            $(this).prop("checked", false);
        });

        // 해당 상품과 같이 묶인 상품의 갯수와 체크된 갯수 확인.
        // 두개가 같으면 all 체크.
        var allFlag = true;
        if ( $(obj).parents("div.shipping-list").prop("id") == "gen" ) {
            $(obj).parents("div.shipping-listwrap").find("input[name=basktInf]").each(function() {
                if ( $(this).parents(".pdwrap").attr("style").indexOf("none") < 0 ) {
                    if ( !$(this).prop("checked") ) {
                        allFlag = false;
                    } else {
                        checkCount++;
                    }
                }
            });
            $(obj).parents("div.shipping-listwrap").find("input[name=all]").prop("checked", allFlag);
        } else if ( $(obj).parents("div.shipping-list").prop("id") == "20" ) {
            $(obj).parents("div.shipping-listwrap").find("input[name=basktInf]").each(function() {
                if ( $(this).parents(".pdwrap").attr("style").indexOf("none") < 0 ) {
                    if ( !$(this).prop("checked") ) {
                        allFlag = false;
                    } else {
                        checkCount++;
                    }
                }
            });
            $(obj).parents("div.shipping-listwrap").find("input[name=all]").prop("checked", allFlag);
        }else {
            $(obj).parents("div.shipping-list").find("input[name=basktInf]").each(function() {
                if ( $(this).parents(".pdwrap").attr("style").indexOf("none") < 0 ) {
                    if ( !$(this).prop("checked") ) {
                        allFlag = false;
                    } else {
                        checkCount++;
                    }
                }
            });
            $(obj).parents("div.shipping-list").prev().find("input[name=all]").prop("checked", allFlag);
        }
        $(obj).parents("div.shipping-listwrap").find("span.cart-count strong").html(checkCount);
    }


    var CombinegiftOrderYn = "N";
    var checkedCnt = 0;
    var notDlvCostFreeCnt = 0;
    var giftCnt = 0;
    $("input[name=basktTotalGiftOrderYn]").each(function() {
        console.log("each " + giftCnt);
        var checked = $(this).siblings(".checkbox").find("input[name=basktInf]").prop("checked");
        if(checked){
            if(checked){
                if(checked){
                    checkedCnt++;
                    if($(this).siblings("input[name='basktGiftOrderYn']").val()=="Y"){
                        giftCnt++
                    }
                    if($(this).val() == "N"){
                        notDlvCostFreeCnt++
                    }
                }
            }
        }
    });

    if(giftCnt != 0 && checkedCnt == giftCnt){
        CombinegiftOrderYn = "Y";
        if(notDlvCostFreeCnt > 0){
            CombinegiftOrderYn = "N";

            if(giftCnt == 1 && notDlvCostFreeCnt == 1){
                CombinegiftOrderYn = "Y";
            }
        }
    }

    if ( CombinegiftOrderYn == "Y") {
        $("div#uobtnprsnbox").show();
        $("div#uobtnbox").hide();
    }
    else{
        $("div#uobtnprsnbox").hide();
        $("div#uobtnbox").show();
    }

    // 선택된 것의 금액계산.
    calculateSelect();
}

function calculateSelect() {
    // 초기값.
    var selCnt = 0;
    var selSlitmAmt = 0;
    var selDlvAmt = 0;
    var selOrdAmt = 0;
    var basktVenCdGatherVal = "";

    // ||||
    $("input[name=basktInf]").each(function() {
        if ( $(this).prop("checked") ) {
            var basktInfArr = $(this).val().split("|");
            console.log("basktInfArr")
            console.log(basktInfArr)

            selCnt++;
            selSlitmAmt += (basktInfArr[3]*basktInfArr[4]);
        }
    });

    selDlvAmt += parseInt(calculateSelectDlvAmt());

    // 우측 윙 set
    $("#selCnt").html(gfn_appendComma(selCnt));
    $("#selSlitmAmt").html(gfn_appendComma(selSlitmAmt));
    $("#selDlvAmt").html(gfn_appendComma(selDlvAmt));
    $("#selOrdAmt").html(gfn_appendComma(selSlitmAmt + selDlvAmt));
    $("#selCnt_btn").html(gfn_appendComma(selCnt));
}

function calculateSelectDlvAmt() {

    var dlvAmtSum = 0;
    var basktVenCdGatherVals = "";

    $("input[name=basktInf]").each(function() {
        if ( $(this).prop("checked") ) {
            var basktVenCdGatherVal = $(this).parents(".pdwrap").find("input[name=basktVenCdGatherVal]").val();
            var dlvAmt = $(this).parents(".pdwrap").find("input[name=basktDlvCostVal]").val();
            $("input[name=basktInf]:checked").each(function() {
                var tempDlvAmt = $(this).parents(".pdwrap").find("input[name=basktDlvCostVal]").val();
                if ( basktVenCdGatherVal == $(this).parents(".pdwrap").find("input[name=basktVenCdGatherVal]").val()
                    && tempDlvAmt > dlvAmt) {
                    dlvAmt = tempDlvAmt;
                }
            });

            if ( $(this).parents(".pdwrap").find("input[name=dlvcPayGbcdVal]").val() == "20" || $(this).parents(".pdwrap").find("input[name=dlvcPayGbcdVal]").val() == "30" ) {
                dlvAmt = 0;
            }

            var sumAmt = 0;
            var bsicAmt = $(this).parents(".pdwrap").find("input[name=bsicAmt]").val();
            if ( basktVenCdGatherVals.indexOf(basktVenCdGatherVal) < 0 ) {
                $("input[name=basktInf]").each(function() {
                    var dlvcGatherVal = $(this).parents(".pdwrap").find("input[name=basktVenCdGatherVal]").val();
                    if ( $(this).prop("checked") && basktVenCdGatherVal == dlvcGatherVal ) {
                        var basktInfArr = $(this).val().split("|");

                        sumAmt += (basktInfArr[3]*basktInfArr[4]);
                    }
                });

                if ( sumAmt < bsicAmt ) {
                    dlvAmtSum += parseInt(dlvAmt);
                    basktVenCdGatherVals += "_" + basktVenCdGatherVal;
                }
            }
        }
    });

    return dlvAmtSum;
}

function deleteBasktItem(obj) {
    var selFlag = false;
    $(obj).parents(".shipping-listwrap").find("input[name='basktInf']:checked").each(function(){
        if ( $(this).parents(".pdwrap").attr("style").indexOf("none") < 0 ) {
            selFlag = true;
            return false;
        }
    });

    if ( !selFlag ) {
        alert("상품을 선택해주세요.");
        return;
    } else if ( !confirm("선택하신 상품을 삭제하시겠습니까?") ) {
        return;
    }

    $("form[name=deleteForm]").html("");

    $(obj).parents(".shipping-listwrap").find("input[name='basktInf']:checked").each(function(){
        if ( $(this).parents(".pdwrap").attr("style").indexOf("none") < 0 ) {
            $("#deleteForm").append($(this).clone());
        }
    });
    deleteBaskt();
}