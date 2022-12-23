package vn.com.webproject.controller;

import vn.com.webproject.beans.Product;
import vn.com.webproject.services.CategoryServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Category", value = "/category")
public class Category extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = request.getParameter("cid");
        List<Product> productList = CategoryServices.getInstance().getCategory(cid);
        request.setAttribute("listCategory", productList);
        request.getRequestDispatcher("categoryProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
