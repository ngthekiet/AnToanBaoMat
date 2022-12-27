package vn.com.webproject.dao;

import vn.com.webproject.beans.DetailsInfo;
import vn.com.webproject.beans.User;
import vn.com.webproject.db.JDBIConnector;
import vn.com.webproject.model.RSA;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.List;
import java.util.stream.Collectors;

public class KeyDao {
    public static KeyDao instance;

    public KeyDao() {

    }

    public static KeyDao getInstances() {
        if (instance == null)
            instance = new KeyDao();
        return instance;
    }

    public boolean changePublicKey(String publicKey, String username, String password) {
        List<User> users = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE username =?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1)
            return false;
        User user = users.get(0);
        if (user.getPassword().equals(hashPassword(password))) {
            try {
                JDBIConnector.getJdbi().withHandle(handle -> {
                    return handle.createUpdate("update user set public_key = ? where username = ?")
                            .bind(0, publicKey)
                            .bind(1, username)
                            .execute();
                });
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            return false;
        }
    }

    public boolean updatePublicKey(String publicKey, String username, String password) {
        List<User> users = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE username =?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1)
            return false;
        User user = users.get(0);
        if (user.getPassword().equals(hashPassword(password))) {
            try {
                JDBIConnector.getJdbi().withHandle(handle -> {
                    return handle.createUpdate("update user set public_key = ? where username = ?")
                            .bind(0, publicKey)
                            .bind(1, username)
                            .execute();
                });
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            return false;
        }
    }

    public String hashPassword(String password) {
        MessageDigest sha256 = null;
        try {
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger bigInteger = new BigInteger(1, hash);
            return bigInteger.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }
    public boolean doVerify(PrivateKey privateKey, int uid, int did) {
        List<User> users = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE userID =?")
                        .bind(0, uid)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        List<DetailsInfo> detailsInfos = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT info FROM order_details WHERE orderDetails_id =?")
                        .bind(0, did)
                        .mapToBean(DetailsInfo.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        DetailsInfo detailsInfo = detailsInfos.get(0);
        String info = detailsInfo.getInfo();

        User user = users.get(0);
        String stringPub = user.getPublicKey();
        PublicKey publicKey = RSA.getInstance().stringToPublicKey(stringPub);

        try {
            if (RSA.getInstance().decrypt(RSA.getInstance().encrypt(info, privateKey), publicKey).equals(info)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }
}
