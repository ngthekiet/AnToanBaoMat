package vn.com.webproject.controller;

import vn.com.webproject.services.ProductServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Home", value = "/home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imac = "imac";
        String ipad = "ipad";
        String iphone = "iphone";
        String watch = "watch";
        String sound = "sound";
        String accessory = "accessory";
        request.setAttribute("imac", ProductServices.getInstance().getTop5(imac));
        request.setAttribute("ipad", ProductServices.getInstance().getTop5(ipad));
        request.setAttribute("iphone", ProductServices.getInstance().getTop5(iphone));
        request.setAttribute("watch", ProductServices.getInstance().getTop5(watch));
        request.setAttribute("sound", ProductServices.getInstance().getTop5(sound));
        request.setAttribute("accessory", ProductServices.getInstance().getTop5(accessory));
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
