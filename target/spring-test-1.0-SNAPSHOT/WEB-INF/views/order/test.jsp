<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-06-07
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<main>
    <div>
        <c:forEach items="${basketList}" var="basket">
            <p>${basket.basket_seq}</p>
            <p>${basket.productVO.product_seq}</p>
            <p>${basket.productVO.product_cost}</p>
            <p>${basket.basket_count}</p>
        </c:forEach>
    </div>

</main>
