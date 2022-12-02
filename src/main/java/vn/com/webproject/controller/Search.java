package vn.com.webproject.controller;

import vn.com.webproject.beans.Product;
import vn.com.webproject.services.SearchServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search", value = "/search")
public class Search extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String txtSearch = request.getParameter("search");
        List<Product> productList = SearchServices.getInstance().search(txtSearch);
        request.setAttribute("category", productList);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }
}
