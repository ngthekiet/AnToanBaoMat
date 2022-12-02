<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" href="css/style.css">
<html lang="vi">
<head>
    <title>Title</title>
</head>
<body id="body_home">
<div id="home_frame">
    <div id="home_container">
        <jsp:include page="header.jsp"/>
        <div class="product-name" style="margin-top: 20px">
            <div>
                <i class="fab fa-apple"></i>
                <span>Apple</span>
            </div>
        </div>
        <div style="width: 85%; margin: 0 auto">
            <div class="product-list" style="min-height: 500px">
                <c:forEach var="p" items="${listCategory}">
                    <div class="product-frameItems">
                        <a class="product-items" href="details?pid=${p.product_id}">
                            <div>
                                <img src="${p.img}">
                                <div class="product-nameItems">${p.name}<br>${p.memory}
                                </div>
                                <div class="product-priceItems">${p.price}đ</div>
                                <span class="product-buttonItems">
                                            <a style="display: inline-flex; align-items: center; height: 2em; justify-content: center"
                                               class="input-click input-pay"
                                               href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a style="display: inline-flex; align-items: center; height: 2em; justify-content: center"
                                               href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</div>

</body>
</html>
