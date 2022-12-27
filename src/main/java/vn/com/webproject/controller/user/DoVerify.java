package vn.com.webproject.controller.user;

import vn.com.webproject.beans.ListOrder;
import vn.com.webproject.model.RSA;
import vn.com.webproject.services.KeyServices;
import vn.com.webproject.services.UserServices;

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
        try {
            PrivateKey privateKey = RSA.getInstance().stringToPrivateKey(key);
            if (KeyServices.getInstance().doVerify(privateKey, uid, did) == true) {
                KeyServices.getInstance().doVerify(privateKey, uid, did);
                ListOrder infoOrder = UserServices.getInstance().verify(did);
                request.setAttribute("infoOrder", infoOrder);
                request.setAttribute("status", "Xác thực thành công");
            } else {
                ListOrder infoOrder = UserServices.getInstance().verify(did);
                request.setAttribute("infoOrder", infoOrder);
                request.setAttribute("status", "Xác thực thất bại vui lòng kiểm tra lại khóa");
            }
        } catch (Exception e) {
            ListOrder infoOrder = UserServices.getInstance().verify(did);
            request.setAttribute("infoOrder", infoOrder);
            request.setAttribute("status", "Xác thực thất bại vui lòng kiểm tra lại khóa");
        }
        request.getRequestDispatcher("verify.jsp").forward(request, response);
    }
}
