package vn.com.webproject.dao;

import vn.com.webproject.beans.Product;
import vn.com.webproject.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class ProductDao {
    private static ProductDao instance;

    private ProductDao() {
    }

    public static ProductDao getInstance() {
        if (instance == null)
            instance = new ProductDao();
        return instance;
    }

    public List<Product> getAll() {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public List<Product> getProducts(String productName) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product where product_group = ?")
                    .bind(0, productName)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public List<Product> getTop5(String productName) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product where product_group = ? limit 5")
                    .bind(0, productName)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public List<Product> getNextProduct(String productName, int amount) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product where product_group = ? order by product_id limit ?,5")
                    .bind(0, productName)
                    .bind(1, amount)
                    .mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }

    public Product getById(int id) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from product where product_id = ?").bind(0, id).mapToBean(Product.class).first();
        });
    }

    public void deleteById(int id) {
        JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createUpdate("delete from product where product_id = ?")
                    .bind(0, id)
                    .execute();
        });
    }

    public void insertProduct(String productGroup, String name, int price, int quantity, String img, String color, String memory) {
        JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createUpdate("insert into product(product_group, name, price, quantity, img, color, memory) values(?,?,?,?,?,?,?)")
                    .bind(0, productGroup)
                    .bind(1, name)
                    .bind(2, price)
                    .bind(3, quantity)
                    .bind(4, img)
                    .bind(5, color)
                    .bind(6, memory)
                    .execute();
        });
    }

    public void editProduct(int id, String productGroup, String name, int price, int quantity, String img, String color, String memory) {
        JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createUpdate("update product set product_group = ?, name = ?, price = ?, quantity = ?, img = ?, color = ?, memory = ? where product_id = ?")
                    .bind(0, productGroup)
                    .bind(1, name)
                    .bind(2, price)
                    .bind(3, quantity)
                    .bind(4, img)
                    .bind(5, color)
                    .bind(6, memory)
                    .bind(7, id)
                    .execute();
        });
    }
}
