package vn.com.webproject.dao;

import org.jdbi.v3.core.result.ResultBearing;
import vn.com.webproject.beans.Cart;
import vn.com.webproject.beans.ListOrder;
import vn.com.webproject.beans.Product;
import vn.com.webproject.beans.User;
import vn.com.webproject.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

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

    public List<ListOrder> listOrder(int uid) {
        List<ListOrder> listOrders = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("select p.img, p.`name`, d.quantity, p.price, d.`status`,d.orderDetails_id, o.user_id " +
                                "from order_details d join orders o on d.order_id=o.order_id join product p on d.product_id = p.product_id " +
                                "where o.user_id = ?")
                        .bind(0, uid)
                        .mapToBean(ListOrder.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return listOrders;
    }
}
