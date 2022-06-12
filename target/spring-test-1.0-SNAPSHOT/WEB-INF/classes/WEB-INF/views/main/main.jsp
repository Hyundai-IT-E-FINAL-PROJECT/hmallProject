<%--
  Created by IntelliJ IDEA.
  User: SM-PC
  Date: 2022-05-18
  Time: 오후 6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
    <div class="container">
        <div class="contents">
            <!--contents-area-->
            <div class="main-contents-area">
                <!--homeshoping-wrap-->
                <div class="homeshoping-wrap">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jjimList();
                            listAlrimiWithItem();
                        });
                        var rgx1 = /\D/g;
                        var rgx2 = /(\d+)(\d{3})/;

                        // 금액 타입 체크
                        function getNumber(obj) {
                            var num01, num02;
                            num01 = obj.value;
                            num02 = num01.replace(rgx1, "");
                            num01 = setComma(num02);
                            obj.value = num01;
                        }

                        // 콤마 입력 변환
                        function setComma(inNum) {
                            var outNum;
                            outNum = inNum;
                            while (rgx2.test(outNum)) {
                                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
                            }
                            return outNum;
                        }

                        //개인화 찜, 알리미
                        var personalJJimData;
                        var personalAlrimiData;

                        /**
                         * 로그인 사용자 찜 리스트 조회 및 처리
                         */
                        function jjimList() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/mpc/selectWishList.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalJJimData = data.result;
                                        personalJJimSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 알림 리스트 조회 및 처리
                         */
                        function listAlrimiWithItem() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/bma/listAlrimiWithItem.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalAlrimiData = data.result;
                                        personalAlrimiSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 찜 처리
                         */
                        function personalJJimSet() {

                            var $alimlike = $('div.alimlike');
                            $alimlike.find('a.btn-like.on').removeClass('on');

                            if (!personalJJimData) {
                                return;
                            }

                            var jjimCnt = personalJJimData.length;

                            if (jjimCnt > 0) {
                                for (var i = 0; i < jjimCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var $btnlike = $($(this).find('a.btn-like')[0]);
                                        var slitmCd = $(this).data('slitmcd');

                                        if (!$btnlike.hasClass('on') && slitmCd == personalJJimData[i]) {
                                            $btnlike.addClass('on');
                                        }
                                    });
                                }
                            }
                        }

                        /*
                         * 로그인 사용자 알림 처리
                         */
                        function personalAlrimiSet() {
                            var $alimlike = $('div.alimlike');

                            // clean
                            $alimlike.find('a.btn-alim.on').removeClass('on');

                            if (!personalAlrimiData) {
                                return;
                            }

                            var alrimiCnt = personalAlrimiData.length;

                            /* 일반 상품 알림 처리 */
                            if ($alimlike.length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var bsitmCd = $(this).data('bsitmcd');
                                        var $btnalim = $($(this).find('a.btn-alim')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }
                                    });
                                }
                            }

                            /* PC 편성표 특화 알림 처리 */
                            // clean
                            $alimlike.find('button.on').removeClass('on');

                            if ($alimlike.find('button').length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {

                                    if (null == personalAlrimiData[i].bsitmCd)
                                        continue;

                                    // console.log('알림 활성화 할 내 구독 : ' + personalAlrimiData[i].bsitmCd);

                                    // 찜. 알리미
                                    $alimlike.each(function (ti, tv) {
                                        var bsitmCd = $(tv).attr('data-bsitmcd');
                                        var $btnalim = $($(tv).find('button')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }

                                    });
                                }
                            }
                        }

                        /*
                         * 호출 URL에 따른 _trk_clickTrace 처리
                         */
                        function dp_clickTrace(type) {
                            try {
                                // 특정 URL 포함이면 필요시 추가
                                if (loca_contain('pde/search.do')) {
                                    trk_title('검색결과_상품리스트_찜', '검색결과_상품리스트_알리미', type);
                                }
                            } catch (e) {
                            }
                        }

                        /*
                         *  url에 포함여부
                         */
                        function loca_contain(url) {
                            return location.href.indexOf(url) > -1;
                        }

                        /*
                         * @ggimTitle 찜
                         * @alimiTitle 알리미
                         */
                        function trk_title(ggimTitle, alimiTitle, type) {
                            var title;
                            if (type == 'ggim') {
                                title = ggimTitle;
                            } else if (type == 'alimi') {
                                title = alimiTitle;
                            }
                            console.log('trk_title', title);
                            _trk_clickTrace('EVT', title);
                        }


                        /*
                         * 2020.12.04 icj 찜하기
                         */
                        var goActionCnt = 0; // 두번 클릭 방지
                        function goChioceProcess(itemType, venCd, venItemCd, slitmCd, event, obj) {
                            goActionCnt++;

                            dp_clickTrace('ggim');

                            if (event.stopPropagation) {
                                event.stopPropagation(); // FF
                            } else {
                                event.cancelBubble = true; // IE
                            }
                            if (!event.preventDefault) {
                                event.returnValue = false; //IE
                            } else {
                                event.preventDefault();
                            }

                            if ((venCd != null && venCd == '009741' && venItemCd != null)) {
                                alert("기프티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '008117' && venItemCd != null)) {
                                alert("기프티쇼 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009014' && venItemCd != null)) {
                                alert("큐피콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009428' && venItemCd != null)) {
                                alert("멀티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if (itemType == '04') {
                                alert("이 상품은 전문상담원과 상담 후 구매하실 수 있습니다.\n상담을 원하시면 080-000-0000으로 문의하여 주시기 바랍니다.\n전문상담원이 친절히 안내해 드리겠습니다.");
                                return;
                            }

                            if (isLogin() != 'true') {
                                if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                    openLoginPopup(location.href);
                                }
                                return false;
                            }

                            if (goActionCnt > 1) return;

                            var params = "chkedSlitmCdUitmCds=" + slitmCd;

                            //파라미터 sectId 가 존재 할경우 sectId 전달
                            var sectId = "";
                            if (sectId == "" || sectId == "0") {
                                sectId = "";
                            }

                            // 2020.11.19 icj PDAItemPtcMst.jsp zzimDone 참조. 2020.12.03 삭제기능 포함
                            $.ajax({
                                url: "/p/mpc/insertGgim.do"
                                , dataType: "json"
                                , data: params
                                , success: function (data) {
                                    goActionCnt = 0;
                                    jjimList();
                                    var gaAction;
                                    if (data.insertResult != 'undefined' && data.insertResult == '0') {
                                        alert("찜하기가 불가능한 상품입니다.");
                                        //alert("판매중인 단품이 없어 찜하지 못했습니다.");
                                        return true;
                                    } else if (data.insertResult != 'undefined' && data.insertResult == '1') {
                                        $(event.target).removeClass("on");
                                        alert("찜목록에서 삭제 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜취소';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜취소', jjimTag);
                                            }

                                        } catch (e) {
                                            alert(e);
                                        }
                                        return true;
                                    } else if (data.custGGimCnt >= 200) {
                                        alert("더 이상 찜 할 수 없습니다. 찜리스트에서 오래된 상품을 삭제 후 다시 이용해 주세요.");
                                        return true;
                                    } else {
                                        if (data != null && data.needLogin) {
                                            // 세션 로그인이 풀려서 로그인이 안된 경우
                                            if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                                openLoginPopup(location.href);
                                            }
                                            return false;
                                        }
                                        $(event.target).addClass("on");
                                        alert("찜 목록에 추가 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜', jjimTag);
                                            }

                                        } catch (e) {
                                        }
                                    }
                                },
                                error: function () {
                                    console.log("json error");
                                    goActionCnt = 0;
                                }
                            });
                        }

                        /*
                         * 2020.12.01 icj 방송 알리미
                         * PDAItemPtcMst.jsp bitemAlrimPopupNew 참조
                         */
                        function bitemAlrimPopupTrk(slitmNm, slitmCd, bsitmCd) {
                            if (isLogin() != 'true') {
                                openLoginPopup(location.href);
                                return false;
                            }

                            dp_clickTrace('alimi');


                            // 방송 알리미 팝업
                            // addBitemAlrimCommonPopupNew(slitmNm, slitmCd, bsitmCd);  //AS-IS
                            alimPopup(slitmNm, slitmCd, bsitmCd, function (w) {
                                listAlrimiWithItem();
                            });
                        }

                        function alimPopup(slitmNm, slitmCd, bsitmCd, callback) {
                            var w = openPopup("/p/bma/editBitmAlrimNewPup.do?slitmNm=" + encodeURIComponent(slitmNm) + "&slitmCd=" + slitmCd + "&bsitmCd=" + bsitmCd,
                                "", 600, 700, "yes", $(window).width(), $(window).height());

                            var wInterval = setInterval(function () {
                                if (w.closed) {
                                    //             console.log('닫힘');
                                    callback(w);
                                    clearInterval(wInterval);
                                } else {
                                    //             console.log('열림')
                                }
                            }, 1000);
                        }


                        function alimLayer() {
                            $.ajax({
                                type: "POST"
                                , url: "/p/bma/editBitmAlrimNewPup.do"
                                , data: {
                                    returnUrl: location.href,
                                    slitmCd: slitmCd,
                                    slitmNm: slitmNm
                                }
                                , dataType: "html"
                                , async: false
                                , success: function (data) {
                                    if ($("#bitmAlrimLayer").length == 0) {
                                        var html = '<div class="layer-popup brand" id="bitmAlrimLayer">';
                                        html += '<div class="pop-wrap">';
                                        html += '<div class="pop-content-wrap">';
                                        html += '<strong class="pop-title">방송 알리미</strong></div>';
                                        html += '<div class="pop-content" id="bitmAlrimBody"></div>';
                                        html += '<button class="btn-close" id="bitmAlrimCloseBtn"><span>팝업 닫기</span></button>';
                                        html += '</div>';
                                        $('body').append(html);

                                        $('#bitmAlrimCloseBtn').click(function () {
                                            $("#bitmAlrimLayer").hide();
                                        });
                                    }
                                    $("#bitmAlrimBody").html(data);
                                    $("#bitmAlrimLayer").show();
                                }
                                ,
                                error: function () {
                                    alert('방송알리미 신청시 오류가 발생했습니다. 잠시후 다시 시도하세요.');
                                    console.log("json error");
                                }
                            });
                        }

                        //상품상세이동
                        function goItemDetail(url, obj, target) {
                            var $slitmInfo = $(obj).closest('.pdthumb');
                            if ($slitmInfo) {
                                if ($slitmInfo.hasClass('comingsoon')) {
                                    alert('아직 판매중이 아닙니다.');
                                    return false;
                                }
                                /*
                                if($slitmInfo.hasClass('soldOut')){
                                    alert('품절입니다.');
                                    return false;
                                }
                                */
                            }

                            /* ga tagging */
                            try {
                                if ($slitmInfo && $slitmInfo.attr("ga-custom-title")) {
                                    setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"))
                                }
                            } catch (e) {
                                console.log(e);
                            }

                            if (target) {
                                window.open(url, target);
                            } else {
                                window.location.href = url;
                            }

                        }

                        function personalSet() {
                            personalJJimSet();
                            personalAlrimiSet();
                        }

                        // 방송톡
                        function brodChatCheck() {

                            //방송톡 가능여부
                            $.ajax({
                                type: "GET",
                                //url: "https://marsheg.sweettracker.net:4443/user/api/is_aviliable_chat/format/json",
                                url: "https://broadeg.happytalk.io/user/api/is_aviliable_chat/format/json",
                                success: function (result) {
                                    if (result.code == 'success') {
                                        // 로그인 체크 및 팝업창 열기
                                        if (isLogin() == 'true') {
                                            var screenWidth = $(window).width();
                                            var screenHeight = $(window).height();
                                            var width = 480;
                                            var height = 700;
                                            var left = (screenWidth - width) / 2;
                                            var top = (screenHeight - height) / 2;
                                            var url = "https://www.hmall.com/p/bmc/brodChatPup.do";
                                            var popName = "brodChatPup";
                                            var popOption = "height=" + height + ", width=" + width + ", left=" + left + ", top=" + top + ", fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                                            window.open(url, popName, popOption);
                                        } else {
                                            openLoginPopup("/p/bmc/brodPordPbdv.do");
                                            return false;
                                        }
                                    } else {
                                        //채팅방 상태가 좋지 않으면 오류메시지 표시.
                                        alert(result.results);
                                    }
                                },
                                async: false,
                                dataType: 'jsonp',
                                crossDomain: true
                            });
                        }

                        // 기획전 템플릿 다운로드 쿠폰 적용
                        var roulette_flag = 0; //계속 클릭 방지
                        function DirectCopnDownload(prmoNo) {

                            var now_urls = location.href;
                            var returnUrl = now_urls.split('hmall.com');

                            if (isLogin() == 'true') {

                                if (roulette_flag != 0) {
                                    return false;
                                }
                                roulette_flag = 1;

                                $.ajax({
                                    type: "post"
                                    , url: "/pevent/eva/evntSectCopnDownLoad.do"
                                    , dataType: "json"
                                    , data: {prmoNo: prmoNo}
                                    , async: false
                                    , success: function (data) {
                                        if (data.save) {
                                            roulette_flag = 0;
                                            alert("쿠폰이 발행되었습니다.");
                                        } else {
                                            roulette_flag = 0;
                                            if (data.errorMsg == "UPNT_REGISTER") {
                                                if (confirm("H.Point 통합회원 가입 후 이벤트 응모 가능합니다.\nH.Point 전환가입 하시겠습니까?")) {
                                                    window.location.href = "/p/cua/registUpnt.do";
                                                } else {
                                                    return false;
                                                }
                                            } else {
                                                if (data.otp == "no") {
                                                    openPopup("/pevent/eva/evaEvntSmsSelfCertPup.do?btn=agree&returnUrl=" + returnUrl[1], 'smsSendPup', "500", "611", null, $(window).width(), $(window).height());
                                                } else {
                                                    alert(data.errorMsg);
                                                    return false;
                                                }
                                            }
                                        }
                                    }
                                    , error: function (request, status, error) {
                                        if (confirm('응모시 오류가 발생했습니다.')) {
                                        }
                                        roulette_flag = 0;
                                    }
                                });
                                return false;
                            } else {
                                openLoginPopup(returnUrl[1]);
                                return false;
                            }
                        }

                        //for chrome debugger
                        //# sourceURL=script-for-main-dprenew.js
                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jjimList();
                            listAlrimiWithItem();
                        });


                        var rgx1 = /\D/g;
                        var rgx2 = /(\d+)(\d{3})/;

                        // 금액 타입 체크
                        function getNumber(obj) {
                            var num01, num02;
                            num01 = obj.value;
                            num02 = num01.replace(rgx1, "");
                            num01 = setComma(num02);
                            obj.value = num01;
                        }

                        // 콤마 입력 변환
                        function setComma(inNum) {
                            var outNum;
                            outNum = inNum;
                            while (rgx2.test(outNum)) {
                                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
                            }
                            return outNum;
                        }

                        //개인화 찜, 알리미
                        var personalJJimData;
                        var personalAlrimiData;

                        /**
                         * 로그인 사용자 찜 리스트 조회 및 처리
                         */
                        function jjimList() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/mpc/selectWishList.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalJJimData = data.result;
                                        personalJJimSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 알림 리스트 조회 및 처리
                         */
                        function listAlrimiWithItem() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/bma/listAlrimiWithItem.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalAlrimiData = data.result;
                                        personalAlrimiSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 찜 처리
                         */
                        function personalJJimSet() {

                            var $alimlike = $('div.alimlike');
                            $alimlike.find('a.btn-like.on').removeClass('on');

                            if (!personalJJimData) {
                                return;
                            }

                            var jjimCnt = personalJJimData.length;

                            if (jjimCnt > 0) {
                                for (var i = 0; i < jjimCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var $btnlike = $($(this).find('a.btn-like')[0]);
                                        var slitmCd = $(this).data('slitmcd');

                                        if (!$btnlike.hasClass('on') && slitmCd == personalJJimData[i]) {
                                            $btnlike.addClass('on');
                                        }
                                    });
                                }
                            }
                        }

                        /*
                         * 로그인 사용자 알림 처리
                         */
                        function personalAlrimiSet() {
                            var $alimlike = $('div.alimlike');

                            // clean
                            $alimlike.find('a.btn-alim.on').removeClass('on');

                            if (!personalAlrimiData) {
                                return;
                            }

                            var alrimiCnt = personalAlrimiData.length;

                            /* 일반 상품 알림 처리 */
                            if ($alimlike.length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var bsitmCd = $(this).data('bsitmcd');
                                        var $btnalim = $($(this).find('a.btn-alim')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }
                                    });
                                }
                            }

                            /* PC 편성표 특화 알림 처리 */
                            // clean
                            $alimlike.find('button.on').removeClass('on');

                            if ($alimlike.find('button').length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {

                                    if (null == personalAlrimiData[i].bsitmCd)
                                        continue;

                                    // console.log('알림 활성화 할 내 구독 : ' + personalAlrimiData[i].bsitmCd);

                                    // 찜. 알리미
                                    $alimlike.each(function (ti, tv) {
                                        var bsitmCd = $(tv).attr('data-bsitmcd');
                                        var $btnalim = $($(tv).find('button')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }

                                    });
                                }
                            }
                        }

                        /*
                         * 호출 URL에 따른 _trk_clickTrace 처리
                         */
                        function dp_clickTrace(type) {
                            try {
                                // 특정 URL 포함이면 필요시 추가
                                if (loca_contain('pde/search.do')) {
                                    trk_title('검색결과_상품리스트_찜', '검색결과_상품리스트_알리미', type);
                                }
                            } catch (e) {
                            }
                        }

                        /*
                         *  url에 포함여부
                         */
                        function loca_contain(url) {
                            return location.href.indexOf(url) > -1;
                        }

                        /*
                         * @ggimTitle 찜
                         * @alimiTitle 알리미
                         */
                        function trk_title(ggimTitle, alimiTitle, type) {
                            var title;
                            if (type == 'ggim') {
                                title = ggimTitle;
                            } else if (type == 'alimi') {
                                title = alimiTitle;
                            }
                            console.log('trk_title', title);
                            _trk_clickTrace('EVT', title);
                        }


                        /*
                         * 2020.12.04 icj 찜하기
                         */
                        var goActionCnt = 0; // 두번 클릭 방지
                        function goChioceProcess(itemType, venCd, venItemCd, slitmCd, event, obj) {
                            goActionCnt++;

                            dp_clickTrace('ggim');

                            if (event.stopPropagation) {
                                event.stopPropagation(); // FF
                            } else {
                                event.cancelBubble = true; // IE
                            }
                            if (!event.preventDefault) {
                                event.returnValue = false; //IE
                            } else {
                                event.preventDefault();
                            }

                            if ((venCd != null && venCd == '009741' && venItemCd != null)) {
                                alert("기프티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '008117' && venItemCd != null)) {
                                alert("기프티쇼 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009014' && venItemCd != null)) {
                                alert("큐피콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009428' && venItemCd != null)) {
                                alert("멀티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if (itemType == '04') {
                                alert("이 상품은 전문상담원과 상담 후 구매하실 수 있습니다.\n상담을 원하시면 080-000-0000으로 문의하여 주시기 바랍니다.\n전문상담원이 친절히 안내해 드리겠습니다.");
                                return;
                            }

                            if (isLogin() != 'true') {
                                if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                    openLoginPopup(location.href);
                                }
                                return false;
                            }

                            if (goActionCnt > 1) return;

                            var params = "chkedSlitmCdUitmCds=" + slitmCd;

                            //파라미터 sectId 가 존재 할경우 sectId 전달
                            var sectId = "";
                            if (sectId == "" || sectId == "0") {
                                sectId = "";
                            }

                            // 2020.11.19 icj PDAItemPtcMst.jsp zzimDone 참조. 2020.12.03 삭제기능 포함
                            $.ajax({
                                url: "/p/mpc/insertGgim.do"
                                , dataType: "json"
                                , data: params
                                , success: function (data) {
                                    goActionCnt = 0;
                                    jjimList();
                                    var gaAction;
                                    if (data.insertResult != 'undefined' && data.insertResult == '0') {
                                        alert("찜하기가 불가능한 상품입니다.");
                                        //alert("판매중인 단품이 없어 찜하지 못했습니다.");
                                        return true;
                                    } else if (data.insertResult != 'undefined' && data.insertResult == '1') {
                                        $(event.target).removeClass("on");
                                        alert("찜목록에서 삭제 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜취소';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜취소', jjimTag);
                                            }

                                        } catch (e) {
                                            alert(e);
                                        }
                                        return true;
                                    } else if (data.custGGimCnt >= 200) {
                                        alert("더 이상 찜 할 수 없습니다. 찜리스트에서 오래된 상품을 삭제 후 다시 이용해 주세요.");
                                        return true;
                                    } else {
                                        if (data != null && data.needLogin) {
                                            // 세션 로그인이 풀려서 로그인이 안된 경우
                                            if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                                openLoginPopup(location.href);
                                            }
                                            return false;
                                        }
                                        $(event.target).addClass("on");
                                        alert("찜 목록에 추가 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜', jjimTag);
                                            }

                                        } catch (e) {
                                        }
                                    }
                                },
                                error: function () {
                                    console.log("json error");
                                    goActionCnt = 0;
                                }
                            });
                        }

                        /*
                         * 2020.12.01 icj 방송 알리미
                         * PDAItemPtcMst.jsp bitemAlrimPopupNew 참조
                         */
                        function bitemAlrimPopupTrk(slitmNm, slitmCd, bsitmCd) {
                            if (isLogin() != 'true') {
                                openLoginPopup(location.href);
                                return false;
                            }

                            dp_clickTrace('alimi');


                            // 방송 알리미 팝업
                            // addBitemAlrimCommonPopupNew(slitmNm, slitmCd, bsitmCd);  //AS-IS
                            alimPopup(slitmNm, slitmCd, bsitmCd, function (w) {
                                listAlrimiWithItem();
                            });
                        }

                        function alimPopup(slitmNm, slitmCd, bsitmCd, callback) {
                            var w = openPopup("/p/bma/editBitmAlrimNewPup.do?slitmNm=" + encodeURIComponent(slitmNm) + "&slitmCd=" + slitmCd + "&bsitmCd=" + bsitmCd,
                                "", 600, 700, "yes", $(window).width(), $(window).height());

                            var wInterval = setInterval(function () {
                                if (w.closed) {
                                    //             console.log('닫힘');
                                    callback(w);
                                    clearInterval(wInterval);
                                } else {
                                    //             console.log('열림')
                                }
                            }, 1000);
                        }


                        function alimLayer() {
                            $.ajax({
                                type: "POST"
                                , url: "/p/bma/editBitmAlrimNewPup.do"
                                , data: {
                                    returnUrl: location.href,
                                    slitmCd: slitmCd,
                                    slitmNm: slitmNm
                                }
                                , dataType: "html"
                                , async: false
                                , success: function (data) {
                                    if ($("#bitmAlrimLayer").length == 0) {
                                        var html = '<div class="layer-popup brand" id="bitmAlrimLayer">';
                                        html += '<div class="pop-wrap">';
                                        html += '<div class="pop-content-wrap">';
                                        html += '<strong class="pop-title">방송 알리미</strong></div>';
                                        html += '<div class="pop-content" id="bitmAlrimBody"></div>';
                                        html += '<button class="btn-close" id="bitmAlrimCloseBtn"><span>팝업 닫기</span></button>';
                                        html += '</div>';
                                        $('body').append(html);

                                        $('#bitmAlrimCloseBtn').click(function () {
                                            $("#bitmAlrimLayer").hide();
                                        });
                                    }
                                    $("#bitmAlrimBody").html(data);
                                    $("#bitmAlrimLayer").show();
                                }
                                ,
                                error: function () {
                                    alert('방송알리미 신청시 오류가 발생했습니다. 잠시후 다시 시도하세요.');
                                    console.log("json error");
                                }
                            });
                        }

                        //상품상세이동
                        function goItemDetail(url, obj, target) {
                            var $slitmInfo = $(obj).closest('.pdthumb');
                            if ($slitmInfo) {
                                if ($slitmInfo.hasClass('comingsoon')) {
                                    alert('아직 판매중이 아닙니다.');
                                    return false;
                                }
                                /*
                                if($slitmInfo.hasClass('soldOut')){
                                    alert('품절입니다.');
                                    return false;
                                }
                                */
                            }

                            /* ga tagging */
                            try {
                                if ($slitmInfo && $slitmInfo.attr("ga-custom-title")) {
                                    setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"))
                                }
                            } catch (e) {
                                console.log(e);
                            }

                            if (target) {
                                window.open(url, target);
                            } else {
                                window.location.href = url;
                            }

                        }

                        function personalSet() {
                            personalJJimSet();
                            personalAlrimiSet();
                        }

                        // 방송톡
                        function brodChatCheck() {

                            //방송톡 가능여부
                            $.ajax({
                                type: "GET",
                                //url: "https://marsheg.sweettracker.net:4443/user/api/is_aviliable_chat/format/json",
                                url: "https://broadeg.happytalk.io/user/api/is_aviliable_chat/format/json",
                                success: function (result) {
                                    if (result.code == 'success') {
                                        // 로그인 체크 및 팝업창 열기
                                        if (isLogin() == 'true') {
                                            var screenWidth = $(window).width();
                                            var screenHeight = $(window).height();
                                            var width = 480;
                                            var height = 700;
                                            var left = (screenWidth - width) / 2;
                                            var top = (screenHeight - height) / 2;
                                            var url = "https://www.hmall.com/p/bmc/brodChatPup.do";
                                            var popName = "brodChatPup";
                                            var popOption = "height=" + height + ", width=" + width + ", left=" + left + ", top=" + top + ", fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                                            window.open(url, popName, popOption);
                                        } else {
                                            openLoginPopup("/p/bmc/brodPordPbdv.do");
                                            return false;
                                        }
                                    } else {
                                        //채팅방 상태가 좋지 않으면 오류메시지 표시.
                                        alert(result.results);
                                    }
                                },
                                async: false,
                                dataType: 'jsonp',
                                crossDomain: true
                            });
                        }

                        // 기획전 템플릿 다운로드 쿠폰 적용
                        var roulette_flag = 0; //계속 클릭 방지
                        function DirectCopnDownload(prmoNo) {

                            var now_urls = location.href;
                            var returnUrl = now_urls.split('hmall.com');

                            if (isLogin() == 'true') {

                                if (roulette_flag != 0) {
                                    return false;
                                }
                                roulette_flag = 1;

                                $.ajax({
                                    type: "post"
                                    , url: "/pevent/eva/evntSectCopnDownLoad.do"
                                    , dataType: "json"
                                    , data: {prmoNo: prmoNo}
                                    , async: false
                                    , success: function (data) {
                                        if (data.save) {
                                            roulette_flag = 0;
                                            alert("쿠폰이 발행되었습니다.");
                                        } else {
                                            roulette_flag = 0;
                                            if (data.errorMsg == "UPNT_REGISTER") {
                                                if (confirm("H.Point 통합회원 가입 후 이벤트 응모 가능합니다.\nH.Point 전환가입 하시겠습니까?")) {
                                                    window.location.href = "/p/cua/registUpnt.do";
                                                } else {
                                                    return false;
                                                }
                                            } else {
                                                if (data.otp == "no") {
                                                    openPopup("/pevent/eva/evaEvntSmsSelfCertPup.do?btn=agree&returnUrl=" + returnUrl[1], 'smsSendPup', "500", "611", null, $(window).width(), $(window).height());
                                                } else {
                                                    alert(data.errorMsg);
                                                    return false;
                                                }
                                            }
                                        }
                                    }
                                    , error: function (request, status, error) {
                                        if (confirm('응모시 오류가 발생했습니다.')) {
                                        }
                                        roulette_flag = 0;
                                    }
                                });
                                return false;
                            } else {
                                openLoginPopup(returnUrl[1]);
                                return false;
                            }
                        }

                        //for chrome debugger
                        //# sourceURL=script-for-main-dprenew.js
                    </script>
                    <div class="hshop-fullbox" id="brodMainFullBexArea" style="height: 670px;">
                        <div class="hshop-full">
                            <div class="onair-box brodEtvArea">
                                <!--onair-top-->
                                <div class="onair-top">
                                    <h3>펀딩 프로젝트 이름</h3>
                                    <div class="onair-timer" style="justify-content: center;">
                                        <span class="timer" id="etvLeftTime">01 : 06 : 09</span>


                                        <!--온에어 아닐 시 방송 예정시간 노출-->
                                        <!-- <p class="tag-extime">9/28 (월) 16:00 ~ 17:00</p> -->
                                    </div>
                                </div>
                                <!--//onair-top-->
                                <!--product-list-->
                                <img src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226" alt="..." class="img-responsive"
                                     style="height: 270px; width: 527px;">
                                <div class="product-list">
                                    <div class="pdthumb">
                                        <!-- 동영상 다시보기 -->
                                        <figure >
                                            <div class="figcaption">
                                                <a href="javascript:;"
                                                  >
                                                    <div class="pdname" aria-label="제품명" style="font-weight: bold; font-size: 16px; line-height: 1.38;">크라우딩 펀딩 내용 블라블라
                                                    </div>


                                                </a>
                                                <!--//pdinfo-->
                                                <!--함께방송중인상품-->


                                                <div class="multi">
                                                    <div class="pdprice" style="justify-content: space-between; margin-top: 80px;">
                                                        <div>
                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">

                                                            <ins class="discount" aria-label="할인가"><em>5,454,000</em>원 펀딩</ins>
                                                        </span>
                                                        </div>
                                                        <div style="display: flex; align-items: center;">
                                                            <em class="rate" aria-label="할인율"  style="color:#002fa3;">5,454<i  style="color:#002fa3;">%</i></em>
                                                            <p style="margin-left:10px;">D-17</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--//함께방송중인상품-->
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                                <!--//product-list-->

                                <script type="text/javascript">
                                    var lbrdEndTimeStrH = '20220525114000';

                                    var etvServerDtm;
                                    if ('20220525103333' != '' && '20220525103333' != null) {
                                        etvServerDtm = '20220525103333';
                                    }

                                    $(function () {
                                        if ((lbrdEndTimeStrH && lbrdEndTimeStrH.length > 0)) {
                                            clockH(etvServerDtm);
                                        }

                                        // 비디오 초기화
                                        videojs($(".brodEtvArea video").get(0));

                                        // 비디오 초기화
                                        //$("brodEtvArea video source").attr("src", 'https://livejj.hyundaihmall.com:8443/live/ngrp:hmall.stream_pc/playlist.m3u8')
                                        //var player = videojs($(".brodEtvArea video").get(0));
                                    });


                                    function clockH(serverDtm) {

                                        var now;
                                        if (serverDtm == undefined || serverDtm == null) {
                                            now = new Date();
                                        } else {
                                            now = new Date(serverDtm.replace(/([\d]{4})([\d]{2})([\d]{2})([\d]{2})([\d]{2})([\d]{2})/, '$2/$3/$1 $4:$5:$6'));
                                        }

                                        var year = Number(lbrdEndTimeStrH.substring(0, 4));       //년
                                        var month = Number(lbrdEndTimeStrH.substring(4, 6)) - 1; //월 (0 ~ 11)
                                        var date = Number(lbrdEndTimeStrH.substring(6, 8));       //일
                                        var hours = Number(lbrdEndTimeStrH.substring(8, 10));     //시
                                        var minutes = Number(lbrdEndTimeStrH.substring(10, 12));  //분
                                        var seconds = Number(lbrdEndTimeStrH.substring(12, 14));  //초

                                        var endDtm = new Date(year, month, date, hours, minutes, seconds);  // 방송종료일시

                                        var gap = (endDtm.getTime() - now.getTime()) / 1000;
                                        var leftTime = "";

                                        if (gap <= 0) {
                                            /* location.reload(true); */
                                            leftTime = "00 : 00 : 00";
                                            $('#etvLeftTime').html(leftTime);
                                            $("#etvLeftReload").show();
                                            $(".brodEtvArea .vjs-big-play-button").hide()
                                            return;
                                        }

                                        var hour = parseInt(gap / 3600);
                                        var min = parseInt((gap % 3600) / 60);
                                        var sec = parseInt(gap % 60);

                                        leftTime += ((hour < 10) ? "0" : "") + hour;
                                        leftTime += ((min < 10) ? " : 0" : " : ") + min;
                                        leftTime += ((sec < 10) ? " : 0" : " : ") + sec;

                                        $('#etvLeftTime').html(leftTime);
                                        /*
                                        $("#onAirNum").html(leftTime);
                                        $("#countNum").html(leftTime + " <span>남음</span>");
                                        $("#countNumSe").html(leftTime + " <span>남음</span>");
                                        */
                                        setTimeout("clockH()", 1000);
                                    }

                                    // 2021.04.06 문주성 > 온에어 ga태깅 제어
                                    function onairEtvGaTagging(obj) {
                                        if ($(obj).children().first().attr('class').indexOf('vjs-user-active vjs-live') > -1
                                            || $(obj).children().first().attr('class').indexOf('vjs-live vjs-user-active') > -1) {
                                            var $slitmInfo = $(obj).closest('figure');
                                            setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"));
                                        }
                                    }
                                </script>

                            </div>
                            <div class="onair-box brodDtvArea">
                                <!--onair-top-->
                                <div class="onair-top">
                                    <h3>펀딩 프로젝트 이름</h3>
                                    <div class="onair-timer" style="justify-content: center;">
                                        <span class="timer" id="dtvLeftTime">00 : 05 : 10</span>
                                    </div>
                                </div>
                                <!--//onair-top-->
                                <!--product-list-->
                                <img src="//image-se.ycrowdy.com/20220602/CROWDY_202206021738450791_yiaOY.png/ycrowdy/resize/!340x!226" alt="..." class="img-responsive"
                                     style="height: 270px; width: 527px;">
                                <div class="product-list">
                                    <div class="pdthumb">

                                        <figure>
                                            <div class="figcaption">
                                                <a href="javascript:;">
                                                    <div class="pdname" aria-label="제품명" style="font-weight: bold; font-size: 16px; line-height: 1.38;">크라우딩 펀딩 내용 블라블라
                                                    </div>


                                                </a>
                                                <!--//pdinfo-->
                                                <!--함께방송중인상품-->


                                                <div class="multi">
                                                    <div class="pdprice" style="justify-content: space-between; margin-top: 80px;">
                                                        <div>
                                                        <span class="rateprice" aria-label="할인율이 적용된 가격">

                                                            <ins class="discount" aria-label="할인가"><em>5,454,000</em>원 펀딩</ins>
                                                        </span>
                                                        </div>
                                                        <div style="display: flex; align-items: center;">
                                                            <em class="rate" aria-label="할인율"  style="color:#002fa3;">5,454<i  style="color:#002fa3;">%</i></em>
                                                            <p style="margin-left:10px;">D-17</p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--//함께방송중인상품-->
                                            </div>
                                        </figure>
                                    </div>
                                </div>
                                <!--//product-list-->
                            </div>
                            <script type="text/javascript">
                                var ldtvEndTimeStrH = "10:39";

                                var dtvServerDtm;

                                if ('20220525103333' != '' && '20220525103333' != null) {
                                    dtvServerDtm = '20220525103333';
                                }

                                $(function () {
                                    if (ldtvEndTimeStrH && ldtvEndTimeStrH.length > 0) {
                                        clockHomeDtvH(dtvServerDtm);
                                    }

                                    // 비디오 초기화
                                    //setTimeout(function () {
                                    $("brodDtvArea video source").attr("src", 'https://dtvstreaming.hyundaihmall.com/newcjp3/_definst_/newcjpstream.smil/playlist.m3u8')
                                    var player = videojs($(".brodDtvArea video").get(0));
                                    //}, 1000);
                                });


                                function clockHomeDtvH(serverDtm) {

                                    var lbrdEndTime;
                                    if (serverDtm == undefined || serverDtm == null) {
                                        lbrdEndTime = new Date();
                                    } else {
                                        lbrdEndTime = new Date(serverDtm.replace(/([\d]{4})([\d]{2})([\d]{2})([\d]{2})([\d]{2})([\d]{2})/, '$2/$3/$1 $4:$5:$6'));
                                    }

                                    //var lbrdEndTime = new Date();
                                    var now = new Date();
                                    var lbrdEndTime = new Date();
                                    var lbrdEndTimeArray = ldtvEndTimeStrH.split(":");
                                    lbrdEndTime.setHours(lbrdEndTimeArray[0]);
                                    lbrdEndTime.setMinutes(lbrdEndTimeArray[1]);
                                    lbrdEndTime.setSeconds(0);

                                    var gap = (lbrdEndTime.getTime() - now.getTime()) / 1000;
                                    var leftTime = "";

                                    if (gap <= 0) {
                                        leftTime = "00 : 00 : 00";
                                        $('#dtvLeftTime').html(leftTime);
                                        $(".brodDtvArea .vjs-big-play-button").hide()
                                        $('#dtvLeftReload').show();
                                        return;
                                    }

                                    var hour = parseInt(gap / 3600);
                                    var min = parseInt((gap % 3600) / 60);
                                    var sec = parseInt(gap % 60);

                                    leftTime += ((hour < 10) ? "0" : "") + hour;
                                    leftTime += ((min < 10) ? " : 0" : " : ") + min;
                                    leftTime += ((sec < 10) ? " : 0" : " : ") + sec;

                                    $("#dtvLeftTime").html(leftTime);

                                    setTimeout("clockHomeDtvH()", 1000);
                                }

                                // 2021.04.06 문주성 > 온에어 ga태깅 제어
                                function onairDtvGaTagging(obj) {
                                    if ($(obj).children().first().attr('class').indexOf('vjs-user-active vjs-live') > -1
                                        || $(obj).children().first().attr('class').indexOf('vjs-live vjs-user-active') > -1) {
                                        var $slitmInfo = $(obj).closest('figure');
                                        setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"));
                                    }
                                }

                            </script>
                        </div>
                        <div style="max-width:473px;
                            height: 56px;
                            background-color: #002fa3;
                            cursor: pointer;
                            font-size: 22px;
                            font-weight: 700;
                            letter-spacing: -.3px;
                            color: #fff;
                            text-align: center;
                            line-height: 56px;
                            margin: 0 auto;
                            margin-top: -15px;
                            border-radius: 10px;" onclick="location.href='${contextPath}/fund/main'">펀딩 프로젝트 더 보기

                        </div>
<%--                        <div style="width: 426px; border: solid 3px #eaebed; border-radius: 4px; text-align: center;--%>
<%--                    height: 42px; cursor: pointer; margin: 0 auto; letter-spacing: -.5px; line-height: 41px;--%>
<%--                    display: flex; justify-content: center; background: white;">--%>
<%--                            <button type="button" style="color: #464646; font-family: 'sans-serif';">펀딩 프로젝트 더 보기</button>--%>
<%--                        </div>--%>
                    </div>

                    <script type="text/javascript">
                        if ($("#brodMainFullBexArea .onair-box").length == 0) {
                            $("#brodMainFullBexArea").hide();
                        }
                    </script>
                    <div class="home-section pd-tvalarm webcont-slide" id="hm2tvAlrimiArea" style="display: none">
                    </div>
                    <script type="text/javascript">
                        $(function () {
                            hm2tvAlrimiAreaLoad();
                        });
                    </script>
                    <div class="home-section display-wrap">

                        <!--딜배너 영역-->

                        <div class="top-banner-wrap">
                            <div class="titArea"><h3>이번주 혜택 가득 행사</h3></div>
                            <div class="sliderwrap slick-initialized slick-slider isArrows slick-paging slider-transitioning"
                                 data-modules-slick="arrows:true;dots:false;autoplay:true;paging:true;infinite:true;slidesToShow:1;">
                                <button class="slick-prev slick-arrow" aria-label="Previous" type="button" style="" onclick="plusSlides(-1)">
                                    Previous
                                </button>
                                <div class="slick-list draggable">
                                    <div class="slick-track">
                                        <div class="slick-slide" style="width: 711px;">
                                            <div>
                                                <form id="hitForm" method="get" action="${contextPath}/exhibition/hit">
                                                    <div class="items_main" style="width: 100%; vertical-align: top;">
                                                        <input type="hidden" name="exhibit_num" value="3">
                                                    </div>
                                                </form>
                                                <img class="img_1" src="${contextPath}/resources/img/exhibitions/mainImg_3.jpeg" onclick="exhibit_3()"/>
                                            </div>
                                        </div>
                                        <div class="slick-slide" style="width: 711px;" >
                                            <div>
                                                <form id="cosmeticForm" method="get" action="${contextPath}/exhibition/cosmetics">
                                                    <div class="items_main" style="width: 100%; vertical-align: top;">
                                                        <input type="hidden" name="exhibit_num" value="2">
                                                    </div>
                                                </form>
                                                <img class="img_1" src="${contextPath}/resources/img/exhibitions/mainImg_4.jpeg" onclick="exhibit_2()"/>
                                            </div>
                                        </div>
                                        <div class="slick-slide" style="width: 711px;">
                                            <div>
                                                <form id="euroForm" action="${contextPath}/exhibition/euro_exhibit" method="get">
                                                    <div class="items_main" style="width: 100%; vertical-align: top;">
                                                        <input type="hidden" name="exhibit_num" value="1">
                                                    </div>
                                                </form>
                                                <img class="img_1" src="${contextPath}/resources/img/exhibitions/mainImg_5.jpeg" onclick="exhibit_1();"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="slick-next slick-arrow" aria-label="Next" type="button" style="" onclick="plusSlides(1)">Next
                                </button>
                                <div class="slick-slidetotal" style=""><em id="current_slide">1</em><strong
                                        class="total">3</strong></div>
                            </div>

                            <button type="button" class="btn btn-all lyopen" data-modules-modal="target:#modalTvFull;">
                                <span>전체</span><i class="icon"></i></button>

                        </div>

                        <!--유로 기획전 데이터 전송-->
<%--                        <script>--%>
<%--                            function euro_exhibit(){--%>
<%--                                var exhibit_num = $('#exhibit_num').val();--%>
<%--                                console.log(exhibit_num);--%>
<%--                                var csrfHeaderName = "${_csrf.headerName}";--%>
<%--                                var csrfTokenValue = "${_csrf.token}";--%>
<%--                                $.ajax({--%>
<%--                                    url:'${contextPath}/exhibition/euro_exhibit',--%>
<%--                                    type:'post',--%>
<%--                                    data: {exhibit_num:exhibit_num},--%>
<%--                                    dataType:'int',--%>
<%--                                    beforeSend:function (xhr){--%>
<%--                                        xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);--%>
<%--                                    },--%>
<%--                                    success:function (data){--%>
<%--                                        window.location.href="${contextPath}/exhibition/euro_exhibit";--%>
<%--                                    }--%>
<%--                                })--%>
<%--                            }--%>
<%--                        </script>--%>

                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('div#modalTvFull .display-wrap').html($("div.top-banner-wrap div.slick-slide:not(.slick-cloned) a").clone(true).wrap('<div class="items"></div>').parent());
                            });
                        </script>

                        <script>
                            function exhibit_1(){
                                document.getElementById('euroForm').submit();
                            }
                            function exhibit_2(){
                                document.getElementById('cosmeticForm').submit();
                            }
                            function exhibit_3(){
                                document.getElementById('hitForm').submit();
                            }
                        </script>


                        <script>
                            var slideIndex = 1;
                            showSlides(slideIndex);
                            function plusSlides(n){
                                showSlides(slideIndex+=n);
                                const resultElement = document.getElementById('current_slide');
                                // var currentElement = $('.current_slide').html();
                                var currentElement = resultElement.innerText;
                                console.log("n : "+n);
                                console.log("number : "+currentElement);
                                if(currentElement < 3 && currentElement > 1){
                                    if(n == 1){
                                        currentElement = parseInt(currentElement) +1;
                                    }else if(n == -1){
                                        currentElement = parseInt(currentElement) -1;
                                    }
                                }else if(currentElement == 1){
                                    if(n == 1){
                                        currentElement = parseInt(currentElement) +1;
                                    }else if(n == -1){
                                        currentElement = 3;
                                    }
                                }else if(currentElement == 3){
                                    if(n == 1){
                                        currentElement = 1;
                                    }else if(n == -1){
                                        currentElement = parseInt(currentElement) -1;
                                    }
                                }

                                resultElement.innerText = currentElement;
                            }
                            function showSlides(n){
                                var i;
                                var slides = document.getElementsByClassName("img_1");
                                console.log(slides);
                                if (n > slides.length) {slideIndex = 1}
                                if (n < 1) {slideIndex = slides.length}
                                for(i = 0 ; i < slides.length ; i++){
                                    slides[i].style.display = "none";
                                }
                                slides[slideIndex-1].style.display = "block";
                            }

                            var slideIndex_side = 1;
                            showSlides_side(slideIndex_side);

                            function plusSlides_side(n){
                                showSlides_side(slideIndex_side+=n);
                                console.log(n);
                                const resultElement = document.getElementById('current_side');
                                // var currentElement = $('.current_slide').html();
                                var currentElement = resultElement.innerText;
                                console.log(currentElement);
                                if(currentElement == 1){
                                    if(n==1){
                                        currentElement = 2;
                                    }else{
                                        currentElement = 2;
                                    }
                                }else if(currentElement ==2){
                                    if(n==1){
                                        currentElement = 1;
                                    }else{
                                        currentElement = 1;
                                    }
                                }
                                resultElement.innerText = currentElement;
                            }

                            function showSlides_side(n){
                                var i;
                                var slides_side = document.getElementsByClassName("slide_img");
                                console.log(slides_side);
                                if (n > slides_side.length) {slideIndex_side = 1}
                                if (n < 1) {slideIndex_side = slides_side.length}
                                for(i = 0 ; i < slides_side.length ; i++){
                                    slides_side[i].style.display = "none";
                                }
                                slides_side[slideIndex_side-1].style.display = "block";
                            }
                        </script>


                        <!--//딜배너 영역-->
                        <!--이달의 혜택 hm2tv_evicon 없는 경우에 display:none-->

                        <div class="month-benefit-wrap">
                            <div class="titArea"><h3>이달의 혜택</h3></div>
                            <div class="sliderwrap slick-initialized slick-slider isArrows slick-paging"
                                 data-modules-slick="arrows:true;paging:true;dots:false;infinite:true;">
                                <button class="slick-prev slick-arrow" aria-label="Previous" type="button" style="" onclick="plusSlides_side(-1)">
                                    Previous
                                </button>
                                <div class="slick-list draggable">
                                    <div class="slick-track"
                                         style="opacity: 1; width: 1192px;">
                                        <div style="width: 298px;">
                                            <div>
                                                <ul class="slide_img" style="width: 100%; vertical-align: top;">

                                                    <li>
                                                        <div class="items">
                                                            <img class="img_2" src="${contextPath}/resources/img/exhibitions/side_1.jpeg"/>
                                                        </div>
                                                    </li>


                                                    <li>
                                                        <div class="items">
                                                            <img class="img_2" src="${contextPath}/resources/img/exhibitions/side_2.jpeg"/>
                                                        </div>
                                                    </li>


                                                    <li>
                                                        <div class="items">
                                                            <img class="img_2" src="${contextPath}/resources/img/exhibitions/side_3.jpeg"/>
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>
                                        </div>
                                        <div style="width: 298px;">
                                            <div>
                                                <ul class="slide_img" style="width: 100%; vertical-align: top; display: none">
                                                    <li>
                                                        <div class="items">
                                                            <img class="img_2" src="${contextPath}/resources/img/exhibitions/side_4.jpeg"/>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="items">
                                                            <img class="img_2" src="${contextPath}/resources/img/exhibitions/side_5.jpeg"/>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="items">
                                                            <img class="img_2" src="${contextPath}/resources/img/exhibitions/side_6.jpeg"/>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="slick-next slick-arrow" aria-label="Next" type="button" style="" onclick="plusSlides_side(1)">Next
                                </button>
                                <div class="slick-slidetotal" style=""><em id="current_side">1</em><strong
                                        class="total" value="">2</strong></div>
                            </div>
                        </div>

                        <!--//이달의 혜택-->
                    </div>
                    <div class="home-section point" style="display:none">
                        <div class="point-box">
                            <div class="info-txt">
                                <i class="icon"><img src="//image.hmall.com/p/img/co/icon/ico-extialarm.png"
                                                     alt="혜택 아이콘"></i>
                                <p><strong>사용기한 7일 남은 혜택</strong>을 알려드려요!</p>
                            </div>
                            <ul class="info-list">
                                <li class="upnt" style="display: none;">
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, '/p/mpe/selectUPntTabPage.do', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                       ga-custom-creative="소멸예정 H.Point" ga-custom-id="" ga-custom-etc="urlAction"
                                       tag-comment="GA요청:홈쇼핑탭:6">

                                        <span class="tit">소멸예정 H.Point</span>
                                        <span class="txt point upnt"><strong>0</strong>P</span>
                                    </a>
                                </li>
                                <li class="svmt" style="display: none;">
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, '/p/mpe/selectHPntTabPage.do', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                       ga-custom-creative="소멸예정 적립금" ga-custom-id="" ga-custom-etc="urlAction"
                                       tag-comment="GA요청:홈쇼핑탭:6">
                                        <span class="tit">소멸예정 적립금</span>
                                        <span class="txt svmt"><strong>0</strong>원</span>
                                    </a>
                                </li>
                                <li class="copnCnt" style="display: none;">
                                    <a href="/p/mpe/selectCopnList.do">
                                    </a><a href="javascript:;"
                                           onclick="gaTagging(this, '/p/mpe/selectCopnList.do', '', '');"
                                           ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                           ga-custom-creative="소멸예정 쿠폰" ga-custom-id="" ga-custom-etc="urlAction"
                                           tag-comment="GA요청:홈쇼핑탭:6">
                                    <span class="tit">소멸예정 쿠폰</span>
                                    <span class="txt copnCnt"><strong>0</strong>장</span>
                                </a>
                                </li>
                                <li class="evalCnt" style="display: none;">
                                    <a href="javascript:;"
                                       onclick="gaTagging(this, '/p/mpb/selectItemEvalAtclListPagingByCondtion.do', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="소멸예정알림"
                                       ga-custom-creative="작성가능 상품평" ga-custom-id="" ga-custom-etc="urlAction"
                                       tag-comment="GA요청:홈쇼핑탭:6">
                                        <span class="tit">작성가능 상품평</span>
                                        <span class="txt evalCnt"><strong>0</strong>건</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <script>
                        //loading alarm info
                        $(document).ready(function () {

                            // 값을 채우고 보여준다.
                            function fillPoint(data) {

                                if (data.evalCnt > 0) $('div.point span.evalCnt strong').text(data.evalCnt.toLocaleString()).closest('li').show();
                                if (data.copnCnt > 0) $('div.point span.copnCnt strong').text(data.copnCnt.toLocaleString()).closest('li').show();
                                if (data.svmt > 0) $('div.point span.svmt strong').text(data.svmt.toLocaleString()).closest('li').show();
                                if (data.upnt > 0) $('div.point span.upnt strong').text(data.upnt.toLocaleString()).closest('li').show();

                                if ($('div.point li').filter(function () {
                                    return $(this).css('display') != 'none';
                                }).length > 0)
                                    $('div.point').show();
                            }


                            $('div.point').hide();
                            $('div.point li').hide();

                            if (isLoginYn == "Y") {
                                $.ajax({
                                    type: "GET"
                                    , url: '/p/mblHomeCustAlarm.do'
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {

                                        fillPoint(data);

                                    }
                                    , error: function (e) {
                                        // default test or sample
                                        data = {svmt: 0, evalCnt: 0, upnt: 0, copnCnt: 0};
                                        fillPoint(data);
                                    }
                                });
                            }
                        });
                        //for chrome debugger
                        //# sourceURL=script-for-broad-loading-alarm.js
                    </script>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jjimList();
                            listAlrimiWithItem();
                        });


                        var rgx1 = /\D/g;
                        var rgx2 = /(\d+)(\d{3})/;

                        // 금액 타입 체크
                        function getNumber(obj) {
                            var num01, num02;
                            num01 = obj.value;
                            num02 = num01.replace(rgx1, "");
                            num01 = setComma(num02);
                            obj.value = num01;
                        }

                        // 콤마 입력 변환
                        function setComma(inNum) {
                            var outNum;
                            outNum = inNum;
                            while (rgx2.test(outNum)) {
                                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
                            }
                            return outNum;
                        }

                        //개인화 찜, 알리미
                        var personalJJimData;
                        var personalAlrimiData;

                        /**
                         * 로그인 사용자 찜 리스트 조회 및 처리
                         */
                        function jjimList() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/mpc/selectWishList.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalJJimData = data.result;
                                        personalJJimSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 알림 리스트 조회 및 처리
                         */
                        function listAlrimiWithItem() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/bma/listAlrimiWithItem.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalAlrimiData = data.result;
                                        personalAlrimiSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 찜 처리
                         */
                        function personalJJimSet() {

                            var $alimlike = $('div.alimlike');
                            $alimlike.find('a.btn-like.on').removeClass('on');

                            if (!personalJJimData) {
                                return;
                            }

                            var jjimCnt = personalJJimData.length;

                            if (jjimCnt > 0) {
                                for (var i = 0; i < jjimCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var $btnlike = $($(this).find('a.btn-like')[0]);
                                        var slitmCd = $(this).data('slitmcd');

                                        if (!$btnlike.hasClass('on') && slitmCd == personalJJimData[i]) {
                                            $btnlike.addClass('on');
                                        }
                                    });
                                }
                            }
                        }

                        /*
                         * 로그인 사용자 알림 처리
                         */
                        function personalAlrimiSet() {
                            var $alimlike = $('div.alimlike');

                            // clean
                            $alimlike.find('a.btn-alim.on').removeClass('on');

                            if (!personalAlrimiData) {
                                return;
                            }

                            var alrimiCnt = personalAlrimiData.length;

                            /* 일반 상품 알림 처리 */
                            if ($alimlike.length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var bsitmCd = $(this).data('bsitmcd');
                                        var $btnalim = $($(this).find('a.btn-alim')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }
                                    });
                                }
                            }

                            /* PC 편성표 특화 알림 처리 */
                            // clean
                            $alimlike.find('button.on').removeClass('on');

                            if ($alimlike.find('button').length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {

                                    if (null == personalAlrimiData[i].bsitmCd)
                                        continue;

                                    // console.log('알림 활성화 할 내 구독 : ' + personalAlrimiData[i].bsitmCd);

                                    // 찜. 알리미
                                    $alimlike.each(function (ti, tv) {
                                        var bsitmCd = $(tv).attr('data-bsitmcd');
                                        var $btnalim = $($(tv).find('button')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }

                                    });
                                }
                            }
                        }

                        /*
                         * 호출 URL에 따른 _trk_clickTrace 처리
                         */
                        function dp_clickTrace(type) {
                            try {
                                // 특정 URL 포함이면 필요시 추가
                                if (loca_contain('pde/search.do')) {
                                    trk_title('검색결과_상품리스트_찜', '검색결과_상품리스트_알리미', type);
                                }
                            } catch (e) {
                            }
                        }

                        /*
                         *  url에 포함여부
                         */
                        function loca_contain(url) {
                            return location.href.indexOf(url) > -1;
                        }

                        /*
                         * @ggimTitle 찜
                         * @alimiTitle 알리미
                         */
                        function trk_title(ggimTitle, alimiTitle, type) {
                            var title;
                            if (type == 'ggim') {
                                title = ggimTitle;
                            } else if (type == 'alimi') {
                                title = alimiTitle;
                            }
                            console.log('trk_title', title);
                            _trk_clickTrace('EVT', title);
                        }


                        /*
                         * 2020.12.04 icj 찜하기
                         */
                        var goActionCnt = 0; // 두번 클릭 방지
                        function goChioceProcess(itemType, venCd, venItemCd, slitmCd, event, obj) {
                            goActionCnt++;

                            dp_clickTrace('ggim');

                            if (event.stopPropagation) {
                                event.stopPropagation(); // FF
                            } else {
                                event.cancelBubble = true; // IE
                            }
                            if (!event.preventDefault) {
                                event.returnValue = false; //IE
                            } else {
                                event.preventDefault();
                            }

                            if ((venCd != null && venCd == '009741' && venItemCd != null)) {
                                alert("기프티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '008117' && venItemCd != null)) {
                                alert("기프티쇼 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009014' && venItemCd != null)) {
                                alert("큐피콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009428' && venItemCd != null)) {
                                alert("멀티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if (itemType == '04') {
                                alert("이 상품은 전문상담원과 상담 후 구매하실 수 있습니다.\n상담을 원하시면 080-000-0000으로 문의하여 주시기 바랍니다.\n전문상담원이 친절히 안내해 드리겠습니다.");
                                return;
                            }

                            if (isLogin() != 'true') {
                                if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                    openLoginPopup(location.href);
                                }
                                return false;
                            }

                            if (goActionCnt > 1) return;

                            var params = "chkedSlitmCdUitmCds=" + slitmCd;

                            //파라미터 sectId 가 존재 할경우 sectId 전달
                            var sectId = "";
                            if (sectId == "" || sectId == "0") {
                                sectId = "";
                            }

                            // 2020.11.19 icj PDAItemPtcMst.jsp zzimDone 참조. 2020.12.03 삭제기능 포함
                            $.ajax({
                                url: "/p/mpc/insertGgim.do"
                                , dataType: "json"
                                , data: params
                                , success: function (data) {
                                    goActionCnt = 0;
                                    jjimList();
                                    var gaAction;
                                    if (data.insertResult != 'undefined' && data.insertResult == '0') {
                                        alert("찜하기가 불가능한 상품입니다.");
                                        //alert("판매중인 단품이 없어 찜하지 못했습니다.");
                                        return true;
                                    } else if (data.insertResult != 'undefined' && data.insertResult == '1') {
                                        $(event.target).removeClass("on");
                                        alert("찜목록에서 삭제 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜취소';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜취소', jjimTag);
                                            }

                                        } catch (e) {
                                            alert(e);
                                        }
                                        return true;
                                    } else if (data.custGGimCnt >= 200) {
                                        alert("더 이상 찜 할 수 없습니다. 찜리스트에서 오래된 상품을 삭제 후 다시 이용해 주세요.");
                                        return true;
                                    } else {
                                        if (data != null && data.needLogin) {
                                            // 세션 로그인이 풀려서 로그인이 안된 경우
                                            if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                                openLoginPopup(location.href);
                                            }
                                            return false;
                                        }
                                        $(event.target).addClass("on");
                                        alert("찜 목록에 추가 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜', jjimTag);
                                            }

                                        } catch (e) {
                                        }
                                    }
                                },
                                error: function () {
                                    console.log("json error");
                                    goActionCnt = 0;
                                }
                            });
                        }

                        /*
                         * 2020.12.01 icj 방송 알리미
                         * PDAItemPtcMst.jsp bitemAlrimPopupNew 참조
                         */
                        function bitemAlrimPopupTrk(slitmNm, slitmCd, bsitmCd) {
                            if (isLogin() != 'true') {
                                openLoginPopup(location.href);
                                return false;
                            }

                            dp_clickTrace('alimi');


                            // 방송 알리미 팝업
                            // addBitemAlrimCommonPopupNew(slitmNm, slitmCd, bsitmCd);  //AS-IS
                            alimPopup(slitmNm, slitmCd, bsitmCd, function (w) {
                                listAlrimiWithItem();
                            });
                        }

                        function alimPopup(slitmNm, slitmCd, bsitmCd, callback) {
                            var w = openPopup("/p/bma/editBitmAlrimNewPup.do?slitmNm=" + encodeURIComponent(slitmNm) + "&slitmCd=" + slitmCd + "&bsitmCd=" + bsitmCd,
                                "", 600, 700, "yes", $(window).width(), $(window).height());

                            var wInterval = setInterval(function () {
                                if (w.closed) {
                                    //             console.log('닫힘');
                                    callback(w);
                                    clearInterval(wInterval);
                                } else {
                                    //             console.log('열림')
                                }
                            }, 1000);
                        }


                        function alimLayer() {
                            $.ajax({
                                type: "POST"
                                , url: "/p/bma/editBitmAlrimNewPup.do"
                                , data: {
                                    returnUrl: location.href,
                                    slitmCd: slitmCd,
                                    slitmNm: slitmNm
                                }
                                , dataType: "html"
                                , async: false
                                , success: function (data) {
                                    if ($("#bitmAlrimLayer").length == 0) {
                                        var html = '<div class="layer-popup brand" id="bitmAlrimLayer">';
                                        html += '<div class="pop-wrap">';
                                        html += '<div class="pop-content-wrap">';
                                        html += '<strong class="pop-title">방송 알리미</strong></div>';
                                        html += '<div class="pop-content" id="bitmAlrimBody"></div>';
                                        html += '<button class="btn-close" id="bitmAlrimCloseBtn"><span>팝업 닫기</span></button>';
                                        html += '</div>';
                                        $('body').append(html);

                                        $('#bitmAlrimCloseBtn').click(function () {
                                            $("#bitmAlrimLayer").hide();
                                        });
                                    }
                                    $("#bitmAlrimBody").html(data);
                                    $("#bitmAlrimLayer").show();
                                }
                                ,
                                error: function () {
                                    alert('방송알리미 신청시 오류가 발생했습니다. 잠시후 다시 시도하세요.');
                                    console.log("json error");
                                }
                            });
                        }

                        //상품상세이동
                        function goItemDetail(url, obj, target) {
                            var $slitmInfo = $(obj).closest('.pdthumb');
                            if ($slitmInfo) {
                                if ($slitmInfo.hasClass('comingsoon')) {
                                    alert('아직 판매중이 아닙니다.');
                                    return false;
                                }
                                /*
                                if($slitmInfo.hasClass('soldOut')){
                                    alert('품절입니다.');
                                    return false;
                                }
                                */
                            }

                            /* ga tagging */
                            try {
                                if ($slitmInfo && $slitmInfo.attr("ga-custom-title")) {
                                    setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"))
                                }
                            } catch (e) {
                                console.log(e);
                            }

                            if (target) {
                                window.open(url, target);
                            } else {
                                window.location.href = url;
                            }

                        }

                        function personalSet() {
                            personalJJimSet();
                            personalAlrimiSet();
                        }

                        // 방송톡
                        function brodChatCheck() {

                            //방송톡 가능여부
                            $.ajax({
                                type: "GET",
                                //url: "https://marsheg.sweettracker.net:4443/user/api/is_aviliable_chat/format/json",
                                url: "https://broadeg.happytalk.io/user/api/is_aviliable_chat/format/json",
                                success: function (result) {
                                    if (result.code == 'success') {
                                        // 로그인 체크 및 팝업창 열기
                                        if (isLogin() == 'true') {
                                            var screenWidth = $(window).width();
                                            var screenHeight = $(window).height();
                                            var width = 480;
                                            var height = 700;
                                            var left = (screenWidth - width) / 2;
                                            var top = (screenHeight - height) / 2;
                                            var url = "https://www.hmall.com/p/bmc/brodChatPup.do";
                                            var popName = "brodChatPup";
                                            var popOption = "height=" + height + ", width=" + width + ", left=" + left + ", top=" + top + ", fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                                            window.open(url, popName, popOption);
                                        } else {
                                            openLoginPopup("/p/bmc/brodPordPbdv.do");
                                            return false;
                                        }
                                    } else {
                                        //채팅방 상태가 좋지 않으면 오류메시지 표시.
                                        alert(result.results);
                                    }
                                },
                                async: false,
                                dataType: 'jsonp',
                                crossDomain: true
                            });
                        }

                        // 기획전 템플릿 다운로드 쿠폰 적용
                        var roulette_flag = 0; //계속 클릭 방지
                        function DirectCopnDownload(prmoNo) {

                            var now_urls = location.href;
                            var returnUrl = now_urls.split('hmall.com');

                            if (isLogin() == 'true') {

                                if (roulette_flag != 0) {
                                    return false;
                                }
                                roulette_flag = 1;

                                $.ajax({
                                    type: "post"
                                    , url: "/pevent/eva/evntSectCopnDownLoad.do"
                                    , dataType: "json"
                                    , data: {prmoNo: prmoNo}
                                    , async: false
                                    , success: function (data) {
                                        if (data.save) {
                                            roulette_flag = 0;
                                            alert("쿠폰이 발행되었습니다.");
                                        } else {
                                            roulette_flag = 0;
                                            if (data.errorMsg == "UPNT_REGISTER") {
                                                if (confirm("H.Point 통합회원 가입 후 이벤트 응모 가능합니다.\nH.Point 전환가입 하시겠습니까?")) {
                                                    window.location.href = "/p/cua/registUpnt.do";
                                                } else {
                                                    return false;
                                                }
                                            } else {
                                                if (data.otp == "no") {
                                                    openPopup("/pevent/eva/evaEvntSmsSelfCertPup.do?btn=agree&returnUrl=" + returnUrl[1], 'smsSendPup', "500", "611", null, $(window).width(), $(window).height());
                                                } else {
                                                    alert(data.errorMsg);
                                                    return false;
                                                }
                                            }
                                        }
                                    }
                                    , error: function (request, status, error) {
                                        if (confirm('응모시 오류가 발생했습니다.')) {
                                        }
                                        roulette_flag = 0;
                                    }
                                });
                                return false;
                            } else {
                                openLoginPopup(returnUrl[1]);
                                return false;
                            }
                        }

                        //for chrome debugger
                        //# sourceURL=script-for-main-dprenew.js
                    </script>
                    <div class="home-section mytem" id="myTemArea" style="">
                        <div class="titArea">
                            <h3>나에게 딱! 마이템</h3>
                        </div>


                        <!-- 이 카테고리를 본 고객님들이 본 상품 -->


                        <div class="pdlist-wrap col5">
                            <div data-modules-slick="paging:true;fade:false;dots:false;arrows:true;"
                                 class="slick-initialized slick-slider isArrows slick-paging">
                                <button class="slick-prev slick-arrow slick-disabled" aria-label="Previous"
                                        type="button" aria-disabled="true" style="">Previous
                                </button>
                                <div class="slick-list draggable">
                                    <div class="slick-track"
                                         style="opacity: 1; width: 2162px; transform: translate(0px, 0px);">
                                        <div class="slick-slide slick-current slick-active" data-slick-index="0"
                                             aria-hidden="false" style="width: 1081px;">
                                            <div>
                                                <div class="items"
                                                     style="width: 100%; display: inline-block; vertical-align: top;">
                                                    <ul id="mainProduct">

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="slick-slide" data-slick-index="1" aria-hidden="true" tabindex="-1"
                                             style="width: 1081px;">
                                            <div>
                                                <div class="items"
                                                     style="width: 100%; display: inline-block; vertical-align: top;">
                                                    <ul>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2138703518&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2138703518_CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/5/3/70/38/2138703518_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종">CK
                                                                        퍼포먼스 22SS 남성 올데이 라운드셔츠 4종
                                                                    </div>
                                                                    <div class="pdprice">
    <span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>87,200</em>원</p>
    </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2138703518&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2138703518_CK 퍼포먼스 22SS 남성 올데이 라운드셔츠 4종"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2137173064&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2137173064_[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/0/3/17/37/2137173064_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종">
                                                                        [DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종
                                                                    </div>
                                                                    <div class="pdprice">
    <span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>71,200</em>원</p>
    </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2137173064&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2137173064_[DKNY GOLF] 22SS 여성 퍼포먼스 반팔 카라티 1종"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139997638&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139997638_[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) "
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/6/7/99/39/2139997638_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) "
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) ">
                                                                        [브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성)
                                                                    </div>
                                                                    <div class="pdprice">
    <span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>159,000</em>원</p>
    </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139997638&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139997638_[브라도르] MADE IN ITALY 22SS 빈티지 소가죽 X자 샌들 (여성) "
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139810241&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139810241_메피스토(MEPHISTO) 컴포트 플랫슈즈"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/2/0/81/39/2139810241_0.jpg?RS=300x300&amp;AR=0"
                                                                         alt="메피스토(MEPHISTO) 컴포트 플랫슈즈"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="메피스토(MEPHISTO) 컴포트 플랫슈즈">
                                                                        메피스토(MEPHISTO) 컴포트 플랫슈즈
                                                                    </div>
                                                                    <div class="pdprice">
    <span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>159,000</em>원</p>
    </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2139810241&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2139810241_메피스토(MEPHISTO) 컴포트 플랫슈즈"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>


                                                        <li class="pdthumb">
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2140320762&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               onclick="gaTagging(this, '', '', '');" class="item-box"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2140320762_[플로레센스]썸머니트케이프2종(블랙+베이지)"
                                                               ga-custom-name="메인_홈쇼핑탭"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1">
                                                                <div class="thumb">
                                                                    <img src="https://image.hmall.com/static/7/0/32/40/2140320762_0.png?RS=300x300&amp;AR=0"
                                                                         alt="[플로레센스]썸머니트케이프2종(블랙+베이지)"
                                                                         onerror="noImage(this, 'https://image.hmall.com/p/img/co/noimg-thumb.png?RS=300x300&amp;AR=0')">

                                                                </div>
                                                                <div class="figcaption">
                                                                    <div class="pdname"
                                                                         aria-label="[플로레센스]썸머니트케이프2종(블랙+베이지)">
                                                                        [플로레센스]썸머니트케이프2종(블랙+베이지)
                                                                    </div>
                                                                    <div class="pdprice">
    <span class="rateprice" aria-label="할인율이 적용된 가격">
    <p class="discount" aria-label="할인가"><em>39,800</em>원</p>
    </span>
                                                                    </div>

                                                                </div>
                                                            </a>
                                                            <a href="/p/pda/itemPtc.do?slitmCd=2140320762&amp;sectId=&amp;bdTrkArea=34&amp;bdTrkAlgrth=11&amp;bdTrkOpt=A"
                                                               class="hoverview" target="_blank"
                                                               onclick="gaTagging(this, '', '', '');"
                                                               ga-custom-position="마이템_추천"
                                                               ga-custom-id="2140320762_[플로레센스]썸머니트케이프2종(블랙+베이지)"
                                                               ga-custom-creative="BDA_bdTrkArea=34&amp;bdTrkAlgrth=11_자동"
                                                               tabindex="-1"><i class="icon"></i>새창열기</a>
                                                            <!--// 새창열기 a태그로 변경 후 위치이동 -->
                                                        </li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button class="slick-next slick-arrow" aria-label="Next" type="button" style=""
                                        aria-disabled="false">Next
                                </button>
                                <div class="slick-slidetotal" style=""><em class="current">1</em><strong
                                        class="total">2</strong></div>
                            </div>
                        </div>


                        <!--// 이 카테고리를 본 고객님들이 본 상품 -->
                    </div>
                    <script type="text/javascript">
                        // MYTEM 추천영역 셋팅
                        rcmmItemMyTem();
                    </script>
                    <div class="home-section banner-slider big-banner">
                        <ul data-modules-slick="paging:false;dots:true;arrows:false;autoplay:true;infinite:true;"
                            class="slick-initialized slick-slider slick-single">
                            <div class="slick-list draggable">
                                <div class="slick-track"
                                     style="opacity: 1; width: 1081px; transform: translate(0px, 0px);">
                                    <div class="slick-slide slick-current slick-active" data-slick-index="0"
                                         aria-hidden="false" style="width: 1081px;">
                                        <div>
                                            <li class="items"
                                                style="background-color: rgb(255, 153, 115); width: 100%; display: inline-block; vertical-align: top;">


                                                <a href="javascript:;"
                                                   onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2718492&amp;eventCode=HHS20', '', '');"
                                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭"
                                                   ga-custom-position="광고영역배너" ga-custom-creative="현대홈쇼핑 현대카드"
                                                   ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:14"
                                                   tabindex="0">


                                                    <div class="info-box">


                                                        <span class="tit">현대홈쇼핑 현대카드</span>


                                                        <p class="txt">현대홈쇼핑에서 첫 이용시 <br>3만원 할인<br>(2022.05.01~2022.05.31)
                                                        </p>

                                                    </div>
                                                    <div class="thumb">
                                                        <img src="https://image.hmall.com/MH/MH002/20220430/230553/0112_big2_ff9973.jpg"
                                                             alt=""
                                                             onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">

                                                    </div>
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ul>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            jjimList();
                            listAlrimiWithItem();
                        });


                        var rgx1 = /\D/g;
                        var rgx2 = /(\d+)(\d{3})/;

                        // 금액 타입 체크
                        function getNumber(obj) {
                            var num01, num02;
                            num01 = obj.value;
                            num02 = num01.replace(rgx1, "");
                            num01 = setComma(num02);
                            obj.value = num01;
                        }

                        // 콤마 입력 변환
                        function setComma(inNum) {
                            var outNum;
                            outNum = inNum;
                            while (rgx2.test(outNum)) {
                                outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
                            }
                            return outNum;
                        }

                        //개인화 찜, 알리미
                        var personalJJimData;
                        var personalAlrimiData;

                        /**
                         * 로그인 사용자 찜 리스트 조회 및 처리
                         */
                        function jjimList() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/mpc/selectWishList.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalJJimData = data.result;
                                        personalJJimSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 알림 리스트 조회 및 처리
                         */
                        function listAlrimiWithItem() {
                            if (isLogin() == 'true') {
                                $.ajax({
                                    type: "post"
                                    , url: "/p/bma/listAlrimiWithItem.do"
                                    , dataType: "json"
                                    , async: true
                                    , success: function (data) {
                                        personalAlrimiData = data.result;
                                        personalAlrimiSet();
                                    },
                                    error: function () {
                                    }
                                });
                            }
                        }

                        /*
                         * 로그인 사용자 찜 처리
                         */
                        function personalJJimSet() {

                            var $alimlike = $('div.alimlike');
                            $alimlike.find('a.btn-like.on').removeClass('on');

                            if (!personalJJimData) {
                                return;
                            }

                            var jjimCnt = personalJJimData.length;

                            if (jjimCnt > 0) {
                                for (var i = 0; i < jjimCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var $btnlike = $($(this).find('a.btn-like')[0]);
                                        var slitmCd = $(this).data('slitmcd');

                                        if (!$btnlike.hasClass('on') && slitmCd == personalJJimData[i]) {
                                            $btnlike.addClass('on');
                                        }
                                    });
                                }
                            }
                        }

                        /*
                         * 로그인 사용자 알림 처리
                         */
                        function personalAlrimiSet() {
                            var $alimlike = $('div.alimlike');

                            // clean
                            $alimlike.find('a.btn-alim.on').removeClass('on');

                            if (!personalAlrimiData) {
                                return;
                            }

                            var alrimiCnt = personalAlrimiData.length;

                            /* 일반 상품 알림 처리 */
                            if ($alimlike.length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {
                                    // 찜. 알리미
                                    $alimlike.each(function () {
                                        var bsitmCd = $(this).data('bsitmcd');
                                        var $btnalim = $($(this).find('a.btn-alim')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }
                                    });
                                }
                            }

                            /* PC 편성표 특화 알림 처리 */
                            // clean
                            $alimlike.find('button.on').removeClass('on');

                            if ($alimlike.find('button').length > 0 && alrimiCnt > 0) {
                                for (var i = 0; i < alrimiCnt; i++) {

                                    if (null == personalAlrimiData[i].bsitmCd)
                                        continue;

                                    // console.log('알림 활성화 할 내 구독 : ' + personalAlrimiData[i].bsitmCd);

                                    // 찜. 알리미
                                    $alimlike.each(function (ti, tv) {
                                        var bsitmCd = $(tv).attr('data-bsitmcd');
                                        var $btnalim = $($(tv).find('button')[0]);

                                        if (null != bsitmCd && bsitmCd == personalAlrimiData[i].bsitmCd) {
                                            $btnalim.addClass('on');
                                        }

                                    });
                                }
                            }
                        }

                        /*
                         * 호출 URL에 따른 _trk_clickTrace 처리
                         */
                        function dp_clickTrace(type) {
                            try {
                                // 특정 URL 포함이면 필요시 추가
                                if (loca_contain('pde/search.do')) {
                                    trk_title('검색결과_상품리스트_찜', '검색결과_상품리스트_알리미', type);
                                }
                            } catch (e) {
                            }
                        }

                        /*
                         *  url에 포함여부
                         */
                        function loca_contain(url) {
                            return location.href.indexOf(url) > -1;
                        }

                        /*
                         * @ggimTitle 찜
                         * @alimiTitle 알리미
                         */
                        function trk_title(ggimTitle, alimiTitle, type) {
                            var title;
                            if (type == 'ggim') {
                                title = ggimTitle;
                            } else if (type == 'alimi') {
                                title = alimiTitle;
                            }
                            console.log('trk_title', title);
                            _trk_clickTrace('EVT', title);
                        }


                        /*
                         * 2020.12.04 icj 찜하기
                         */
                        var goActionCnt = 0; // 두번 클릭 방지
                        function goChioceProcess(itemType, venCd, venItemCd, slitmCd, event, obj) {
                            goActionCnt++;

                            dp_clickTrace('ggim');

                            if (event.stopPropagation) {
                                event.stopPropagation(); // FF
                            } else {
                                event.cancelBubble = true; // IE
                            }
                            if (!event.preventDefault) {
                                event.returnValue = false; //IE
                            } else {
                                event.preventDefault();
                            }

                            if ((venCd != null && venCd == '009741' && venItemCd != null)) {
                                alert("기프티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '008117' && venItemCd != null)) {
                                alert("기프티쇼 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009014' && venItemCd != null)) {
                                alert("큐피콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if ((venCd != null && venCd == '009428' && venItemCd != null)) {
                                alert("멀티콘 상품은 찜하기에 담을 수 없습니다!!");
                                return;
                            }

                            if (itemType == '04') {
                                alert("이 상품은 전문상담원과 상담 후 구매하실 수 있습니다.\n상담을 원하시면 080-000-0000으로 문의하여 주시기 바랍니다.\n전문상담원이 친절히 안내해 드리겠습니다.");
                                return;
                            }

                            if (isLogin() != 'true') {
                                if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                    openLoginPopup(location.href);
                                }
                                return false;
                            }

                            if (goActionCnt > 1) return;

                            var params = "chkedSlitmCdUitmCds=" + slitmCd;

                            //파라미터 sectId 가 존재 할경우 sectId 전달
                            var sectId = "";
                            if (sectId == "" || sectId == "0") {
                                sectId = "";
                            }

                            // 2020.11.19 icj PDAItemPtcMst.jsp zzimDone 참조. 2020.12.03 삭제기능 포함
                            $.ajax({
                                url: "/p/mpc/insertGgim.do"
                                , dataType: "json"
                                , data: params
                                , success: function (data) {
                                    goActionCnt = 0;
                                    jjimList();
                                    var gaAction;
                                    if (data.insertResult != 'undefined' && data.insertResult == '0') {
                                        alert("찜하기가 불가능한 상품입니다.");
                                        //alert("판매중인 단품이 없어 찜하지 못했습니다.");
                                        return true;
                                    } else if (data.insertResult != 'undefined' && data.insertResult == '1') {
                                        $(event.target).removeClass("on");
                                        alert("찜목록에서 삭제 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜취소';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜취소', jjimTag);
                                            }

                                        } catch (e) {
                                            alert(e);
                                        }
                                        return true;
                                    } else if (data.custGGimCnt >= 200) {
                                        alert("더 이상 찜 할 수 없습니다. 찜리스트에서 오래된 상품을 삭제 후 다시 이용해 주세요.");
                                        return true;
                                    } else {
                                        if (data != null && data.needLogin) {
                                            // 세션 로그인이 풀려서 로그인이 안된 경우
                                            if (confirm("찜을 하기 위해 로그인이 필요합니다.\n로그인 하시겠습니까?")) {
                                                openLoginPopup(location.href);
                                            }
                                            return false;
                                        }
                                        $(event.target).addClass("on");
                                        alert("찜 목록에 추가 되었습니다.");
                                        try {
                                            var jjimTag = data.slitmCd + "_" + data.slitmNm;

                                            gaAction = '찜';
                                            var $slitmInfo = null;
                                            if ($(obj).length > 0) {
                                                $slitmInfo = $(obj).closest('figure');
                                                setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), gaAction, jjimTag);
                                            } else {
                                                GA_Event('검색결과', '상품리스트_찜', jjimTag);
                                            }

                                        } catch (e) {
                                        }
                                    }
                                },
                                error: function () {
                                    console.log("json error");
                                    goActionCnt = 0;
                                }
                            });
                        }

                        /*
                         * 2020.12.01 icj 방송 알리미
                         * PDAItemPtcMst.jsp bitemAlrimPopupNew 참조
                         */
                        function bitemAlrimPopupTrk(slitmNm, slitmCd, bsitmCd) {
                            if (isLogin() != 'true') {
                                openLoginPopup(location.href);
                                return false;
                            }

                            dp_clickTrace('alimi');


                            // 방송 알리미 팝업
                            // addBitemAlrimCommonPopupNew(slitmNm, slitmCd, bsitmCd);  //AS-IS
                            alimPopup(slitmNm, slitmCd, bsitmCd, function (w) {
                                listAlrimiWithItem();
                            });
                        }

                        function alimPopup(slitmNm, slitmCd, bsitmCd, callback) {
                            var w = openPopup("/p/bma/editBitmAlrimNewPup.do?slitmNm=" + encodeURIComponent(slitmNm) + "&slitmCd=" + slitmCd + "&bsitmCd=" + bsitmCd,
                                "", 600, 700, "yes", $(window).width(), $(window).height());

                            var wInterval = setInterval(function () {
                                if (w.closed) {
                                    //             console.log('닫힘');
                                    callback(w);
                                    clearInterval(wInterval);
                                } else {
                                    //             console.log('열림')
                                }
                            }, 1000);
                        }


                        function alimLayer() {
                            $.ajax({
                                type: "POST"
                                , url: "/p/bma/editBitmAlrimNewPup.do"
                                , data: {
                                    returnUrl: location.href,
                                    slitmCd: slitmCd,
                                    slitmNm: slitmNm
                                }
                                , dataType: "html"
                                , async: false
                                , success: function (data) {
                                    if ($("#bitmAlrimLayer").length == 0) {
                                        var html = '<div class="layer-popup brand" id="bitmAlrimLayer">';
                                        html += '<div class="pop-wrap">';
                                        html += '<div class="pop-content-wrap">';
                                        html += '<strong class="pop-title">방송 알리미</strong></div>';
                                        html += '<div class="pop-content" id="bitmAlrimBody"></div>';
                                        html += '<button class="btn-close" id="bitmAlrimCloseBtn"><span>팝업 닫기</span></button>';
                                        html += '</div>';
                                        $('body').append(html);

                                        $('#bitmAlrimCloseBtn').click(function () {
                                            $("#bitmAlrimLayer").hide();
                                        });
                                    }
                                    $("#bitmAlrimBody").html(data);
                                    $("#bitmAlrimLayer").show();
                                }
                                ,
                                error: function () {
                                    alert('방송알리미 신청시 오류가 발생했습니다. 잠시후 다시 시도하세요.');
                                    console.log("json error");
                                }
                            });
                        }

                        //상품상세이동
                        function goItemDetail(url, obj, target) {
                            var $slitmInfo = $(obj).closest('.pdthumb');
                            if ($slitmInfo) {
                                if ($slitmInfo.hasClass('comingsoon')) {
                                    alert('아직 판매중이 아닙니다.');
                                    return false;
                                }
                                /*
                                if($slitmInfo.hasClass('soldOut')){
                                    alert('품절입니다.');
                                    return false;
                                }
                                */
                            }

                            /* ga tagging */
                            try {
                                if ($slitmInfo && $slitmInfo.attr("ga-custom-title")) {
                                    setGaPromotion($slitmInfo.attr("ga-custom-title"), $slitmInfo.attr("ga-custom-name"), $slitmInfo.attr("ga-custom-position"), $slitmInfo.attr("ga-custom-creative"), $slitmInfo.attr("ga-custom-id"))
                                }
                            } catch (e) {
                                console.log(e);
                            }

                            if (target) {
                                window.open(url, target);
                            } else {
                                window.location.href = url;
                            }

                        }

                        function personalSet() {
                            personalJJimSet();
                            personalAlrimiSet();
                        }

                        // 방송톡
                        function brodChatCheck() {

                            //방송톡 가능여부
                            $.ajax({
                                type: "GET",
                                //url: "https://marsheg.sweettracker.net:4443/user/api/is_aviliable_chat/format/json",
                                url: "https://broadeg.happytalk.io/user/api/is_aviliable_chat/format/json",
                                success: function (result) {
                                    if (result.code == 'success') {
                                        // 로그인 체크 및 팝업창 열기
                                        if (isLogin() == 'true') {
                                            var screenWidth = $(window).width();
                                            var screenHeight = $(window).height();
                                            var width = 480;
                                            var height = 700;
                                            var left = (screenWidth - width) / 2;
                                            var top = (screenHeight - height) / 2;
                                            var url = "https://www.hmall.com/p/bmc/brodChatPup.do";
                                            var popName = "brodChatPup";
                                            var popOption = "height=" + height + ", width=" + width + ", left=" + left + ", top=" + top + ", fullscreen=no, location=no, scrollbars=no, menubar=no, toolbar=no, titlebar=no, directories=no, resizable=no";
                                            window.open(url, popName, popOption);
                                        } else {
                                            openLoginPopup("/p/bmc/brodPordPbdv.do");
                                            return false;
                                        }
                                    } else {
                                        //채팅방 상태가 좋지 않으면 오류메시지 표시.
                                        alert(result.results);
                                    }
                                },
                                async: false,
                                dataType: 'jsonp',
                                crossDomain: true
                            });
                        }

                        // 기획전 템플릿 다운로드 쿠폰 적용
                        var roulette_flag = 0; //계속 클릭 방지
                        function DirectCopnDownload(prmoNo) {

                            var now_urls = location.href;
                            var returnUrl = now_urls.split('hmall.com');

                            if (isLogin() == 'true') {

                                if (roulette_flag != 0) {
                                    return false;
                                }
                                roulette_flag = 1;

                                $.ajax({
                                    type: "post"
                                    , url: "/pevent/eva/evntSectCopnDownLoad.do"
                                    , dataType: "json"
                                    , data: {prmoNo: prmoNo}
                                    , async: false
                                    , success: function (data) {
                                        if (data.save) {
                                            roulette_flag = 0;
                                            alert("쿠폰이 발행되었습니다.");
                                        } else {
                                            roulette_flag = 0;
                                            if (data.errorMsg == "UPNT_REGISTER") {
                                                if (confirm("H.Point 통합회원 가입 후 이벤트 응모 가능합니다.\nH.Point 전환가입 하시겠습니까?")) {
                                                    window.location.href = "/p/cua/registUpnt.do";
                                                } else {
                                                    return false;
                                                }
                                            } else {
                                                if (data.otp == "no") {
                                                    openPopup("/pevent/eva/evaEvntSmsSelfCertPup.do?btn=agree&returnUrl=" + returnUrl[1], 'smsSendPup', "500", "611", null, $(window).width(), $(window).height());
                                                } else {
                                                    alert(data.errorMsg);
                                                    return false;
                                                }
                                            }
                                        }
                                    }
                                    , error: function (request, status, error) {
                                        if (confirm('응모시 오류가 발생했습니다.')) {
                                        }
                                        roulette_flag = 0;
                                    }
                                });
                                return false;
                            } else {
                                openLoginPopup(returnUrl[1]);
                                return false;
                            }
                        }

                        //for chrome debugger
                        //# sourceURL=script-for-main-dprenew.js
                    </script>
                    <div class="home-section theme-pd">

                        <!--8개로 운영, 8개 한번에 노출 // 어드민에 별도 url 입력된 경우 해당url로 이동, 그렇지 않을 시 기본기획전 url로 이동-->
                        <ul class="theme-list">

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="마틴발
    CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                    <div class="img">
                                        <img src="https://image.hmall.com/MH/MH002/20220426/130221/494.png"
                                             alt="마틴발 스페셜샵"
                                             onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">

                                        <span class="flag-da">AD</span>


                                    </div>
                                    <figcaption>


                                        <p class="tit">마틴발</p>

                                        <p class="tit">CLASSIC MEN'S WEAR</p>


                                        <p class="txt"></p>
                                    </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2740027', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="마틴발
    CLASSIC MEN" s="" wear'="" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2766132', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="한섬의 디자인을 입다
    Mothan" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/static/image/sect/mblbnnr2766132.jpg"
                                                 alt="모덴 스페셜샵"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">한섬의 디자인을 입다</p>

                                            <p class="tit">Mothan</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2766132', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="한섬의 디자인을 입다
    Mothan" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2211104', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="고비(GOBI)
    Ordinary Premium" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/MH/MH002/20220406/130850/20220406114541026.S220100035.jpg"
                                                 alt="고비(GOBI)"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">고비(GOBI)</p>

                                            <p class="tit">Ordinary Premium</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?sectId=2211104', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="고비(GOBI)
    Ordinary Premium" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2146735', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="Reflect me
    Laciento 라씨엔토" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/MH/MH002/20220510/153559/4565.jpg"
                                                 alt="라씨엔토 스페셜샵"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">Reflect me </p>

                                            <p class="tit">Laciento 라씨엔토</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2146735', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="Reflect me
    Laciento 라씨엔토" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2700368', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="JBY by 디자이너 정구호
    공기를 담은 실루엣" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/MH/MH002/20220510/153529/897.jpg"
                                                 alt="JBY(제이바이) SHOP"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">JBY by 디자이너 정구호</p>

                                            <p class="tit">공기를 담은 실루엣</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/m/dpa/searchSpexSectItem.do?PlanSaleSectID=2700368', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="JBY by 디자이너 정구호
    공기를 담은 실루엣" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2731848', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="프리미엄 데님
    TRUE RELIGION" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/MH/MH002/20220421/171944/545.png"
                                                 alt="트루릴리전 스페셜샵"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">프리미엄 데님</p>

                                            <p class="tit">TRUE RELIGION</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2731848', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="프리미엄 데님
    TRUE RELIGION" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/m/plPlanSaleL.do?PlanSaleSectID=2690970', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="안나수이 ANNA SUI
    달콤한 로맨티시즘" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/MH/MH002/20220208/083355/20220208083232338.1617714.jpg"
                                                 alt="안나수이(ANNA SUI)"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">안나수이 ANNA SUI</p>

                                            <p class="tit">달콤한 로맨티시즘</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/m/plPlanSaleL.do?PlanSaleSectID=2690970', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="안나수이 ANNA SUI
    달콤한 로맨티시즘" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                            <li>


                                <figure>

                                    <a href="javascript:;"
                                       onclick="gaTagging(this, 'https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2383760', '', '');"
                                       ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                       ga-custom-creative="이상봉 에디션
    프리미엄을 담다" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">


                                        <div class="img">
                                            <img src="https://image.hmall.com/MH/MH002/20220512/111908/1_21.jpg"
                                                 alt="이상봉 에디션 스페셜샵"
                                                 onerror="noImage(this, '//image.hmall.com/p/img/co/noimg-thumb.png')">


                                        </div>
                                        <figcaption>


                                            <p class="tit">이상봉 에디션</p>

                                            <p class="tit">프리미엄을 담다</p>


                                            <p class="txt"></p>
                                        </figcaption>
                                    </a></figure>
                                <a href="javascript:;"
                                   onclick="gaTagging(this, 'https://www.hmall.com/p/dpa/searchSpexSectItem.do?sectId=2383760', '', '');"
                                   ga-custom-title="메인>홈쇼핑" ga-custom-name="메인_홈쇼핑탭" ga-custom-position="테마기획전"
                                   ga-custom-creative="이상봉 에디션
    프리미엄을 담다" ga-custom-id="" ga-custom-etc="urlAction" tag-comment="GA요청:홈쇼핑탭:17">
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
                <!--//homeshoping-wrap-->
            </div>
            <!--//contents-area-->
        </div>
    </div>
    <!-- //.container -->
</main>