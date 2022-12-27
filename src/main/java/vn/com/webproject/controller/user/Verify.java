package vn.com.webproject.controller.user;

import vn.com.webproject.beans.ListOrder;
import vn.com.webproject.services.UserServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Verify", value = "/verify")
public class Verify extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int did = Integer.parseInt(request.getParameter("did"));
        UserServices.getInstance().saveHash(did);
        ListOrder infoOrder = UserServices.getInstance().verify(did);
        request.setAttribute("infoOrder", infoOrder);
        request.getRequestDispatcher("verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
