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
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <title>iPhone 13 Pro Max</title>
</head>

<body id="body_iphone">
<div id="iphone_container">
    <div id="iphone_frame">
        <jsp:include page="header.jsp"/>
        <div class="product_info-items">
            <div class="product_info-itemsFrame">
                <div class="product_info-left">
                    <div class="product_info-leftFrame">
                        <div class="product_info-name">
                            <div class="product_info-nameTop">
                                <h3 class="product_name-h3">${details.name}</h3>
                                <h4 class="product_name-h4">${details.price}₫</h4>
                            </div>
                            <img src="${details.img}">
                        </div>
                    </div>
                </div>
                <div class="product_info-right">
                    <div class="product_info-rightFrame">
                        <div class="product_info-nameBottom">
                            <h3 class="product_name-h3">${details.name}</h3>
                            <h4 class="product_name-h4">${details.price}₫</h4>
                        </div>
                        <div class="product_info-memory">
                            <p>Dung lượng:</p>
                            <ul class="div-items product-memoryFrame">
                                <li>
                                    <label class="product-memory">${details.memory}</label>
                                </li>
                            </ul>
                        </div>
                        <div class="product_info-color">
                            <p>Màu:</p>
                            <ul class="div-items product-colorFrame">
                                <li>
                                    <label id="color-gray" class="product-color"></label>
                                </li>
                            </ul>
                        </div>
                        <div class="product_button-buyBag">
                            <div class="product-buttonFrame">
                                <a href="cart-add?id=${details.product_id}" id="product-button-buy"
                                   class="product-button">Mua
                                    ngay</a>
                            </div>
                            <div class="product-buttonFrame">
                                <a href="cart-add-product?pid=${details.product_id}" id="product-button-bag"
                                   class="product-button">Thêm vào giỏ</a>
                            </div>
                        </div>
                        <div class="product_service">
                            <ul id="product_serviceFrame">
                                <li class="product_service-items">
                                    <i class="fas fa-redo-alt product-icons"></i>
                                    <span>Đổi trả trong vòng 12 tháng <a class="product-linkColor" href="#">Xem
                                                chi tiết</a></span>
                                </li>
                                <li class="product_service-items">
                                    <i class="fas fa-shield-alt product-icons"></i>
                                    <span>Bảo hành chính hãng 1 năm</span>
                                </li>
                                <li class="product_service-items">
                                    <i class="fas fa-truck product-icons"></i>
                                    <span>Giao hàng toàn quốc <a class="product-linkColor" href="#">Xem chi
                                                tiết</a></span>
                                </li>
                                <li class="product_service-items">
                                    <i class="fas fa-phone-alt product-icons"></i>
                                    <span>Tổng đài: 000.0000.000 (9h00 - 21h00 mỗi ngày)</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product_description">
            <div class="product_descriptionFrame">
                <div class="product_description-left">
                    <h3 class="product_descriptionName">Mô tả sản phẩm</h3>
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-1.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-2.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-3.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-4.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-5.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-6.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-7.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-8.jpg" alt="">
                    <img class="product_descriptionImg"
                         src="./images/description-info/iPhone 13 Pro-ProMax/iphone-13-9.jpg" alt="">
                    <h4 class="product_descriptionName">Điện thoại iPhone 13 Pro Max giá bao nhiêu? Ra mắt khi nào?
                    </h4>
                    <div>
                        <p>Điện thoại iPhone 13 Pro Max được ra mắt vào ngày 14 tháng 9 năm 2021 tại sự
                            kiện "California Streaming"
                            diễn ra trực tuyến tương tự năm ngoái cùng với 3 phiên bản khác là iPhone 13, 13
                            mini và 13 Pro.</p>
                        <p>Với giá bán dao động từ 35 triệu ~ 50 triệu VNĐ (tùy theo RAM và bộ nhớ
                            trong), Khách hàng có thể
                            mua iPhone 13 Pro Max chính hãng VN/A tại H2KStore để nhận ngay mức giá tốt nhất
                            cùng nhiều ưu đãi
                            hấp dẫn qua tổng đài tư vấn 0000.0000.</p>
                    </div>
                </div>
                <div class="product_description-right">
                    <h3 class="product_descriptionName">Thông số kỹ thuật</h3>
                    <ul class="product_description-listInfo">
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Kích thước màn hình</div>
                            <div class="product_description-listName">6.7 inches</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Công nghệ màn hình</div>
                            <div class="product_description-listName">OLED</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Camera sau</div>
                            <div class="product_description-listName">Camera góc rộng: 12MP, ƒ/1.5<br>
                                Camera góc siêu rộng: 12MP, ƒ/1.8<br>
                                Camera tele : 12MP, /2.8
                            </div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Camera trước</div>
                            <div class="product_description-listName">12MP, ƒ/2.2</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Chipset</div>
                            <div class="product_description-listName">Apple A15</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Dung lượng RAM</div>
                            <div class="product_description-listName">6 GB</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Bộ nhớ trong</div>
                            <div class="product_description-listName">128 GB</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Pin</div>
                            <div class="product_description-listName">4,325mAh</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Thẻ SIM</div>
                            <div class="product_description-listName">2 SIM (nano‑SIM và eSIM)</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Hệ điều hành</div>
                            <div class="product_description-listName">iOS15</div>
                        </li>
                        <li class="product_description-list">
                            <div class="product_description-listTitle">Độ phân giải màn hình</div>
                            <div class="product_description-listName">2778 x 1284 pixel</div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <div id="web_author">
            <div id="author_container">
                <div id="author-info">
                    <p>Đây là web phục vụ việc học tập không nhằm mục đích kinh doanh. Bản quyền thuộc H2K</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>