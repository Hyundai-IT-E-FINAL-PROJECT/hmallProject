<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 3:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="passwordCheck.jsp" %>
<section id="bottomSection">
    <main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
        <div class="container">
            <div class="gird-l2x">

                <%@ include file="mypageSide.jsp" %>

                <div class="contents">
                    <div class="mypage-delivery-wrap">
                        <h3 class="title22">
                            배송지 리스트
                            <button id="addDstnAdr" class="btn btn-lineblack small34 abs"><span>배송지 추가</span></button>
                        </h3>


                        <div class="delivery-box">
                            <ul class="list">

                                <c:forEach items="${list}" var="list">
                                <li>
                                    <input type="hidden" name="dstnSeq" value="0000000002">
                                    <input type="hidden" id="baseYn" name="baseYn" value="Y">
                                    <input type="hidden" id="rcvCustNm" name="rcvCustNm" value="김민수">
                                    <input type="hidden" id="dstnPostNo" name="dstnPostNo" value="02060">
                                    <input type="hidden" id="dstnBaseAdr" name="dstnBaseAdr"
                                           value="서울특별시 중랑구  망우로71가길 11-5(망우동, 어반캐슬)">
                                    <input type="hidden" id="dstnPtcAdr" name="dstnPtcAdr" value="203호">
                                    <input type="hidden" id="dstnHpIdntNo" name="dstnHpIdntNo" value="010">
                                    <input type="hidden" id="dstnHpIntmNo" name="dstnHpIntmNo" value="9398">
                                    <input type="hidden" id="dstnHpBckNo" name="dstnHpBckNo" value="9130">
                                    <input type="hidden" id="dstnTela" name="dstnTela" value="">
                                    <input type="hidden" id="dstnTels" name="dstnTels" value="">
                                    <input type="hidden" id="dstnTeli" name="dstnTeli" value="">

                                    <input type="hidden" id="adrKndGbcd" name="adrKndGbcd" value="2">
                                    <input type="hidden" id="dstnPostNoSum" name="dstnPostNoSum" value="02060">
                                    <input type="hidden" id="dstnNknm" name="dstnNknm" value="김민수">

                                    <p class="name">${list.USER_ADDRESS_NAME}

                                        <c:if test="${list.BASIC_ADDRESS == 1}">
                                            <span class="tag red">기본 배송지</span>
                                        </c:if>
                                    </p>
                                    <p class="add">${list.USER_ADDRESS_ADDRESS1} ${list.USER_ADDRESS_ADDRESS2} ${list.USER_ADDRESS_ADDRESS3}</p>

                                    <p class="tel" id="mobile">${list.USER_ADDRESS_PHONE_NUM}</p>

                                    <c:if test="${list.BASIC_ADDRESS != 1}">
                                    <button name="setBaseDstnAdr" class="btn btn-linelgray small30"
                                            data-dstnseq="0000000001"><span>기본배송지로</span></button>
                                    </c:if>

                                    <div class="btngroup abs">
                                        <button id="modifyDstnAdr" name="modifyDstnAdr"
                                                class="btn btn-linelgray small30"><span>수정</span></button>

                                    <c:if test="${list.BASIC_ADDRESS != 1}">
                                    <button id="deleteDstnAdr" name="deleteDstnAdr"
                                            class="btn btn-linelgray small30"><span>삭제</span></button>
                                    </div>
                                    </c:if>
                                </li>

                                </c:forEach>

                            </ul>
                        </div>
                        <div class="paging">


                            <div class="page-prevarea">


                                <strong aria-label="현재 선택페이지">1</strong>


                            </div>


                        </div>


                    </div>
                </div>
                <!-- // .contents -->
            </div>
        </div>

        <!-- 배송지 삭제 모달창-->
        <!-- //.container -->
        <div class="ui-modal alert in" id="deliveryDrop" tabindex="-1" role="dialog" aria-label="배송지관리 얼럿" style="z-index: 1031; display: none; padding-right: 0px;">
            <div class="ui-modal-dialog" role="document">
                <div class="content">
                    <span class="bgcircle ex-redmark-sm"><i class="icon ex-red-mark"></i></span>
                    <p class="ctypo17 bold">배송지를 삭제하시겠습니까?</p>
                </div>
                <!-- //.content -->
                <!-- alert은 버튼 위치 변경 -->
                <div class="btngroup">
                    <button class="btn btn-linelgray" data-dismiss="modal"><span>아니오</span></button>
                    <button class="btn btn-default" onclick="deleteDstnAdr();"><span>예</span></button>
                    <!-- 데이터 전송 후 닫힘 $(element).modal().hide() -->
                </div>
                <button class="btn btn-close" data-dismiss="modal"><i class="icon xico"></i><span class="hiding">레이어 닫기</span></button>
            </div>
            <!-- //.ui-modal-dialog -->
        </div>
    </main>
</section>
<script type="text/javascript">
    jQuery(function($){



        $("button[name=deleteDstnAdr]").click(function() {
            dstnSeqforDelete = $(this).parents("li").find("input[name=dstnSeq]").val();
            $("#deliveryDrop").modal().show();
        });


        $("button[name=modifyDstnAdr]").click(function() {
            var dstnSeq = $(this).parents("li").find("input[name=dstnSeq]").val();
            window.open("/p/mpd/selectAddDstnAdr.do?type=update&dstnSeq=" + dstnSeq, "MPDAddDstnAdr", "width=645, height=783, style:overflow-x:hidden, overflow-y:hidden");
        });


        $("#addDstnAdr").click(function() {
            dstnSeqforDelete = $(this).parents("li").find("input[name=dstnSeq]").val();
            //$("#PHH009").modal().show();
            window.open("/p/mpd/selectAddDstnAdr.do?type=new", "MPDAddDstnAdr", "width=645, height=783, style:overflow-x:hidden, overflow-y:hidden");
        });


        $("button[name=setBaseDstnAdr]").click(function() {
            var dstnSeq = $(this).data("dstnseq");
            $("form[name=updateBaseYn]").append("<input type='hidden' name='baseYn' value='Y'/>");
            $("form[name=updateBaseYn]").append("<input type='hidden' name='dstnSeq' value='"+dstnSeq+"'/>");
            $("form[name=updateBaseYn]").submit();
        })

    })

    // 배송지 삭제를 위한 전역변수
    var dstnSeqforDelete = "";
    function deleteDstnAdr() {
        if (isEmpty(dstnSeqforDelete)) {
            return false;
        }
        $("form[name=deleteDstnAdrForm]").append("<input type='hidden' name='dstnSeq' value='"+dstnSeqforDelete+"'/>");
        $("form[name=deleteDstnAdrForm]").submit();
    }

    function refreshPage() {
        location.href = "/p/mpd/selectMemberDstnAdr.do?pwdInYn=Y";
    }

    function getSelectedValue(dstnSeq, key) {
        var obj = $("input[name=dstnSeq][value=" + dstnSeq + "]");
        return $(obj).parent().find("input[name=" + key + "]").val();
    }

    // 현재 등록된 배송지 갯수를 조회(팝업에서 사용)
    function getDstnCount() {
        return $(".delivery-box .list li").length;
    }
</script>