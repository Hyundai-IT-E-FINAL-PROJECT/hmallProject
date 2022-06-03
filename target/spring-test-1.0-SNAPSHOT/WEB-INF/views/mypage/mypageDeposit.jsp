<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-06-02
  Time: 오후 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
  <div class="container">
    <div class="gird-l2x">
      <%@ include file="mypageSide.jsp" %>
      <div class="contents">
        <div class="hpoint-wrap">
          <h2 class="hiding">포인트</h2>
          <div class="point-head">
            <p>김민수님의 포인트</p>
          </div>
          <!--tabgroup-->
          <div class="tabgroup point-tab">

            <!--ui-tab-->
            <ul class="ui-tab" role="tablist">
              <li role="presentation"><a href="/p/mpe/selectHPntTabPage.do" role="tab" aria-controls="viewReserve"><span>적립금 <em>0원</em></span></a></li>
              <li role="presentation" class="ui-active"><a href="/p/mpe/selectCdpstTabPage.do" role="tab" aria-controls="viewDeposit"><span>예치금 <em>0원</em></span></a></li>
            </ul>
            <!--//ui-tab-->
            <!--Tab panes-->
            <div class="tab-content">
              <!--viewDeposit-->
              <div role="tabpanel" class="tab-pane ui-active" id="viewDeposit">
                <!--boxtbl-->
                <div class="boxtbl">
                  <div class="point-wrap">
                    <!--w포인트 , 예치금일 경우 class="point-fl point-only"추가시-->
                    <div class="point-fl point-only">
                      <span class="ctypo17 bold"><em class="name">김민수</em>님의 예치금</span>
                      <span class="txt-point"><em class="mydeposit">0</em>원</span>
                    </div>
                  </div>
                </div>
                <!--//boxtbl-->

                <!--point-progresstxt-->
                <div class="point-progresstxt">
                  <div class="tit-wrap">
                    <h3>예치금 내역 및 사용 현황</h3>
                  </div>
                </div>
                <!--//point-progresstxt-->

                <!--filter-box-->
                <div class="filter-box">
                  <div class="search-filter rel">
                    <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                      <select id="listSize" name="listSize">
                        <option value="10" selected="">10개씩 보기</option>
                        <option value="20">20개씩 보기</option>
                        <option value="50">50개씩 보기</option>
                      </select>
                      <div class="ui-label"><a href="#1">10개씩 보기</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">10개씩 보기</a></li><li><a href="#2">20개씩 보기</a></li><li><a href="#3">50개씩 보기</a></li></ul></div></div></div></div>
                    <!-- 2020-09-28 마크업 수정 -->
                    <ul id="searchTermCondition" class="radiolist abs">
                      <li id="1">
                        <input type="radio" name="filter4" id="filter4-01" aria-checked="true">
                        <label for="filter4-01">최근 14일</label>
                      </li>
                      <li id="2">
                        <input type="radio" name="filter4" id="filter4-02" aria-checked="false">
                        <label for="filter4-02">최근 3개월</label>
                      </li>
                      <li id="3">
                        <input type="radio" name="filter4" id="filter4-03" aria-checked="false">
                        <label for="filter4-03">최근 6개월</label>
                      </li>
                      <li id="4">
                        <input type="radio" name="filter4" id="filter4-04" aria-checked="false">
                        <label for="filter4-04">2022년</label>
                      </li>
                      <li id="5">
                        <input type="radio" name="filter4" id="filter4-05" aria-checked="false">
                        <label for="filter4-05">2021년</label>
                      </li>
                      <li id="6">
                        <input type="radio" name="filter4" id="filter4-06" aria-checked="false">
                        <label for="filter4-06">2020년</label>
                      </li>
                      <li id="7">
                        <input type="radio" name="filter4" id="filter4-07" aria-checked="false">
                        <label for="filter4-07">전체</label>
                      </li>
                    </ul>
                    <!-- // 2020-09-28 마크업 수정 -->
                  </div>
                </div>
                <!--//filter-box-->



                <!--hpoint list-->
                <div class="list-wrap">


                  <!--내역이 없을 경우-->
                  <div class="nodata">
                    <span class="bgcircle"><i class="icon nodata-type18"></i></span>
                    <p>예치금 내역이 없습니다.</p>
                  </div>
                  <!--//내역이 없을 경우-->

                  <!--paging-->
                  <div class="paging">







                  </div>
                  <!--//paging-->
                </div>
                <!--hpoint list-->

                <!--point-progresstxt-->
                <div class="point-progresstxt apply">
                  <div class="tit-wrap">
                    <h3>예치금 출금 신청하기</h3>
                  </div>
                </div>
                <!--//point-progresstxt-->
                <!--guide-box-->
                <div class="guide-box">
                  <!--box-head-->
                  <div class="box-head">
                    <div class="l-wrap">
                      <p class="text">



                        (신청가능 <strong id="possibleApplyAmt">0</strong>원)


                      </p>
                    </div>
                    <div class="r-wrap">
                      <p class="text">출금 신청할 예치금</p>
                      <div class="inputbox sm w-120">
                        <label class="inplabel"><input type="text" name="" value="" placeholder="0" onchange="getNumber(this);" onkeyup="getNumber(this);" id="applyAmt"></label>
                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                      </div>
                      <p class="text">원</p>
                    </div>
                  </div>
                  <!--//box-head-->
                  <!--box-body-->
                  <div class="box-body">
                    <dl>
                      <dt>은행</dt>
                      <dd>
                        <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                          <select id="bankCd" name="bankCd">
                            <option>은행선택</option>

                            <option value="003">IBK기업은행</option>

                            <option value="004">KB국민은행</option>

                            <option value="081">KEB하나은행</option>

                            <option value="005">KEB하나은행(구.외환)</option>

                            <option value="011">NH농협</option>

                            <option value="023">SC제일은행</option>

                            <option value="039">경남은행</option>

                            <option value="034">광주은행</option>

                            <option value="012">단위농협</option>

                            <option value="031">대구은행</option>

                            <option value="999">무형상품</option>

                            <option value="032">부산은행</option>

                            <option value="096">산림조합은행</option>

                            <option value="997">상담원결제</option>

                            <option value="050">상호저축은행</option>

                            <option value="045">새마을금고</option>

                            <option value="007">수협</option>

                            <option value="048">신용협동조합</option>

                            <option value="026">신한은행</option>

                            <option value="088">신한은행(통합)</option>

                            <option value="027">씨티은행</option>

                            <option value="998">예약상품</option>

                            <option value="020">우리은행</option>

                            <option value="071">우체국</option>

                            <option value="037">전북은행</option>

                            <option value="035">제주은행</option>

                            <option value="021">조흥은행</option>

                            <option value="996">카드분할결제</option>

                            <option value="090">카카오뱅크</option>

                            <option value="089">케이뱅크은행</option>

                            <option value="093">토스뱅크</option>

                            <option value="083">평화은행</option>

                            <option value="002">한국산업은행</option>

                            <option value="087">한미(타행)</option>

                            <option value="064">홍콩상하이은행</option>

                          </select>
                          <div class="ui-label"><a href="#1">은행선택</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">은행선택</a></li><li><a href="#2">IBK기업은행</a></li><li><a href="#3">KB국민은행</a></li><li><a href="#4">KEB하나은행</a></li><li><a href="#5">KEB하나은행(구.외환)</a></li><li><a href="#6">NH농협</a></li><li><a href="#7">SC제일은행</a></li><li><a href="#8">경남은행</a></li><li><a href="#9">광주은행</a></li><li><a href="#10">단위농협</a></li><li><a href="#11">대구은행</a></li><li><a href="#12">무형상품</a></li><li><a href="#13">부산은행</a></li><li><a href="#14">산림조합은행</a></li><li><a href="#15">상담원결제</a></li><li><a href="#16">상호저축은행</a></li><li><a href="#17">새마을금고</a></li><li><a href="#18">수협</a></li><li><a href="#19">신용협동조합</a></li><li><a href="#20">신한은행</a></li><li><a href="#21">신한은행(통합)</a></li><li><a href="#22">씨티은행</a></li><li><a href="#23">예약상품</a></li><li><a href="#24">우리은행</a></li><li><a href="#25">우체국</a></li><li><a href="#26">전북은행</a></li><li><a href="#27">제주은행</a></li><li><a href="#28">조흥은행</a></li><li><a href="#29">카드분할결제</a></li><li><a href="#30">카카오뱅크</a></li><li><a href="#31">케이뱅크은행</a></li><li><a href="#32">토스뱅크</a></li><li><a href="#33">평화은행</a></li><li><a href="#34">한국산업은행</a></li><li><a href="#35">한미(타행)</a></li><li><a href="#36">홍콩상하이은행</a></li></ul></div></div></div></div>
                      </dd>
                      <dt>계좌번호</dt>
                      <dd>
                        <div class="inputbox sm">
                          <label class="inplabel btnlabel"><input type="text" id="bnkac" name="bnkac" onkeydown="onlyNumber(this)" value="" placeholder="계좌번호를 입력하세요"></label>
                          <!-- <button class="btn btn-lineblack btn-confirm"><span>계좌확인</span></button>  -->
                          <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                        </div>
                      </dd>
                    </dl>
                    <dl>
                      <dt>예금주</dt>
                      <dd>
                        <div class="inputbox sm">
                          <label class="inplabel"><input type="text" id="dpsrNm" name="dpsrNm" value="" placeholder="예금주명을 입력하세요."></label>
                          <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                        </div>
                      </dd>
                      <dt>관계</dt>
                      <dd>
                        <div class="selectwrap"><div class="custom-selectbox sm" data-modules-selectbox="">
                          <select class="_mp_input" style="width:80px;" id="dpsrRelNm">
                            <option value="">선택</option>
                            <option value="1">본인</option>
                            <option value="2">가족</option>
                            <option value="3">타인</option>
                          </select>
                          <div class="ui-label"><a href="#1">선택</a></div><div class="ui-selectbox"><div class="selectbox_area"><ul><li><a href="#1">선택</a></li><li><a href="#2">본인</a></li><li><a href="#3">가족</a></li><li><a href="#4">타인</a></li></ul></div></div></div></div>
                      </dd>
                    </dl>
                  </div>
                  <!--//box-body-->
                </div>
                <!--//guide-box-->
                <!--form-box-->
                <div class="form-box">
                  <label class="chklabel">
                    <input id="agreeAll" type="checkbox" name="">
                    <i class="icon"></i>
                    <span>개인정보 수집 및 이용에 동의합니다.</span>
                  </label>
                  <button class="btn btn-linelgray small25" data-modules-modal="target:#phc005-01;"><span>상세보기</span></button>
                </div>
                <!--//form-box-->
                <div class="btngroup w-250">
                  <button id="btnApply" class="btn btn-default medium" disabled="" onclick="apply(); return false;"><span>동의 후 신청</span></button>
                </div>
              </div>
              <!--//viewDeposit-->
            </div>
            <!--//Tab panes -->
          </div>
          <!--//tabgroup-->
        </div>
      </div>
      <!-- // .contents -->
    </div>
  </div>
  <!-- //.container -->

</main>