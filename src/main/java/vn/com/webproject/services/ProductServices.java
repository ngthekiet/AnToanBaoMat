package vn.com.webproject.services;

import vn.com.webproject.beans.Product;
import vn.com.webproject.dao.ProductDao;

import java.util.List;

public class ProductServices {
    private static ProductServices instance;

    private ProductServices() {

    }

    public static ProductServices getInstance() {
        if (instance == null) {
            instance = new ProductServices();
        }
        return instance;
    }

    public List<Product> getAll() {
        return ProductDao.getInstance().getAll();
    }

    public List<Product> getProducts(String productName) {
        return ProductDao.getInstance().getProducts(productName);
    }

    public List<Product> getTop5(String productName) {
        return ProductDao.getInstance().getTop5(productName);
    }

    public List<Product> getNextProduct(String productName, int amount) {
        return ProductDao.getInstance().getNextProduct(productName, amount);
    }

    public Product getById(int id) {
        return ProductDao.getInstance().getById(id);
    }

    public void deleteById(int id) {
        ProductDao.getInstance().deleteById(id);
    }

    public void insertProduct(String productGroup, String name, int price, int quantity, String img, String color, String memory) {
        ProductDao.getInstance().insertProduct(productGroup, name, price, quantity, img, color, memory);
    }

    public void editProduct(int id, String productGroup, String name, int price, int quantity, String img, String color, String memory) {
        ProductDao.getInstance().editProduct(id, productGroup, name, price, quantity, img, color, memory);
    }
}
