<%--
  Created by IntelliJ IDEA.
  User: kimbyeounghoon
  Date: 2022/05/28
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${contextPath}/resources/css/join.css">
<link rel="stylesheet" href="/assets/app/css/swiper.min.css"><!-- RENEWAL 2021 -->
<link rel="stylesheet" href="/assets/app/css/screen.ui.css?version=202202170001" /><!-- RENEWAL 2021 -->
<script>
    $(function() {
        $('.inner808 #allAgree').on('click', function () {
            console.log("click!!");
            if ($('#allAgree').prop("checked")) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
        })
    });

    $(function (){
       $('.inner808').on('click', '.tcmCheckboxreqTcm', function (){
           console.log("취소하기");
           let is_checked = true;
           $('.inner808 .tcmCheckboxreqTcm').each(function (){
               is_checked = is_checked && $(this).is(':checked');
           });
           $('#allAgree').prop('checked',is_checked);
       })
    })

    function next(){
        console.log("next 버튼 클릭");
        var chkbox = document.getElementsByName('agreement');
        var chk = false;
        for(var i = 0 ; i < chkbox.length; i++){
            if(chkbox[i].checked){
                chk = true;
            }else {
                chk=false;
            }
        }
        if(chk){
            location.href='${contextPath}/user/signup';
        }else{
            alert('모든 필수 약관에 동의해 주세요.');
        }
    }


</script>
<main>
    <div>
        <div>
            <!-- 약관동의 -->
            <section class="step2_container">
                <div class="layout1">
                    <div class="wrap_box">
                            <input type="hidden" name="hdgmMktTcm"  value="Y" />
                            <input type="hidden" name="prtnrMktTcm" value="Y"/>
                            <div class="inner808">

                                <h3 class="sect_tit">H.Point 회원가입을 위해 약관동의를 진행해주세요.</h3>
                                <div class="wrap_terms_agree">
                                    <div class="agree_all">
                                      <span class="checkbox_ui type1">
                                         <input type="checkbox" id="allAgree" class="allCheckbox" name="tcndAllAgree">
                                         <label for="allAgree">전체 약관 동의</label>
                                      </span>
                                    </div>
                                    <div class="agree_part tAgreeA">
                                        <p>H.Point 약관</p>
                                        <ul id="hdgmTerm" class="tAgreeList">

                                            <li>
                                               <span class="checkbox_ui type1">
                                                  <input type="checkbox" id="agree0" class="tcmCheckboxreqTcm" name="agreement">
                                                  <label for="agree0">
                                                     <span class="c_bl chkA">
                                                        <span class="c_bl">[필수]</span>
                                                     </span> 이용 약관</label>
                                               </span>
                                               <button class="btn_typeC1" onclick="$('#modal_1').modal().show()"><span>내용보기</span></button>
                                            </li>

                                            <!--비밀번호 변경 모달창-->
                                            <div class="ui-modal password-change in" id="modal_1" tabindex="-1" role="dialog" aria-label="비밀번호 수정" style="z-index: 1031; display: none; padding-right: 0px;">
                                                <div class="ui-modal-dialog" role="document">
                                                    <div class="content">
                                                        <p class="ui-title">이용 약관</p>
                                                        <!-- //.content-head -->
                                                        <div class="content-body">
                                                            <div class="form-wrap">

                                                            </div>
                                                            <ul class="dotlist">
                                                                <li>
                                                                영문, 숫자를 포함한 6자 이상 ~ 30자 이내 (공백 입력 불가)
                                                                영문+숫자 10자 이상 혹은 영문+숫자+특수문자 8자 이상을 권장
                                                                다른 사이트와 같지 않은 비밀번호를 추천
                                                                </li>
                                                            </ul>

                                                            <div class="btngroup">
                                                                <button class="btn btn-linelgray" data-dismiss="modal" id="btnChangePwdCancel"><span>취소</span></button>
                                                                <button class="btn btn-default medium" id="btnChangePwdConfirm"><span>확인</span></button>
                                                            </div>
                                                        </div>
                                                        <!-- //.content-body -->

                                                        <button class="btn btn-close" data-dismiss="modal" id="btnChangePwdX"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
                                                    </div> <!-- //.content -->
                                                </div> <!-- //.ui-modal-dialog -->
                                            </div>

                                            <li>
                                               <span class="checkbox_ui type1">
                                                  <input type="checkbox" title="" name="agreement" value="02" id="agree1"
                                                         class="tcmCheckboxreqTcm">
                                                  <label for="agree1">
                                                     <span class="c_bl chkA">
                                                        <span class="c_bl">[필수]</span>

                                                     </span> 개인정보 수집.이용 동의</label>
                                               </span>
                                               <button type="button" class="btn_typeC1 viewBt" onclick="viewTermContentsHdgm('02', '1', this)" data-pop="pop_terms"><span>내용보기</span></button>
                                            </li>
                                        </ul>
                                    </div>


                                    <div class="agree_part tAgreeA">
                                        <p>Hmall 약관</p>
                                        <ul id="partnerTerm" class="tAgreeList">

                                            <li>
                                          <span class="checkbox_ui type1">
                                             <input type="checkbox" title="" name="agreement" value="01" id="agreeP0"
                                                    class="tcmCheckboxreqTcm">
                                             <label for="agreeP0">
                                                <span class="c_bl chkA">
                                                   <span class="c_bl">[필수]</span>

                                                </span> 이용 약관</label>
                                          </span>
                                                <button type="button" class="btn_typeC1 viewBt" onclick="viewTermContents('01', '0', this)" data-pop="pop_terms"><span>내용보기</span></button>
                                            </li>

                                            <li>
                                          <span class="checkbox_ui type1">
                                             <input type="checkbox" title="" name="agreement" value="02" id="agreeP1"
                                                    class="tcmCheckboxreqTcm">
                                             <label for="agreeP1">
                                                <span class="c_bl chkA">
                                                   <span class="c_bl">[필수]</span>

                                                </span> 개인정보 수집.이용 동의</label>
                                          </span>
                                                <button type="button" class="btn_typeC1 viewBt" onclick="viewTermContents('02', '1', this)" data-pop="pop_terms"><span>내용보기</span></button>
                                            </li>

                                            <li>
                                          <span class="checkbox_ui type1">
                                             <input type="checkbox" title="" name="agreement_c" value="03" id="agreeP2"
                                                    class="tcmCheckboxreqTcm_2">
                                             <label for="agreeP2">
                                                <span class="c_bl chkA">

                                                   [선택]
                                                </span> 맞춤 마케팅을 위한 개인정보 수집·이용 동의</label>
                                          </span>
                                                <button type="button" class="btn_typeC1 viewBt" onclick="viewTermContents('03', '2', this)" data-pop="pop_terms"><span>내용보기</span></button>
                                            </li>

                                            <li>
                                        </ul>
                                    </div>
                                </div>

                                <ul class="bullet_type1 mark2">
                                    <li>필수항목에 동의하지 않으실 경우 서비스 가입이 불가합니다.</li>
                                    <li><em>선택항목에 동의하지 않으셔도 서비스 가입이 가능하나, 관련 서비스는 제공받으실 수 없습니다.</em></li>
                                </ul>
                                <div class="btn_area btn_ac">
                                    <a href="https://www.hmall.com/p/index.do" class="btn_typeB1">
                                        <span>취소</span></a>
                                    <button class="btn_typeB2" id="joinSubmit" onclick="next()" ><span>다음</span></button>
                                </div>
                            </div>
                    </div>
                </div>
            </section>
            <div class="sub_bottom_blank1"></div>
        </div>
    </div>
</main>

