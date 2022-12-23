package vn.com.webproject.controller.manage;

import vn.com.webproject.beans.User;
import vn.com.webproject.services.UserServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoadUser", value = "/loadUser")
public class LoadUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        User user = UserServices.getInstance().getByUsername(username);
        request.setAttribute("user", user);
        request.getRequestDispatcher("admin-edit-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
