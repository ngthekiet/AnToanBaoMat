package vn.com.webproject.controller.user;

import vn.com.webproject.beans.ListOrder;
import vn.com.webproject.services.OrderServices;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListOrder", value = "/listOrder")
public class MyOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid = Integer.parseInt(request.getParameter("uid"));
        List<ListOrder> myOrders = OrderServices.getInstance().listOrder(uid);
        request.setAttribute("myOrders", myOrders);
        System.out.println(myOrders.get(0).getImg());
        request.getRequestDispatcher("list-order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
