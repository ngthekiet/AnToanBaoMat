<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    <style>
        body {
            margin: 0;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<table id="list-order" class="display" style="width:100%; margin-top: 50px">
    <thead>
    <tr>
        <th style="text-align: center">Image</th>
        <th style="text-align: center">Name</th>
        <th style="text-align: center">Quantity</th>
        <th style="text-align: center">Unit price</th>
        <th style="text-align: center">Status</th>
        <th style="text-align: center">Options</th>
    </tr>
    </thead>
    <tbody>
    <jsp:useBean id="myOrders" scope="request" type="java.util.List"/>
    <c:forEach items="${myOrders}" var="orders">
        <tr>
            <td>
                <img src="${orders.img}" style="width: 100px;height: 100px;display: block;margin: 0 auto">
            </td>
            <td style="text-align: center">
                    ${orders.name}
            </td>
            <td style="text-align: center" class="goods-page-price">
                    ${orders.quantity}
            </td>
            <td style="text-align: center">
                    ${orders.price}
            </td>
            <td style="text-align: center" class="goods-page-total">
                    ${orders.status}
            </td>
            <td style="text-align: center" class="del-goods-col">
                <a href="verify?did=${orders.orderDetails_id}">Xác thực</a>
                <span>&emsp;</span>
                <button>IN</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    </tfoot>
</table>
<jsp:include page="footer.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>
    var dt;
    //Load xong trang
    $(document).ready(function () {
        dt = $('#list-order').DataTable({
            searching: false,
            paging: false,
            info: false
        });
    });
</script>
</body>
</html>
