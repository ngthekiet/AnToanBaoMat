<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<c:set var="auth" value="${sessionScope.auth}"/>
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
    <title>Manage User</title>
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
                                <div id="index_menu-product" class="index_menu-list">
                                    <a href="/WebProject/listUser">
                                        <i class="fas fa-user"></i>
                                        <span>Manage User</span>
                                    </a>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${auth!=null}">
                            <c:if test="${auth.role>=1}">
                                <div class="index_menu-list">
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
                            <c:if test="${auth.role==2}">
                                <div id="index_data-contentID" class="home_data-content">
                                    <div style="width: 90%;margin: 20px auto">
                                        <table id="user" style="width: 100%">
                                            <thead>
                                            <tr>
                                                <td style="text-align: center">
                                                    USERNAME
                                                </td>
                                                <td style="text-align: center">
                                                    EMAIL
                                                </td>
                                                <td style="text-align: center">
                                                    FULL NAME
                                                </td>
                                                <td style="text-align: center">
                                                    NUMBER PHONE
                                                </td>
                                                <td style="text-align: center">
                                                    ADDRESS
                                                </td>
                                                <td style="text-align: center">
                                                    ROLE
                                                </td>
                                                <td style="text-align: center">
                                                    OPTIONS
                                                </td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <form action="editUser" method="post">
                                                    <jsp:useBean id="user" scope="request" type="java.util.List"/>
                                                <c:forEach var="user" items="${user}">
                                                <tr>
                                                    <td style="text-align: center">
                                                        <input style="text-align: center; border: none; font-size: medium"
                                                               name="username"
                                                               value="${user.username}" readonly>
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${user.email}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${user.fullname}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${user.numberPhone}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${user.address}
                                                    </td>
                                                    <td style="text-align: center">
                                                            ${user.role}
                                                    </td>
                                                    <td>
                                                        <a href="loadUser?username=${user.username}" class="options">
                                                            <i class="fas fa-pen"></i>
                                                        </a>
                                                        <a class="options"
                                                           href="deleteUser?username=${user.username}">
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
                        <c:if test="${auth==null||auth.role!=2}">
                            <span style="margin: 20px auto" id="testContent">Không có quyền truy cập</span>
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
        $('#user').DataTable();
    });
</script>
<jsp:include page="admin-fun.jsp"/>
</body>

</html>