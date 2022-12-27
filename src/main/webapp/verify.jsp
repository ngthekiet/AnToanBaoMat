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
    <link rel="stylesheet" href="css/verify.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <style>
        body {
            margin: 0;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<table id="info" class="display" style="width:100%; margin-top: 50px">
    <thead>
    <tr>
        <th style="text-align: center">Image</th>
        <th style="text-align: center">Name</th>
        <th style="text-align: center">Quantity</th>
        <th style="text-align: center">Price</th>
        <th style="text-align: center">Number Details</th>
        <th style="text-align: center">ID User</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <img src="${infoOrder.img}" style="width: 100px;height: 100px;display: block;margin: 0 auto">
        </td>
        <td style="text-align: center">
            ${infoOrder.name}
        </td>
        <td style="text-align: center" class="goods-page-price">
            ${infoOrder.quantity}
        </td>
        <td style="text-align: center">
            ${infoOrder.price}
        </td>
        <td style="text-align: center" class="goods-page-total">
            ${infoOrder.orderDetails_id}
        </td>
        <td style="text-align: center" class="del-goods-col">
            ${infoOrder.userID}
        </td>
    </tr>
    </tbody>
    <tfoot>
    </tfoot>
</table>
<div id="panel-verify">
    <form action="doVerify" method="post">
        <textarea id="private-key" name="key" required="required"></textarea>
        <input style="display: none" name="uid" type="text" readonly value="${infoOrder.userID}">
        <input style="display: none" name="did" type="text" readonly value="${infoOrder.orderDetails_id}">
        <input id="open-key" type="file" onchange="chooseFile(this)" accept="text/plain">
        <button id="submit" type="submit">Xác thực</button>
    </form>
</div>
<jsp:include page="footer.jsp"/>
<script>
    var dt;
    //Load xong trang
    $(document).ready(function () {
        dt = $('#info').DataTable({
            searching: false,
            paging: false,
            info: false
        });
    });
    function chooseFile(fileInput) {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#private-key').text(e.target.result)
            }
            reader.readAsText(fileInput.files[0])
        }
    }
</script>
</body>
</html>