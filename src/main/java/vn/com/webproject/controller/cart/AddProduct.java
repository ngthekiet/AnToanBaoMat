package vn.com.webproject.controller.cart;

import vn.com.webproject.beans.Cart;
import vn.com.webproject.beans.Product;
import vn.com.webproject.services.ProductServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddProduct", value = "/cart-add")
public class AddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = ProductServices.getInstance().getById(id);
        if (product != null) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null)
                cart = Cart.getInstance();
            cart.put(product);
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("/WebProject/cart");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
