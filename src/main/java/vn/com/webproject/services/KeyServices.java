package vn.com.webproject.services;

import vn.com.webproject.dao.KeyDao;
import vn.com.webproject.dao.UserDao;

public class KeyServices {
    private static KeyServices instance;

    public KeyServices() {
    }

    public static KeyServices getInstance() {
        if (instance == null)
            instance = new KeyServices();
        return instance;
    }

    public void changePublicKey(String publicKey, String username) {
        KeyDao.getInstances().changePublicKey(publicKey, username);
    }
}
