<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<c:set var="auth" value="${sessionScope.auth}"/>
<div id="web_header">
    <div id="web_logo">
        <div>
            <img src="./images/imgLogo/logo2.png">
        </div>
    </div>
    <div id="web_bar">
        <div id="bar-top">
            <div id="bar-menu">
                <ul>
                    <li>
                        <a href="#">
                            MENU MENU
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            MENU MENU
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            MENU MENU
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            MENU MENU
                        </a>
                    </li>
                </ul>
            </div>
            <div id="bar-iconSupport">
                <ul>
                    <li>
                        <a href="#">
                            <i class="fab fa-facebook-f fb"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fab fa-twitter twi"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fab fa-instagram ins"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="bar-bottom">
            <div id="bar-iconHome">
                <div>
                    <a href="/WebProject/home">
                        <i class="fas fa-home"></i>
                    </a>
                </div>
            </div>
            <form action="search" method="post" id="bar-frameSearch">
                <div>
                    <div id="bar-search">
                        <input name="search" id="bar-searchInput" type="text" placeholder="Search" required="required">
                    </div>
                    <div id="bar-buttonSearch">
                        <div>
                            <button type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
            <div id="bar_bag-user">
                <div id="bar-bagUser">
                    <c:if test="${auth==null}">
                        <div id="bar-user">
                            <a class="user-bag-icons" href="login.jsp">
                                <i class="fas fa-user"></i>
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${auth!=null}">
                        <div style="position: relative" id="bar-user">
                            <img id="user-login" onclick="user()" style="border-radius: 50%"
                                 src="images/imgIcons/avatar.png">
                            <ul id="user">
                                <li class="navbar-list">
                                    <a class="nav-list-login" href="#">
                                        <i class="far fa-user"></i>
                                        <span>My Profile</span>
                                    </a>
                                </li>
                                <c:if test="${auth.role>=1}">
                                    <li class="navbar-list">
                                        <a class="nav-list-login" href="/WebProject/admin-home.jsp">
                                            <i class="fas fa-tasks"></i>
                                            <span>Quản lý</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li class="navbar-list">
                                    <a class="nav-list-login" href="#">
                                        <i class="fas fa-cog"></i>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li class="navbar-list">
                                    <a class="nav-list-login" href="/WebProject/logout">
                                        <i class="fas fa-sign-out-alt"></i>
                                        <span>Logout</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <div id="bar-bag">
                        <a class="user-bag-icons" href="/WebProject/cart">
                            <i class="fas fa-shopping-bag"></i>
                        </a>
                    </div>
                </div>
                <label id="bar-childMenu" for="bar-nav-checkbox">
                    <i class="fas fa-bars"></i>
                </label>
                <input type="checkbox" id="bar-nav-checkbox">
                <label id="bar-overlay" for="bar-nav-checkbox"></label>
                <nav id="bar-nav-mobile">
                    <label id="bar-mobile-close" for="bar-nav-checkbox">
                        <i class="fas fa-times"></i>
                    </label>
                    <ul id="bar-nav-mobile-list">
                        <li>
                            <a class="bar-nav-mobile-link" href="#">MENU MENU</a>
                        </li>
                        <li>
                            <a class="bar-nav-mobile-link" href="#">MENU MENU</a>
                        </li>
                        <li>
                            <a class="bar-nav-mobile-link" href="#">MENU MENU</a>
                        </li>
                        <li>
                            <a class="bar-nav-mobile-link" href="#">MENU MENU</a>
                        </li>
                        <li>
                            <a class="bar-nav-mobile-link" href="#"><i
                                    class="fas fa-sign-out-alt bar-iconSignout"></i>Log out</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script>
    let clicking = 0;

    function user() {
        let elm = document.getElementById("user");
        if (clicking == 0) {
            elm.style.display = "block";
            clicking = 1;
            return;
        }
        if (clicking == 1) {
            elm.style.display = "none";
            clicking = 0;
            return;
        }
    }
</script>
