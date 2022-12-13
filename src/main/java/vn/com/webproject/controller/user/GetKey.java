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
        String username = request.getParameter("uid");
        RSA rsa = new RSA();
        byte[] dataPublicKey = rsa.getPublicKey().getEncoded();
        byte[] dataPrivateKey = rsa.getPrivateKey().getEncoded();
        String publicKeyString = Base64.getEncoder().encodeToString(dataPublicKey);
        String privateKeyString = Base64.getEncoder().encodeToString(dataPrivateKey);
        KeyServices.getInstance().changePublicKey(publicKeyString,username);
        request.setAttribute("yourkey", privateKeyString);
        request.getRequestDispatcher("setting-security.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
