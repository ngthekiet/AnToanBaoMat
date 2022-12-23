package vn.com.webproject.controller;

import vn.com.webproject.beans.User;
import vn.com.webproject.services.UserServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/doLogin")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserServices.getInstance().checkLogin(username, password);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("auth", user);
            response.sendRedirect("/WebProject/home");
        } else {
            request.setAttribute("error", "Username or password is incorrect");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }
}
