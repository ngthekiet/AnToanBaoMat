package vn.com.webproject.controller.load;

import vn.com.webproject.beans.Product;
import vn.com.webproject.services.ProductServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadSound", value = "/loadSound")
public class LoadSound extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sound = "sound";
        String quantityProductSound = request.getParameter("quantityProductSound");
        int amountSound = Integer.parseInt(quantityProductSound);
        response.setContentType("text/html; charset=UTF-8");
        List<Product> productList = ProductServices.getInstance().getNextProduct(sound, amountSound);
        PrintWriter printWriter = response.getWriter();
        for (Product product : productList) {
            printWriter.println(
                    "<div class=\"product-frameItems quantity-product-sound\">\n" +
                            "                                <a class=\"product-items\" href=\"details?pid=" + product.getProduct_id() + "\">\n" +
                            "                                    <div>\n" +
                            "                                        <img src=\"" + product.getImg() + "\">\n" +
                            "                                        <div class=\"product-nameItems\">" + product.getName() + "<br>" + product.getMemory() + "\n" +
                            "                                        </div>\n" +
                            "                                        <div class=\"product-priceItems\">" + product.getPrice() + "đ</div>\n" +
                            "                                        <span class=\"product-buttonItems\">\n" +
                            "                                            <a class=\"input-click input-pay\" href=\"cart-add?id=" + product.getProduct_id() + "\">\n" +
                            "                                                <i class=\"fas fa-money-bill\"></i>\n" +
                            "                                            </a>\n" +
                            "                                            <a href=\"cart-add-product?pid=" + product.getProduct_id() + "\"\n" +
                            "                                               class=\"input-click input-cart\">\n" +
                            "                                                <i class=\" fas fa-shopping-cart\"></i>\n" +
                            "                                            </a>\n" +
                            "                                        </span>\n" +
                            "                                    </div>\n" +
                            "                                </a>\n" +
                            "                            </div>"
            );
        }
    }
}
