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
    <form name="updateMemberForm" method="post">
      <input type="hidden" name="name" value="김민수">
      <input type="hidden" name="birthdayInLaw" value="19980429">
      <input type="hidden" name="sex" value="2">
<<<<<<< HEAD

      <!-- TODO 곽희섭 20170531 통합포인트 추가 -->
      <input type="hidden" name="id" value="alstn2631">
      <input type="hidden" name="passwd" value="0ad88c12ac9367d45ad34824296fa6b6941839d1c3118d4e0945b7d237313b51f7f604a7408f22a7cf89ddf98ebefc4b3ffe1e0675b9f9413dea02b2e9710a20">



      <input type="hidden" name="postNo" value="">
      <input type="hidden" name="postNoSeq" value="">
      <input type="hidden" name="rdnmPostNo" value="">
      <input type="hidden" name="aptDongNm" value="">
      <input type="hidden" name="aptHoNm" value="">
      <input type="hidden" name="adrGbcd" value="10">
      <input type="hidden" name="adrKndGbcd" value="1">
      <input type="hidden" name="addrReside" value="">
      <input type="hidden" name="addrBunge" value="">
      <input type="hidden" name="email" value="alstntn2631@naver.com">
      <input type="hidden" name="orgEmail" value="alstntn2631@naver.com">
      <input type="hidden" name="mobilePhone" value="01093989130">
      <input type="hidden" name="orgMobilePhone" value="01093989130">
      <input type="hidden" name="homePhone" value="">
      <input type="hidden" name="onepassMemberSub.marryDate">
      <input type="hidden" name="onepassMemberSub.id" value="">
      <input type="hidden" name="cashRcptGbcd">
      <input type="hidden" name="cashRcptHpTel">
      <input type="hidden" name="evdnRgno">
      <input type="hidden" name="zipSeq" value="0">

      <!--2014. 12. 08. 전용상 수정  -->
      <input type="hidden" name="postNo1" value="">
      <input type="hidden" name="postNo2" value="">
      <input type="hidden" name="baseAdr" value="">
      <input type="hidden" name="ptcAdr" value="">
      <input type="hidden" name="rdnmPostNo1" value="">
      <input type="hidden" name="rdnmPostNo2" value="">
      <input type="hidden" name="rdnmBaseAdr" value="">
      <input type="hidden" name="rdnmPtcAdr" value="">
      <input type="hidden" name="homeDdd" value="">
      <input type="hidden" name="homePhone1" value="">
      <input type="hidden" name="homePhone2" value="">

      <input type="hidden" name="birthday" value="19980429">
      <input type="hidden" name="birSolarYn" value="">
      <input type="hidden" name="onepassMemberSub.marryYn" value="">
      <input type="hidden" name="onepassMemberSub.marrySolarYn" value="">
      <input type="hidden" name="fvtField1AgrYn" value="">
      <input type="hidden" name="fvtField2AgrYn" value="">
      <input type="hidden" name="fvtField3AgrYn" value="">
      <input type="hidden" name="fvtField4AgrYn" value="">
      <input type="hidden" name="fvtField5AgrYn" value="">
      <input type="hidden" name="fvtField6AgrYn" value="">
      <input type="hidden" name="fvtField7AgrYn" value="">
      <input type="hidden" name="fvtField8AgrYn" value="">
      <input type="hidden" name="fvtField9AgrYn" value="">
      <input type="hidden" name="fvtField10AgrYn" value="">

      <input type="hidden" name="cnryCd" id="cnryCd" value="KR">
      <input type="hidden" name="rcvSelfCertVal" id="rcvSelfCertVal" value="">
      <input type="hidden" name="rcvCustNm" id="rcvCustNm" value="">
      <input type="hidden" name="rcvBymdDt" id="rcvBymdDt" value="">

      <!-- 마케팅 동의 관련 수정 : 민수영 140421 -->


      <input type="hidden" id="marketingAgreementYn" name="marketingAgreementYn" value="Y">

      <input type="hidden" id="emailReceiveYn" name="emailReceiveYn" value="N">

      <input type="hidden" id="fObReceiveYn" name="fObReceiveYn" value="N">

      <input type="hidden" id="smsReceiveYn" name="smsReceiveYn" value="N">

      <div class="gird-l2x">
        <!-- LNB 시작 -->

        <%@ include file="mypageSide.jsp" %>

<%--        <script type="text/javascript">--%>
<%--          var upntCustYn = "N";--%>
<%--          $(document).ready(function() {--%>
<%--            $.ajax({--%>
<%--              type: "get"--%>
<%--              ,url: "/p/mpf/chkUpntCustYn.do"--%>
<%--              ,dataType: "json"--%>
<%--              ,async: false--%>
<%--              ,success : function(data) {--%>
<%--                upntCustYn = data.upntCustYn;--%>
<%--              }--%>
<%--              , error: function (data) {--%>
<%--                console.log("chkUpntCustYn_error", data);--%>
<%--              }--%>
<%--            });--%>
<%--          });--%>

<%--          <!--HPAY임대진 추가 -->--%>
<%--          function openHPayTag(pathVal) {--%>
<%--            var url = "http://" + location.host + "/p/mpf/hpayManage.do";--%>
<%--            try {--%>
<%--              _trk_flashEnvView('_TRK_CP=' + pathVal);--%>
<%--            } catch(e){}--%>

<%--            openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());--%>
<%--          }--%>

<%--          //H.Point Pay 관리 통합회원 확인 후 후 화면 분기--%>
<%--          function fn_HppManage(){--%>
<%--            if(upntCustYn == "Y"){--%>
<%--              location.href = "https://www.hmall.com/p/mpd/hhpPmntManage.do";--%>
<%--            }else{--%>
<%--              $("#pec001-01").modal().show();--%>
<%--            }--%>
<%--          }--%>

<%--          function fn_upntPopupOpen(){--%>
<%--            location.href='/p/cua/registUpnt.do';--%>
<%--          }--%>

<%--          function fn_upntPopupClose(){--%>
<%--            $("#pec001-01").modal().hide();--%>
<%--          }--%>
<%--        </script>--%>
=======
>>>>>>> 4ddd453 ([FEAT]: 약관동의 처리 끝(필수, 선택, 전체선택))
        <!--20170816 박승택 추가 -->

        <input type="hidden" name="mcustNo" value="">


=======
      <div class="gird-l2x">
          <%@ include file="mypageSide.jsp" %>
>>>>>>> 1d8fd91 ([FEAT]: 개인정보 수정)
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
                      <sec:authentication property="principal" var="pinfo" />
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
                      <button type="button" class="btn btn-linelgray small30" onclick="$('#nickname_change_modal').modal().show()"><span>등록</span></button>
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
                      <button type="button" class="btn btn-linelgray small30" onclick="$('#brithday_change_modal').modal().show()"><span>수정</span></button>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row" class="txt-left">휴면방지기간</th>
                    <td>
                      <div class="selectwrap"><div class="custom-selectbox sm w_160" data-modules-selectbox="">
                        <select id="vlidTermGbcd" name="vlidTermGbcd">
                          <option value="1" selected="selected">1년</option>
                          <option value="2">2년</option>
                          <option value="3">3년</option>
                          <option value="4">4년</option>
                          <option value="5">5년</option>
                          <option value="99">회원탈퇴시까지</option>
                        </select>
                        <div class="ui-label"><a href="#1">1년</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">1년</a></li><li><a href="#2">2년</a></li><li><a href="#3">3년</a></li><li><a href="#4">4년</a></li><li><a href="#5">5년</a></li><li><a href="#6">회원탈퇴시까지</a></li></ul></div></div></div></div>
                      <ul class="dotlist">
                        <li>장기 미접속 시에도 휴면계정전환 및 자동탈퇴를 방지할 수 있습니다.</li>
                      </ul>
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
                <button type="button" class="btn btn-default medium" id="aBtnSubmit" onclick="updateMember();"><span>확인</span></button>
              </div>
            </div>

        </div> <!-- // .contents -->
      </div>
    </form>
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
                <label class="inplabel icon-lock"><input type="password" placeholder="현재 비밀번호 입력" id="iPwd" name="oldPassword" maxlength="30"></label>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
              </div>
              <p class="failed-msg" id="failedOldPwd" style="display: none;">
                <i class="icon error" id="alertOldPasswdIcon"></i><span id="alertOldPasswd" style="display: none;"></span>
              </p> <!-- // 실패시 노출 -->

              <!-- 신규비밀번호 ------ -->
              <div class="inputbox" id="divNewPwd"><!-- 실패시 class="failed" 추가 -->
                <label class="inplabel icon-lock" id="uPwdChk1"><input type="password" placeholder="비밀번호 (영문, 숫자 조합 6자리 이상)" id="iPwd1" name="user_pw" maxlength="30"value=""></label>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                <em class="" id="lockNewPwd" style="display: none;"></em>
              </div>
              <p class="failed-msg" id="failedNewPwd" style="display: none;">
                <i class="icon error" id="alertNewPasswdIcon"></i><span id="alertNewPasswd" style="display: none;"></span>
              </p> <!-- // 실패시 노출 -->

              <!-- 비밀번호확인 ------ -->
              <div class="inputbox" id="divReNewPwd"><!-- 실패시 class="failed" 추가 -->
                <label class="inplabel icon-lock" id="uPwdChk2"><input type="password" placeholder="비밀번호 재확인" id="iPwd2" name="user_pw_2" maxlength="30" value=""></label>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                <em class="" id="lockReNewPwd" style="display: none;"></em>
              </div>
              <p class="failed-msg" id="failedReNewPwd" style="display:none">
                <i class="icon" id="alertReNewPasswdIcon"></i><span id="alertReNewPasswd" style="display: none;"></span>
              </p> <!-- // 실패시 노출 -->

            </div>

            <ul class="dotlist">
              <li>영문, 숫자를 포함한 6자 이상 ~ 30자 이내 (공백 입력 불가)</li>
              <li>영문+숫자 10자 이상 혹은 영문+숫자+특수문자 8자 이상을 권장</li>
              <li>다른 사이트와 같지 않은 비밀번호를 추천</li>
            </ul>

            <div class="btngroup">
              <button class="btn btn-linelgray" data-dismiss="modal" id="btnChangePwdCancel"><span>취소</span></button>
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <input type="hidden" id="userId" name="user_id" value="${pinfo.userVO.user_id}">
              <button type="submit" class="btn btn-default medium" id="btnChangePwdConfirm" onclick="update_pw();">확인</button>
            </div>
          </div>
          <!-- //.content-body -->

          <button class="btn btn-close" data-dismiss="modal" id="btnChangePwdX"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
        </div> <!-- //.content -->
      </div> <!-- //.ui-modal-dialog -->
    </div>

      <div class="ui-modal nickname-change in" id="nickname_change_modal" tabindex="-1" role="dialog" aria-label="닉네임 등록 및 수정" style="z-index: 1031; display: none; padding-right: 0px;">
        <div class="ui-modal-dialog" role="document">
          <div class="content">
            <p class="ui-title">닉네임 등록</p>
            <div class="content-body">
              <div class="form-wrap">
                <div class="inputbox failed" id="divChangeNickname">
                  <label class="inplabel"><input type="text" id="new_nickname" name="new_nickname" value="" onkeyup="this.value=this.value.replace(/[^0-9a-zA-Zㄱ-힣]/g, '');" placeholder="닉네임 입력" title="닉네임을 입력해주세요" maxlength="8"></label>
                  <button class="btn btn-lineblack btn-confirm" type="button" onclick="nknmChk()"><span>중복확인</span></button>
                  <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                </div>
                <p class="failed-msg">
                  <i class="icon error" id="alertNicknameIcon"></i>
                  <span id="alertNickname">닉네임은 2자리이상 8자리 이하로 설정해주세요.</span>
                </p>
              </div>
              <div class="btngroup">
                <button class="btn btn-linelgray" data-dismiss="modal"><span>취소</span></button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <input type="hidden" id="user_id" name="user_id" value="${pinfo.userVO.user_id}">
                <button type="submit" class="btn btn-default medium" id="ChangeNickname" onclick="update_nickname();"><span>확인</span></button>
              </div>
            </div> <!-- //.content-body -->
            <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
          </div>
        </div> <!-- //.content -->
      </div>

      <!--생년월일 수정 모달-->
  <div class="ui-modal birth-change in" id="brithday_change_modal" tabindex="-1" role="dialog" aria-label="생년월일 수정" style="z-index: 1031; display: none; padding-right: 0px;">
    <div class="ui-modal-dialog" role="document">
      <div class="content">
        <p class="ui-title">생년월일 수정</p>
        <!-- //.content-head -->
        <div class="content-body">
          <div class="form-wrap">
            <!-- input disabled이면 inputbox에 class disabled 추가, readonly 동일, focus시 selected 추가 입력 오류 시 inputbox class failed 추가 class="inputbox failed" -->
            <div class="inputbox" id="divBirth">
              <label class="inplabel"><input type="text" name="user_birth" id="user_birth" value="" onkeypress="return isNumberKey(event)" maxlength="8" placeholder="생년월일 (예: 1990824)" title="생년월일을 입력해주세요"></label>
              <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
            </div>
            <p class="failed-msg" id="alertBirthday" style="display: none;"></p>
          </div>
          <div class="btngroup">
            <button class="btn btn-linelgray" data-dismiss="modal" id="btnChangeBirthCancel"><span>취소</span></button>
            <button class="btn btn-default medium" id="btnChangeBirthConfirm" onclick="update_birthday()"><span>확인</span></button>
          </div>
        </div> <!-- //.content-body -->
        <button class="btn btn-close" data-dismiss="modal" id="btnChangeBirthX"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
      </div> <!-- //.content -->
    </div> <!-- //.ui-modal-dialog -->
  </div>
    </div>
  </main>
</section>
<<<<<<< HEAD
=======
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</main>
</body>
</html>
<script>
  var csrfHeaderName = "${_csrf.headerName}";
  var csrfTokenValue = "${_csrf.token}"

  function update_pw(){
    console.log("비밀번호 바꾸기");
    var user_pw = document.getElementById("iPwd1").value;
    var user_id = document.getElementById("userId").value;
    console.log(user_pw);
    console.log(user_id);
    $.ajax({
      url:"myPage_pwUpdate",
      method:"post",
      data:{"user_pw":user_pw, "user_id":user_id},
      beforeSend: function(xhr) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
      }
    });
    $('#changePasswordPup').modal('hide')
  }

  function update_nickname(){
    console.log("닉네임 등록하기");
    var user_nickname = document.getElementById("new_nickname").value;
    var user_id = document.getElementById("user_id").value;
    console.log(user_nickname);
    $.ajax({
      url:"myPage_newNickname",
      method: "post",
      data:{"user_nickname":user_nickname,"user_id":user_id},
      beforeSend: function(xhr) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
      },
      success: function (){
        $('#nickname_change_modal').modal('hide')
        getNickname();
      }
    });
  }

  function getNickname(){
    $.getJSON("${contextPath}/getUserInfo/"+${pinfo.userVO.no}, function (data){
      console.log(data);
      $('#baseInfoNickname').empty();
      var str = "";

      $(data).each(function (){
        str += this.user_nickname;
      })
      $('#baseInfoNickname').html(str);
    });
  }

  function update_birthday(){
    console.log("생년월일 수정하기");
    var user_birth = document.getElementById("user_birth").value;
    var user_id = document.getElementById("user_id").value;
    var date = new Date(user_birth);
    console.log(user_birth);
    console.log(user_id);
    $.ajax({
      url:"myPage_newBirthday",
      method: "post",
      data:{"user_birth":date,"user_id":user_id},
      beforeSend: function(xhr) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
      },
      success: function (){
        $('#brithday_change_modal').modal('hide')
      }
    });
  }






  // // 닉네임 등록 및 수정 팝업의 '확인' 버튼 클릭
  // $("#ChangeNickname").on("click",function() {
  //   var tmpNknm = $("#new_nickname").val();
  //   var preNknm = "";
  //
  //   var divChangeNickname = $("div#divChangeNickname");
  //   var alterSpan = $("span#alertNickname");
  //   var alterIcon = $("i#alertNicknameIcon");
  //
  //   divChangeNickname.removeClass("failed");
  //   alterIcon.removeClass("error");
  //   alterSpan.text("");
  //
  //   if (tmpNknm == preNknm) {
  //     divChangeNickname.addClass("failed");
  //     alterIcon.addClass("error");
  //     alterSpan.text("닉네임을 변경해주세요.");
  //     return;
  //   }
  //
  //   if (!isChkNknm) {
  //     divChangeNickname.addClass("failed");
  //     alterIcon.addClass("error");
  //     alterSpan.text("닉네임 중복확인을 먼저 해주세요.");
  //     return;
  //   }
  //
  //   if (!isEmpty(preNknm)) {
  //     if (!confirm("닉네임을 수정하시겠습니까?")) return;
  //   }
  //
  //   $.ajax({
  //     type: "post"
  //     ,url: "/p/mpd/changeNknmFormInsert.do?nknm="+tmpNknm
  //     ,dataType: "json"
  //     ,async: false
  //     ,success : function(data) {
  //       if(data.ErrorMessage != null){
  //         alert(data.ErrorMessage);
  //       } else {
  //         alert("닉네임이 등록되었습니다.");
  //         location.reload();
  //         return;
  //       }
  //     },
  //     error : function() {
  //       alert("시스템 오류입니다. 다시 시도해주세요.");
  //     }
  //   });
  // });
</script>
>>>>>>> 1d8fd91 ([FEAT]: 개인정보 수정)
