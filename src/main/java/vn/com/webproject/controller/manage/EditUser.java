package vn.com.webproject.controller.manage;

import vn.com.webproject.services.UserServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditUser", value = "/editUser")
public class EditUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String numberPhone = request.getParameter("numberPhone");
        String address = request.getParameter("address");
        int role = Integer.parseInt(request.getParameter("role"));
        UserServices.getInstance().editUser(username, email, fullname, numberPhone, address, role);
        response.sendRedirect("/WebProject/listUser");
    }
}
