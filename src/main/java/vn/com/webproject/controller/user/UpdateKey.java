package vn.com.webproject.controller.user;

import vn.com.webproject.services.KeyServices;
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
        String username = request.getParameter("username");
        String publicKey = request.getParameter("publicKey");
        String password = request.getParameter("password");
        if (KeyServices.getInstance().updatePublicKey(publicKey, username, password) == false) {
            request.setAttribute("status", "Không thể cập nhật khóa. Vui lòng thử lại!");
        } else {
            KeyServices.getInstance().updatePublicKey(publicKey, username, password);
            request.setAttribute("status", "Cập nhật khóa thành công");
        }
        request.getRequestDispatcher("setting-security.jsp").forward(request, response);
    }
}
