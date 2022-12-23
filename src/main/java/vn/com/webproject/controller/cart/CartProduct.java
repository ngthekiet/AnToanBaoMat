package vn.com.webproject.controller.cart;

import vn.com.webproject.beans.Cart;
import vn.com.webproject.beans.Product;
import vn.com.webproject.services.ProductServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartProduct", value = "/cart-add-product")
public class CartProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        Product product = ProductServices.getInstance().getById(pid);
        if (product != null) {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null)
                cart = Cart.getInstance();
            cart.put(product);
            session.setAttribute("cart", cart);
        }
        response.sendRedirect("/WebProject/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
