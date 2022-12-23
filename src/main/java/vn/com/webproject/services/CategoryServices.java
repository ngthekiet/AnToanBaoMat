package vn.com.webproject.services;

import vn.com.webproject.beans.Product;
import vn.com.webproject.dao.CategoryDao;

import java.util.List;

public class CategoryServices {
    private static CategoryServices instance;

    public CategoryServices() {
    }

    public static CategoryServices getInstance() {
        if (instance == null)
            instance = new CategoryServices();
        return instance;
    }

    public List<Product> getCategory(String cid) {
        return CategoryDao.getInstance().getCategory(cid);
    }
}
