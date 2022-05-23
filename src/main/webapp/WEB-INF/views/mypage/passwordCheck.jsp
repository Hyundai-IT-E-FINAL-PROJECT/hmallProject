<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <div class="container">
        <div class="gird-l2x">
            <!-- LNB 시작 -->

            <%@ include file="mypageSide.jsp" %>
            <form name="upntLeftForm" method="post" target="uPnt">
                <input type="hidden" name="mcustNo" value="">
            </form>
            <!-- // LNB 끝 -->

            <div class="contents">
                <div class="mypage-info-wrap">
                    <h3 class="title22">비밀번호 재확인</h3>
                    <div class="border-gray-box">
                        <div class="confirm-box">
                            <p class="ctypo17">고객님의 소중한 개인정보를 보호하기 위해 <br>비밀번호를 다시 한번 확인합니다.</p>
                            <div class="bg-gray-box center">





                                <p class="title22">아이디 자리</p>





                            </div>

                            <div class="form-wrap">
                                <form name="checkPasswordForm" method="post" action="/mypage/pwcheck">
                                    <div class="inputbox" id="divPassword"><!-- 실패시 class="failed" 추가 -->
                                        <label class="inplabel icon-lock"><input type="password" id="pwd1063" name="pwd" maxlength="30" value="" placeholder="비밀번호 (6자리 이상)"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    </div>
                                    <input type="hidden" name="formType" id="formType">
                                    <input type="hidden" name="snsType" id="snsType">
                                    <input type="hidden" name="id" value="alsth">
                                    <input type="hidden" name="type" value="${type}">
                                    <p class="failed-msg"> <!-- 실패시 노출 -->
                                        <i class="icon" id="alterPasswordIcon"></i>
                                        <span id="alterPassword"></span>
                                    </p>
                                </form>
                            </div>

                            <div class="btngroup">
                                <button class="btn btn-default medium" onclick="checkPassword();"><span>확인</span></button>
                            </div>




                        </div> <!-- //.confirm-box -->
                    </div> <!-- //.border-gray-box -->
                </div> <!-- //.mypage-info-wrap -->
            </div> <!-- //.contents -->
        </div>
    </div> <!-- //.container -->
</main>

<script type="text/javascript">
    jQuery(function($) {


        $("input[name='pwd']").focus();

        $("form[name='checkPasswordForm']").submit(function() {
            var pwd = $("input[name='pwd']").val();

            if (isEmpty(pwd)) {
                $("div#divPassword").addClass("failed");
                $("i#alterPasswordIcon").addClass("error");
                $("span#alterPassword").text("비밀번호를 입력해 주세요.").show();
                //alert("비밀번호를 입력해 주세요.");
                $("input[name='pwd']").focus();
                return false;
            }
        });


    });

    function checkPassword() {
        $("form[name='checkPasswordForm']").submit();
    }


</script>
</body>
</html>







