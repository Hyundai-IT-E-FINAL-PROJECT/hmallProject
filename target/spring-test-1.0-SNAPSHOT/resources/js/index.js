console.log("index.js")
;(function (core, $, undefined) {
    console.log("index.js")
})(window[LIB_NAME], jQuery);

function setTopBanner() {
    try {
        let TopBannerArr = [top1Json, top2Json, top3Json, top4Json];
        let imageServer = 'https://image.hmall.com';

        $.each(TopBannerArr, function (i, arr) {
            if (TopBannerArr[i].length == 0) return;

            let dispUrl = TopBannerArr[i][0].dispUrl;
            let dispTrtyNmCd = TopBannerArr[i][0].dispTrtyNmCd;
            let dispImflNm = TopBannerArr[i][0].dispImflNm;
            let dispNm = TopBannerArr[i][0].dispNm;
            let evntDesc = TopBannerArr[i][0].evntDesc;

            if (dispNm == null) {
                dispNm = "";
            }

            if (evntDesc == null) {
                evntDesc = "";
            }

            let _html = "";


            if (i == 0) {
                _html = '<a class="banner-item type3 firstitem gp_className" ga-category="헤더" ga-action="탑배너1" ga-label="' + dispNm + '" href="javascript:bizSpringTag(\'' + dispUrl + '&_IC_=top' + Math.round(i + 1) + '\',\'^헤더^탑배너^' + dispNm + '\');">';
            } else if (i == 1) {
                _html = '<a class="banner-item type3 gp_className" ga-category="헤더" ga-action="탑배너2" ga-label="' + dispNm + '" href="javascript:bizSpringTag(\'' + dispUrl + '&_IC_=top' + Math.round(i + 1) + '\',\'^헤더^탑배너^' + dispNm + '\');">';
            } else {
                _html = '<a class="banner-item type3 lastitem gp_className" ga-category="헤더" ga-action="탑배너4" ga-label="' + dispNm + '" href="javascript:bizSpringTag(\'' + dispUrl + '&_IC_=top' + Math.round(i + 1) + '\',\'^헤더^탑배너^' + dispNm + '\');">';
            }


            if (i == 3) {
                _html = _html + '<span class="label-wrap"><span class="cat-label">' + dispNm + '</span><span class="main-label">' + evntDesc + '</span></span></a>';
            } else {
                _html = _html + '<img src="' + imageServer + dispImflNm + '"/><span class="label-wrap"><span class="cat-label">' + dispNm + '</span><span class="main-label">' + evntDesc + '</span></span></a>';
            }

            $("#top_bar").append(_html);


            if (i == 2) return false;


        });
        if ($("#top_bar").size() > 0) $(".header-banner").css({backgroundColor: $("#top_bar").find("img").first().attr("src").split("-")[1] == undefined ? "#FFF" : "#" + $("#top_bar").find("img").first().attr("src").split("-")[1].split(".")[0]});
    } catch (err) {
    }
}

function loadPCdirect() {
    try {
        let ulSize = 0;
        $(PCdirectJson).each(function (idx, cOAPCdirectInfVO) {
            $("#pcdirect").attr("href", "javascript:bizSpringTagForVisit('" + cOAPCdirectInfVO.dispUrl + "','^스카이스크래퍼^바로접속ON');");
            ulSize += 1;
            if (ulSize == 1) return false;
        });
    } catch (err) {
    }
}

function bizSpringTagForVisit(url, pathVal) {
    let bookMarkFlag = 'true';

    if (bookMarkFlag == 'true') {
        try {
            _trk_flashEnvView('_TRK_CP=' + pathVal);
        } catch (e) {
        }
    } else {

    }

    url = url.replace(/ /g, '');
    if (url != "" && url != undefined) {
        location.href = url;
    }
}

function bizSpringTag(url, pathVal) {
    try {
        _trk_flashEnvView('_TRK_CP=' + pathVal);
    } catch (e) {
    }

    url = url.replace(/ /g, '');
    if (url != "" && url != undefined) {
        location.href = url;
    }
}

function bizspringClickTrace(tag) {
    try {
        if (!isEmpty(tag)) _trk_clickTrace('EVT', tag);
    } catch (e) {
    }
}

function openLoginTag(url, pathVal) {

    try {

        //현재는 사용안함 향후 매체동의 사용시에 주석 제거
        //sessionStorage.setItem("recentCokiUseAgr", "Y");

        _trk_flashEnvView('_TRK_CP=' + pathVal);
    } catch (e) {
    }

    // 2020.11.25 icj : url이 없는 경우 현재 url 전달
    if (isEmpty(url)) {
        // 2021.01.13 : url이 없는경우 특정 url은 제외 처리
        if (isLoginExpectUrl(location.href)) {
            url = "";
        } else {
            url = location.href;
        }

    }

    openLoginPopup(url);
}

//2020.03.04 gnb_search.js에서 이동
let searchAdTempArr = new Array();

function initSearchAD() {
    if (typeof searchADLinkList !== 'undefined') { //searchADLinkList.js 배치로 만들어진 파일이라 local Test시 에러방지
        if (searchADLinkList.length > 0) {
            //2021.12.21 인터넷 노출 컬럼 기준 필터링
            for (let i = 0; i < searchADLinkList.length; i++) {
                if (searchADLinkList[i].itntDispYn == "Y") {
                    searchAdTempArr.push(i); //인터넷 노출될 인덱스 값 저장
                }
            }

            adIndex = Math.round(Math.random() * 10) % searchAdTempArr.length;

            gv_gnbHomeBnnrTitl = searchADLinkList[searchAdTempArr[adIndex]].bnnrTitl;
            gv_gnbHomeBnnrLinkUrl = searchADLinkList[searchAdTempArr[adIndex]].bnnrLinkUrl;
        }
    }

    if (typeof searchADTextList !== 'undefined') {
        if (searchADTextList.length > 0) {
            gv_gnbSearchADTextList = searchADTextList;
        }
    }

    // 2020.12.24 icj : 미선택시에만 값 세팅
    if (!$('.header .search').hasClass('selected')) {
        $("#gnbSearchKeyword").val(gv_gnbHomeBnnrTitl);
    }

}

function doSearchGnb() {
    let searchKeyword = $("#gnbSearchKeyword").val();
    if (searchKeyword == null || searchKeyword == "") {
        alert("검색어를 입력해주세요.");
        return false;
    }
    if (searchKeyword.indexOf("www.") >= 0) {
        alert("검색할 수 없는 키워드가 포함되어 있습니다.");
        return false;
    }

    //검색어 값이 처음 현시된 글과 같을경우 해당 Url에 이동
    if (typeof gv_gnbHomeBnnrTitl !== 'undefined') {
        if (gv_gnbHomeBnnrTitl == searchKeyword) {
            let url = gv_gnbHomeBnnrLinkUrl;
            if (gv_gnbHomeBnnrLinkUrl.indexOf("http:") == -1 && gv_gnbHomeBnnrLinkUrl.indexOf("https:") == -1) {
                if (url.indexOf("/p/") >= 0) {
                    url = serverHost + "/" + url;
                } else {
                    url = "http://" + url;
                }
            }
            try {
                _trk_flashEnvView('_TRK_CP=^헤더^검색창광고^' + searchKeyword);
            } catch (e) {
            }

            window.location.href = url;
            return false;
        }
    }

    let isSearchADText = goSearchADText(searchKeyword);

    if (!isSearchADText) {
        let form = document.gnbPdeSearchForm;
        form.action = "https://www.hmall.com/p/pde/search.do";
        form.submit();
    }
}

function goSearchADText(searchKeyword) {

    if (gv_gnbSearchADTextList.length > 0) {
        let index = -1;
        for (let idx = 0; idx < gv_gnbSearchADTextList.length; idx++) {
            if (!isEmpty(gv_gnbSearchADTextList[idx].bnnrTitl)) {
                if (gv_gnbSearchADTextList[idx].bnnrTitl == searchKeyword) {
                    index = idx;
                    break;
                }
            }
        }

        if (index >= 0) {
            if (!isEmpty(gv_gnbSearchADTextList[index])) {
                let url = gv_gnbSearchADTextList[index].bnnrLinkUrl;
                if (url.indexOf("http:") == -1 && url.indexOf("https:") == -1) {
                    if (url.indexOf("/p/") >= 0) {
                        url = serverHost + "/" + url;
                    } else {
                        url = "http://" + url;
                    }
                }

                // 180305 - bizSpring - rlatkdals
                _trk_bnnrTitl = "TEXT검색어_" + gv_gnbSearchADTextList[index].bnnrTitl;
                _trk_clickTrace('EVT', _trk_bnnrTitl);

                window.location.href = url;
                return true;
            }
        }
    }
    return false;
}

$(function () {
    let flag = 0;
    $(document).on('click', '#gnbSearchKeyword', function () {
        let searchTerm = "";
        //최초 검색키워드 설정 후 초기화
        if (searchTerm == "A") {
            searchTerm = '';
        }
        if (flag == 0) {
            $("#gnbSearchKeyword").val(searchTerm);
            flag = 1;

            //IE 커서 위치를 맨 뒤로
            if (this.createTextRange) {
                let range = this.createTextRange();
                range.move('character', this.value.length);
                range.select();
            }
        }

        $(".search-box").focus();
    });

});

/* GNB - 카테고리 배너 vs008 */
function setCategoryBanner(jsonData) {
    let _data = jsonData;

    $(_data).each(function (_idx) {
        if (this.cd != null && this.cd != "") {
            let _catecode = this.cd.toString();
            let _mainLabel = this.bnnrTitl == null ? " " : this.bnnrTitl.toString();
            let _subLabel = this.srcCntn == null ? " " : this.srcCntn.toString();
            let _dispUrl = this.bnnrLinkUrl == null ? " " : this.bnnrLinkUrl.toString();
            let _imgUrl = this.bnnrImflNm == null ? " " : this.bnnrImflNm.toString();

            /* 임시처리 TV쇼핑 노출되지 않도록 처리 */
            let _html = "<div class='exhibition-banner'>" +
                "<a href='" + _dispUrl + "'>" +
                "<img src='" + 'https://image.hmall.com' + _imgUrl + "' alt='기획전 Banner' onerror=\"this.src='//image.hmall.com/p/img/co/sample/img-bnn01.jpg'\"/>" +
                "<span class='banner-text'>" +
                "<strong>" + _mainLabel + "</strong>" +
                "<em>" + _subLabel + "</em>" +
                "</span>" +
                "</a>" +
                "</div>";

            $('.category-list-contents[data-catecode="' + _catecode + '"]').append(_html);
        }
    });
}

/* GNB - 카테고리 공통 common 동작 추가 (category append 이후 동작 처리) */
function catNavigation(option) {
    let $selector = $('#categoryArea');

    let _default = {
        menuWrap: '.category-menu-wrap',
        btn: '.btn-category',
        mainList: '.category-list',
        contents: '.category-list-contents',
        index: 0,
    }
    let _option = $.extend({}, _default, option)
    let $menuWrap = $(_option["menuWrap"])
    let $mainMenu = $menuWrap.find(_option.mainList)
    let $menuList = $menuWrap.find(_option.mainList + ' li')
    let $contents = $(_option["contents"])
    let _index = _option["index"]

    let init_renew = function () {
        if (!$selector.length) {
            console.log('No elements. "' + _selector + '"')
        }
        onClickHandler_renew()
        onMouseLeaveHandler_renew()
        onMenuOverHandler_renew()
    }

    let onClickHandler_renew = function () {
        $selector.on('click', _option.btn, function (e) {
            e.stopPropagation()
            if ($menuWrap.is(':visible')) {
                $menuWrap.hide()
            } else {
                $menuWrap.show()
                showMenuByIndex_renew(_index)
                equalizeHeight_renew(_index)

                //검색창 숨김 처리
                $('#search-autowrap').hide();
                $("#search-popup").hide();
                $(".header .search").removeClass("selected");

                //퀵 메뉴 숨김 처리
                $('.quick-menu-more').removeClass('on');
            }
        })
    }

    let onMouseLeaveHandler_renew = function () {
        $menuWrap.on('mouseleave', function () {
            // $menuWrap.hide()
        })
    }

    let onMenuOverHandler_renew = function () {
        $menuList.on('mouseenter', function (e) {
            let index = $(e.target).closest('li').index()
            showMenuByIndex_renew(index)
            equalizeHeight_renew(index)
        })
    }

    let showMenuByIndex_renew = function (index) {
        _index = index
        $menuList.removeClass('on').eq(_index).addClass('on')
        $contents.hide().closest("[data-catecode='" + $menuList.eq(_index).data('catecode') + "']").show()
    }
    let equalizeHeight_renew = function (index) {
        let $currentContents = $contents.hide().closest("[data-catecode='" + $menuList.eq(_index).data('catecode') + "']").show()
        let maintHeight = $mainMenu.outerHeight()
        let currentContentsHeight = $currentContents.outerHeight()

        if (maintHeight > currentContentsHeight) {
            $currentContents.height(maintHeight - 2)
        } else if (currentContentsHeight > maintHeight) {
            $mainMenu.height(currentContentsHeight)
        }
    }

    init_renew()
    return this;
}

//for chrome debugger
//# sourceURL= script-for-Top2.js

$(document).on('click', '.header-top .logo', function () {
    console.log("logo clicked")
    if ($(this).parent('div').attr('class') != 'header-inner') {
        let form = document.createElement('form');
        let objs;

        objs = document.createElement('input');
        objs.setAttribute('type', 'text');
        objs.setAttribute('name', 'cacheYn');
        objs.setAttribute('value', 'N');
        form.appendChild(objs);
        form.setAttribute('method', 'post');
        form.setAttribute('action', '/p/index.do');
        document.body.appendChild(form);
        form.submit();
        //window.location.href = "/p/index.do?cacheYn=N";
    }
});