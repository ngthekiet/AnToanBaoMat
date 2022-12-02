package vn.com.webproject.dao;

import vn.com.webproject.beans.Product;
import vn.com.webproject.beans.User;
import vn.com.webproject.db.JDBIConnector;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.stream.Collectors;

public class UserDao {
    private static UserDao instance;

    public UserDao() {
    }

    public static UserDao getInstance() {
        if (instance == null)
            instance = new UserDao();
        return instance;
    }

    //Chức năng Login
    public User checkLogin(String username, String password) {
        List<User> users = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE username =?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1)
            return null;
        User user = users.get(0);
        if (!user.getPassword().equals(hashPassword(password)) || !user.getUsername().equals(username))
            return null;
        return user;
    }

    //    Chức năng Register
    public int register(String username, String password, String confirmPassword, String email, String fullname, String numberPhone, String address) {
        int i;
        if (!checkRegister(username))
            return 0;
        if (password.equals(confirmPassword)) {
            try {
                i = JDBIConnector.getJdbi().withHandle(handle ->
                        handle.createUpdate("INSERT INTO user(username, password, email, fullname,number_phone,address) VALUES (?,?,?,?,?,?)")
                                .bind(0, username)
                                .bind(1, hashPassword(password))
                                .bind(2, email)
                                .bind(3, fullname)
                                .bind(4, numberPhone)
                                .bind(5, address)
                                .execute());
            } catch (Exception e) {
                return 0;
            }
        } else
            return 2;
        return i;
    }

    //Mã hóa password
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

    public List<User> getAllUser() {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from user").mapToBean(User.class).stream().collect(Collectors.toList());
        });
    }

    public void deleteByUsername(String username) {
        JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createUpdate("delete from user where username = ? and role != 2")
                    .bind(0, username)
                    .execute();
        });
    }

    public void editUser(String username, String email, String fullname, String numberPhone, String address, int role) {
        JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createUpdate("update user set email = ?, fullname = ?, number_phone = ?, address= ?, role = ? where username = ?")
                    .bind(0, email)
                    .bind(1, fullname)
                    .bind(2, numberPhone)
                    .bind(3, address)
                    .bind(4, role)
                    .bind(5, username)
                    .execute();
        });
    }

    public boolean checkRegister(String username) {
        List<User> users = JDBIConnector.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM user WHERE username =?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() == 0)
            return true;
        return false;
    }

    public User getByUsername(String username) {
        return JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("select * from user where username = ?").bind(0, username).mapToBean(User.class).first();
        });
    }
}
