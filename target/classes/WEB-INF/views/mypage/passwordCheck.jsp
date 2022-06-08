<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-05-21
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script>
    $(document).ready(function () {
        // 화면 로드될 때 비밀번호 확인하는 상단부만 보여주기
        document.getElementById("headerSection").style.display = "";
        document.getElementById("bottomSection").style.display = "none";
    });
</script>
<section id="headerSection">
<main class="cmain mypage" role="main" id="mainContents"><!-- 마이페이지 'mypage' 클래스 추가 -->
    <sec:authentication property="principal" var="pinfo" />
    <div class="container">
        <div class="gird-l2x">
            <!-- LNB 시작 -->
            <%@ include file="mypageSide.jsp" %>

            <div class="contents">
                <div class="mypage-info-wrap">
                    <h3 class="title22">비밀번호 재확인</h3>

                    <div class="border-gray-box">
                        <div class="confirm-box" style="margin: auto; width: 440px;">
                            <p class="ctypo17" style="color: #333; text-align: center; font-weight: 700;">고객님의 소중한 개인정보를 보호하기 위해 <br>비밀번호를 다시 한번 확인합니다.</p>
                            <div class="bg-gray-box center" style="margin-top: 20px; margin-bottom: 20px;">
                                <p class="title22">${pinfo.userVO.user_id}</p>
                            </div>

                            <div class="form-wrap">
                                    <div class="inputbox" id="divPassword"><!-- 실패시 class="failed" 추가 -->
                                        <label class="inplabel icon-lock"><input type="password" id="inputpwd" name="inputPwd" maxlength="30" value="" placeholder="비밀번호 (6자리 이상)"></label>
                                        <button class="btn ico-clearabled"><i class="icon"></i><span class="hiding">지우기</span></button>
                                    </div>
                                    <input type="hidden" id="userpwd" name="userpwd" value="${pinfo.userVO.user_pw}">
                                    <p class="failed-msg"> <!-- 실패시 노출 -->
                                        <i class="icon" id="alterPasswordIcon"></i>
                                        <span id="alterPassword"></span>
                                    </p>
                            </div>

                            <div class="btngroup">
                                <button class="btn btn-default medium" id="passworddBtn"><span>확인</span></button>
                            </div>

                        </div> <!-- //.confirm-box -->
                    </div> <!-- //.border-gray-box -->
                </div> <!-- //.mypage-info-wrap -->
            </div> <!-- //.contents -->
        </div>
    </div> <!-- //.container -->
</main>
</section>
<script>

    const csrfHeaderName = "${_csrf.headerName}";
    const csrfTokenValue = "${_csrf.token}";

    $(function () {
        $("#inputPwd").keyup(function () {
            $("#passworddBtn").click();
        })

        $("#passworddBtn").click(function () {
            let userPwd = document.getElementById("userpwd").value;
            let inputPwd = document.getElementById("inputpwd").value;

            console.log(userPwd);
            console.log(inputPwd);

            if (inputPwd === "") {
                $("div#divPassword").addClass("failed");
                $("i#alterPasswordIcon").addClass("error");
                $("span#alterPassword").text("비밀번호를 입력해 주세요.").show();
                //alert("비밀번호를 입력해 주세요.");
                $("input[name='pwd']").focus();
            } else { // IdCheckController 요청
                $.ajax({
                    url: "pwdcheck",
                    method: "post", // 요청방식은 post
                    data: { "userPwd": userPwd , "inputPwd" : inputPwd},
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
                    },
                    success: function (result) {
                        if (result === "1") {
                            // 비밀번호 입력 상단부 숨기고, 회원정보 수정 폼 보여주기
                            document.getElementById("headerSection").style.display = "none";
                            document.getElementById("bottomSection").style.display = "";
                        } else {
                            // 비밀번호가 회원 정보와 일치하지 않는 경우 초기화 후 alert창 띄워주기
                            $("div#divPassword").addClass("failed");
                            $("i#alterPasswordIcon").addClass("error");
                            $("span#alterPassword").text("비밀번호가 맞지 않습니다. 다시 확인하여 입력해주세요").show();
                            //alert("비밀번호를 입력해 주세요.");
                            $("input[name='pwd']").focus();
                            $('#inputpwd').val('');
                        }
                    }, error: function (error) {
                        alert("AJAX요청 실패 : 에러코드=" + error.status); // status 에러확인
                    }
                });
            }
        });
    });


</script>






