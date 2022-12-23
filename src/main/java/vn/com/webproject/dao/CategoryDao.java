package vn.com.webproject.dao;

import vn.com.webproject.beans.Product;
import vn.com.webproject.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CategoryDao {
    private static CategoryDao instance;

    public CategoryDao() {
    }

    public static CategoryDao getInstance() {
        if (instance == null)
            instance = new CategoryDao();
        return instance;
    }

    public List<Product> getCategory(String cid) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product where product_group like ?")
                    .bind(0, "%" + cid + "%")
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }
}
