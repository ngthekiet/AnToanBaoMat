package vn.com.webproject.controller.user;

import vn.com.webproject.model.RSA;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.PrivateKey;

@WebServlet(name = "DoVerify", value = "/doVerify")
public class DoVerify extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String key = request.getParameter("key");
        int uid = Integer.parseInt(request.getParameter("uid"));
        int did = Integer.parseInt(request.getParameter("did"));
        PrivateKey privateKey = RSA.getInstance().stringToPrivateKey(key);
        System.out.println(privateKey);
    }
}
