<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    String status = (String) request.getAttribute("status");
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
        <th style="text-align: center">Status</th>
        <th style="text-align: center">Options</th>
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
        <td style="text-align: center" class="del-goods-col">
            ${infoOrder.status}
        </td>
        <td style="text-align: center" class="del-goods-col">
            <button onclick="generatePDF()">Xuất PDF</button>
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
<jsp:include page="footer.jsp"/>
<script src="https://unpkg.com/jspdf-invoice-template@1.4.0/dist/index.js"></script>
<script>
    function generatePDF() {
        var pdfObject = jsPDFInvoiceTemplate.default(props);
    }

    var props = {
        outputType: jsPDFInvoiceTemplate.OutputType.Save,
        returnJsPDFDocObject: true,
        fileName: "Invoice",
        orientationLandscape: false,
        compress: true,
        logo: {
            src: "./images/imgLogo/logo1.png",
            type: 'PNG', //optional, when src= data:uri (nodejs case)
            width: 53.33, //aspect ratio = width/height
            height: 26.66,
            margin: {
                top: 0, //negative or positive num, from the current position
                left: 0 //negative or positive num, from the current position
            }
        },
        stamp: {
            inAllPages: true, //by default = false, just in the last page
            src: "https://raw.githubusercontent.com/edisonneza/jspdf-invoice-template/demo/images/qr_code.jpg",
            type: 'JPG', //optional, when src= data:uri (nodejs case)
            width: 20, //aspect ratio = width/height
            height: 20,
            margin: {
                top: 0, //negative or positive num, from the current position
                left: 0 //negative or positive num, from the current position
            }
        },
        business: {
            name: "H2K Store",
            address: "Tp.HCM",
            phone: "(+84) 012 34 56 789",
            email: "h2kstore@gmail.com",
            email_1: "infoh2k@gmail.com",
            website: "http://localhost:8080/WebProject",
        },
        contact: {
            label: "Invoice issued for:",
            name: "UserID: ${infoOrder.userID}",
            address: "Tp.HCM",
            phone: "(+84) 111 11 11 111",
            email: "client@gmail.com",
            otherInfo: "None",
        },
        invoice: {
            label: "Invoice #: ",
            num: 1,
            invDate: "Payment Date: 2022",
            invGenDate: "Invoice Date: 2022",
            headerBorder: false,
            tableBodyBorder: false,
            header: [
                {
                    title: "#",
                    style: {
                        width: 10
                    }
                },
                {
                    title: "Name",
                    style: {
                        width: 30
                    }
                },
                {
                    title: "Number Details",
                    style: {
                        width: 50
                    }
                },
                {
                    title: "Price",
                    style: {
                        width: 20
                    }
                },
                {
                    title: "Quantity",
                    style: {
                        width: 20
                    }
                },
                {
                    title: "Status",
                    style: {
                        width: 35
                    }
                },
                {
                    title: "UserID",
                    style: {
                        width: 20
                    }
                }
            ],
            table: Array.from(Array(1), (item, index) => ([
                index + 1,
                "${infoOrder.name}",
                "${infoOrder.orderDetails_id}",
                ${infoOrder.price},
                ${infoOrder.quantity},
                "${infoOrder.status}",
                ${infoOrder.userID}
            ])),
            additionalRows: [{
                col1: 'Total:',
                col2: '145,250.50',
                col3: 'ALL',
                style: {
                    fontSize: 14 //optional, default 12
                }
            },
                {
                    col1: 'VAT:',
                    col2: '20',
                    col3: '%',
                    style: {
                        fontSize: 10 //optional, default 12
                    }
                },
                {
                    col1: 'SubTotal:',
                    col2: '116,199.90',
                    col3: 'ALL',
                    style: {
                        fontSize: 10 //optional, default 12
                    }
                }],
            invDescLabel: "Invoice Note",
            invDesc: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.",
        },
        footer: {
            text: "The invoice is created on a computer and is valid without the signature and stamp.",
        },
        pageEnable: true,
        pageLabel: "Page ",
    };
</script>
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