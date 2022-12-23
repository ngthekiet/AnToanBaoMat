package vn.com.webproject.beans;

import java.io.Serializable;

public class ListOrder implements Serializable {
    private String img;
    private String name;
    private int quantity;
    private int price;
    private String status;

    private int orderDetails_id;

    public ListOrder() {

    }

    public ListOrder(String image, String name, int quantity, int price, String status, int orderDetails_id) {
        this.img = image;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.status = status;
        this.orderDetails_id = orderDetails_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getOrderDetails_id() {
        return orderDetails_id;
    }

    public void setOrderDetails_id(int orderDetails_id) {
        this.orderDetails_id = orderDetails_id;
    }
}
