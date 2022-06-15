<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/06/09
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javascript" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--datePicker-->
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
<!--datePicker end -->

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

<!-- include libraries(jQuery, bootstrap) -->
<link  href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js-->
<link  href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
<!-- include summernote-ko-KR -->
<script src="${contextPath}/resources/js/summernote-ko-KR.js"></script>


<div class="common_sub_layout">
    <div class="container">
        <div class="row not-space">
            <div class="col-md-2">
                <div class="col-line-lm mt70">
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
                </div>
            </div>
            <div id="basic_info" class="col-md-10 col-line" style="display: block; padding-bottom: 150px">
                <div class="row not-space">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">
                        <div class="md-ml30">
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
                            </div>
                            <div class="form-group row-mobile-n mb30"><label for="project_price" class="col-xs-12 control-label control-label-big">
                                <div class="text-left mb10">목표 금액을 적어주세요</div>
                                <div style="text-align: left">
                                    <p class="form-control-static mb10 mt0"><a class="red-800">최소 100,000원 이상</a>이어야 합니다.</p>
                                </div>
                            </label>
                                <div class="col-xs-12 col-sm-8"><input placeholder="" type="tel" data-vv-name="cpTargetAmount" class="form-control" id="goal_cost"></div>
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
                                        <div class="col-xs-5"><input type="text" max="60" placeholder="" disabled="disabled" class="form-control" name="d_day" id="d_day"></div>
                                        <div class="col-xs-2 col-sm-2">
                                            <div class="textarea_text_leng mt10">일 남음</div>
                                        </div>
                                        <div class="col-xs-5" style="z-index: 10;"><input class="form-control datetimepicker" id="duration_project" value=""></div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                const config = {
                                    dateFormat: 'yy-mm-dd',
                                    yearRange: '1930:2022',
                                    prevText: '이전 달',
                                    nextText: '다음 달',
                                    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                                    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                                    dayNames: ['일','월','화','수','목','금','토'],
                                    dayNamesShort: ['일','월','화','수','목','금','토'],
                                    dayNamesMin: ['일','월','화','수','목','금','토'],
                                    yearSuffix: '년',
                                    changeMonth: true,
                                    changeYear: true
                                }
                                $(function() {
                                    var today=new Date();
                                    $("#estimated_deliveryDate").datepicker(config);
                                    $("#duration_project").datepicker(config);
                                    $("#duration_project").on("change", function(){
                                        let year= parseInt($(this).val().split('-')[0]);
                                        let month= parseInt($(this).val().split('-')[1]);
                                        let day= parseInt($(this).val().split('-')[2]);
                                        console.log(year, month, day);
                                        var d_day=new Date(year, month, day);
                                        var gap=d_day.getTime()-today.getTime();
                                        var result=Math.ceil(gap/(1000*60*60*24));
                                        $("#d_day").val(result-30);
                                    });
                                });
                            </script>
                            <div class="form-group row-mobile-n mt90">
                                <div class="col-sm-11" style="margin-top: 20px">
                                    <div class="form-group row-mobile-n" style="margin-top: 20px;">
                                        <div class="col-xs-6 col-sm-4 col-md-3" style="width: 200"><button type="button" class="btn btn-block btn-primary" onclick="nextStep_info();">다음 단계</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="reword" class="col-md-10 col-line" style="display: none">
                <div class="row not-space">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">
                        <div class="md-ml30">
                            <div class="form-group row-mobile-n mt40">
                                <div class="col-xs-12 control-label control-label-big">
                                    <div class="text-left mb10">
                                        프로젝트 리워드를 구성해주세요
                                    </div>
                                    <div style="text-align: left">
                                        <p class="form-control-static mb10 mt0">프로젝트 시작을 위해서는
                                            <a class="red-800">최소 1개 이상의 최대 3개의 리워드가 있어야 합니다.</a> 배송이 필요한 리워드는 배송비가 포함된 가격을 적어주세요.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="ps-wrap mb80">
                                <!---->
                                <div class="row row-mobile-n">
                                    <label for="rewards_ea" class="col-xs-2 control-label">
                                        <div class="text-left">리워드 제공 가능 수</div>
                                    </label>
                                    <div class="row row-mobile-n mb25">

                                        <div class="col-xs-2"><input id="max_num" type="tel" maxlength="100" placeholder="제공 가능 수량" class="form-control"></div>
                                        <div class="col-xs-1">
                                            <div class="mt10 textarea_text_leng webfont2">개</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-mobile-n mb25"><label for="rewards_date" class="col-xs-2 control-label">
                                    <div class="text-left">예상 배송일</div>
                                </label>
                                    <div class="col-xs-3">
                                        <input type="text" class="form-control datetimepicker" id="estimated_deliveryDate">
                                    </div>
                                </div>
                                <div class="row row-mobile-n mb30">
                                    <div class="col-xs-2 control-label">
                                        <div class="text-left mb10">리워드 옵션</div>
                                    </div>
                                    <div class="col-xs-9">
                                        <button type="button" id="option_btn" class="btn btn-block btn-primary" style="display: block" onclick="showOptions();">리워드 옵션 추가하기</button>
                                        <div id="option_group1" class="option_group"  style="display: none">
                                            <div class="row row-mobile-n option_select">
                                                <div class="col-xs-12 text-right" style="text-align: left!important;">
                                                    <div class="mt5">
                                                        <a id="plus_option1" onclick="plusOptions(1);" class="btn_none_icon btn_plus blue-800">추가하기</a>
                                                        <a id="minus_option1" onclick="minusOptions(1);" class="btn_none_icon btn_delete red-800">삭제하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="option1_contents1" class="row row-mobile-n otab1_contents mt10" style="margin-bottom: 20px">
                                                <div class="col-xs-8">
                                                    <input id="product_name1" name ="fund_reward_name" type="text" maxlength="20" placeholder="ex) 옷의 사이즈를 적어주세요." class="form-control ">

                                                </div>
                                                <div class="col-xs-2">
                                                    <div class="mt10 textarea_text_leng webfont2"></div>
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25">
                                                <div class="col-xs-8">
                                                    <input id="product_cost1" name="fund_reward_cost" placeholder="1,000원 이상 입력해 주세요." type="tel" maxlength="9" class="form-control">
                                                </div>
                                                <div class="col-xs-2">
                                                    <div class="mt10 textarea_text_leng webfont2"></div>
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25">
                                                <div class="col-xs-8">
                                                    <input id="product_content1" name="fund_reward_content" placeholder="간단한 소개글을 작성해주세요." type="tel" maxlength="9" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25" style="width: fit-content">
                                                <div class="col-xs-8">
                                                    <input id="product_count1" name="fund_reward_count" placeholder="수량" type="tel" maxlength="9" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="option_group2" class="option_group"  style="display: none">
                                            <div class="row row-mobile-n option_select">
                                                <div class="col-xs-12 text-right" style="text-align: left!important;">
                                                    <div class="mt5">
                                                        <a id="plus_option2" onclick="plusOptions(2);" class="btn_none_icon btn_plus blue-800">추가하기</a>
                                                        <a id="minus_option2" onclick="minusOptions(2);" class="btn_none_icon btn_delete red-800">삭제하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="option1_contents2" class="row row-mobile-n otab1_contents mt10" style="margin-bottom: 20px">
                                                <div class="col-xs-8">
                                                    <input id="product_name2" name ="fund_reward_name" type="text" maxlength="20" placeholder="ex) 옷의 사이즈를 적어주세요." class="form-control ">
                                                </div>
                                                <div class="col-xs-2">
                                                    <div class="mt10 textarea_text_leng webfont2"></div>
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25">
                                                <div class="col-xs-8">
                                                    <input id="product_cost2" name="fund_reward_cost" placeholder="1,000원 이상 입력해 주세요." type="tel" maxlength="9" class="form-control">
                                                </div>
                                                <div class="col-xs-2">
                                                    <div class="mt10 textarea_text_leng webfont2"></div>
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25">
                                                <div class="col-xs-8">
                                                    <input id="product_content2" name="fund_reward_content" placeholder="간단한 소개글을 작성해주세요." type="tel" maxlength="9" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25" style="width: fit-content">
                                                <div class="col-xs-8">
                                                    <input id="product_count2" name="fund_reward_count" placeholder="수량" type="tel" maxlength="9" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <div id="option_group3" class="option_group"  style="display: none">
                                            <div class="row row-mobile-n option_select">
                                                <div class="col-xs-12 text-right" style="text-align: left!important;">
                                                    <div class="mt5">
                                                        <a id="plus_option3" onclick="plusOptions(3);" class="btn_none_icon btn_plus blue-800">추가하기</a>
                                                        <a id="minus_option3" onclick="minusOptions(3);" class="btn_none_icon btn_delete red-800">삭제하기</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="option1_contents3" class="row row-mobile-n otab1_contents mt10" style="margin-bottom: 20px">
                                                <div class="col-xs-8">
                                                    <input id="product_name3" name ="fund_reward_name" type="text" maxlength="20" placeholder="ex) 옷의 사이즈를 적어주세요." class="form-control ">
                                                </div>
                                                <div class="col-xs-2">
                                                    <div class="mt10 textarea_text_leng webfont2"></div>
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25">
                                                <div class="col-xs-8">
                                                    <input id="product_cost3" name="fund_reward_cost" placeholder="1,000원 이상 입력해 주세요." type="tel" maxlength="9" class="form-control">
                                                </div>
                                                <div class="col-xs-2">
                                                    <div class="mt10 textarea_text_leng webfont2"></div>
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25">
                                                <div class="col-xs-8">
                                                    <input id="product_content3" name="fund_reward_content" placeholder="간단한 소개글을 작성해주세요." type="tel" maxlength="9" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row row-mobile-n mb25" style="width: fit-content">
                                                <div class="col-xs-8">
                                                    <input id="product_count3" name="fund_reward_count" placeholder="수량" type="tel" maxlength="9" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                            </div>
                            <div class="form-group row-mobile-n mt90">
                                <div class="col-sm-11">
                                    <div class="form-group row-mobile-n">
                                        <div class="col-xs-6 col-sm-4 col-md-3">
                                            <button type="button" class="btn btn-block btn-primary" onclick="insertFund();">등록하기</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="story" class="col-md-10 col-line" style="display: none">
                <div class="row not-space">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">
                        <div class="md-ml30">

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

                                        <div class="mainImage_info" style="display: flex">
                                            <span style="width: 50px; margin-bottom: 17px; font-weight: 800;">메인사진</span>
                                            <input type="file" id="file" name="file" multiple> <br>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        </div>

                                        <%--                                            <div class="row row-mobile-n mb25"><label for="rewards_contents" class="col-xs-2 control-label">--%>
                                        <%--                                                <div class="text-left mb10">프로젝트 스토리</div>--%>

                                        <div >
                                            <textarea id="project_story" class="summernote" name="editorData"></textarea>
                                        </div>
                                        <%--                                                <button onclick="testEditor();" name="testEditor">확인용</button>--%>
                                        </label>
                                        <div class="col-xs-8">
                                            <%--                                                    <textarea rows="20" id="project_story" maxlength="70" placeholder="프로젝트 스토리를 적어주세요."--%>
                                            <%--                                                                                class="form-control"></textarea>--%>

                                        </div>
                                    </div>

                                </div><textarea id="editor0" readonlyflag="0" value="" aria-hidden="true" style="display: none;"></textarea>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="form-group row-mobile-n mt90" style="padding-left: 80px">
                    <div class="col-sm-11" style="margin-top: -70px">
                        <div class="form-group row-mobile-n">
                            <div class="col-xs-6 col-sm-4 col-md-3"><button type="button" class="btn btn-block btn-primary">이전으로</button></div>
                            <div class="col-xs-6 col-sm-4 col-md-3"><button type="button" class="btn btn-block btn-primary" onclick="nextStep_story();">다음단계</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<script>
    var i = 3;
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
    function showOptions(){
        const element_option_btn = document.getElementById("option_btn");
        const element_reward = document.getElementById("option_group1");
        element_option_btn.style.display = 'none';
        element_reward.style.display = 'block';
    }
    function plusOptions(a){
        const max_num = document.getElementById("max_num").value;
        if(a < max_num){
            if(a === 1){
                const element_reward2 = document.getElementById("option_group2");
                element_reward2.style.display = 'block';
            }else if(a === 2){
                const element_reward3 = document.getElementById("option_group3");
                element_reward3.style.display = 'block';
            }
        }else{
            alert("최대 리워드 갯수를 초과했습니다.");
        }
    }
    function minusOptions(a){
        if(a === 1){
            const element_option_btn = document.getElementById("option_btn");
            const element_reward = document.getElementById("option_group1");
            element_option_btn.style.display = 'block';
            element_reward.style.display = 'none';
        }else if(a === 2){
            const element_reward2 = document.getElementById("option_group2");
            element_reward2.style.display = 'none';
        }else if(a === 3){
            const element_reward3 = document.getElementById("option_group3");
            element_reward3.style.display = 'none';
        }
    }
    function nextStep_info(){
        $(".list_link_tab li").removeClass("active");
        document.getElementById('story_btn').classList.add("active");
        const element_basic = document.getElementById("basic_info");
        const elememt_reword = document.getElementById("reword");
        const element_story = document.getElementById("story");
        element_basic.style.display = 'none';
        elememt_reword.style.display = 'none';
        element_story.style.display = 'block';
    }
    function nextStep_story(){
        $(".list_link_tab li").removeClass("active");
        document.getElementById('reword_btn').classList.add("active");
        const element_basic = document.getElementById("basic_info");
        const elememt_reword = document.getElementById("reword");
        const element_story = document.getElementById("story");
        element_basic.style.display = 'none';
        elememt_reword.style.display = 'block';
        element_story.style.display = 'none';
    }
    //펀드 등록하기 함수
    function insertFund(){
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        var end_date = document.getElementById('duration_project').value;
        var estimated_date = document.getElementById('estimated_deliveryDate').value;
        var fund_product_title = document.getElementById('project_subject').value;
        var fund_product_goal_cost = document.getElementById('goal_cost').value;
        var fund_product_content = document.getElementById('project_story').value;
        //String to Date
        stringToDate(end_date,"mm-dd-yyyy","-");
        stringToDate(estimated_date,"mm-dd-yyyy","-");
        //file 파일정보
        var fileName = document.getElementById('fileName').value;
        console.log(end_date);
        var fund_product_end_date = end_date;
        console.log("배송예정일 :"+estimated_date);
        var fund_product_estimate_date = estimated_date;
        let fund_reward_titleList = [];
        let fund_reward_costList = [];
        let fund_reward_contentList = [];
        let fund_reward_countList = [];
        var rewardLength = document.getElementById('max_num').value;
        for(var i = 1 ; i <= rewardLength ; i++){
            fund_reward_titleList.push($("input[id='"+'product_name'+String(i)+"']").val());
            fund_reward_costList.push($("input[id='"+'product_cost'+String(i)+"']").val());
            fund_reward_contentList.push($("input[id='"+'product_content'+String(i)+"']").val());
            fund_reward_countList.push($("input[id='"+'product_count'+String(i)+"']").val());
        }
        console.log(fund_reward_titleList, fund_reward_costList,fund_reward_contentList,fund_reward_countList);
        var rewardData = {
            fund_product_main_img: fileName,
            fund_product_end_date: fund_product_end_date,
            fund_product_title: fund_product_title,
            fund_product_content: fund_product_content,
            fund_product_goal_cost: parseInt(fund_product_goal_cost),
            fund_product_estimate_date: fund_product_estimate_date,
            "fund_reward_titleList" : fund_reward_titleList,
            "fund_reward_costList" : fund_reward_costList,
            "fund_reward_contentList" : fund_reward_contentList,
            "fund_reward_countList" : fund_reward_countList
        }
        console.log(fund_reward_titleList)
        console.log(rewardData);
        $.ajax({
            url:"${contextPath}/fund/insertFund",
            method:"post",
            data:rewardData,
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },success: function (){
                alert("프로젝트 등록에 성공하셨습니다!");
                location.href="${contextPath}/fund/main";
            }
        })
    }
</script>
<script type="text/javascript">
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";
    $(document).ready(function() {
        $('.summernote').summernote({
            placeholder: '프로젝트 스토리를 적어주세요!',
            minHeight: 370,
            maxHeight: null,
            focus: true,
            lang: 'ko-KR',
            // callbacks: {
            //     onImageUpload: function (files) {
            //         sendFile(files[0], this);
            //     }
            // }
        });
    });
    <%--function sendFile(file, editor){--%>
    <%--    var form_data=new FormData();--%>
    <%--    form_data.append('file',file);--%>
    <%--    $.ajax({--%>
    <%--        data:form_data,--%>
    <%--        type:'post',--%>
    <%--        url:'${contextPath}/fund/uploadImage',--%>
    <%--        // cache:false,--%>
    <%--        contentType:false,--%>
    <%--        // enctype:'multipart/form-data',--%>
    <%--        processData:false,--%>
    <%--        success:function(data){--%>
    <%--            $(editor).summernote('insertImage', data.url);--%>
    <%--        },--%>
    <%--        error:function(data){--%>
    <%--            alert('error: '+data);--%>
    <%--        }--%>
    <%--    });--%>
    <%--}--%>
    $("input[type='file']").change(function (e){
        var formData = new FormData();
        var inputFile = $("input[name='file']");
        var files = inputFile[0].files;
        console.log(files);
        for(var i = 0 ; i < files.length ; i++){
            formData.append("file",files[i]);
        }
        console.log(formData);
        $.ajax({
            url: '${contextPath}/fund/uploadAjaxAction',
            processData: false,
            contentType: false,
            data:formData,
            type: 'post',
            dataType: 'text',
            beforeSend: function(xhr) {
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
            },
            success: function (result){
                console.log("result값 ");
                console.log(result);
                let fileName = result;
                $(".mainImage_info").append(
                    `
                    <input type = 'hidden' id ='fileName' value =`+fileName+`>
                    `
                )
            },
            error: function (request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    })
    function stringToDate(_date,_format,_delimiter)
    {
        var formatLowerCase=_format.toLowerCase();
        var formatItems=formatLowerCase.split(_delimiter);
        var dateItems=_date.split(_delimiter);
        var monthIndex=formatItems.indexOf("mm");
        var dayIndex=formatItems.indexOf("dd");
        var yearIndex=formatItems.indexOf("yyyy");
        var month=parseInt(dateItems[monthIndex]);
        month-=1;
        var formatedDate = new Date(dateItems[yearIndex],month,dateItems[dayIndex]);
        return formatedDate;
    }
</script>