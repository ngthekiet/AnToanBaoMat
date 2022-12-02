package vn.com.webproject.dao;

import org.jdbi.v3.core.result.ResultBearing;
import vn.com.webproject.beans.Cart;
import vn.com.webproject.beans.Product;
import vn.com.webproject.beans.User;
import vn.com.webproject.db.JDBIConnector;

public class OrderDao {
    private static OrderDao instance;

    public OrderDao() {
    }

    public static OrderDao getInstance() {
        if (instance == null)
            instance = new OrderDao();
        return instance;
    }

    public boolean create(User user, Cart cart) {
        int orderId = JDBIConnector.getJdbi().withHandle(handle -> {
            ResultBearing resultBearing = handle.createUpdate("INSERT INTO orders (user_id, status) VALUES (?,?)")
                    .bind(0, user.getUserID())
                    .bind(1, "")
                    .executeAndReturnGeneratedKeys();
            return resultBearing.mapTo(Integer.class).findFirst().get();
        });
        int total = JDBIConnector.getJdbi().withHandle(handle -> {
            int sum = 0;
            for (Product product : cart.getProductList()) {
                sum += handle.createUpdate("INSERT  INTO order_details(order_id, product_id,quantity,note) VALUES(?,?,?,?) ")
                        .bind(0, orderId)
                        .bind(1, product.getProduct_id())
                        .bind(2, product.getQuantitySold())
                        .bind(3, "")
                        .execute();
            }
            return sum;
        });
        return total == cart.getProductList().size();
    }
}
