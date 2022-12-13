package vn.com.webproject.dao;

import vn.com.webproject.db.JDBIConnector;

public class KeyDao {
    public static KeyDao instance;

    public KeyDao() {

    }

    public static KeyDao getInstances() {
        if (instance == null)
            instance = new KeyDao();
        return instance;
    }

    public void changePublicKey(String publicKey, String username) {
        JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createUpdate("update user set public_key = ? where username = ?")
                    .bind(0, publicKey)
                    .bind(1, username)
                    .execute();
        });
    }
}
