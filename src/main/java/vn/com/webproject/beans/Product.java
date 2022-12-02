package vn.com.webproject.beans;

public class Product {
    private int product_id;
    private String product_group;
    private String name;
    private int price;
    private String img;
    private int quantity;
    private String color;
    private String memory;
    int quantitySold;

    public Product() {
    }

    public Product(int product_id, String product_group, String name, int price, String img, int quantity, String color, String memory, int quantitySold) {
        this.product_id = product_id;
        this.product_group = product_group;
        this.name = name;
        this.price = price;
        this.img = img;
        this.quantity = quantity;
        this.color = color;
        this.memory = memory;
        this.quantitySold = quantitySold;
    }

    public int getPriceSold() {
        return this.getQuantitySold() * this.getPrice();
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getProduct_group() {
        return product_group;
    }

    public void setProduct_group(String product_group) {
        this.product_group = product_group;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMemory() {
        return memory;
    }

    public void setMemory(String memory) {
        this.memory = memory;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }
}
