<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="passwordCheck.jsp" %>
<section id="bottomSection">
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
  <div class="container">


      <input type="hidden" name="userid" value="${pinfo.userVO.user_id}">
      <input type="hidden" name="userGender" value="${pinfo.userVO.user_gender}">
      <input type="hidden" name="emailyn" value="${pinfo.userVO.user_email_receive}">
      <input type="hidden" name="smsyn" value="${pinfo.userVO.user_sms_receive}">

      <div class="gird-l2x">
          <%@ include file="mypageSide.jsp" %>
        <!-- // LNB 끝 -->
          <div class="contents">
            <div class="mypage-info-wrap">
              <!-- 본인확인 시작 ----------------------------------------------------------------------------------------------- -->
              <div class="bg-gray-box center" id="divConfirmMemberInfo">
                <p class="ctypo15">고객님의 개인정보 보호를 위해 본인확인 후 가려진 정보 확인이 가능합니다.</p>
                <h3><button type="button" class="btn btn-linelgray small34 accordion-trigger" data-modules-collapse="" aria-expanded="false"><span>본인확인</span></button></h3>
                <div class="accordion-panel" role="region" aria-label="회원정보입력">
                  <div class="form-wrap">
                    <div class="inputbox">
                      <label class="inplabel"><input type="text" name="confirmName" value="" placeholder="이름"></label>
                      <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                    </div>
                    <div class="inputbox">
                      <label class="inplabel"><input type="number" name="confirmMobile" value="" placeholder="휴대폰번호 입력" onkeypress="return isNumberKey(event)"></label>
                      <button type="button" class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                    </div>
                    <div class="btngroup">
                      <button type="button" class="btn btn-default medium" onclick="confirmMemberInfo();"><span>확인</span></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 본인확인 종료 ----------------------------------------------------------------------------------------------- -->
              <!-- 기본정보 시작 ----------------------------------------------------------------------------------------------- -->
              <h3 class="title22">기본정보</h3>
              <div class="tblwrap">
                <table>
                  <caption>기본정보</caption>
                  <colgroup>
                    <col style="width:120px">
                    <col style="width:auto">
                  </colgroup>
                  <tbody>
                  <tr>
                    <th scope="row" class="txt-left">이름</th>
                    <td>
                      <span id="baseInfoName">${pinfo.userVO.user_name}</span>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="txt-left">아이디</th>
                    <td>
                      <span id="baseInfoId">${pinfo.userVO.user_id}</span>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="txt-left">비밀번호</th>
                    <td><span>********</span>
                      <button type="button" class="btn btn-linelgray small30" onclick="$('#changePasswordPup').modal().show()"><span>수정</span></button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="txt-left">휴대폰</th>
                    <script type="text/javascript">
                      var cnryCd = null;
                      cnryCd = "KR";
                      if (cnryCd == null || cnryCd == "") {
                        cnryCd = "KR";
                      }
                      $("#cnryCd").val(cnryCd);
                    </script>
                    <input type="hidden" class="text type2" title="휴대폰번호 첫자리" name="mobileDdd" value="010" maxlength="4">
                    <input type="hidden" class="text type2" title="휴대폰번호 두번째" name="mobilePhone1" value="9398" maxlength="4">
                    <input type="hidden" class="text type2" title="휴대폰번호 마지막" name="mobilePhone2" value="9130" maxlength="4">

                    <td>

                      <sec:authentication property="principal" var="pinfo" />
                      <span id="baseInfoMobilePhone">대한민국 (82) - ${pinfo.userVO.user_phone}</span>
                      <input type="hidden" id="cnryNm" value="대한민국 (82)">
                      <button type="button" class="btn btn-linelgray small30" onclick="popChangeMobilePhone();"><span>수정</span></button>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- 기본정보 종료 ----------------------------------------------------------------------------------------------- -->
              <!-- 부가정보 시작 ----------------------------------------------------------------------------------------------- -->
              <h3 class="title22">부가정보</h3>
              <div class="tblwrap">
                <table>
                  <caption>부가정보</caption>
                  <colgroup>
                    <col style="width:120px">
                    <col style="width:auto">
                  </colgroup>
                  <tbody>

                  <tr>
                    <th scope="row" class="txt-left">닉네임</th>
                    <td>
                      <sec:authentication property="principal" var="pinfo" />
                      <span id="baseInfoNickname">${pinfo.userVO.user_nickname}</span>
                      <button type="button" class="btn btn-linelgray small30" onclick="$('#changeNicknamePup').modal().show()"><span>등록</span></button>
                    </td>
                  </tr>


                  <tr>
                    <th scope="row" class="txt-left">이메일</th>
                    <td>
                      <sec:authentication property="principal" var="pinfo" />
                      <span id="baseInfoEmail">${pinfo.userVO.user_email}</span>
                      <button type="button" class="btn btn-linelgray small30" onclick="popChangeEmail();"><span>수정</span></button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="txt-left">생년월일</th>
                    <td><span id="baseInfoBirthday"><fmt:formatDate value="${pinfo.userVO.user_birth}" pattern="yyyy년 MM월 dd일"/></span>
                      <button type="button" class="btn btn-linelgray small30" onclick="$('#changeBirthdayPup').modal().show()"><span>수정</span></button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="txt-left">성별</th>
                    <td>
                      <div class="wrap_chk">
                        <span class="checkbox_ui type1">
                          <input type='radio' name='gender' id="maleGender" value="M" />&nbsp;남&nbsp;
                          <input type='radio' name='gender' id="femaleGender" value="F" />&nbsp;여&nbsp;
                          <input type='radio' name='gender' id="noneGender" value="N" />&nbsp;미입력
<%--                          <label class="chklabel sm">--%>
<%--                            <input type='checkbox' name='maleGender' id="maleGender" value="M" /><i class="icon"></i>--%>
<%--                            <p>&nbsp;남&nbsp;</p>--%>
<%--                          </label>--%>
<%--                          <label class="chklabel sm">--%>
<%--                            <input type='checkbox' name='femaleGender' id="femaleGender" value="F" /><i class="icon"></i>--%>
<%--                            <p>&nbsp;여&nbsp;</p>--%>
<%--                          </label>--%>
<%--                          <label class="chklabel sm">--%>
<%--                            <input type='checkbox' name='noneGender' id="noneGender" value="N" /><i class="icon"></i>--%>
<%--                            <p>&nbsp;미입력&nbsp;</p>--%>
                          </label>
                        </span>
                      </div>
                    </td>
                  </tr>
                  </tbody>
                </table>
              </div>
              <!-- 부가정보 종료 ----------------------------------------------------------------------------------------------- -->
              <h3 class="title22">
                <label class="chklabel">
                  <input type="checkbox" id="agreeMarketing" onclick="checkAgreeMarketing();">
                  <i class="icon"></i>
                  <span>맞춤형 마케팅 동의 (선택)</span>
                </label>
                <button type="button" class="btn btn-linelgray small34" onclick="openMkAgrPopup();"><span>상세보기</span></button>
              </h3>

              <div class="border-gray-box type-list">
                <label class="chklabel sm">
                  <input type="checkbox" id="emailMarketing" onclick="checkBoxChk($(this));">
                  <i class="icon"></i>
                  <span>이메일</span>
                </label>
                <label class="chklabel sm">
                  <input type="checkbox" id="smsMarketing" onclick="checkBoxChk($(this));">
                  <i class="icon"></i>
                  <span>문자</span>
                </label>
              </div>
              <div class="btngroup w_510">
                <button type="button" class="btn btn-linelgray medium" onclick="cancelMember();"><span>취소</span></button>
                <button type="button" class="btn btn-default medium" id="aBtnSubmit" onclick="updateSubmit();"><span>확인</span></button>
              </div>
            </div>

        </div> <!-- // .contents -->
      </div>
  </div> <!-- //.container -->

      <!--비밀번호 변경 모달창-->
      <div class="ui-modal password-change in" id="changePasswordPup" tabindex="-1" role="dialog" aria-label="비밀번호 수정" style="z-index: 1031; display: none; padding-right: 0px;">
          <div class="ui-modal-dialog" role="document">
            <div class="content">
              <p class="ui-title">비밀번호 수정</p>
              <!-- //.content-head -->
              <div class="content-body">
                <div class="form-wrap">
                      <!-- 현재비밀번호 ------ -->
                      <div class="inputbox" id="divOldPwd"><!-- 실패시 class="failed" 추가 -->
                        <label class="inplabel icon-lock"><input type="password" placeholder="현재 비밀번호 입력" id='iPwd' name="oldPassword" maxlength="30"></label>
                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                      </div>
                      <p class="failed-msg" id="failedOldPwd" style="display:none">
                        <i class="icon" id="alertOldPasswdIcon"></i><span id="alertOldPasswd"></span>
                      </p> <!-- // 실패시 노출 -->

                      <!-- 신규비밀번호 ------ -->
                      <div class="inputbox" id="divNewPwd"><!-- 실패시 class="failed" 추가 -->
                        <label class="inplabel icon-lock" id="uPwdChk1"><input type="password" placeholder="비밀번호 (영문, 숫자 조합 6자리 이상)" id='iPwd1' name="newPassword" maxlength="30"></label>
                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                        <em class="" id="lockNewPwd"></em>
                      </div>
                      <p class="failed-msg" id="failedNewPwd" style="display:none">
                        <i class="icon" id="alertNewPasswdIcon"></i><span id="alertNewPasswd"></span>
                      </p> <!-- // 실패시 노출 -->

                      <!-- 비밀번호확인 ------ -->
                      <div class="inputbox" id="divReNewPwd"><!-- 실패시 class="failed" 추가 -->
                        <label class="inplabel icon-lock" id="uPwdChk2"><input type="password" placeholder="비밀번호 재확인" id='iPwd2' name="reNewPassword" maxlength="30"></label>
                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                        <em class="" id="lockReNewPwd"></em>
                      </div>
                      <p class="failed-msg" id="failedReNewPwd" style="display:none">
                        <i class="icon" id="alertReNewPasswdIcon"></i><span id="alertReNewPasswd"></span>
                      </p> <!-- // 실패시 노출 -->

                </div>

                <ul class="dotlist">
                  <li>영문, 숫자를 포함한 6자 이상 ~ 30자 이내 (공백 입력 불가)</li>
                  <li>영문+숫자 10자 이상 혹은 영문+숫자+특수문자 8자 이상을 권장</li>
                  <li>다른 사이트와 같지 않은 비밀번호를 추천</li>
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
        </div> <!-- //.ui-modal -->

      <!--닉네임 변경 모달창-->
      <div class="ui-modal nickname-change in" id="changeNicknamePup" tabindex="-1" role="dialog" aria-label="닉네임 등록 및 수정" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
          <div class="content">

            <p class="ui-title">닉네임 등록</p>


            <div class="content-body">
              <div class="form-wrap">
                <div class="inputbox" id="divChangeNickname">

                  <label class="inplabel"><input type="text" id="new-nickname" value="" onkeyup="this.value=this.value.replace(/[^0-9a-zA-Zㄱ-힣]/g, '');" placeholder="닉네임 입력" title="닉네임을 입력해주세요" maxlength="8"></label>


                  <button class="btn btn-lineblack btn-confirm" type="button" onclick="nknmChk()"><span>중복확인</span></button>
                  <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                </div>
                <p class="failed-msg">
                  <i class="icon" id="alertNicknameIcon"></i>
                  <span id="alertNickname"></span>
                </p>
              </div>
              <div class="btngroup">
                <button class="btn btn-linelgray" data-dismiss="modal"><span>취소</span></button>
                <button class="btn btn-default medium" id="btnChangeNickname"><span>확인</span></button>
              </div>
            </div> <!-- //.content-body -->
            <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
          </div> <!-- //.content -->
        </div>
      </div>

      <!--생년월일 수정 모달-->
      <div class="ui-modal birth-change in" id="changeBirthdayPup" tabindex="-1" role="dialog" aria-label="생년월일 수정" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
          <div class="content">
            <p class="ui-title">생년월일 수정</p>
            <!-- //.content-head -->
            <div class="content-body">
              <div class="form-wrap">
                <!-- input disabled이면 inputbox에 class disabled 추가, readonly 동일, focus시 selected 추가 입력 오류 시 inputbox class failed 추가 class="inputbox failed" -->
                <div class="inputbox" id="divBirth">
                  <label class="inplabel"><input type="text" name="newBirthday" value="" onkeypress="return isNumberKey(event)" maxlength="8" placeholder="생년월일 (예: 1990824)" title="생년월일을 입력해주세요"></label>
                  <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                </div>
                <p class="failed-msg" id="alertBirthday">
                  <i class="icon error" id="alertBirthdayIcon" style="display:none"></i>
                  <span></span>
                </p>
              </div>
              <div class="btngroup">
                <button class="btn btn-linelgray" data-dismiss="modal" id="btnChangeBirthCancel"><span>취소</span></button>
                <button class="btn btn-default medium" id="btnChangeBirthConfirm"><span>확인</span></button>
              </div>
            </div> <!-- //.content-body -->
            <button class="btn btn-close" data-dismiss="modal" id="btnChangeBirthX"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
          </div> <!-- //.content -->
        </div> <!-- //.ui-modal-dialog -->
      </div>

      <!-- 맞춤형 마케팅 동의 -->
      <div class="ui-modal mp-member-info in" id="mkAgrPopup" tabindex="-1" role="dialog" aria-label="맞춤형 마케팅 동의 (선택)" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
          <div class="content">
            <p class="ui-title">맞춤형 마케팅 동의 (선택)</p>
            <!-- //.content-head -->
            <div class="content-body">
              <div class="tblwrap mt_10">
                <table>
                  <caption>마케팅 정보 수신여부</caption>
                  <colgroup>
                    <col style="width:180px;">
                    <col style="width:auto;">
                    <col style="width:195px;">
                  </colgroup>
                  <thead>
                  <tr>
                    <th scope="col" class="major-headings">목적</th>
                    <th scope="col" class="major-headings">항목</th>
                    <th scope="col">보유기간</th>
                  </tr>
                  </thead>
                  <tbody>
                  <tr>
                    <td class="txt-center">맞춤형 서비스 <br>제공 및 마케팅</td>
                    <td class="txt-center">이메일, 휴대폰 번호, 생년월일, 서비스 이용기록</td>
                    <td class="txt-center"><strong>회원탈퇴 시 <br>또는 법정 의무 보유기간</strong></td>
                  </tr>
                  </tbody>
                </table>
              </div>
            </div> <!-- //.content-body -->
            <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
          </div> <!-- //.content -->
        </div> <!-- //.ui-modal-dialog -->
      </div>

    </div>
  </main>
</section>

<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
</main>
</body>
</html>

<script type="text/javascript">

  var isValidMobilePhone = false;
  var isValidPasswd = false;
  var isValidRePasswd = false;
  var isValidEmail = false;
  var isCertYn = false;
  var isEmail = false;
  var memCnryCd = "KR";
  var cnryCdOld = "KR";
  var isValidBirthday = false; // 회원가입개선Prj 추가
  var certType = "";  //휴대폰변경을 위한 휴대폰본인 인증: hphoneCertForUpdateHphone, 휴대폰변경을 위한 이메일 인증: emailCertForUpdateHphone, 휴대폰인증:hPhoneCert,  메일주소변경을 위한 인증: updateEmail, 이메일인증: emailCert, 네이버인증:naverBinding - 2018.11.23 회원가입개선Prj
  var emailCertNo = "";  //이메일 인증을 위한 인증 로그 번호
  var newHphoneNumber = "";
  var redirectUrl = "";
  var snsGubun = "";
  var memEmail = "alstntn2631@naver.com";
  var isChkNknm = false; //닉네임 수정
  var isNknmAjax = false;

  jQuery(function($) {

    $(document).ready(function () {
      var emaailval = $('input[name="emailyn"]').val();
      var smsval = $('input[name="smsyn"]').val();
      var genderval = $('input[name="userGender"]').val();

      if(emaailval == 1) $("#emailMarketing").prop("checked", true);
      else $("#emailMarketing").prop("checked", false);

      if(smsval == 1) $("#smsMarketing").prop("checked", true);
      else $("#smsMarketing").prop("checked", false);

      if(genderval === "M") $("#maleGender").prop("checked", true);
      else if(genderval === "F") $("#femaleGender").prop("checked", true);
      else $("#noneGender").prop("checked", true);
    });

    $("input[name='oldPassword'], input[name='newPassword'], input[name='reNewPassword']").keyup(function() {
      var str = $(this).val();
      var pattern = /\s/g;

      if (!isEmpty(str) && pattern.test(str)){
        $(this).val(txt);
      } else {
        txt = $(this).val();
      }
    });

    // 현재 비밀번호 입력 체크
    $("input[name='oldPassword']").blur(function() {
      var pwd = $(this).val();

      var alertSpan = $("#alertOldPasswd");
      var alertIcon = $("#alertOldPasswdIcon");
      var divChk = $("#divOldPwd");
      var failedMsg = $("#failedOldPwd");

      if (isEmpty(pwd)) {
        isValidPasswd = false;
        divChk.addClass('failed');
        alertIcon.addClass("error");
        alertSpan.text("비밀번호를 입력해 주세요.").show();
        failedMsg.show();
      } else {
        divChk.removeClass('failed');
        alertIcon.removeClass("error");
        alertSpan.text("").hide();
        failedMsg.hide();
      }
    });


    // 신규 비밀번호 입력 체크
    $("input[name='newPassword']").blur(function() {
      var pwd = $(this).val();

      var alertSpan = $("#alertNewPasswd");
      var alertIcon = $("#alertNewPasswdIcon");
      var divChk = $("#divNewPwd");
      var lockChk = $("#lockNewPwd");
      var failedMsg = $("#failedNewPwd");

      if (isEmpty(pwd)) {
        isValidPasswd = false;

        divChk.removeClass('weak');
        divChk.removeClass('usually');
        divChk.removeClass('success');
        divChk.addClass('failed');

        lockChk.removeClass('lock-weak');
        lockChk.removeClass('lock-usually');
        lockChk.removeClass('lock-success');
        lockChk.text("").hide();

        alertIcon.addClass("error");
        alertSpan.text("새 비밀번호를 입력해 주세요.").show();
        failedMsg.show();
      } else {
        var v_num = 0;
        var v_engL = 0;
        var v_engS = 0;
        var v_spe = 0;
        var pattern1 = /\s/g;

        isValidPasswd = true;

        //1.비밀번호에 포함된 문자,숫자,특수문자구분,한글
        for(var i = 0; i < pwd.length; i++)
        {
          if(ufn_ASCII(pwd,i)>=48 && ufn_ASCII(pwd,i)<=57){ v_num = 1; }//숫자
          else if(ufn_ASCII(pwd,i)>=65 && ufn_ASCII(pwd,i)<=90){ v_engL = 1; }//영대
          else if(ufn_ASCII(pwd,i)>=97 && ufn_ASCII(pwd,i)<=122){ v_engS = 1; }//영소
          else if((ufn_ASCII(pwd,i)>=33 && ufn_ASCII(pwd,i)<=47)||(ufn_ASCII(pwd,i)>=58 && ufn_ASCII(pwd,i)<=64)||(ufn_ASCII(pwd,i)>=91 && ufn_ASCII(pwd,i)<=96)||(ufn_ASCII(pwd,i)>=123 && ufn_ASCII(pwd,i)<=126)){
            v_spe = 1;//특수문자
          }
        }

        //2.비밀번호 자리수 체크 및 자리수별 조합된 경우의 수 체크
        if (pwd.length < 6) {
          isValidPasswd = false;
          alertSpan.text("비밀번호는 6 ~ 30자리 이내로 입력해 주세요.");
        } else if ((v_num+v_engL+v_engS+v_spe) < 2) {
          isValidPasswd = false;
          alertSpan.text("비밀번호는 영소문자, 영대문자, 숫자, 특수문자의 조합이 2가지 이상으로 구성해야합니다.");
        }

        //3.연속된숫자 및 문자 체크 / 연속 중복된 문자,숫자 체크
        for(var i = 0; i < pwd.length; i++)
        {
          if (((ufn_ASCII(pwd,i)-ufn_ASCII(pwd,i-1)==1) && (ufn_ASCII(pwd,i-1)-ufn_ASCII(pwd,i-2)==1))||((ufn_ASCII(pwd,i)-ufn_ASCII(pwd,i-1)==-1) && (ufn_ASCII(pwd,i-1)-ufn_ASCII(pwd,i-2)==-1))) {
            if (ufn_ASCII(pwd,i-1)>=40 && ufn_ASCII(pwd,i-1)<=57) {
              isValidPasswd = false;
              alertSpan.text("연속된 숫자는 비밀번호로 사용하실수 없습니다.");//(예:123 , 321 등)
            } else if (ufn_ASCII(pwd,i-1)>=65 && ufn_ASCII(pwd,i-1)<=90) {
              isValidPasswd = false;
              alertSpan.text("연속된 영대문자는 비밀번호로 사용하실수 없습니다.");//(예: ABC, CBA등)
            } else if (ufn_ASCII(pwd,i-1)>=97 && ufn_ASCII(pwd,i-1)<=122) {
              isValidPasswd = false;
              alertSpan.text("연속된 영소문자는 비밀번호로 사용하실수 없습니다.");//(예: abc, cba등)
            }
          } else if ((ufn_ASCII(pwd,i)-ufn_ASCII(pwd,i-1)==0) && (ufn_ASCII(pwd,i-1)-ufn_ASCII(pwd,i-2)==0)) {
            isValidPasswd = false;
            alertSpan.text("동일한 문자,숫자,특수문자는 연속해서 비밀번호로 사용하실수 없습니다.");
          }
        }

        //4. 공백 입력 제한
        if (pattern1.test(pwd)) {
          isValidPasswd = false;
          alertSpan.text("공백은 입력할 수 없습니다.");
        }

        // 5. 아이디와 동일한지 체크
        if(pwd == "alstn2631"){
          isValidPasswd = false;
          alertSpan.text("아이디와 동일한 비밀번호는 입력할 수 없습니다.");
        }

        if (isValidPasswd) {
          if (pwd.length >= 6 && pwd.length < 8) {
            divChk.removeClass('usually');
            divChk.removeClass('success');
            divChk.addClass('weak');

            lockChk.removeClass('lock-usually');
            lockChk.removeClass('lock-success');
            lockChk.addClass('lock-weak');

            lockChk.text("취약").show();
          } else if(pwd.length >= 8 && pwd.length <= 9) {
            divChk.addClass('usually');
            divChk.removeClass('success');
            divChk.removeClass('weak');

            lockChk.addClass('lock-usually');
            lockChk.removeClass('lock-success');
            lockChk.removeClass('lock-weak');

            lockChk.text("보통").show();
          } else if(pwd.length >= 10) {
            divChk.removeClass('usually');
            divChk.addClass('success');
            divChk.removeClass('weak');

            lockChk.removeClass('lock-usually');
            lockChk.addClass('lock-success');
            lockChk.removeClass('lock-weak');

            lockChk.text("안전").show();
          }

          divChk.removeClass('failed');
          alertIcon.removeClass("error");
          alertSpan.text("").hide();
          failedMsg.hide();
        } else {
          if( $("input[name='newPassword']").val() != $("input[name='reNewPassword']").val() ) {
            divChk.addClass('failed');
          }

          divChk.addClass('failed');
          alertSpan.show();
          alertIcon.addClass("error");
          failedMsg.show();
        }
      }
    });

    // 비밀번호 재 입력 체크
    $("input[name='reNewPassword']").blur(function() {
      var alertSpan = $("#alertReNewPasswd");
      var alertIcon = $("#alertReNewPasswdIcon");
      var divChk = $("#divReNewPwd");
      var lockChk = $("#lockReNewPwd");
      var failedMsg = $("#failedReNewPwd");

      if (isEmpty($(this).val())) {
        isValidRePasswd = false;

        divChk.addClass('failed');
        divChk.removeClass('discord');

        lockChk.removeClass('lock-discord');
        lockChk.text("").hide();

        alertIcon.addClass("error");
        alertSpan.text("비밀번호 재확인을 입력해 주세요.").show();
        failedMsg.show();
      } else {
        if ($("input[name='newPassword']").val() != $(this).val()) {
          isValidRePasswd = false;

          divChk.addClass('failed');
          divChk.addClass('discord');

          lockChk.addClass('lock-discord');
          lockChk.text("불일치").show();

          alertIcon.addClass("error");
          alertSpan.text("비밀번호가 일치하지 않습니다.").show();
          failedMsg.show();
        } else {
          isValidRePasswd = true;

          divChk.removeClass('failed');
          divChk.removeClass('discord');

          lockChk.removeClass('lock-discord');
          lockChk.text("").hide();

          alertIcon.removeClass("error");
          alertSpan.text("").hide();
          failedMsg.hide();
        }
      }
    });


    $("input[name='reNewPassword']").keyup(function() {
      var alertSpan = $("#alertReNewPasswd");
      var alertIcon = $("#alertReNewPasswdIcon");
      var failedMsg = $("#failedReNewPwd");

      if (isEmpty($(this).val())) {
        if ( isEmpty($("input[name='newPassword']").val()) ) {
          alertSpan.hide();
          alertIcon.removeClass("error");
          failedMsg.hide();
        }
      }
    });

    // 비밀번호 변경 팝업의 '확인' 버튼 클릭
    $("#btnChangePwdConfirm").on("click",function(){
      changePwd();
    });

    // 비밀번호 변경 팝업의 '취소' 버튼 클릭
    $("#btnChangePwdCancel, #btnChangePwdX").on("click",function() {
      puClear();
    });

    // 이메일수정 입력 체크
    $("input[name='newEmail']").blur(function() {
      checkEmail();
    });

    // 휴대폰번호 변경 새로운 번호 입력 팝업의 '취소' 버튼 클릭
    $("#btnchangeHphoneCancel, #btnchangeHphoneX").on("click",function(){
      puClear();
    });

    $("input[name='newHphoneNumber']").blur(function() {
      checkMoblie();
    });

    // 휴대폰번호 수정 팝업의 '확인' 버튼 클릭
    $("#btnChangeHphoneConfirm").on("click",function(){
      setHphoneNum();
    });

    // 닉네임 등록 및 수정 팝업의 '확인' 버튼 클릭
    $("#btnChangeNickname").on("click",function() {
      var tmpNknm = $("#new-nickname").val();
      var preNknm = "";

      var divChangeNickname = $("div#divChangeNickname");
      var alterSpan = $("span#alertNickname");
      var alterIcon = $("i#alertNicknameIcon");

      divChangeNickname.removeClass("failed");
      alterIcon.removeClass("error");
      alterSpan.text("");

      if (tmpNknm == preNknm) {
        divChangeNickname.addClass("failed");
        alterIcon.addClass("error");
        alterSpan.text("닉네임을 변경해주세요.");
        return;
      }

      if (!isChkNknm) {
        divChangeNickname.addClass("failed");
        alterIcon.addClass("error");
        alterSpan.text("닉네임 중복확인을 먼저 해주세요.");
        return;
      }

      if (!isEmpty(preNknm)) {
        if (!confirm("닉네임을 수정하시겠습니까?")) return;
      }

      var csrfHeaderName = "${_csrf.headerName}";
      var csrfTokenValue = "${_csrf.token}";
      var user_id = "${pinfo.userVO.user_id}"

      $.ajax({
        type: "post"
        ,url: "myPage_newNickname"
        ,data: {"user_nickname" : tmpNknm, "user_id" : user_id}
        ,async: false
        ,beforeSend: function(xhr) {
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        }
        ,success : function(data) {
          if(data == "success") {
            alert("닉네임이 등록되었습니다.");
            $('#changeNicknamePup').modal('hide')
            getNewInfo("nick");
          }
        },
        error : function() {
          alert("시스템 오류입니다. 다시 시도해주세요.");
        }
      });
    });

    // 이메일 수정 팝업의 '인증메일 발송' 버튼 클릭
    $("#btnSendEmail").on("click",function() {
      //개인정보 수집 및 이용 동의 체크 여부 확인
      if ($("input:checkbox[name='chkAgreeEmailChange']").is(":checked") == false){
        alert('개인정보 수집 및 이용에 동의하여야합니다.');
        return;
      }

      certType = "updateEmail";

      var sessionEmail = '';
      var newEmail = $("input[name='newEmail']").val();
      var email = $("input[name='email']").val();
      var divChangeEmail  = $("#divChangeEmail");
      var alertSpan = $("#alertNewEmail");

      //emailCertNo = "isCi";
      $("input[name='email']").val(newEmail);

      checkEmail();

      if (isValidEmail){
        var left = ($(window).scrollLeft() + $(window).width()) / 2 + "px";
        var top = ($(window).scrollTop() + ($(window).height() / 2)) + "px";
        showLoadingBar(left, top);
        jQuery.ajax({
          type: "POST"
          , url: "/p/mpd/emailVerificationAndCertForChageEmail.do"
          , dataType: "json"
          , data:{"oldEmail":sessionEmail,"newEmail":newEmail,"custName":"김민수","type":"mp","emailCertNo":emailCertNo}
          , success : function(data) {
            hideLoadingBar();
            if (data.result) {
              alert("이메일이 발송되었습니다. 메일인증 후 해당페이지에서 '인증하기'를 해주세요");
              emailCertNo = data.emailCertNo;
              divChangeEmail.addClass('disabled');
              $("input[name='newEmail']").attr("disabled", true);
              $("#divSendEmail").hide();
              $("#btnChangeEmailConfirm").show();
            } else {
              $("#divSendEmail").show();
              $("#btnChangeEmailConfirm").hide();
              divChangeEmail.removeClass('disabled');
              $("input[name='newEmail']").attr("disabled", false);
              divChangeEmail.addClass('failed');
              if (data.errorCode == "MEMBEREMAIL") {
                alertSpan.parent().show();
                alertSpan.text("이미 등록된 이메일입니다.").show();
                isEmail = false;
              }
            }
          }
          , error: function(data) {
            hideLoadingBar();
            alert("일시적 시스템 오류입니다. \n 다시 시도하여 주세요.");
          }
        });
      }  // if (isValidEmail)
    });

    // 이메일 변경 팝업의 '인증하기' 버튼 클릭
    $("#btnChangeEmailConfirm").on("click",function() {

      //개인정보 수집 및 이용 동의 체크 여부 확인
      if ($("input:checkbox[name='chkAgreeEmailChange']").is(":checked") == false){
        alert('개인정보 수집 및 이용에 동의하여야합니다.');
        return;
      }

      var newEmail = $("input[name='newEmail']").val();
      var divChangeEmail = $("#divChangeEmail");
      var alertSpan = $("#alertNewEmail");

      $("input[name='email']").val(newEmail);

      checkEmail();

      if (isValidEmail && (isEmpty(emailCertNo) || !isEmail)) {
        alert("이메일 인증을 하세요.");
        isEmail = false;
        return;
      }

      if (isValidEmail && isEmail) {
        jQuery.ajax({
          type: "post"
          , url: "/p/mpd/isFindEmailCert.do"
          , dataType: "json"
          , data :{emailCertNo:emailCertNo}
          , async: false
          , success : function(data) {
            if(data.result) {
              jQuery.ajax({
                type: "post"
                , url: "/p/mpd/updateEmail.do"
                , dataType: "json"
                , data :{newEmail:newEmail}
                , async: false
                , success : function(data) {
                  if(data.result) {
                    alert("이메일이 수정되었습니다.");
                    location.reload();
                    return;
                  } else {
                    alert(data.errorMsg);
                    return;
                  }
                }, error: function(data) {
                  alert("시스템 오류입니다. 다시 시도해주세요.");
                  return;
                }
              });

              return;

            } else {
              alert(data.errorMsg);
              return;
            }
          }, error: function(data) {
            alert("시스템 오류입니다. 다시 시도해주세요.");
            return;
          }
        }); // ajax mpd/isFindEmailCert.do
      }  // if (isValidEmail && isEmail)
    });

    // 이메일 변경 팝업의 '취소' 버튼 클릭
    $("#btnChangeEmailCancel").on("click",function(){
      puClear();
    });

    // 생년월일 변경 팝업의 '취소', 'X' 버튼 클릭
    $("#btnChangeBirthCancel, #btnChangeBirthX").on("click",function(){
      puClear();
    });

    // 생년월일 변경 팝업의 '확인' 버튼 클릭
    $("#btnChangeBirthConfirm").on("click",function(){
      changeBirthday();
    });

    // 생년월일 입력 체크
    $("input[name='newBirthday']").blur(function() {
      var alertSpan = $("#alertBirthday");
      var birthday = this.value;
      //var birthday = $("input[name='newBirthday']").val();

      var divChk = $("#divBirth");

      divChk.addClass('failed');

      if (birthday.length != 8) {
        if (isEmpty(birthday)) {
          isValidBirthday = true;
          alertSpan.text("필수 정보입니다.").show();
          divChk.addClass('failed');
        } else {
          alertSpan.text("생년월일은 8자리로 입력해 주세요. 예)19930227").show();
          isValidBirthday = false;
        }
      } else {
        if(!isValidDate(birthday)){
          alertSpan.text("올바른 날짜가 아닙니다.").show();
          isValidBirthday = false;
        } else if (calcAge(birthday) < 0) {  // 오늘날짜 이후의 미래의 날짜를 입력한 경우
          alertSpan.text("올바른 날짜가 아닙니다.").show();
          isValidBirthday = false;
        } else if (calcAge(birthday) < 14) {
          alertSpan.text("만14세 미만은 회원가입 하실 수 없습니다.").show();
          isValidBirthday = false;
        } else if (calcAge(birthday) > 115) {
          alertSpan.text("올바른 날짜가 아닙니다.").show();
          isValidBirthday = false;
        } else {
          isValidBirthday = true;
          alertSpan.text("");
          alertSpan.hide();
          divChk.removeClass('failed');
        }
      }
    });
  });

  /**
   * 인증완료
   */
  function certComplete() {
    isCertYn = true;
    //closeModalLayerPopup('certSelection');

    // 휴대폰번호 변경을 위한 휴대폰본인 인증 후
    if (certType == 'hphoneCertForUpdateHphone') {
      ;
    } else if (certType == 'emailCertForUpdateHphone'){
      // 휴대폰번호 변경을 위한 이메일 인증 후
      //$("a[name=certEmailNeed]").hide();
      //$("span#certEmailComplete").text("인증완료").show();
      //$("span#spanExHphone").text("예:01012345678").show();
      updateEmailCertInfo(); // 휴대폰번호 변경시 기존이메일을 기준으로 인증을 하므로 인증완료처리 하였음. but 요구사항에 맞지 않으면 이부분 삭제
    } else if(certType == 'updateEmail') {
      ;
    } else if (certType == 'hPhoneCert'){
      return;
    } else if (certType == 'emailCert'){    // 인증정보에서 이메일 인증 후
      location.reload();
    } else if (certType == 'snsBindingFal') { // 계정연결/실패 (네이버)
      certType = "";
      alert("계정연결에 실패하였습니다.");
    } else if (certType == 'snsBindingDup') { // 계정연결/이미 사용중인 메일 (네이버)
      certType = "";
      alert("사용중인 메일 계정입니다.");
    } else if (certType == "naverDeleteSuc"){
      location.reload();
    }
  }


  function setHphoneNum() {

    var newHphoneNumber = $("input[name='newHphoneNumber']").val();
    var isCi = false;
    var alertSpan = $("span#alertChangeHphone");
    var alertIcon = $("i#alertChangeHphoneIcon");

    if(isEmpty(newHphoneNumber)) {
      alertIcon.addClass('error');
      alertSpan.text("필수 정보입니다.").show();
      $("input[name='newHphoneNumber']").focus();
      return;
    }

    if(emailCertNo == "isCi"){
      isCi = true;
    }

    // 휴대폰번호 변경을 위해 휴대폰본인인증을 한 경우
    if (certType == 'hphoneCertForUpdateHphone') {
      saveChangeHphoneNum();
      return;
    }

    if (!isValidMobilePhone){
      alertSpan.text("휴대폰번호를 확인 해주세요.").show();
      $("input[name='newHphoneNumber']").focus();
      return;
    } else {
      certComplete();
      saveChangeHphoneNum();
      return;
    }

    return;
  }



  // 2018.11.26 이메일인증 또는 전화번호 수정을 위한 이메일 인증
  function popCertEmail(pCertType) {
    var msg = "";
    var emailAddr = memEmail;

    // 휴대폰변경을 위한 이메일 인증
    if (pCertType == "emailCertForUpdateHphone") {
      //개인정보 수집 및 이용 동의 체크 여부 확인
      if ($("input:checkbox[name='chkPersonalInfoAgreeEmail']").is(":checked") == false){
        alert('개인정보 수집 및 이용에 동의하여야합니다.');
        return;
      }

      //메일주소가 없는 경우 진행할 수 없음을 표시
      if (isEmpty(emailAddr)) {
        alert('이메일이 등록되어있지 않습니다.');
        return;
      }

      msg = "으로 이메일이 발송되었습니다. 이메일 인증 후 변경하시기 바랍니다.";
    }

    certType = pCertType;  // 휴대폰변경을 위한 이메일 인증

    $.ajax({
      type: "post"
      , url: "/p/mpd/findOldEmailCert.do"  // 인증메일 발송
      , dataType: "json"
      , data :{emailAdr:emailAddr,"custName":"김민수"}
      , success : function(data) {
        var flag = data.result;

        if(flag) {
          emailCertNo = data.emailCertNo;

          if (certType == "emailCert") {
            alert(emailAddr + msg);
            $("input[name='confirmEmail']").attr("disabled", true);
            $("#alertConfirmEmailIcon").removeClass('error');
            $("#alertConfirmEmail").text("").hide();
            $("#divConfirmEmail").show();
            return;
          }

          alert($.trim($("#baseInfoEmail").text()) + msg);
          $("#btnSendEmailForChangeHp").hide();
          $("#btnConfirmEmailForChangeHp").show();
          return;
        } else {
          alert("인증에 실패하였습니다. 다시 시도해주세요.");
          return;
        }
      } , error: function(data) {
        alert("시스템 오류입니다. 다시 시도해주세요.");
      }
    });
  }


  function puClear(){

    //*** 비밀번호 변경 팝업 clear ****
    isValidPasswd = false;
    isValidRePasswd = false;

    $("#alertOldPasswd").text("").hide();
    $("#alertNewPasswd").text("").hide();
    $("#alertReNewPasswd").text("").hide();

    $("#failedOldPwd").hide();
    $("#failedNewPwd").hide();
    $("#failedReNewPwd").hide();

    $("#divOldPwd").removeClass('failed');
    $("#divNewPwd").removeClass('failed');
    $("#divReNewPwd").removeClass('failed');

    $("#divNewPwd").removeClass('weak');
    $("#divNewPwd").removeClass('usually');
    $("#divNewPwd").removeClass('success');

    $("#divReNewPwd").removeClass('discord');

    $("#lockNewPwd").removeClass('lock-weak');
    $("#lockNewPwd").removeClass('lock-usually');
    $("#lockNewPwd").removeClass('lock-success');

    $("#lockReNewPwd").removeClass('lock-weak');
    $("#lockReNewPwd").removeClass('lock-usually');
    $("#lockReNewPwd").removeClass('lock-success');

    $("#lockNewPwd").text("").hide();
    $("#lockReNewPwd").text("").hide();

    init($("input[name='oldPassword']"));
    init($("input[name='newPassword']"));
    init($("input[name='reNewPassword']"));

    //*** 휴대폰번호 변경 팝업 clear ****
    // 인증 선택 팝업
    //$("label#lblPersonalInfoAgree").removeClass('_checked');
    //$("input:checkbox[name='chkPersonalInfoAgree']").prop("checked",false);

    // 새로운 휴대폰번호 입력 팝업
    isValidMobilePhone = false;

    $("#alertChangeHphone").text("");
    $("#alertChangeHphone").hide();
    $("#divNewHphone").removeClass('failed');
    $("#alertChangeHphoneIcon").removeClass('error');

    init($("input[name='newHphoneNumber']"));

    //*** 이메일 변경 팝업 clear ****
    isValidEmail = false;
    isEmail = false;

    $("#alertNewEmail").text("");
    $("#alertNewEmail").hide();
    $("#alertNewEmailIcon").removeClass('error');
    $("#alertNewEmailIcon").parent().hide();
    $("#divChangeEmail").removeClass('failed');
    $("input[name='newEmail']").attr("disabled", false);
    $("#divSendEmail").show();
    $("input[name=chkAgreeEmailChange]").prop("checked", false);
    $("#btnChangeEmailConfirm").hide();

    init($("input[name='newEmail']"));

    //*** 생년월일 변경 팝업 clear ****
    isValidBirthday = false;

    $("#alertBirthday").text("");
    $("#alertBirthday").hide();
    $("#divBirth").removeClass('failed');

    init($("input[name='newBirthday']"));

    //*** 이메일 인증 팝업 clear ****
  }

  ////////////////////////////////////////레이어팝업////////////////////////////////////////
  // 비밀번호 수정
  function popChangePassword() {
    $("#changePasswordPup").modal().show();
  }

  // 휴대폰번호 수정을 위한 인증
  function popChangeMobilePhone() {
    $("#changeMobilePhonePup").modal().show();
  }

  //휴대폰번호 수정 '인증하기' 버튼 클릭
  function checkConfirmEmail() {
    // 휴대폰 변경을 위해 이메일 인증을 한 경우
    jQuery.ajax({
      type: "post"
      , url: "/p/mpd/isFindEmailCert.do"
      , dataType: "json"
      , data :{emailCertNo:emailCertNo}
      , async: false
      , success : function(data) {
        if(data.result) {
          if (certType == 'emailCertForUpdateHphone'){
            $("#changeMobilePhonePup").modal().hide();
            $("#changePhoneNumberPup").modal().show();
          }
          if (certType == "emailCert") {
            updateEmailCertInfo();
          }
          return;
        } else {
          alert(data.errorMsg);
          return;
        }
      }, error: function(data) {
        certType = "";
        alert("시스템 오류입니다. 다시 시도해주세요.");
        return;
      }
    });
  }

  // 닉네임 등록 및 수정
  function popChangeNickname() {
    $("#changeNicknamePup").modal().show();
  }

  // 생년월일 수정
  function popChangeBirthday() {
    $("#changeBirthdayPup").modal().show();
  }

  // 이메일 수정
  function popChangeEmail() {
    $("#changeEmailPup").modal().show();
  }

  // 맞춤형 마케팅 동의 (선택) 상세보기 버튼 클릭
  function openMkAgrPopup() {
    $("#mkAgrPopup").modal().show();
  }

  ////////////////////////////////////////완료함수////////////////////////////////////////

  // 비밀번호 변경
  function changePwd() {

    console.log("함수");
    var oPwd = $("input[name='oldPassword']");

    var divOChk = $("#divOldPwd");
    var divNChk = $("#divNewPwd");
    var divRChk = $("#divReNewPwd");

    var alterOSpan = $("#alertOldPasswd");
    var alterNSpan = $("#alertNewPasswd");
    var alterRSpan = $("#alertReNewPasswd");

    var alterOIcon = $("#alertOldPasswdIcon");
    var alterNIcon = $("#alertNewPasswdIcon");
    var alterRIcon = $("#alertReNewPasswdIcon");

    var failedOMsg = $("#failedOldPwd");
    var failedNMsg = $("#failedNewPwd");
    var failedRMsg = $("#failedReNewPwd");


    if (isEmpty(oPwd.val())) {
      divOChk.addClass('failed');
      alterOIcon.addClass("error");
      alterOSpan.text("기존 비밀번호를 입력해 주세요.").show();
      failedOMsg.show();

      oPwd.focus();
      //alert("기존 비밀번호를 입력해 주세요.");
      return;
    }

    var nPwd = $("input[name='newPassword']");
    nPwd.val($.trim(nPwd.val()));

    if (isEmpty(nPwd.val())) {
      divNChk.addClass('failed');
      alterNIcon.addClass("error");
      alterNSpan.text("새 비밀번호를 입력해 주세요.").show();
      failedNMsg.show();

      nPwd.focus();
      //alert("새 비밀번호를 입력해 주세요.");
      return;
    }

    var rePwd = $("input[name='reNewPassword']");

    if (isEmpty(rePwd.val())) {
      divRChk.addClass('failed');
      alterRIcon.addClass("error");
      alterRSpan.text("새 비밀번호 재확인을 위해 입력해 주세요.").show();
      failedRMsg.show();

      rePwd.focus();
      //alert("새 비밀번호 재확인을 위해 입력해 주세요.");
      return;
    } else {
      if (nPwd.val() != rePwd.val()) {
        divRChk.addClass('failed');
        alterRIcon.addClass("error");
        alterRSpan.text("비밀번호가 일치하지 않습니다.").show();
        failedRMsg.show();

        rePwd.focus();
        //alert("비밀번호가 일치하지 않습니다.");
        return;
      } else {
        if(oPwd.val() == rePwd.val()) {
          divNChk.addClass('failed');
          alterNIcon.addClass("error");
          alterNSpan.text("기존 비밀번호와 변경할 비밀번호가 동일합니다.").show();
          failedNMsg.show();

          nPwd.focus();
          //alert("기존 비밀번호와 변경할 비밀번호가 동일합니다.");
          return;
        }
      }
    }

    if (!isValidPasswd) {
      alert($("#alertNewPasswd").text());
      return;
    }

    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";

    var userid = "${pinfo.userVO.user_id}";
    var userPassword = "${pinfo.userVO.user_pw}";

    if (confirm("비밀번호를 수정하시겠습니까?")) {
      $.ajax({
        type: "POST"
        , url: "myPage_pwUpdate"
        , data: {oldPassword: oPwd.val(), newPassword: nPwd.val(), "userPassword" : userPassword, "userid" : userid}
        , beforeSend: function(xhr) {
                  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
          }
        , success : function(data) {
          if (data === "discode") {
            console.log("기존 비번 틀림");
            divOChk.addClass('failed');
            alterOIcon.addClass("error");
            alterOSpan.text("비밀번호가 맞지 않습니다. 다시 확인하여 입력해 주세요.").show();
            failedOMsg.show();

            oPwd.focus();
            //alert(data.errorMessages[0]);
          } else {
              if(data === "success") {
                alert("비밀번호가 수정되었습니다.");
                $('#changePasswordPup').modal('hide')
                return;
            }
          }
        }
        , error: function (error) {
          alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인
        }

      });
    }

    return;
  }

  // 취소
  function cancelMember() {
    window.location.href = "/mypage";
  }

  //닉네임 중복, 블랙키워드 확인
  function nknmChk() {
    if(isNknmAjax) return;

    isChkNknm = false;

    var tmpNknm = $("#new-nickname").val();
    var divChangeNickname = $("div#divChangeNickname");
    var alterSpan = $("span#alertNickname");
    var alterIcon = $("i#alertNicknameIcon");

    divChangeNickname.removeClass("failed");
    alterIcon.removeClass("error");
    alterSpan.text("");

    if (tmpNknm.length < 2 || tmpNknm.length > 8 ){
      divChangeNickname.addClass("failed");
      alterSpan.text("닉네임은 2자리이상 8자리 이하로 설정해주세요.");
      alterIcon.addClass("error");
      return;
    }

    if(tmpNknm == "GUEST" || tmpNknm == "GUESTMAINTAB"){
      //GUEST는 로그인 하지 않은 입장고객용 닉네임이므로 사용불가
      divChangeNickname.addClass("failed");
      alterSpan.text("이미 존재하는 닉네임입니다.");
      alterIcon.addClass("error");
      return;
    }

    isNknmAjax = true;

    $.ajax({
      type: "get"
      ,url: "mypageNknmChk"
      ,data: { "tmpNknm" : tmpNknm }
      ,success : function(data) {
        isNknmAjax = false;

        //정상닉네임
        if (data == "00") {
          isChkNknm = true;
          alterSpan.text("사용가능한 닉네임입니다.");
          return;
        } else if (data == "01") {
          divChangeNickname.addClass("failed");
          alterSpan.text("이미 존재하는 닉네임입니다.");
          alterIcon.addClass("error");
        } else {
          //블랙키워드 포함
          divChangeNickname.addClass("failed");
          alterSpan.text("닉네임에 사용 불가한 단어 [" + result + "]가 포함 되어 있습니다. 다른 닉네임을 입력해주세요.");
          alterIcon.addClass("error");
        }

        isChkNknm = false;
      }
      ,error : function() {
        isNknmAjax = false;
      }
    });
  }

  //이메일 수정 유효성 체크
  function checkEmail(type) {
    var sessionEmail = '';
    var divChk = $("#divChangeEmail");
    var alertSpan = $("#alertNewEmail");
    var alertIcon = $("#alertNewEmailIcon");
    var email = $("input[name='newEmail']").val();
    var orgEmail = $("input[name='orgEmail']").val();
    var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zsA-Z_-]+){1,2}$/;

    divChk.addClass('failed');

    if (isEmpty(email)) {
      isValidEmail = false;
      alertIcon.addClass("error");
      alertIcon.parent().show();
      alertSpan.text("이메일을 입력해 주세요.").show();
      return;
    }

    if (!pattern.test(email)) {
      isValidEmail = false;
      alertIcon.addClass("error");
      alertIcon.parent().show();
      alertSpan.text("이메일 형식이 틀렸습니다. 다시 확인하고 입력해 주세요.").show();
      return;
    } else if (email == orgEmail) {
      isValidEmail = false;
      alertIcon.addClass("error");
      alertIcon.parent().show();
      alertSpan.text("기존 이메일과 다른 이메일을 입력해 주세요.").show();
      return;
    } else {
      $("input[name='newEmail']").val($.trim(email));
      isValidEmail = true;
      alertSpan.text("");
      alertSpan.hide();
      alertIcon.removeClass("error");
      alertIcon.parent().hide();
      divChk.removeClass('failed');
    }

    // 이메일 유효성 체크
    if (!isValidEmail) {
      alertIcon.addClass("error");
      alertIcon.parent().show();
      alertSpan.text("이메일 형식이 틀렸습니다. 다시 확인하고 입력해 주세요.").show();
      return;
    } else {
      if(sessionEmail != email){
        // 이메일 중복 체크
        var val = $("input[name='newEmail']").val();
        $.ajax({
          type: 'POST'
          ,url : "/p/cua/emailDupCheck.do"
          ,data: {emailAdr: val}
          ,dataType: "json"
          ,success: function(data) {
            if (data.result) {
              isEmail = true;
              alertIcon.removeClass("error");
              alertIcon.parent().hide();
              divChk.removeClass('failed');
            } else {
              isEmail = false;
              divChk.addClass('failed');
              alertIcon.addClass("error");
              alertIcon.parent().show();
              alertSpan.text("기존 이메일과 다른 이메일을 입력해 주세요.").show();
            }
          }
          ,error: function(e) {
            isEmail = false;
          }
        });
      }
    }
  }

  //생년월일 날짜 계산
  function calcAge(birthday){
    var today = new Date(); //현재날짜구하기
    var t_year = today.getFullYear(); //올해
    var t_mm = today.getMonth()+1; //이번 달 (0이 1월이라 1더함)
    var t_dd = today.getDate(); //오늘 날짜
    var b_year = Number(birthday.substring(0,4)); //태어난 년도 4자리
    var b_mm = Number(birthday.substring(4,6)); //태어난 월
    var b_dd = Number(birthday.substring(6,8)); //태어난 일
    var diff_year = t_year - b_year; // 나이
    var diff_mm = (t_mm - b_mm ) * 100 + (t_dd - b_dd); // 날짜 대소 비교 (숫자 100은 단지 큰 숫자를 곱해준 것)

    return  diff_mm >= 0 ? diff_year : diff_year-1; // 생일이 지나지 않았으면 나이를 1살 더 내린다
  }

  function isValidDate(param) {
    // 자리수가 맞지않을때
    if (isNaN(param) || param.length != 8) {
      return false;
    }

    var year = Number(param.substring(0, 4));
    var month = Number(param.substring(4, 6));
    var day = Number(param.substring(6, 8));

    if( month < 1 || month > 12 ) {
      return false;
    }

    var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var maxDay = maxDaysInMonth[month-1];

    // 윤년 체크
    if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
      maxDay = 29;
    }

    if( day <= 0 || day > maxDay ) {
      return false;
    }

    return true;
  }

  //생년월일 수정
  function changeBirthday() {
    var birthday = $("input[name='newBirthday']").val();
    var divBirth = $("#divBirth");

    // 생년월일을 입력한 경우
    if (!isEmpty(birthday)){
      // 날짜가 유효하지 않으면
      if (!isValidBirthday) {
        $("input[name='newBirthday']").focus();
        return;
      } else {
        // 날짜가 유효하면
        $("input[name='birthday']").val(birthday);
      }
    } else {
      // 생년월일을 입력하지 않은 경우
      $("#alertBirthday").text("생년월일을 입력하세요.").show();
      $("input[name='newBirthday']").focus();
      divBirth.addClass('failed');
      return;
    }

    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";
    var user_id = "${pinfo.userVO.user_id}";

    if (confirm("생년월일을 수정하시겠습니까?")) {
      $.ajax({
        type: "POST"
        , url: "myPage_newBirthday"
        , data: {birthday: birthday ,"user_id": user_id}
        ,beforeSend: function(xhr) {
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        }
        , success : function(data) {
          if (data == "success") {
            alert("생년월일이 수정되었습니다.");
            $('#changeBirthdayPup').modal('hide')
            getNewInfo("birth");
            return;
          }
        }
        , error: function(data) {
          alert("시스템 오류입니다. 다시 시도해주세요.");
        }
      });
    } // if

    return;
  }


  function checkMoblie() {

    var divChk = $("#divNewHphone");
    divChk.addClass('failed');

    var alertIcon = $("#alertChangeHphoneIcon");
    alertIcon.addClass('error');

    var alertSpan = $("#alertChangeHphone");
    var inputValue = $("input[name='newHphoneNumber']").val();

    var mobileDdd = "";
    var mobilePhone1 = "";
    var mobilePhone2 = "";

    if (isEmpty(inputValue)) {
      alertSpan.text("필수 정보입니다.").show();
      $("input[name='newHphoneNumber']").focus();
      return;
    }

    if (inputValue.length < 10 || inputValue.length > 11) {
      isValidMobilePhone = false;
      alertSpan.text("휴대폰번호를 확인 해주세요.").show();
      return ;
    }

    var pattern = /\D/g;

    if (pattern.test(inputValue)) {
      isValidMobilePhone = false;
      alertSpan.text("숫자만 입력해주세요.").show();
      return;
    }

    //번호 3등분
    //국번 010/011/016/017/018/019/로 시작하는 3자리
    var numF = inputValue.substring(0,3);
    var numPattern = /01[016789]/;

    if (!numPattern.test(numF)) {
      isValidMobilePhone = false;
      alertSpan.text("휴대폰번호를 확인 해주세요.").show();
      return ;
    }

    if (inputValue.length == 10) {
      mobileDdd = inputValue.substring(0,3);
      mobilePhone1 = inputValue.substring(3,6);
      mobilePhone2 = inputValue.substring(6,10);
    } else if(inputValue.length == 11) {
      mobileDdd = inputValue.substring(0,3);
      mobilePhone1 = inputValue.substring(3,7);
      mobilePhone2 = inputValue.substring(7,11);
    } else {
      isValidMobilePhone = false;
      alertSpan.text("휴대폰번호를 확인 해주세요.").show();
      return ;
    }

    $("input[name='mobileDdd']").val(mobileDdd);
    $("input[name='mobilePhone1']").val(mobilePhone1);
    $("input[name='mobilePhone2']").val(mobilePhone2);

    isValidMobilePhone = true;
    $("input[name='mobilePhone']").val(mobileDdd + "-" + mobilePhone1 + "-" + mobilePhone2);

    alertSpan.hide();
    divChk.removeClass('failed');
    alertIcon.removeClass('error');
  }

  //휴대폰 본인인증 - 2018.11.27 휴대폰 본인인증
  function popCertHphoneForChangeName() {
    //개인정보 수집 및 이용 동의 체크 여부 확인
    if ($("input:checkbox[name='chkPersonalInfoAgreeMobile']").is(":checked") == false) {
      alert('개인정보 수집 및 이용에 동의하여야 합니다.');
      return;
    }

    certType = "hphoneCertForChangeName"; // 휴대폰변경을 위한 휴대폰본인 인증
    certByMobile('certByMobileFormForChangeName');
  }

  //휴대폰 본인인증 - 2018.11.27 휴대폰 본인인증
  function popCertHphoneForChangeHphone() {
    //개인정보 수집 및 이용 동의 체크 여부 확인
    if ($("input:checkbox[name='chkPersonalInfoAgreeMobile']").is(":checked") == false) {
      alert('개인정보 수집 및 이용에 동의하여야 합니다.');
      return;
    }

    certType = "hphoneCertForUpdateHphone"; // 휴대폰변경을 위한 휴대폰본인 인증
    certByMobile('certByMobileFormForChangeHphone');
  }

  //인증정보(휴대폰) - 2018.11.29 휴대폰 본인인증
  function certHphone() {
    certType = "hPhoneCert"; // 휴대폰변경을 위한 휴대폰본인 인증
    certByMobile('certByMobileForm');
  }

  // 메일인증
  function emailCert(mode){
    $("#confirmEmailPup").modal().show();

  }

  function dateCheck() {
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();

    return year + "년 " + month + "월 " + day + "일 ";
  }

  function setCertType(pCertType) {
    certType = pCertType;
  }

  function setSnsGubun(pSnsType) {
    snsGubun = pSnsType;
  }

  function ufn_ASCII(pwd,i){
    return pwd.substr(i,i+1).charCodeAt(0);
  }

  /*
  *
  * 체크박스 동의여부 체크
  * 2015. 01. 05. 전용상 수정
  *
  */
  function checkBoxChk(obj) {

    var idText = obj.attr("id");
    var hiddenIdText = null;

    if (idText == "emailMarketing") {
      hiddenIdText = "emailyn";
    }

    if (idText == "smsMarketing") {
      hiddenIdText = "smsyn";
    }


    var chkObj = $("#" + idText).is(":checked");

    if(chkObj) {
      $('input[name="' + hiddenIdText + '"]').val(1);
      // $("#" + hiddenIdText).attr("1");
    } else {
      $('input[name="' + hiddenIdText + '"]').val(0);
      //$("#" + hiddenIdText).attr("0");
    }

    var emailChkObj = $("#emailMarketing").is(":checked");
    var smsChkObj = $("#smsMarketing").is(":checked");

    if(!emailChkObj && !smsChkObj) {
      $("#agreeMarketing").prop("checked", false);
    } else {
      $("#agreeMarketing").prop("checked", true);
    }

    return false;
  }

  // 맞춤형 마케팅 동의 전체 체크 또는 해제
  function checkAgreeMarketing() {
    if ($("#agreeMarketing").is(":checked")) {
      $("#emailyn, #smsyn").val("1");
      $("#emailMarketing, #smsMarketing").prop("checked", true);
    } else {
      $("#emailyn, #smsyn").val("0");
      $("#emailMarketing, #smsMarketing").prop("checked", false);
    }
  }


  function updateSubmit() {
    if (isCertYn || confirm("수정하시겠습니까?")) {

      var genderval = $(":input:radio[name=gender]:checked").val();
      var emaailval = $('input[name="emailyn"]').val();
      var smsval = $('input[name="smsyn"]').val();
      var userid = $('input[name="userid"]').val();

      var csrfHeaderName = "${_csrf.headerName}";
      var csrfTokenValue = "${_csrf.token}";

      $.ajax({
        type: 'POST'
        ,url : "checkUpdate"
        ,data: {"emaailval": emaailval, "smsval": smsval, "genderval": genderval, "userid": userid}
        , beforeSend: function(xhr) {
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
        }
        ,success: function(data) {
          if (data === "success") {
            getNewInfo("check");
            confirmMk();
          }
        }
        ,error: function(e) {
          isEmail = false;
        }
      });

    }
  }

  function confirmMk() {
    alert("개인정보가 변경되었습니다.");
    window.location.href = "/mypage";
  }

  function updateEmailCertInfo() {
    jQuery.ajax({
      type: "post"
      , url: "/p/mpd/changeMemberEmailCertYn.do"
      , dataType: "json"
      , data :{emailCertNo:emailCertNo}
      , async: false
      , success : function(data) {
        if (certType != 'emailCertForUpdateHphone'){
          alert("이메일 인증이 완료되었습니다.");
        }

        if (certType == "emailCert") {
          location.reload();
        }

        return;
      }, error: function(data) {
        certType = "";
        alert("시스템 오류입니다. 다시 시도해주세요.");
        return;
      }
    });
  }

  //서신평 휴대폰 본인인증
  function certSciHphone(){
    var isChecked=$("input[name=chkPersonalInfoAgreeMobile]").is(":checked");

    //개인정보 수집 및 이용 동의 체크 여부 확인
    if (isChecked==false){
      alert('개인정보 수집 및 이용에 동의하여야합니다.');
      return;
    }

    certByMobile2('certByMobileForm2')
  }

  function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
    return true;
  }

  // 이메일인증용 메일발송
  var emailCertNoForSend = "";
  function sendEmail(){
    var emailAddr = $("input[name='confirmEmail']").val();

    if ($("input:checkbox[name='chkAgreeConfirmEmail']").is(":checked") == false){
      alert('개인정보 수집 및 이용에 동의하여야합니다.');
      return;
    }

    if (isEmpty(emailAddr)) {
      $("#alertConfirmEmailIcon").addClass('error');
      $("#alertConfirmEmail").text("이메일을 입력해 주세요.").show();
      $("#alertConfirmEmail").parent().show();
      return;
    } else {
      $("#alertConfirmEmailIcon").removeClass('error');
      $("#alertConfirmEmail").text("").hide();
      $("#alertConfirmEmail").parent().hide();
    }

    var pattern = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zsA-Z_-]+){1,2}$/;
    if (!pattern.test(emailAddr)) {
      $("#alertConfirmEmailIcon").addClass('error');
      $("#alertConfirmEmail").text("이메일 형식이 틀렸습니다. 다시 확인하고 입력해 주세요.").show();
      $("#alertConfirmEmail").parent().show();
      return;
    } else {
      $("#alertConfirmEmailIcon").removeClass('error');
      $("#alertConfirmEmail").text("").hide();
      $("#alertConfirmEmail").parent().hide();
    }

    var cname = $(".email-certify input[name='confirmName']").val();

    loading(true);
    $.ajax({
      type: 'POST'
      ,url : "/p/cua/emailVerificationAndCert.do"
      ,data: {emailAdr: emailAddr, certNo: emailCertNoForSend, custName: cname, gubun: "certEmail"}
      ,dataType: "json"
      ,success: function(data) {
        loading(false);
        if (data.result) {
          if (data.resultMsg == "duplicateMail") {
            $("#alertConfirmEmailIcon").addClass('error');
            $("#alertConfirmEmail").text("이미 등록된 이메일입니다.").show();
            $("#alertConfirmEmail").parent().show();
            return;
          } else {
            $("#alertConfirmEmailIcon").removeClass('error');
            $("#alertConfirmEmail").text("").hide();
            $("#alertConfirmEmail").parent().hide();
          }
          emailCertNoForSend = data.emailCertNo;
          $("#btnSendEmailForCertDiv").hide();
          $("#btnConfirmEmailForCertDiv").show();
          alert(" 메일이 발송되었습니다.\n 메일인증 후 해당페이지에서\n'인증하기'를 해주세요.");

        }
        else {
          alert("일시적인 에러로 인증 이메일 전송에 실패하였습니다.\n잠시 후에 다시 시도해주세요.");
          emailCertNoForSend = "";
          return;
        }
      }
      ,error: function(e) {
        loading(false);
        alert("일시적인 에러로 인증 이메일 전송에 실패하였습니다.\n잠시 후에 다시 시도해주세요.");
        emailCertNoForSend = "";
      }
    });
  }

  // 이메일 인증
  function checkCert(){
    var emailAddr = $("input[name='confirmEmail']").val();

    if (emailCertNoForSend == "") {
      alert("메일인증 후 해당페이지에서 '인증하기'를 해주세요.");
      return;
    } else {
      // 이메일 인증 체크
      var val = $("input[name='email']").val();
      var formType = $("input[name='formType']").val();
      $.ajax({
        type: 'POST'
        ,url : "/p/cua/emailCertCheck.do"
        ,data: {emailAdr: emailAddr, emailCertNo: emailCertNoForSend, formType: "certEmail"}
        ,dataType: "json"
        ,success: function(data) {
          if (data.result) {
            alert("인증 완료되었습니다.");
            location.href="/p/mpd/changeMemberInfoFormMain.do";
          }
          else {
            alert("메일인증 후 해당페이지에서 '인증하기'를 해주세요.");
          }
        }
        ,error: function(e) {
          alert("일시적인 에러로 인증 확인에 실패하였습니다.\n잠시 후에 다시 시도해주세요.");
        }
      });
    }
  }

  function getNewInfo(type){
    $.getJSON("${contextPath}/getUserInfo/"+${pinfo.userVO.no}, function (data){
      console.log(data);
      var str = "";

      $(data).each(function (){
        if (type === "nick") {
          $('#baseInfoNickname').empty();
          str += this.user_nickname;
          $('#baseInfoNickname').html(str);
        }
        else if (type === "birth") {
          var timestamp = this.user_birth;
          var birth = new Date(timestamp);

          var year = birth.getFullYear();
          var month = birth.getMonth()+1;
          var date = birth.getDate();
          $('#baseInfoBirthday').empty();
          str += year + "년 " + month + "월 " + date + "일";
          $('#baseInfoBirthday').html(str);
        }
        else if (type === "check") {
          var emailYN = document.querySelector('input[name="emailyn"]');
          var smsYN = document.querySelector('input[name="smsyn"]');
          var genderCK = document.querySelector('input[name="userGender"]');
          console.log(this.user_email_receive + " " + this.user_sms_receive + " " + this.user_gender);

          emailYN.value = this.user_email_receive;
          smsYN.value = this.user_sms_receive;
          genderCK.value = this.user_gender;

          // $('input[name="emailyn"]').val(this.user_email_receive);
          // $('input[name="smsyn"]').val(this.user_sms_receive);
          // $('input[name="userGender"]').val('this.user_gender');
        }
      })
    });
  }
</script>
