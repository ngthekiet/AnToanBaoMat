package vn.com.webproject.controller.cart;

import vn.com.webproject.beans.Cart;
import vn.com.webproject.beans.User;
import vn.com.webproject.services.OrderServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckOut", value = "/cart-checkout")
public class CheckOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("auth") == null) {
            response.sendRedirect("/WebProject/login.jsp");
            return;
        }
        if (session.getAttribute("cart") == null) {
            response.sendRedirect("/WebProject/cart");
            return;
        }

        boolean result = OrderServices.getInstance().createOrder((User) session.getAttribute("auth"), (Cart) session.getAttribute("cart"));
        session.removeAttribute("cart");
        if (result)
            response.sendRedirect("/WebProject/home");
        else
            response.sendRedirect("/WebProject/cart.jsp");
    }
}
