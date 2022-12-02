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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
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
                        <c:if test="${auth!=null}">
                            <c:if test="${auth.role==2}">
                                <div class="index_menu-list">
                                    <a href="/WebProject/listUser">
                                        <i class="fas fa-user"></i>
                                        <span>Manage User</span>
                                    </a>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${auth!=null}">
                            <c:if test="${auth.role>=1}">
                                <div id="index_menu-product" class="index_menu-list">
                                    <a href="/WebProject/listProduct">
                                        <i class="fas fa-box"></i>
                                        <span>Manage Product</span>
                                    </a>
                                </div>
                            </c:if>
                        </c:if>
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
                        <c:if test="${auth!=null}">
                            <c:if test="${auth.role>=1}">
                                <div id="index_data-contentID" class="home_data-content">
                                    <div style="width: 90%;margin: 20px auto">
                                        <div id="full-manage">
                                            <div onclick="showAddProduct()" id="add-product" class="manage-button-add">
                                                Add Product
                                            </div>
                                        </div>
                                        <form action="addProduct" method="post" id="table-add-product">
                                            <div class="field-add" style="font-weight: bold">Add Products</div>
                                            <input name="name" class="field-add" type="text" placeholder="Product name"
                                                   required="required" maxlength="255">
                                            <input name="img" class="field-add" type="text" placeholder="Link images"
                                                   required="required" maxlength="255">
                                            <input name="price" class="field-add" type="number" placeholder="Price"
                                                   required="required" maxlength="11">
                                            <input name="quantity" class="field-add" type="number" placeholder="Quantity"
                                                   required="required" maxlength="11">
                                            <input name="memory" class="field-add" type="text" placeholder="Memory" maxlength="20">
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
                                                <button type="button" onclick="showAddProduct()" class="filed-button">Cancel
                                                </button>
                                                <button type="submit" class="filed-button">Add</button>
                                            </div>
                                        </form>
                                        <hr style=" width: 100%; height: 3px; margin-bottom: 5px
                                        ">
                                        <table id="product" style="width: 100%">
                                            <thead>
                                            <tr>
                                                <td style="text-align: center">
                                                    ID
                                                </td>
                                                <td style="text-align: center">
                                                    GROUP
                                                </td>
                                                <td style="text-align: center">
                                                    IMAGES
                                                </td>
                                                <td style="text-align: center">
                                                    NAME
                                                </td>
                                                <td style="text-align: center">
                                                    PRICE
                                                </td>
                                                <td style="text-align: center">
                                                    QUANTITY
                                                </td>
                                                <td style="text-align: center">
                                                    COLOR
                                                </td>
                                                <td style="text-align: center">
                                                    MEMORY
                                                </td>
                                                <td style="text-align: center">
                                                    OPTION
                                                </td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <jsp:useBean id="product" scope="request" type="java.util.List"/>
                                            <c:forEach var="product" items="${product}">
                                                <tr>
                                                    <td style="text-align: center">
                                                            ${product.product_id}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${product.product_group}
                                                    </td>
                                                    <td style="text-align: center">
                                                        <img style="width: 100px; height: 100px;display: block; margin: 0 auto"
                                                             src="${product.img}">
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${product.name}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${product.price}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${product.quantity}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${product.color}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${product.memory}
                                                    </td>
                                                    <td style="text-align: center">
                                                        <a href="loadProduct?id=${product.product_id}" class="options">
                                                            <i class="fas fa-pen"></i>
                                                        </a>
                                                        <a class="options"
                                                           href="deleteProduct?id=${product.product_id}">
                                                            <i class="fas fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                            <tfoot>

                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${auth==null}">
                            <span style="margin: 20px auto">Không có quyền truy cập</span>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#product').DataTable();
    });
</script>
<jsp:include page="admin-fun.jsp"/>
<script>
    let clickingTable = 0;

    function showAddProduct() {
        let form = document.getElementById("table-add-product");
        if (clickingTable == 0) {
            form.style.display = "block";
            clickingTable = 1;
            return;
        }
        if (clickingTable == 1) {
            form.style.display = "none";
            clickingTable = 0;
            return;
        }
    }
</script>
</body>


</html>