<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-06-09
  Time: 오전 1:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">

<!--주소 api-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/addressapi.js"></script>

<div class="popup-win wd600 delivery-site-add">
  <!--pop-wrap-->
  <div class="pop-wrap" tabindex="0">
    <!--pop-content-wrap-->
    <div class="pop-content-wrap">


      <strong class="pop-title">배송지 추가</strong>

      <!--pop-content-->
      <div class="pop-content">
        <div id="mainform" class="content">
          <div class="form-wrap">
            <form name="insertDstnAdrForm" action="/p/mpd/insertDstnAdr.do" method="post">
              <input type="hidden" id="dstnNknm" name="dstnNknm" value="" />
              <input type="hidden" id="updateYn" name="updateYn" value="" />
              <input type="hidden" id="dstnPostNoSum" name="dstnPostNoSum" value="" />
              <input type="hidden" id="dstnHpIdntNo" name="dstnHpIdntNo" value=""/>
              <input type="hidden" id="dstnHpIntmNo" name="dstnHpIntmNo" value=""/>
              <input type="hidden" id="dstnHpBckNo" name="dstnHpBckNo" value=""/>
              <input type="hidden" id="dstnTela" name="dstnTela" value=""/>
              <input type="hidden" id="dstnTels" name="dstnTels" value=""/>
              <input type="hidden" id="dstnTeli" name="dstnTeli" value=""/>
              <input type="hidden" id="dstnSeq" name="dstnSeq" value=""/><!-- 키 -->
              <input type="hidden" id="dstnPostNo" name="dstnPostNo" value=""/><!-- 우편번호 -->
              <input type="hidden" id="adrKndGbcd" name="adrKndGbcd" value=""/>
              <input type="hidden" id="baseYn" name="baseYn" value=""/>

              <div class="inputbox"><!-- 실패시 클래스 'failed' 추가 -->
                <label class="inplabel"><input type="text" id="rcvCustNm" name="rcvCustNm" value="" placeholder="받으실 분"></label>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
              </div>
              <!-- 실패시 노출 -->
              <p class="failed-msg" style="display:none">
                <i class="icon error"></i>
                <span id="rcvCustNmErrorMsg"></span>
              </p>
              <!-- 우편번호 -->
              <div class="inputbox">
                <label class="inplabel btnlabel"><input class="inp flex" style="width: 70%; display: inline;" placeholder="우편번호" name="user_address_address1" id="addr1" type="text" readonly="readonly" ></label>
                <button class="btn btn-lineblack btn-confirm" onclick="execPostCode(); return false;"><span>우편번호 찾기</span></button>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
              </div>
              <!-- 기본주소 -->
              <div class="inputbox">
                <label class="inplabel btnlabel"><input class="inp flex" style="top: 5px;" placeholder="도로명 주소" name="user_address_address2" id="addr2" type="text" readonly="readonly" /></label>
<%--                <button class="btn btn-lineblack btn-confirm" onclick="execPostCode(); return false;"><span>우편번호 찾기</span></button>--%>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
              </div>
              <!-- 상세주소 -->
              <div class="inputbox">
                <label class="inplabel"><input class="inp flex" placeholder="상세주소" name="user_address_address3" id="addr3" type="text" placeholder="상세 주소를 입력해주세요."/></label>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
              </div>
              <!-- 실패시 노출 -->
              <p class="failed-msg" style="display:none">
                <i class="icon error"></i>
                <span id="dstnPtcAdrErrorMsg"></span>
              </p>
              <!-- 핸드폰번호 -->
              <div class="inputbox">
                <label class="inplabel"><input type="text" id="dstnHpNo" name="dstnHpNo" maxlength="11" value="" placeholder="전화번호"></label>
                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
              </div>
              <!-- 실패시 노출 -->
              <p class="failed-msg" style="display:none">
                <i class="icon error"></i>
                <span id="dstnHpNoErrorMsg"></span>
              </p>
              <!-- 일반번호 -->
<%--              <div class="inputbox"><!-- 실패시 클래스 'failed' 추가 -->--%>
<%--                <label class="inplabel"><input type="text" id="dstnTelNo" name="dstnTelNo" maxlength="11" value="" placeholder="전화번호2"></label>--%>
<%--                <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>--%>
<%--              </div>--%>
              <!-- 실패시 노출 -->
              <p class="failed-msg" style="display:none">
                <i class="icon error"></i>
                <span id="dstnTelNoErrorMsg"></span>
              </p>
              <!-- // 실패시 노출 -->
              <p class="caption13 color-666">배송 및 수거를 위한 고객님의 배송주소 재사용에 동의합니다.</p>
              <ul class="dotlist">
                <li>배송지는 목록에서 삭제하실 수 있습니다.</li>
              </ul>
            </form>
            <div class="btngroup">
              <button type="button" class="btn btn-linelgray" onclick="javqascript:self.close();return false;"><span>취소</span></button>
              <button type="button" class="btn btn-default" onclick="addNewAddress();"><span>저장</span></button>
              <!-- 데이터 전송 후 클릭시 $(element).modal().hide() -->
            </div>
          </div>

        </div>
      </div>
      <!--//pop-content-->
    </div>
    <!--//pop-content-wrap-->
  </div>
  <!--//pop-wrap-->
</div>
<!--popup-win-->
<script>
  function execPostCode() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 도로명 조합형 주소 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
          extraRoadAddr = ' (' + extraRoadAddr + ')';
        }
        // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
        if(fullRoadAddr !== ''){
          fullRoadAddr += extraRoadAddr;
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        console.log(data.zonecode);
        console.log(fullRoadAddr);


        $("[name=user_address_address1]").val(data.zonecode);
        $("[name=user_address_address2]").val(fullRoadAddr);

        /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
        document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
        document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
      }
    }).open();
  }

  function addNewAddress(){
      var csrfHeaderName = "${_csrf.headerName}";
      var csrfTokenValue = "${_csrf.token}";

      $.ajax({
          type: 'post',
          data:{
              user_address_address1: $("input[name='user_address_address1']").val(),
              user_address_address2:$("input[name='user_address_address2']").val(),
              user_address_address3:$("input[name='user_address_address3']").val(),
              user_address_name:$("input[name='rcvCustNm']").val(),
              user_address_phone_num:$("input[name='dstnHpNo']").val(),
              basic_address:0
          },
          url: '${contextPath}/user/addNewAddress',
          beforeSend:function (xhr){
              xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
          },
          success:function (res){
              alert("새로운 배송지가 등록되었습니다!")
              self.close();
          },
          error:function (){
              alert("error");
          }
      });
  }
</script>