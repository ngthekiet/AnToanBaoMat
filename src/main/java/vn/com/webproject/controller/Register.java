package vn.com.webproject.controller;

import vn.com.webproject.services.UserServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Register", value = "/doRegister")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String numberPhone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (UserServices.getInstance().register(username, password, confirmPassword, email, fullname, numberPhone, address) == 1) {
            response.sendRedirect("login.jsp");
        } else if (UserServices.getInstance().register(username, password, confirmPassword, email, fullname, numberPhone, address) == 0) {
            request.setAttribute("error", "Username is exist");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else if (UserServices.getInstance().register(username, password, confirmPassword, email, fullname, numberPhone, address) == 2) {
            request.setAttribute("error", "Confirm password incorrect");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
