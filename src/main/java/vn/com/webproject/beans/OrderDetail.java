package vn.com.webproject.beans;

import java.util.Date;
import java.util.List;

public class OrderDetail {
    private int orderDetail_id;
    private List<Order> orders;
    private int product_id;
    private int quantity;
    private String note;
    private Date createAt;
    private Date updateAt;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetail_id, List<Order> orders, int product_id, int quantity, String note, Date createAt, Date updateAt) {
        this.orderDetail_id = orderDetail_id;
        this.orders = orders;
        this.product_id = product_id;
        this.quantity = quantity;
        this.note = note;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    public int getOrderDetail_id() {
        return orderDetail_id;
    }

    public void setOrderDetail_id(int orderDetail_id) {
        this.orderDetail_id = orderDetail_id;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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
