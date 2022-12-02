<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<div class="index_header">
    <div class="index_header-frame">
        <div class="index_logo-search">
            <a href="/WebProject/home">
                <img src="./images/imgLogo/logo2.png" alt="">
            </a>
            <div class="index_buttonMenu">
                <label id="arrow-button">
                    <i onclick="rot()" class="far fa-arrow-alt-circle-left fa-2x"></i>
                </label>
            </div>
            <div class="index_search">
                <div class="index_searchFrame">
                    <input id="index_inputSearch-frame" class="index_buttonSearch" type="text"
                           placeholder="Search" autofocus="autofocus">
                    <div id="index_buttonSearch-frame" class="index_buttonSearch">
                        <button>
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="index_navbar">
            <ul class="index_navbarFrame">
                <li id="index_navbar-notifi" class="index_navbarItems">
                    <a href="#">
                        <i class="far fa-bell fa-2x"></i>
                    </a>
                </li>
                <li id="index_navbar-user" class="index_navbarItems">
                    <input id="index_navbarInput" type="checkbox">
                    <label id="index_navbar-label" for="index_navbarInput">
                        <img class="index_navbar-userItems" src="./images/imgIcons/avatar.png">
                        <span class="index_navbar-userItems"><c:if test="${auth!=null}">${auth.username}</c:if></span>
                        <i class="fas fa-chevron-down"></i>
                    </label>
                    <ul id="index_navbar-checked" class="index_navbar-child">
                        <li class="index_navbar-list">
                            <a href="#">
                                <i class="far fa-user"></i>
                                <span>My Profile</span>
                            </a>
                        </li>
                        <li class="index_navbar-list">
                            <a href="#">
                                <i class="far fa-envelope"></i>
                                <span>Message</span>
                            </a>
                        </li>
                        <li class="index_navbar-list">
                            <a href="#">
                                <i class="fas fa-cog"></i>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li class="index_navbar-list">
                            <a href="/WebProject/logout">
                                <i class="fas fa-sign-out-alt"></i>
                                <span>Logout</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>