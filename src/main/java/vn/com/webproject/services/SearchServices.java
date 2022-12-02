package vn.com.webproject.services;

import vn.com.webproject.beans.Product;
import vn.com.webproject.dao.SearchDao;

import java.util.List;

public class SearchServices {
    private static SearchServices instance;

    public SearchServices() {
    }

    public static SearchServices getInstance() {
        if (instance == null)
            instance = new SearchServices();
        return instance;
    }

    public List<Product> search(String txtSearch) {
        return SearchDao.getInstance().search(txtSearch);
    }
}
