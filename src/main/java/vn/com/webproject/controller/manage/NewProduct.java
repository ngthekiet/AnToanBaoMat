package vn.com.webproject.controller.manage;

import vn.com.webproject.services.ProductServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewProduct", value = "/addProduct")
public class NewProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String img = request.getParameter("img");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String memory = request.getParameter("memory");
        String productGroup = request.getParameter("product_group");
        ProductServices.getInstance().insertProduct(productGroup, name, price, quantity, img, color, memory);
        response.sendRedirect("/WebProject/listProduct");
    }
}
