<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="./css/style-admin.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title>Home Admin</title>
</head>

<body class="body_index">
<div class="container_index">
    <div class="frame_index">
        <jsp:include page="admin-header.jsp"/>
        <div class="index_content">
            <div class="index_content-frame">
                <div id="index_menu-block" class="index_menu">
                    <div class="index_menu-frame">
                        <div class="index_menu-list">
                            <a href="/WebProject/admin-home.jsp">
                                <i class="fas fa-home"></i>
                                <span>Home</span>
                            </a>
                        </div>
                        <div class="index_menu-list">
                            <a href="#">
                                <i class="fas fa-clone"></i>
                                <span>Posts</span>
                            </a>
                        </div>
                        <div class="index_menu-list">
                            <a href="/WebProject/listUser">
                                <i class="fas fa-user"></i>
                                <span>Manage User</span>
                            </a>
                        </div>
                        <div id="index_menu-product" class="index_menu-list">
                            <a href="/WebProject/listProduct">
                                <i class="fas fa-box"></i>
                                <span>Product</span>
                            </a>
                        </div>
                        <div class="index_menu-list">
                            <a href="#">
                                <i class="fas fa-table"></i>
                                <span>Table</span>
                            </a>
                        </div>
                        <div class="index_menu-list">
                            <a href="#">
                                <i class="fas fa-comment-alt"></i>
                                <span>Feedback</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div id="index_dataID" class="index_data">
                    <div class="index_date-frame">
                        <div id="index_clearID" class="index_clear"></div>
                        <div id="index_data-contentID" class="home_data-content">
                            <div style="width: 90%;margin: 20px auto">
                                <form action="editProduct" method="post" id="table-edit-product">
                                    <div class="field-add" style="font-weight: bold">Edit Products</div>
                                    <div>ID</div>
                                    <input style="background-color: #cccccc" value="${product.product_id}" name="id"
                                           class="field-add"
                                           readonly="readonly">
                                    <div>Name</div>
                                    <input value="${product.name}" name="name" class="field-add" type="text"
                                           placeholder="Name" required="required" maxlength="255">
                                    <div>Link images</div>
                                    <input value="${product.img}" name="img" class="field-add" type="text"
                                           placeholder="Link images" required="required" maxlength="255">
                                    <div>Price</div>
                                    <input value="${product.price}" name="price" class="field-add" type="number"
                                           placeholder="Price" required="required" maxlength="11">
                                    <div>Quantity</div>
                                    <input value="${product.quantity}" name="quantity" class="field-add" type="number"
                                           placeholder="Quantity" required="required" maxlength="11">
                                    <div>Memory</div>
                                    <input value="${product.memory}" name="memory" class="field-add" type="text"
                                           placeholder="Memory" maxlength="20">
                                    <div class="field-add">
                                        <label>Color</label>
                                        <select name="color" class="select">
                                            <option value="white">white</option>
                                            <option value="black">black</option>
                                            <option value="red">red</option>
                                            <option value="green">green</option>
                                            <option value="blue">blue</option>
                                            <option value="yellow">yellow</option>
                                        </select>
                                    </div>
                                    <div class="field-add">
                                        <label>Group</label>
                                        <select name="product_group" class="select">
                                            <option value="imac">imac</option>
                                            <option value="ipad">ipad</option>
                                            <option value="iphone">iphone</option>
                                            <option value="watch">watch</option>
                                            <option value="sound">sound</option>
                                            <option value="accessory">accessory</option>
                                        </select>
                                    </div>
                                    <div>
                                        <button onclick="window.location.href='/WebProject/listProduct'" type="button"
                                                class="filed-button">Cancel
                                        </button>
                                        <button type="submit" class="filed-button">Edit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="admin-fun.jsp"/>
</body>
</html>