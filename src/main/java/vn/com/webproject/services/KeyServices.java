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

    public boolean changePublicKey(String publicKey, String username, String password) {
        return KeyDao.getInstances().changePublicKey(publicKey, username, password);
    }

    public boolean updatePublicKey(String publicKey, String username, String password) {
        return KeyDao.getInstances().updatePublicKey(publicKey, username, password);
    }
}
