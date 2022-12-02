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
                        <div id="index_menu-product" class="index_menu-list">
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
                        <div id="index_data-contentID" class="home_data-content">
                            <c:if test="${auth!=null}">
                                <c:if test="${auth.role>=1}">
                                    <span id="testContent">Content</span>
                                </c:if>
                            </c:if>
                            <c:if test="${auth==null}">
                                <span style="margin: 20px auto" id="testContent">Không có quyền truy cập</span>
                            </c:if>
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