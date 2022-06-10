<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/06/09
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/resources/font/NotoSansCJKkr/font.min.css" rel="stylesheet">
<link href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/slick.min.css?v=20220222_02">
<link href="/resources/vendor/bootstrap-tokenfield/bootstrap-tokenfield.min.css" rel="stylesheet">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/custom_shinhan.min.css?v=20220222_02">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/custom-tinymce.min.css">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/common.min.css?v=20220513_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/theme.min.css?v=20220331_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/custom.min.css?v=20220513_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdy.min.css?v=20220527_01">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/crowdyCardUI.min.css?v=20220222_02">
<link rel="stylesheet" href="//image-se.ycrowdy.com/crowdyCss/crowdy/datepickerCustom.css">
<div class="common_sub_layout">
    <div class="container">
        <div class="row not-space">
            <div class="col-md-2">
                <div class="col-line-lm mt70">
                    <div class="st-navi-device-wrap"><span>프로젝트 미리보기</span>
                        <div class="st-navi-device"><a>모바일</a> <a>태블릿</a> <a>PC</a></div>
                    </div>
                    <ul class="st-navi st-navi-p">
                        <li class="active"><a href="javascript:void(0)">프로젝트 만들기</a>
                            <div class="list_link_tab">
                                <ul>
                                    <li class="active" id="info_btn" onclick="active('info_btn');"><a onclick="show('info')">1. 기본정보</a></li>
                                    <li class="" id="story_btn" onclick="active('story_btn');"><a onclick="show('story')">2. 스토리</a></li>
                                    <li class="" id="reword_btn" onclick="active('reword_btn');"><a onclick="show('reword');">3. 리워드</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <div style="cursor: pointer;"><img
                            src="https://image-se.ycrowdy.com/crowdyCss/img/mypage_banner.png"
                            style="width: 180px; padding-right: 10px;"></div>
                </div>
            </div>
            <div id="basic_info" class="col-md-10 col-line" style="display: block">
                <div class="row not-space">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">
                        <div class="md-ml30">
                            <form id="projectForm" method="get" action="#" class="form-horizontal">
                                <div class="form-group row-mobile-n mt40 mb30">
                                    <label for="project_type1" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">프로젝트의 성공 조건 &amp; 수수료 안내</div>
                                        <p class="form-control-static mb10 mt0"></p>
                                        <div style="text-align: left">
                                            <p style="color: rgb(51, 51, 51);">프로젝트 종료일 기준 모금액이 목표금액의 100% 이상인 경우에만 프로젝트가
                                                성공하게 됩니다.</p>
                                            <p style="color: rgb(51, 51, 51);">프로젝트가 성공한 경우, 크라우디는 모금액에서 수수료를 제한 금액을
                                                정산해드립니다.</p>
                                            <p>* 수수료 (vat 별도) 크라우디 수수료 10% + 결제 수수료 3%</p>
                                            <p></p>
                                        </div>
                                    </label>
                                </div>
                                <div class="form-group row-mobile-n mb30">
                                    <label for="project_subject" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">프로젝트의 제목을 적어주세요</div>
                                        <div style="text-align: left">
                                            <p class="form-control-static mb10 mt0">프로젝트의 핵심 내용을 담을 수 있고 간결한 제목을 정해주세요.</p>
                                        </div>
                                    </label>
                                    <div class="col-xs-12 col-sm-8"><input type="text" id="project_subject" maxlength="40" class="form-control"></div>
                                    <div class="col-xs-12 col-sm-2">
                                        <span class="textarea_text_leng webfont2 mt10">
                                        <span id="charNum">0</span> / 40</span>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n mb30"><label for="project_price" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">목표 금액을 적어주세요</div>
                                    <div style="text-align: left">
                                        <p class="form-control-static mb10 mt0"><a class="red-800">최소 100,000원 이상</a>이어야 합니다.</p>
                                    </div>
                                </label>
                                    <div class="col-xs-12 col-sm-8"><input placeholder="" type="tel" data-vv-name="cpTargetAmount" class="form-control"></div>
                                    <div class="col-xs-12 col-sm-2">
                                        <div class="textarea_text_leng mt10">원</div>
                                    </div>
                                    <div class="col-xs-12 col-sm-10 basic_info">
                                        <div class="fees_info">
                                            <div class="fees_info_frame">
                                                <div class="row not-space">
                                                    <div class="col-xs-8">
                                                        펀딩 결제 수수료(카드 수수료 + 계좌이체 수수료)
                                                    </div>
                                                    <div class="col-xs-4 text-right"><span id="pg_fees">0</span>원
                                                    </div>
                                                </div>
                                                <div class="row not-space">
                                                    <div class="col-xs-8">
                                                        크라우디 플랫폼 이용 수수료
                                                    </div>
                                                    <div class="col-xs-4 text-right"><span id="platform_fees">0</span>원
                                                    </div>
                                                </div>
                                                <div class="row not-space">
                                                    <div class="col-xs-8">
                                                        프로젝트를 성공했을 경우 예상 정산 금액
                                                    </div>
                                                    <div class="col-xs-4 text-right text-big"><span id="totalSum"
                                                                                                    class="red-800">0</span>원
                                                    </div>
                                                </div>
                                                <ul>
                                                    <li>1. 위 금액은 예상이므로, 실제 정산 금액은 조금 다를 수 있습니다.</li>
                                                    <li>2. 목표금액을 초과달성하여도 수수료는 동일한 비율로 적용됩니다.</li>
                                                    <li>
                                                        3. 수수료의 비율은 다음과 같습니다.
                                                        <ul>
                                                            <li> - 크라우디 플랫폼 이용 수수료 (결제승인금액의 7% + 부가가치세 10%)</li>
                                                            <li> - PG 수수료 (카드결제승인금액의 1.7-2% + 부가가치세 10%)</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n mb30"><label for="project_start" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">프로젝트의 진행 기간을 적어주세요</div>
                                    <div style="text-align: left">
                                        <p class="form-control-static mb10 mt0">최소 7일부터 최대 60일까지 가능합니다.</p>
                                    </div>
                                </label>
                                    <div class="col-xs-12 col-sm-6">
                                        <div class="row row-mobile-n">
                                            <div class="col-xs-5"><input type="text" max="60" placeholder="" disabled="disabled" class="form-control"></div>
                                            <div class="col-xs-2 col-sm-2">
                                                <div class="textarea_text_leng mt10">일 남음</div>
                                            </div>
                                            <div class="col-xs-5" style="z-index: 10;"><input class="form-control datetimepicker hasDatepicker" id="dp1654786091986"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n"><label for="project_weburl" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left">프로젝트의 고유 주소를 적어주세요</div>
                                    <div style="text-align: left">
                                        <p class="form-control-static mb10 mt0">프로젝트와 관련된 키워드를 짧은 영어로 적어주세요. 특수문자와 띄어쓰기는 불가능합니다.</p>
                                    </div>
                                </label>
                                    <div class="col-xs-4 col-sm-3">
                                        <p class="form-control-static">https://www.ycrowdy.com/r/</p>
                                    </div>
                                    <div class="col-xs-8 col-sm-3"><input type="text" maxlength="30" placeholder="프로젝트명" class="form-control"></div>
                                    <!---->
                                </div>
                                <div class="form-group row-mobile-n mb30"><label for="project_img" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">프로젝트 대표 이미지를 등록해주세요</div>
                                    <div style="text-align: left">
                                        <p class="form-control-static mb10 mt0">홈페이지와 외부 공유를 했을 때 보여집니다. 프로젝트를 한 눈에 나타낼 수 있는 이미지를 등록해주세요.</p>
                                    </div>
                                </label>
                                    <div class="col-xs-12 dropify-wrapper-340">
                                        <div class="dropify-wrapper">
                                            <div class="dropify-message"><span class="file-icon"></span>
                                                <p>최적 사이즈 740*492px</p>
                                                <p class="dropify-error">오류가 발생하였습니다.</p>
                                            </div>
                                            <div class="dropify-loader"></div>
                                            <div class="dropify-errors-container">
                                                <ul></ul>
                                            </div><input type="file" data-allowed-file-extensions="png jpg jpeg" data-max-file-size-preview="5M" class="dropify"><button type="button" class="dropify-clear">삭제</button>
                                            <div class="dropify-preview"><span class="dropify-render"></span>
                                                <div class="dropify-infos">
                                                    <div class="dropify-infos-inner">
                                                        <p class="dropify-filename"><span class="file-icon"></span>
                                                            <span class="dropify-filename-inner"></span></p>
                                                        <p class="dropify-infos-message">터치 하여 이미지를 교체 합니다.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n mt90">
                                    <div class="col-sm-11">
                                        <div class="form-group row-mobile-n">
                                            <div class="col-xs-6 col-sm-4 col-md-3">
                                                <div class="btn btn-block btn-primary-outline">저장하기</div>
                                            </div>
                                            <div class="col-xs-6 col-sm-4 col-md-3"><button type="button" class="btn btn-block btn-primary">다음단계</button></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="reword" class="col-md-10 col-line" style="display: none">
                <div class="row not-space">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">
                        <div class="md-ml30">
                            <form id="combinationForm" method="get" action="#" class="form-horizontal">
                                <div class="form-group row-mobile-n mt40">
                                    <div class="col-xs-12 control-label control-label-big">
                                        <div class="text-left mb10">
                                            프로젝트 리워드를 구성해주세요
                                        </div>
                                        <p class="form-control-static mb10 mt0">프로젝트 시작을 위해서는 <a class="red-800">최소 1개 이상의
                                            리워드가 있어야 합니다.</a> 배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.</p>
                                    </div>
                                </div>
                                <div class="ps-wrap mb80">
                                    <!---->
                                    <div class="row row-mobile-n mb25"><label for="rewards_price"
                                                                              class="col-xs-2 control-label">
                                        <div class="text-left">리워드 금액</div>
                                    </label>
                                        <div class="col-xs-8"><input placeholder="1,000원 이상 입력해 주세요." type="tel"
                                                                     maxlength="9" class="form-control"></div>
                                        <div class="col-xs-2">
                                            <div class="mt10 textarea_text_leng webfont2">원</div>
                                        </div>
                                    </div>
                                    <div class="row row-mobile-n mb25"><label for="rewards_ea"
                                                                              class="col-xs-2 control-label">
                                        <div class="text-left">리워드 제공 <br>가능 수</div>
                                    </label>
                                        <div class="col-xs-5">
                                            <div class="option_group option_group_none mt3">
                                                <div class="qty_radio ui-controlgroup ui-controlgroup-horizontal ui-helper-clearfix"
                                                     role="toolbar"><label for="qty_radio1"
                                                                           class="radio-inline ui-button ui-widget ui-checkboxradio-radio-label ui-checkboxradio-checked ui-state-active ui-controlgroup-item ui-checkboxradio-label ui-corner-left"><span
                                                        class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank ui-state-hover"></span><span
                                                        class="ui-checkboxradio-icon-space"> </span><input type="radio"
                                                                                                           name="qty_radio" id="qty_radio1" value="N"
                                                                                                           class="ui-checkboxradio ui-helper-hidden-accessible"><span
                                                        class="webfont">무제한</span></label> <label for="qty_radio2"
                                                                                                  class="radio-inline ui-button ui-widget ui-checkboxradio-radio-label ui-controlgroup-item ui-checkboxradio-label ui-corner-right"><span
                                                        class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank"></span><span
                                                        class="ui-checkboxradio-icon-space"> </span><input type="radio"
                                                                                                           name="qty_radio" id="qty_radio2" value="Y"
                                                                                                           class="ui-checkboxradio ui-helper-hidden-accessible"><span
                                                        class="webfont">제한</span></label></div>
                                            </div>
                                        </div>
                                        <!---->
                                    </div>
                                    <div class="row row-mobile-n mb25"><label for="rewards_name"
                                                                              class="col-xs-2 control-label">
                                        <div class="text-left">리워드 제목</div>
                                    </label>
                                        <div class="col-xs-8"><input type="text" maxlength="30" class="form-control "></div>
                                        <div class="col-xs-2">
                                            <div class="mt10 textarea_text_leng webfont2"><span id="charNum1">0</span> / 30
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row-mobile-n mb25"><label for="rewards_contents"
                                                                              class="col-xs-2 control-label">
                                        <div class="text-left mb10">리워드 내용</div>
                                    </label>
                                        <div class="col-xs-8"><textarea rows="5" id="rewards_contents" maxlength="70"
                                                                        placeholder="준비된 리워드와 설명을 적어주세요." class="form-control"></textarea></div>
                                        <div class="col-xs-2">
                                            <div class="mt10 textarea_text_leng webfont2"><span id="charNum2">0</span> / 70
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row-mobile-n mb25"><label for="rewards_date"
                                                                              class="col-xs-2 control-label">
                                        <div class="text-left">예상 배송일</div>
                                    </label>
                                        <div class="col-xs-3"><input class="form-control datetimepicker hasDatepicker"
                                                                     id="dp1654786091998"></div>
                                    </div>
                                    <div class="row row-mobile-n mb30">
                                        <div class="col-xs-2 control-label">
                                            <div class="text-left mb10">리워드 옵션</div>
                                        </div>
                                        <div class="col-xs-9"><button type="button"
                                                                      class="btn btn-block btn-primary-outline">리워드 옵션 추가하기</button> </div>
                                    </div>
                                    <div class="row row-mobile-n mb25"><label for="rewards_date"
                                                                              class="col-xs-2 control-label">
                                        <div class="text-left">배송지 필요여부</div>
                                    </label>
                                        <div class="col-xs-6">
                                            <div class="option_group option_group_none mt3">
                                                <div class="delivery_radio ui-controlgroup ui-controlgroup-horizontal ui-helper-clearfix"
                                                     role="toolbar"><label for="delivery_radio1"
                                                                           class="radio-inline ui-button ui-widget ui-checkboxradio-radio-label ui-checkboxradio-checked ui-state-active ui-controlgroup-item ui-checkboxradio-label ui-corner-left"
                                                                           style="z-index: 0;"><span
                                                        class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank ui-state-hover"></span><span
                                                        class="ui-checkboxradio-icon-space"> </span><input type="radio"
                                                                                                           name="delivery_radio" id="delivery_radio1" value="Y"
                                                                                                           class="ui-checkboxradio ui-helper-hidden-accessible"><span
                                                        class="webfont">배송지 필요</span></label> <label
                                                        for="delivery_radio2"
                                                        class="radio-inline ui-button ui-widget ui-checkboxradio-radio-label ui-controlgroup-item ui-checkboxradio-label ui-corner-right"
                                                        style="z-index: 0;"><span
                                                        class="ui-checkboxradio-icon ui-corner-all ui-icon ui-icon-background ui-icon-blank"></span><span
                                                        class="ui-checkboxradio-icon-space"> </span><input type="radio"
                                                                                                           name="delivery_radio" id="delivery_radio2" value="N"
                                                                                                           class="ui-checkboxradio ui-helper-hidden-accessible"><span
                                                        class="webfont">배송지 필요없음</span></label></div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row row-mobile-n pt15 mb30">
                                        <div class="col-xs-4"></div>
                                        <div class="col-xs-2"><button type="button" class="btn btn-block btn-primary">
                                            등록
                                            <!---->
                                        </button></div>
                                        <div class="col-xs-2"><button type="button"
                                                                      class="btn btn-block btn-primary-outline">
                                            초기화
                                            <!---->
                                        </button></div>
                                        <div class="col-xs-4"></div>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n">
                                    <div class="col-xs-2 control-label control-label-big">
                                        <div class="text-left mb10">
                                            등록된 리워드<br>미리보기 </div>
                                        </div>
                                    <div class="col-xs-10">
                                        <div id="st-items-wrap" class="row row-mobile-n">
                                            <p class="form-control-static mb10 mt0"> 리워드가 없습니다. 리워드를 추가해주세요.</p>
                                            <div class="col-xs-6"></div>
                                            <div class="col-xs-6"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n mt90">
                                    <div class="col-sm-11">
                                        <div class="form-group row-mobile-n">
                                            <div class="col-xs-6 col-sm-4 col-md-3">
                                                <button type="button" class="btn btn-block btn-primary">등록하기</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div id="story" class="col-md-10 col-line" style="display: none">
                <div class="row not-space">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">
                        <div class="md-ml30">
                            <form id="combinationForm" method="get" action="#" class="form-horizontal">

                                <div class="form-group row-mobile-n"><label for="project_story" class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">프로젝트 스토리를 적어주세요</div>
                                    <div style="text-align: left">
                                        <p class="form-control-static mb10 mt0"><a class="red-800">프로젝트를 시작하기 위해 필요한 내용이 없다면 승인이 되지 않습니다. 프로젝트 가이드북</a>을 읽어보시고 매력적인 스토리를 적어주세요.</p>
                                    </div>
                                </label>
                                    <div class="col-xs-12">
                                        <div>
                                            <div class="row common-flex-between-center">
                                                <div class="mb15 col-xs-9">
                                                    Enter(↵) : 문단 나눔, Shift + Enter : 줄바꿈입니다! <br>
                                                    적절한 문단/줄 바꿈만으로 멋진 프로젝트를 완성 할 수 있습니다! <br>
                                                    이미지와 영상은 꼭 버튼을 이용하여 첨부해주세요.
                                                </div>
                                                <div class="col-xs-3"><a href="https://drive.google.com/file/d/1SpeaG3Jj3gSwCQwZ51jDuFXiBelZPtiA/view" target="_blank" class="btn btn-block btn-primary" style="color: #fff4f3">디자인 가이드 보기</a>
                                                </div>
                                            </div>
                                            <div id="mceu_335" class="mce-tinymce mce-container mce-panel" hidefocus="1" tabindex="-1" role="application" style="visibility: hidden; border-width: 1px;">
                                                <div id="mceu_335-body" class="mce-container-body mce-stack-layout">
                                                    <div id="mceu_336" class="mce-toolbar-grp mce-container mce-panel mce-stack-layout-item mce-first" hidefocus="1" tabindex="-1" role="group">
                                                        <div id="mceu_336-body" class="mce-container-body mce-stack-layout">
                                                            <div id="mceu_337" class="mce-container mce-toolbar mce-stack-layout-item mce-first mce-last" role="toolbar">
                                                                <div id="mceu_337-body" class="mce-container-body mce-flow-layout">
                                                                    <div id="mceu_338" class="mce-container mce-flow-layout-item mce-first mce-btn-group" role="group">
                                                                        <div id="mceu_338-body">
                                                                            <div id="mceu_320" class="mce-widget mce-btn mce-first mce-disabled" tabindex="-1" aria-labelledby="mceu_320" role="button" aria-label="Undo" aria-disabled="true"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-undo"></i></button>
                                                                            </div>
                                                                            <div id="mceu_321" class="mce-widget mce-btn mce-last mce-disabled" tabindex="-1" aria-labelledby="mceu_321" role="button" aria-label="Redo" aria-disabled="true"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-redo"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="mceu_339" class="mce-container mce-flow-layout-item mce-btn-group" role="group">
                                                                        <div id="mceu_339-body">
                                                                            <div id="mceu_322" class="mce-widget mce-btn mce-menubtn mce-first mce-last mce-btn-has-text" tabindex="-1" aria-labelledby="mceu_322" role="button" aria-haspopup="true"><button id="mceu_322-open" role="presentation" type="button" tabindex="-1"><span class="mce-txt">문단서식</span> <i class="mce-caret"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="mceu_340" class="mce-container mce-flow-layout-item mce-btn-group" role="group">
                                                                        <div id="mceu_340-body">
                                                                            <div id="mceu_323" class="mce-widget mce-btn mce-first" tabindex="-1" aria-labelledby="mceu_323" role="button" aria-label="Bold"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-bold"></i></button>
                                                                            </div>
                                                                            <div id="mceu_324" class="mce-widget mce-btn" tabindex="-1" aria-labelledby="mceu_324" role="button" aria-label="Italic"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-italic"></i></button>
                                                                            </div>
                                                                            <div id="mceu_325" class="mce-widget mce-btn" tabindex="-1" aria-labelledby="mceu_325" role="button" aria-label="밑줄"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-underline"></i></button>
                                                                            </div>
                                                                            <div id="editor_blue" class="mce-widget mce-btn" tabindex="-1" aria-labelledby="editor_blue" role="button" aria-label="글자색 바꾸기"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-forecolor"></i></button>
                                                                            </div>
                                                                            <div id="editor_highlight" class="mce-widget mce-btn mce-last" tabindex="-1" aria-labelledby="editor_highlight" role="button" aria-label="글자 배경색 바꾸기">
                                                                                <button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-backcolor"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="mceu_341" class="mce-container mce-flow-layout-item mce-btn-group" role="group">
                                                                        <div id="mceu_341-body">
                                                                            <div id="mceu_326" class="mce-widget mce-btn mce-menubtn mce-first" tabindex="-1" aria-labelledby="mceu_326" role="button" aria-label="구분선" aria-haspopup="true"><button id="mceu_326-open" role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-none" style="background-image: url('/resources/css/img/btn_icon_hr1.png')"></i>
                                                                                <i class="mce-caret"></i></button></div>
                                                                            <div id="mceu_327" class="mce-widget mce-btn mce-menubtn mce-last" tabindex="-1" aria-labelledby="mceu_327" role="button" aria-label="인용구" aria-haspopup="true"><button id="mceu_327-open" role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-none" style="background-image: url('/resources/css/img/btn_icon_bq1.png')"></i>
                                                                                <i class="mce-caret"></i></button></div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="mceu_342" class="mce-container mce-flow-layout-item mce-btn-group" role="group">
                                                                        <div id="mceu_342-body">
                                                                            <div id="mceu_328" class="mce-widget mce-btn mce-first" tabindex="-1" aria-labelledby="mceu_328" role="button" aria-label="Align left">
                                                                                <button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-alignleft"></i></button>
                                                                            </div>
                                                                            <div id="mceu_329" class="mce-widget mce-btn mce-last" tabindex="-1" aria-labelledby="mceu_329" role="button" aria-label="Align center">
                                                                                <button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-aligncenter"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="mceu_343" class="mce-container mce-flow-layout-item mce-btn-group" role="group">
                                                                        <div id="mceu_343-body">
                                                                            <div id="mceu_330" class="mce-widget mce-btn mce-menubtn mce-first mce-last" tabindex="-1" aria-labelledby="mceu_330" role="button" aria-label="리스트" aria-haspopup="true"><button id="mceu_330-open" role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-bullist"></i>
                                                                                <i class="mce-caret"></i></button></div>
                                                                        </div>
                                                                    </div>
                                                                    <div id="mceu_344" class="mce-container mce-flow-layout-item mce-last mce-btn-group" role="group">
                                                                        <div id="mceu_344-body">
                                                                            <div id="mceu_331" class="mce-widget mce-btn mce-menubtn mce-first" tabindex="-1" aria-labelledby="mceu_331" role="button" aria-label="Table" aria-haspopup="true"><button id="mceu_331-open" role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-table"></i> <i class="mce-caret"></i></button>
                                                                            </div>
                                                                            <div id="mceu_332" class="mce-widget mce-btn" tabindex="-1" aria-labelledby="mceu_332" role="button" aria-label="Insert/edit link">
                                                                                <button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-link"></i></button>
                                                                            </div>
                                                                            <div id="mceu_333" class="mce-widget mce-btn" tabindex="-1" aria-labelledby="mceu_333" role="button" aria-label="Insert/edit image"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-image"></i></button>
                                                                            </div>
                                                                            <div id="mceu_334" class="mce-widget mce-btn mce-last" tabindex="-1" aria-labelledby="mceu_334" role="button" aria-label="Insert/edit video"><button role="presentation" type="button" tabindex="-1"><i class="mce-ico mce-i-media"></i></button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="mceu_345" class="mce-edit-area mce-container mce-panel mce-stack-layout-item" hidefocus="1" tabindex="-1" role="group" style="border-width: 1px 0px 0px;"><iframe id="editor0_ifr" frameborder="0" allowtransparency="true" title="서식 있는 텍스트 편집기 입니다. ALT-F9를 누르면 메뉴, ALT-F10를 누르면 툴바, ALT-0을 누르면 도움말을 볼 수 있습니다." src='javascript:""' style="width: 100%; height: 650px; display: block;"></iframe>
                                                    </div>
                                                    <div id="mceu_346" class="mce-statusbar mce-container mce-panel mce-stack-layout-item mce-last" hidefocus="1" tabindex="-1" role="group" style="border-width: 1px 0px 0px;">
                                                        <div id="mceu_346-body" class="mce-container-body mce-flow-layout">
                                                            <div id="mceu_347" class="mce-path mce-flow-layout-item mce-first">
                                                                <div role="button" class="mce-path-item mce-last" data-index="0" tabindex="-1" id="mceu_347-0" aria-level="1">p</div>
                                                            </div>
                                                            <div id="mceu_348" class="mce-flow-layout-item mce-last mce-resizehandle"><i class="mce-ico mce-i-resize"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div><textarea id="editor0" readonlyflag="0" value="" aria-hidden="true" style="display: none;"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row-mobile-n mt90">
                                    <div class="col-sm-11">
                                        <div class="form-group row-mobile-n">
                                            <div class="col-xs-6 col-sm-4 col-md-3"><button type="button" class="btn btn-block btn-primary-outline">저장하기</button></div>
                                            <div class="col-xs-6 col-sm-4 col-md-3"><button type="button" class="btn btn-block btn-primary">다음단계</button></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function show(a){
        console.log("리워드 버튼 누름");
        const element_basic = document.getElementById("basic_info");
        const elememt_reword = document.getElementById("reword");
        const element_story = document.getElementById("story");
        console.log(element_basic.style.display);
        console.log(elememt_reword.style.display);
        console.log(element_story.style.display);
        if(a === 'reword'){
            element_basic.style.display = 'none';
            elememt_reword.style.display = 'block';
            element_story.style.display =  'none';
        }else if(a === 'info'){
            element_basic.style.display = 'block';
            elememt_reword.style.display = 'none';
            element_story.style.display = 'none';
        }else{
            element_basic.style.display = 'none';
            elememt_reword.style.display = 'none';
            element_story.style.display = 'block';
        }
    }

    function active(a){
        $(".list_link_tab li").removeClass("active");
        console.log("버튼 :"+a);
        if(a === 'info_btn'){
            document.getElementById('info_btn').classList.add("active");
        }else if(a === 'reword_btn'){
            document.getElementById('reword_btn').classList.add("active");
        }else{
            document.getElementById('story_btn').classList.add("active");
        }
    }
</script>