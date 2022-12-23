package vn.com.webproject.dao;

import vn.com.webproject.beans.Product;
import vn.com.webproject.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class SearchDao {
    private static SearchDao instance;

    public SearchDao() {
    }

    public static SearchDao getInstance() {
        if (instance == null)
            instance = new SearchDao();
        return instance;
    }

    public List<Product> search(String txtSearch) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product where product_group like ? or name like ? or color like ? or memory like ?")
                    .bind(0, "%" + txtSearch + "%")
                    .bind(1, "%" + txtSearch + "%")
                    .bind(2, "%" + txtSearch + "%")
                    .bind(3, "%" + txtSearch + "%")
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }


}
