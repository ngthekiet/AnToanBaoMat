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
    <link rel="stylesheet" href="css/setting-security.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/style.css">
    <title>Security</title>
</head>
<body>
<div id="security-container">
    <jsp:include page="header.jsp"/>
    <div id="security-frame">
        <div id="security-title">Tùy chọn bảo mật</div>
        <div id="security-content">
            <div id="content-left">
                <h3>Cập nhật khóa công khai</h3>
                <form action="updateKey" method="post">
                    <input value="${auth.username}" name="username" readonly style="display: none">
                    <textarea id="public-key" name="publicKey" readonly></textarea>
                    <input id="open-key" type="file">
                    <button class="security-button" type="submit">Save Change</button>
                </form>
            </div>
            <div id="content-right">
                <h3>Yêu cầu cấp khóa mới</h3>
                <textarea id="private-key" readonly></textarea>
                <button class="security-button">Get Key</button>
                <button class="security-button">Save Key</button>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
