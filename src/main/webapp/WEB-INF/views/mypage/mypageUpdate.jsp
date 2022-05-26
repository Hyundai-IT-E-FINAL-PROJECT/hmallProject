<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%@ include file="passwordCheck.jsp" %>
<section id="bottomSection">
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
  <div class="container">
    <form name="updateMemberForm" method="post">
      <input type="hidden" name="name" value="김민수">
      <input type="hidden" name="birthdayInLaw" value="19980429">
      <input type="hidden" name="sex" value="2">

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

        <script type="text/javascript">
          var upntCustYn = "N";
          $(document).ready(function() {
            $.ajax({
              type: "get"
              ,url: "/p/mpf/chkUpntCustYn.do"
              ,dataType: "json"
              ,async: false
              ,success : function(data) {
                upntCustYn = data.upntCustYn;
              }
              , error: function (data) {
                console.log("chkUpntCustYn_error", data);
              }
            });
          });

          <!--HPAY임대진 추가 -->
          function openHPayTag(pathVal) {
            var url = "http://" + location.host + "/p/mpf/hpayManage.do";
            try {
              _trk_flashEnvView('_TRK_CP=' + pathVal);
            } catch(e){}

            openPopup(url, "loginPup", 640, 600, "no", $(window).width(), $(window).height());
          }

          //H.Point Pay 관리 통합회원 확인 후 후 화면 분기
          function fn_HppManage(){
            if(upntCustYn == "Y"){
              location.href = "https://www.hmall.com/p/mpd/hhpPmntManage.do";
            }else{
              $("#pec001-01").modal().show();
            }
          }

          function fn_upntPopupOpen(){
            location.href='/p/cua/registUpnt.do';
          }

          function fn_upntPopupClose(){
            $("#pec001-01").modal().hide();
          }
        </script>
        <!--20170816 박승택 추가 -->

        <input type="hidden" name="mcustNo" value="">


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
                    <span id="baseInfoName">김민*</span>
                    <button type="button" class="btn btn-linelgray small30" onclick="openPopChangeNameCert();"><span>수정</span></button>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="txt-left">아이디</th>
                  <td>





                    <span id="baseInfoId">als******</span>





                  </td>
                </tr>
                <tr>
                  <th scope="row" class="txt-left">비밀번호</th>
                  <td><span>********</span>
                    <button type="button" class="btn btn-linelgray small30" onclick="popChangePassword();"><span>수정</span></button>
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


                    <span id="baseInfoMobilePhone">대한민국 (82) - 010-93**-91**</span>
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
                    <button type="button" class="btn btn-linelgray small30" onclick="popChangeNickname();"><span>등록</span></button>
                  </td>
                </tr>


                <tr>
                  <th scope="row" class="txt-left">이메일</th>
                  <td>
                    <span id="baseInfoEmail">als********@naver.com</span>
                    <button type="button" class="btn btn-linelgray small30" onclick="popChangeEmail();"><span>수정</span></button>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="txt-left">생년월일</th>



                  <td><span id="baseInfoBirthday">1998년 **월 **일</span>
                    <button type="button" class="btn btn-linelgray small30" onclick="popChangeBirthday();"><span>수정</span></button>
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
            <!-- 계정연결 시작 ----------------------------------------------------------------------------------------------- -->
            <h3 class="title22">계정연결</h3>
            <div class="tblwrap">
              <table>
                <caption>계정연결</caption>
                <colgroup>
                  <col style="width:120px">
                  <col style="width:auto">
                </colgroup>
                <tbody>


                <tr>
                  <th scope="row" class="txt-left">네이버</th>
                  <td>미등록
                    <button type="button" class="btn btn-linelgray small30" onclick="naverBinding();"><span>등록</span></button>
                  </td>
                </tr>
                <tr>
                  <th scope="row" class="txt-left">카카오톡</th>
                  <td>미등록
                    <button type="button" class="btn btn-linelgray small30" onclick="kakaoLogin();"><span>등록</span></button>
                  </td>
                </tr>

                </tbody>
              </table>
            </div>
            <!-- 계정연결 종료 ----------------------------------------------------------------------------------------------- -->

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
              <label class="chklabel sm">
                <input type="checkbox" id="phoneMarketing" onclick="checkBoxChk($(this));">
                <i class="icon"></i>
                <span>전화 (보험상담 등)</span>
              </label>
            </div>

            <h3 class="title22">인증정보</h3>
            <div class="tblwrap">
              <table>
                <caption>인증정보</caption>
                <colgroup>
                  <col style="width:120px">
                  <col style="width:auto">
                </colgroup>
                <tbody>
                <tr>
                  <th scope="row" class="txt-left">휴대폰</th>


                  <td>인증완료 <button type="button" class="btn btn-linelgray small30" disabled=""><span>휴대폰인증</span></button></td>

                </tr>
                <tr>
                  <th scope="row" class="txt-left">메일</th>

                  <td>미인증 <button type="button" class="btn btn-linelgray small30" onclick="emailCert('certEmail');"><span>메일인증</span></button></td>
                </tr>
                </tbody>
              </table>
            </div>

            <h3 class="title22">로그인 기록 <button type="button" class="btn btn-linelgray small34" onclick="openLoginHistory();"><span>로그인 기록</span></button></h3>

            <div class="btngroup w_510">
              <button type="button" class="btn btn-linelgray medium" onclick="cancelMember();"><span>취소</span></button>
              <button type="button" class="btn btn-default medium" id="aBtnSubmit" onclick="updateMember();"><span>확인</span></button>
            </div>
          </div>
        </div> <!-- // .contents -->
      </div></form>

  </div> <!-- //.container -->
</main>
</section>
</body>
</html>
