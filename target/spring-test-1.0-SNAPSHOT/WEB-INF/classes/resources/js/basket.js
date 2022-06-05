$(function sayHello() {
    calculateSelect();
})

function check(obj, gbcd, slitmCd, uitmCd) {
    var checkFlag = $(obj).prop("checked");
    var checkCount = 0;
    console.log(obj);

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

    // ||||
    $("input[name=basktInf]").each(function() {
        if ( $(this).prop("checked") ) {
            var basktInfArr = $(this).val().split("|");
            console.log(basktInfArr)
            console.log("basktInfArr")
            console.log(basktInfArr)

            selCnt++;
            selSlitmAmt += (basktInfArr[3]*basktInfArr[4]);
        }
    });

    selDlvAmt += parseInt(calculateSelectDlvAmt());

    console.log("$$$")
    console.log(selCnt)

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

function showChgUitmPup(obj, slitmCd, uitmCd, aspItemCd, sellPrc, uitmCombYn) {

    $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).html("");

    if ( $("#optBtn_"+slitmCd+"_"+uitmCd).hasClass("selected") ) {
        //$("#chgUitmLayer_"+slitmCd+"_"+uitmCd).toggleClass("selected");
        return;
    }

    //$("#dlUitmArea, #dlAddCmpsArea, #divSelectedUitmArea").html("");
    $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).append('<input type="hidden" name="slitmCd" value="' + slitmCd + '"/>');
    $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).append('<input type="hidden" name="uitmCd" value="' + uitmCd + '"/>');
    loading(true);
    $.ajax({
        type: "post"
        , url: "/p/odb/getBakstItemUitmInf.do"
        , dataType: "html"
        , data : {slitmCd : slitmCd, uitmCd : uitmCd, uitmCombYn : uitmCombYn}
        , success : function(data) {
            if(!isEmpty(data.errorMessages)) {
                loading(false);
                alert(data.errorMessages.join("\n"));
            } else {
                $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).html(data);
                loading(false);
                /*
                                var optionCnt = 0;
                                var dlUitmArea = $("#chgUitmLayer_"+slitmCd+"_"+uitmCd);
                                var selectbox = $('<div class="selectbox"></div>');

                                $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).append('<input type="hidden" name="uitmSellPrc" value="' + sellPrc +'"/>');
                                if(data.uitmAttrTypeList != null && data.uitmAttrTypeList.uitmAttrMstList.length > 0) {
                                    $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).append('<input type="hidden" name="bsitmCd" value="' + data.uitmAttrTypeList[0].bsitmCd +'"/>');

                                    for(var i in data.uitmAttrTypeList) {
                                        var label = $('<label class="sellabel"></label>');

                                        var select = $("<select onchange='changeUitm(this);'></select>");
                                        $(select).append('<option value="">선택하세요</option>');

                                        for(var j in data.uitmAttrTypeList[i].uitmAttrMstList) {
                                            $(select).append('<option value="' + data.uitmAttrTypeList[i].uitmAttrMstList[j].uitmSeq + '">' + data.uitmAttrTypeList[i].uitmAttrMstList[j].uitmAttrNm + '</option>');
                                        }

                                        $(label).append(select);
                                        $(selectbox).append(label);
                                    }
                                    $(dlUitmArea).append(selectbox);
                                }

                                if(data.bsicUitmList != null && data.bsicUitmList.length > 1) {
                                    var label = $('<label class="sellabel"></label>');
                                    var select = $("<select id='uitmSelect' onchange='changeUitmCd(\""+slitmCd+"\", \""+uitmCd+"\");'></select>");
                                    $(select).append('<option value="">선택하세요</option>');

                                    for(var i in data.bsicUitmList) {
                                        $(select).append('<option value="' + data.bsicUitmList[i].uitmCd + '">' + data.bsicUitmList[i].uitmTotNm + '</option>');
                                        optionCnt += 1;
                                    }

                                    $(label).append(select);
                                    $(selectbox).append(label);
                                    $(dlUitmArea).append(selectbox);
                                }
                                ///*
                                // 기본구성
                                if(data.baseSlitmCmpsMstList != null && data.baseSlitmCmpsMstList.length > 0) {
                                    for(var i in data.baseSlitmCmpsMstList) {
                                        $(dlUitmArea).append('<dt>' + data.baseSlitmCmpsMstList[i].cmpsNm + '</dt>');

                                        var dd = $("<dd></dd>");
                                        var select = $("<select class='cu_select w260 baseCmpsSelect' onchange='changeBaseCmps(this);'></select>");
                                        $(select).append('<option value="">선택하세요</option>');

                                        for(var j in data.baseSlitmCmpsMstList[i].slitmCmpsDtlList) {
                                            $(select).append('<option value="' + data.baseSlitmCmpsMstList[i].slitmCmpsDtlList[j].cmpsSeq + '|' + data.baseSlitmCmpsMstList[i].slitmCmpsDtlList[j].cmpsItemSeq + '">' + data.baseSlitmCmpsMstList[i].slitmCmpsDtlList[j].cmpsItemDispNm + '</option>');
                                        }

                                        $(dd).append(select);
                                        $(dlUitmArea).append(dd);
                                    }
                                }
                                // /

                                // 추가구성
                                if(data.addSlitmCmpsMstList != null && data.addSlitmCmpsMstList.length > 0) {
                                    for(var i in data.addSlitmCmpsMstList) {
                                        //$(dlAddCmpsArea).append('<dt>' + data.addSlitmCmpsMstList[i].cmpsNm + '</dt>');

                                        var label = $('<label class="sellabel"></label>');
                                        var select = $("<select onchange='changeAddCmps(this, \""+slitmCd+"\", \""+uitmCd+"\");'></select>");
                                        $(select).append('<option value="">선택하세요</option>');

                                        for(var j in data.addSlitmCmpsMstList[i].slitmCmpsDtlList) {
                                            $(select).append('<option value="' + data.addSlitmCmpsMstList[i].cmpsSeq + '|' + data.addSlitmCmpsMstList[i].slitmCmpsDtlList[j].cmpsItemSeq + '|' + data.addSlitmCmpsMstList[i].slitmCmpsDtlList[j].sellPrc + '">' + data.addSlitmCmpsMstList[i].slitmCmpsDtlList[j].cmpsItemDispNm + '</option>');
                                            optionCnt += 1;
                                        }

                                        $(label).append(select);
                                        $(selectbox).append(label);
                                    }
                                    $(dlUitmArea).append(selectbox);
                                }

                                if(data.baskt != null) {
                                    $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).append('<input type="hidden" name="dluMaxBuyQtyCnt" value="' + data.baskt.slitmInf.dluMaxBuyQty +'"/>');
                                    $("#chgUitmLayer_"+slitmCd+"_"+uitmCd).append('<input type="hidden" name="lwstBuyQtyCnt" value="' + data.baskt.slitmInf.lwstBuyQty +'"/>');

                                    var optgroup = $('<div class="optgroup"></div>');
                                    $(optgroup).append($("<strong>"+data.baskt.uitmTotNm+"</strong>"));

                                    var quantity = $('<div class="quantity" id="uitm"></div>');

                                    if(data.baskt.uitmCombYn == 'Y') {
                                        for(var idx in data.baskt.uitmSeqList) {
                                            $(quantity).append('<input type="hidden" name="uitmSeq" value="' + data.baskt.uitmSeqList[idx] + '"/>');
                                        }
                                    } else {
                                        $(quantity).append('<input type="hidden" name="uitmCd" value="' + data.baskt.uitmCd + '"/>');
                                    }

                                    var count = $('<div class="count"></div>');
                                    $(count).append('<button type="button" class="btn btn-minus" aria-label="수량 감소" onclick="uitmMinus(this, \''+ data.baskt.slitmInf.lwstBuyQty + '\')"><i class="icon"></i><span class="hiding">감소</span></button>');
                                    $(count).append('<div class="inputbox"><label class="inplabel"><input type="number" name="ordQty" maxlength="2" value="'+ data.baskt.ordQty + '" onkeyup="uCheckOrdQty(this,\''+ data.baskt.slitmInf.dluMaxBuyQty + '\', \''+data.baskt.slitmInf.lwstBuyQty+'\')" title="입력하세요"></label></div>');
                                    $(count).append('<button type="button" class="btn btn-plus" aria-label="수량 증가" onclick="uitmPlus(this, \''+ data.baskt.slitmInf.dluMaxBuyQty + '\')"><i class="icon"></i><span class="hiding">증가</span></button>');

                                    var price = $('<div class="pdprice"></div>');
                                    $(price).append('<input type="hidden" name="sellPrc" value="' + data.baskt.slitmInf.sellPrc + '"/>');
                                    $(price).append('<ins aria-label="가격"><em>'+gfn_appendComma(Number(data.baskt.slitmInf.sellPrc) * Number(data.baskt.ordQty))+'</em><b>원</b></ins>');
                                    if ( optionCnt > 0 ) {
                                        $(price).append('<button type="button" class="btn-delete" onclick="removeUitmRow(this);"><i class="icon"></i><span class="hiding">삭제</span></button>');
                                    }
                                    /*
                                    if(data.baskt.basktBaseCmpsDtlList != null && data.baskt.basktBaseCmpsDtlList.length > 0) { // 기본구성
                                        for(var i in data.baskt.basktBaseCmpsDtlList) {
                                            $("#divSelectedUitmArea li.first").append('<span class="block gray mt5">└ ' + data.baskt.basktBaseCmpsDtlList[i].cmpsItemDispNm + '</span>');
                                            $("#divSelectedUitmArea li.first").append('<input type="hidden" name="baseCmpsInfo" value="' + data.baskt.basktBaseCmpsDtlList[i].cmpsSeq + '|' + data.baskt.basktBaseCmpsDtlList[i].cmpsItemSeq + '"/>');
                                        }
                                    }
                                    // /

                                    $(quantity).append(count);
                                    $(quantity).append(price);
                                    $(optgroup).append(quantity);
                                    $(dlUitmArea).append(optgroup);

                                    if(data.baskt.basktAddCmpsDtlList != null && data.baskt.basktAddCmpsDtlList.length > 0) {   // 추가구성
                                        for(var i in data.baskt.basktAddCmpsDtlList) {
                                            //var optgroup = $('<div class="optgroup"></div>');
                                            $(optgroup).append($("<strong>"+data.baskt.basktAddCmpsDtlList[i].cmpsItemDispNm+"</strong>"));

                                            var quantity = $('<div class="quantity" id="addCmps"></div>');
                                            $(quantity).append('<input type="hidden" name="addCmpsInf" value="' + data.baskt.basktAddCmpsDtlList[i].cmpsSeq + '|' + data.baskt.basktAddCmpsDtlList[i].cmpsItemSeq + '"/>');

                                            var count = $('<div class="count"></div>');
                                            $(count).append('<input type="hidden" name="ordQty" value="'+ data.baskt.basktAddCmpsDtlList[i].cmpsOrdQty + '"title="입력하세요">');

                                            var price = $('<div class="pdprice"></div>');
                                            $(price).append('<input type="hidden" name="sellPrc" value="' + data.baskt.slitmInf.sellPrc + '"/>');
                                            $(price).append('<ins aria-label="가격"><em>'+gfn_appendComma(Number(data.baskt.basktAddCmpsDtlList[i].cmpsSellPrc) * Number(data.baskt.basktAddCmpsDtlList[i].cmpsOrdQty))+'</em><b>원</b></ins>');
                                            $(price).append('<button type="button" class="btn-delete" onclick="removeUitmRow(this);"><i class="icon"></i><span class="hiding">삭제</span></button>');

                                            $(quantity).append(count);
                                            $(quantity).append(price);
                                            $(optgroup).append(quantity);
                                            $(dlUitmArea).append(optgroup);
                                        }
                                    }

                                    //calcSellPrc();
                                }
                                $(dlUitmArea).append('<div class="btngroup"><button type="button" class="btn btn-linelgray" onclick="$(\'#optBtn_'+slitmCd+'_'+uitmCd+'\').toggleClass(\'selected\');$(\'#chgUitmLayer_'+slitmCd+'_'+uitmCd+'\').toggleClass(\'selected\');"><span>취소</span></button> <button type="button" class="btn btn-linelgray" onclick="changeBasktItemUitmInf(\''+slitmCd+'\', \''+uitmCd+'\');"><span>변경적용</span></button></div>');
                                //$("#chgUitmLayer_"+slitmCd+"_"+uitmCd).toggleClass("selected");
                                loading(false);
                                */

            }
        }
        , error: function(data) {
            loading(false);
        }
    });
}