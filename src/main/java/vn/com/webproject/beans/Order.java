package vn.com.webproject.beans;

import java.util.Date;

public class Order {
    private int order_id;
    private String username;
    private String status;
    private Date createAt;
    private Date updateAt;

    public Order() {
    }

    public Order(int order_id, String username, String status, Date createAt, Date updateAt) {
        this.order_id = order_id;
        this.username = username;
        this.status = status;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }
}
