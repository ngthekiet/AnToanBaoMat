package vn.com.webproject.services;

import vn.com.webproject.beans.User;
import vn.com.webproject.dao.UserDao;

import java.util.List;

public class UserServices {
    private static UserServices instance;

    public UserServices() {
    }

    public static UserServices getInstance() {
        if (instance == null)
            instance = new UserServices();
        return instance;
    }

    //    Chức năng Login
    public User checkLogin(String username, String password) {
        return UserDao.getInstance().checkLogin(username, password);
    }

    //    Chức năng Register
    public int register(String username, String password, String confirmPassword, String email, String fullname, String numberPhone, String address) {
        return UserDao.getInstance().register(username, password, confirmPassword, email, fullname, numberPhone, address);
    }

    public List<User> getAllUser() {
        return UserDao.getInstance().getAllUser();
    }

    public void deleteByUsername(String username) {
        UserDao.getInstance().deleteByUsername(username);
    }

    public void editUser(String username, String email, String fullname, String numberPhone, String address, int role) {
        UserDao.getInstance().editUser(username, email, fullname, numberPhone, address, role);
    }

    public User getByUsername(String username) {
        return UserDao.getInstance().getByUsername(username);
    }


}
