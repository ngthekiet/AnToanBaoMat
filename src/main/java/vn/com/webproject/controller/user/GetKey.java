package vn.com.webproject.controller.user;

import vn.com.webproject.model.RSA;
import vn.com.webproject.services.KeyServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Base64;

@WebServlet(name = "GetKey", value = "/getKey")
public class GetKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RSA rsa = new RSA();
        byte[] dataPublicKey = rsa.getPublicKey().getEncoded();
        byte[] dataPrivateKey = rsa.getPrivateKey().getEncoded();
        String publicKeyString = Base64.getEncoder().encodeToString(dataPublicKey);
        String privateKeyString = Base64.getEncoder().encodeToString(dataPrivateKey);
        if (KeyServices.getInstance().changePublicKey(publicKeyString, username, password) == false) {
            request.setAttribute("status", "Không thể cấp khóa mới. Vui lòng thử lại!");
        } else {
            KeyServices.getInstance().changePublicKey(publicKeyString, username, password);
            request.setAttribute("yourkey", privateKeyString);
            request.setAttribute("status", "Cấp khóa mới thành công. Vui lòng lưu lại khóa!");
        }
        request.getRequestDispatcher("setting-security.jsp").forward(request, response);
    }
}
