<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/style.css">
    <title>H2K Store</title>
</head>
<body id="body_home">
<div id="home_frame">
    <div id="home_container">
        <jsp:include page="header.jsp"/>
        <jsp:include page="category.jsp"/>
        <div id="home_product">
            <div id="product_container">
                <div class="product_frame">
                    <div class="product-name">
                        <a href="category?cid=imac">
                            <i class="fab fa-apple"></i>
                            <span>Mac</span>
                        </a>
                    </div>
                    <div id="list-content-imac" class="product-list">
                        <jsp:useBean id="imac" scope="request" type="java.util.List"/>
                        <c:forEach var="p" items="${imac}">
                            <div class="product-frameItems quantity-product-imac">
                                <a class="product-items" href="details?pid=${p.product_id}">
                                    <div>
                                        <img src="${p.img}">
                                        <div class="product-nameItems">${p.name}<br>${p.memory}
                                        </div>
                                        <div class="product-priceItems">${p.price}đ</div>
                                        <span class="product-buttonItems">
                                            <a class="input-click input-pay" href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load-more">
                        <button onclick="loadMoreImac()">Xem thêm</button>
                    </div>
                </div>
                <div class="product_frame">
                    <div class="product-name">
                        <a href="category?cid=ipad">
                            <i class="fab fa-apple"></i>
                            <span>iPad</span>
                        </a>
                    </div>
                    <div id="list-content-ipad" class="product-list">
                        <jsp:useBean id="ipad" scope="request" type="java.util.List"/>
                        <c:forEach var="p" items="${ipad}">
                            <div class="product-frameItems quantity-product-ipad">
                                <a class="product-items" href="details?pid=${p.product_id}">
                                    <div>
                                        <img src="${p.img}">
                                        <div class="product-nameItems">${p.name}<br>${p.memory}
                                        </div>
                                        <div class="product-priceItems">${p.price}đ</div>
                                        <span class="product-buttonItems">
                                            <a class="input-click input-pay" href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load-more">
                        <button onclick="loadMoreIpad()">Xem thêm</button>
                    </div>
                </div>
                <div class="product_frame">
                    <div class="product-name">
                        <a href="category?cid=iphone">
                            <i class="fab fa-apple"></i>
                            <span>iPhone</span>
                        </a>
                    </div>
                    <div id="list-content-iphone" class="product-list">
                        <jsp:useBean id="iphone" scope="request" type="java.util.List"/>
                        <c:forEach var="p" items="${iphone}">
                            <div class="product-frameItems quantity-product-iphone">
                                <a class="product-items" href="details?pid=${p.product_id}">
                                    <div>
                                        <img src="${p.img}">
                                        <div class="product-nameItems">${p.name}<br>${p.memory}
                                        </div>
                                        <div class="product-priceItems">${p.price}đ</div>
                                        <span class="product-buttonItems">
                                            <a class="input-click input-pay" href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load-more">
                        <button onclick="loadMoreIphone()">Xem thêm</button>
                    </div>
                </div>
                <div class="product_frame">
                    <div class="product-name">
                        <a href="category?cid=watch">
                            <i class="fab fa-apple"></i>
                            <span>Watch</span>
                        </a>
                    </div>
                    <div id="list-content-watch" class="product-list">
                        <jsp:useBean id="watch" scope="request" type="java.util.List"/>
                        <c:forEach var="p" items="${watch}">
                            <div class="product-frameItems quantity-product-watch">
                                <a class="product-items" href="details?pid=${p.product_id}">
                                    <div>
                                        <img src="${p.img}">
                                        <div class="product-nameItems">${p.name}<br>${p.memory}
                                        </div>
                                        <div class="product-priceItems">${p.price}đ</div>
                                        <span class="product-buttonItems">
                                            <a class="input-click input-pay" href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load-more">
                        <button onclick="loadMoreWatch()">Xem thêm</button>
                    </div>
                </div>
                <div class="product_frame">
                    <div class="product-name">
                        <a href="category?cid=sound">
                            <i class="fab fa-apple"></i>
                            <span>Âm thanh</span>
                        </a>
                    </div>
                    <div id="list-content-sound" class="product-list">
                        <jsp:useBean id="sound" scope="request" type="java.util.List"/>
                        <c:forEach var="p" items="${sound}">
                            <div class="product-frameItems quantity-product-sound">
                                <a class="product-items" href="details?pid=${p.product_id}">
                                    <div>
                                        <img src="${p.img}">
                                        <div class="product-nameItems">${p.name}<br>${p.memory}
                                        </div>
                                        <div class="product-priceItems">${p.price}đ</div>
                                        <span class="product-buttonItems">
                                            <a class="input-click input-pay" href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load-more">
                        <button onclick="loadMoreSound()">Xem thêm</button>
                    </div>
                </div>
                <div class="product_frame">
                    <div class="product-name">
                        <a href="category?cid=accessory">
                            <i class="fab fa-apple"></i>
                            <span>Phụ kiện</span>
                        </a>
                    </div>
                    <div id="list-content-accessory" class="product-list">
                        <jsp:useBean id="accessory" scope="request" type="java.util.List"/>
                        <c:forEach var="p" items="${accessory}">
                            <div class="product-frameItems quantity-product-accessory">
                                <a class="product-items" href="details?pid=${p.product_id}">
                                    <div>
                                        <img src="${p.img}">
                                        <div class="product-nameItems">${p.name}<br>${p.memory}
                                        </div>
                                        <div class="product-priceItems">${p.price}đ</div>
                                        <span class="product-buttonItems">
                                            <a class="input-click input-pay" href="cart-add?id=${p.product_id}">
                                                <i class="fas fa-money-bill"></i>
                                            </a>
                                            <a href="cart-add-product?pid=${p.product_id}"
                                               class="input-click input-cart">
                                                <i class=" fas fa-shopping-cart"></i>
                                            </a>
                                        </span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="load-more">
                        <button onclick="loadMoreAccessory()">Xem thêm</button>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <div id="web_author">
            <div id="author_container">
                <div id="author-info">
                    <p>Đây là web phục vụ việc học tập không nhằm mục đích kinh doanh. Bản quyền thuộc H2K</p>
                </div>
            </div>
        </div>
        <div id="mobile_category">
            <div id="mobile_category-frame">
                <div class="mobile-menu">
                    <a href="#">
                        <img src="./images/imgIcons/icon-imac2.png">
                        <div>Mac</div>
                    </a>
                </div>
                <div class="mobile-menu">
                    <a href="#">
                        <img src="./images/imgIcons/icon-ipad2.png">
                        <div>iPad</div>
                    </a>
                </div>
                <div class="mobile-menu">
                    <a href="#">
                        <img src="./images/imgIcons/icon-iphone2.png">
                        <div>Iphone</div>
                    </a>
                </div>
                <div class="mobile-menu">
                    <a href="#">
                        <img src="./images/imgIcons/icon-watch2.png">
                        <div>Watch</div>
                    </a>
                </div>
                <div class="mobile-menu">
                    <a href="#">
                        <img src="./images/imgIcons/icon-airpods2.png">
                        <div>Âm thanh</div>
                    </a>
                </div>
                <div class="mobile-menu">
                    <a href="#">
                        <img src="./images/imgIcons/icons8-cable-2.png">
                        <div>Phụ kiện</div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function loadMoreImac() {
        var amountImac = document.getElementsByClassName("quantity-product-imac").length;
        $.ajax({
            url: "/WebProject/loadImac",
            type: "get",
            data: {
                quantityProductImac: amountImac
            },
            success: function (data) {
                var row = document.getElementById("list-content-imac");
                row.innerHTML += data;
            },
            error: function () {

            }
        })
    }

    function loadMoreIpad() {
        var amountIpad = document.getElementsByClassName("quantity-product-ipad").length;
        $.ajax({
            url: "/WebProject/loadIpad",
            type: "get",
            data: {
                quantityProductIpad: amountIpad
            },
            success: function (data) {
                var row = document.getElementById("list-content-ipad");
                row.innerHTML += data;
            },
            error: function () {

            }
        })
    }

    function loadMoreIphone() {
        var amountIphone = document.getElementsByClassName("quantity-product-iphone").length;
        $.ajax({
            url: "/WebProject/loadIphone",
            type: "get",
            data: {
                quantityProductIphone: amountIphone
            },
            success: function (data) {
                var row = document.getElementById("list-content-iphone");
                row.innerHTML += data;
            },
            error: function () {

            }
        })
    }

    function loadMoreWatch() {
        var amountWatch = document.getElementsByClassName("quantity-product-watch").length;
        $.ajax({
            url: "/WebProject/loadWatch",
            type: "get",
            data: {
                quantityProductWatch: amountWatch
            },
            success: function (data) {
                var row = document.getElementById("list-content-watch");
                row.innerHTML += data;
            },
            error: function () {

            }
        })
    }

    function loadMoreSound() {
        var amountSound = document.getElementsByClassName("quantity-product-sound").length;
        $.ajax({
            url: "/WebProject/loadSound",
            type: "get",
            data: {
                quantityProductSound: amountSound
            },
            success: function (data) {
                var row = document.getElementById("list-content-sound");
                row.innerHTML += data;
            },
            error: function () {

            }
        })
    }

    function loadMoreAccessory() {
        var amountAccessory = document.getElementsByClassName("quantity-product-accessory").length;
        $.ajax({
            url: "/WebProject/loadAccessory",
            type: "get",
            data: {
                quantityProductAccessory: amountAccessory
            },
            success: function (data) {
                var row = document.getElementById("list-content-accessory");
                row.innerHTML += data;
            },
            error: function () {

            }
        })
    }
</script>
</body>
</html>