package vn.com.webproject.services;

import vn.com.webproject.beans.Cart;
import vn.com.webproject.beans.User;
import vn.com.webproject.dao.OrderDao;

public class OrderServices {
    private static OrderServices instance;

    public OrderServices() {
    }

    public static OrderServices getInstance() {
        if (instance == null)
            instance = new OrderServices();
        return instance;
    }

    public boolean createOrder(User user, Cart cart) {
        OrderDao orderDao = OrderDao.getInstance();
        return orderDao.create(user, cart);
    }
}
