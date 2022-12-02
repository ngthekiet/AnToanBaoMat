package vn.com.webproject.beans;

import java.io.Serializable;

public class User implements Serializable {
    private int userID;
    private String username;
    private String password;
    private String email;
    private String fullname;
    private String numberPhone;
    private String address;
    private int role;

    public User() {
    }

    public User(int userID, String username, String password, String email, String fullname, String numberPhone, String address, int role) {
        this.userID = userID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullname = fullname;
        this.numberPhone = numberPhone;
        this.address = address;
        this.role = role;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
