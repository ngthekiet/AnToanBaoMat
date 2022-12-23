<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    String yourkey = (String) request.getAttribute("yourkey");
    String status = (String) request.getAttribute("status");
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
                    <textarea id="public-key" name="publicKey" required="required"></textarea>
                    <span>Password: <input type="password" name="password" maxlength="32" required="required"></span>
                    <input type="file" id="open-key" onchange="chooseFile(this)" accept="text/plain">
                    <button class="security-button" type="submit">Save Change</button>
                    <div style="color: red">Lưu ý: Key phải được mã hóa Base64</div>
                </form>
            </div>
            <div id="content-right">
                <h3>Yêu cầu cấp khóa mới</h3>
                <%
                    if (yourkey != null) {
                %>
                <textarea id="private-key" readonly><%=yourkey%></textarea>
                <%
                } else {
                %>
                <textarea id="private-key" readonly></textarea>
                <%
                    }
                %>
                <form action="getKey" method="post">
                    <input value="${auth.username}" name="username" readonly style="display: none">
                    <span>Password: <input type="password" name="password" maxlength="32" required="required"></span>
                    <button class="security-button" type="submit">Get Key</button>
                </form>
                <button class="security-button" onclick="download()">Save Key</button>
            </div>
        </div>
        <div id="status">
            Status:
            <%
                if (status != null) {
            %>
            <%=status%>
            <%
                }
            %>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
<script>
    function chooseFile(fileInput) {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#public-key').text(e.target.result)
            }
            reader.readAsText(fileInput.files[0])
        }
    }

    function saveAs(dataToDownLoad, filename) {
        var element = document.createElement('a')
        element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(dataToDownLoad))
        element.setAttribute('download', filename)
        element.style.display = 'none'
        document.body.appendChild(element)
        element.click()
        document.body.removeChild(element)
    }

    function download() {
        var text = document.getElementById('private-key')
        var file = 'PrivateKey.txt'
        saveAs(text.value, file)
    }
</script>
</body>
</html>
