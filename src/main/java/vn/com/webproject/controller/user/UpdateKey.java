package vn.com.webproject.controller.user;

import vn.com.webproject.services.UserServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateKey", value = "/updateKey")
public class UpdateKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String publicKey = request.getParameter("publicKey");
        String username = request.getParameter("username");
        UserServices.getInstance().changePublicKey(publicKey,username);
        response.sendRedirect("/WebProject/setting-security.jsp");
    }
}
