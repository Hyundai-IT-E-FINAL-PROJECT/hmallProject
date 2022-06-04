<%--
  Created by IntelliJ IDEA.
  User: Minsu
  Date: 2022-06-04
  Time: 오후 4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main class="cmain main" role="main" id="mainContents"><!-- 메인페이지 'main' 클래스 추가 -->
  <div class="container">
    <!--contents-->
    <div class="contents">
      <!-- 본문 컨텐츠 영역 시작 -->
      <div class="product-nodata">
        <div class="nodata">
          <span class="bgcircle"><i class="icon nodata-type5"></i></span>
          <div class="txt-wrap">
            <strong>페이지를 찾을 수 없습니다.</strong>
            <p>해당 페이지 경로가 변경되었거나,<br>URL주소가 바르게 입력되어 있는지 다시 확인해주세요.</p>
          </div>
          <button class="btn btn-default medium" onclick="location.href='/p/index.do'"><span>홈으로 이동</span></button>
        </div>
      </div>
      <!-- // 본문 컨텐츠 영역 끝 -->
    </div>
    <!--//contents-->
  </div>
  <!-- //.container -->
</main>