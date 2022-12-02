<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="cart" scope="request" type="vn.com.webproject.beans.Cart"/>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="shopping-cart" style="width: 85%; margin: 0 auto">
    <div class="product-name" style="margin-top: 20px; font-size: 40px">
        <div>
            <i class="fas fa-shopping-cart"></i>
            <span>Shopping Cart</span>
        </div>
    </div>
    <table id="cart" class="display" style="width:100%; margin-top: 50px">
        <thead>
        <tr>
            <th style="text-align: center">Image</th>
            <th style="text-align: center">Name</th>
            <th style="text-align: center">Memory</th>
            <th style="text-align: center">Quantity</th>
            <th style="text-align: center">Unit price</th>
            <th style="text-align: center">Options</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="product" value="${cart.productList}"/>
        <c:forEach items="${product}" var="product">
            <tr>
                <td>
                    <img src="${product.img}" style="width: 100px;height: 100px;display: block;margin: 0 auto">
                </td>
                <td style="text-align: center">
                        ${product.name}
                </td>
                <td style="text-align: center" class="goods-page-price">
                    <strong>${product.memory}</strong>
                </td>
                <td style="text-align: center">
                    <div class="product-quantity">
                        <input style="text-align: center" pid="${product.product_id}" id="product-quantity"
                               type="number"
                               value="${product.quantitySold}"
                               class="form-control changeQuantity">
                    </div>
                </td>
                <td style="text-align: center" class="goods-page-total">
                    <strong><span>$</span>${product.price}</strong>
                </td>
                <td class="del-goods-col">
                    <i class="fas fa-trash trash" pid="${product.product_id}">&nbsp;</i>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <tfoot>
        </tfoot>
    </table>
    <div class="shopping-total">
        <ul style="margin: 0 auto;">
            <li style="text-align: center; padding-top: 15px;font-weight: bold; font-size: large">
                <em>Total: </em>
                <span>$</span><strong class="price total-cart"></strong>
            </li>
        </ul>
        <div style="margin: 0 auto;display: flex; padding: 20px 0">
            <a style="background-color: tomato" href="/WebProject/home" class="btn btn-default link-cart">Continue
                shopping <i
                        class="fa fa-shopping-cart"></i>
            </a>
            <a style="background-color: #1f8cfe" class="btn btn-primary link-cart" href="/WebProject/cart-checkout">Checkout
                <i
                        class="fa fa-check"></i></a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>
    var cart;
    var dt;
    //Load xong trang
    $(document).ready(function () {
        dt = $('#cart').DataTable({
            searching: false,
            paging: false,
            info: false
        });

        <%String data = session.getAttribute("cart")==null?"{}":new Gson().toJson(session.getAttribute("cart"));%>
        cart = JSON.parse('<%=data%>');
        // Load cart
        loadCart(cart);
        //
        $('#cart tbody .trash').on('click', function () {
            var id = $(this).attr('pid');
            var thisRow = $(this);
            $.ajax({
                url: '/WebProject/cart-del',
                type: 'POST',
                data: {
                    id: id
                },
                success: function (data) {
                    delete cart.productMap[id];
                    dt.row(thisRow.parent('td')).remove().draw();
                    loadCart(cart);
                },
                error: function (data) {
                    alert('Sản phẩm không còn tồn tại trong giỏ hàng!!!')
                }
            });
        });
        $('#cart tbody .changeQuantity').on('blur', function () {
            var id = $(this).attr('pid');
            var quantity = $(this).val();
            var thisRow = $(this);
            $.ajax({
                url: '/WebProject/cart-update',
                type: 'POST',
                data: {
                    id: id,
                    quantity: quantity
                },
                success: function (data) {
                    JSQuantity = JSON.parse(data);
                    thisRow.val(JSQuantity.quantity);
                    updateQuantity(cart, id, JSQuantity.quantity);
                    loadCart(cart);
                },
                error: function (data) {
                    alert('Sản phẩm không còn tồn tại trong giỏ hàng!!!')
                }
            });
        });
    });

    //Tính tổng tiền giỏ hàng
    function loadCart(cart) {
        sum = 0;
        for (const x in cart.productMap) {
            sum += cart.productMap[x].price * cart.productMap[x].quantitySold;
        }
        $('.total-cart').html(sum);
    }

    function updateQuantity(cart, id, quantity) {
        cart.productMap[id].quantitySold = quantity;
    }
</script>
</body>
</html>