package vn.com.webproject.beans;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {
    private Map<Integer, Product> productMap;

    public Cart() {
        productMap = new HashMap<>();
    }

    public static Cart getInstance() {
        return new Cart();
    }

    public Product get(int id) {
        return productMap.get(id);
    }

    //    Đưa sản phẩm vào giỏ hàng hoàn chỉnh(có thể chỉnh sửa)
    public void put(Product product) {
        if (productMap.containsKey(product.getProduct_id())) {
            upQuantity(product.getProduct_id());
        } else {
            product.setQuantitySold(1);
            productMap.put(product.getProduct_id(), product);
        }
    }

    //    Tăng số lượng sản phẩm hoàn chỉnh
    private void upQuantity(int id) {
        Product product = productMap.get(id);
        product.setQuantitySold(product.getQuantitySold() + 1);
    }

    public void updataQuantity(int id, int quantity) {
        Product product = productMap.get(id);
        product.setQuantitySold(quantity);
    }

    public Product remove(int id) {
        return productMap.remove(id);
    }

    //    Lấy tổng tiền hóa đơn hoàn chỉnh
    public double getTotalPrice() {
        double total = 0;
        for (Product product : productMap.values()) {
            total += product.getPriceSold();
        }
        return total;
    }

    //    Lấy tổng số lượng sản phẩm đã bán hoàn chỉnh
    public int getTotalQuantity() {
        int total = 0;
        for (Product product : productMap.values()) {
            total += product.getQuantitySold();
        }
        return total;
    }

    //    Lấy danh sách sản phẩm hoàn chỉnh
    public Collection<Product> getProductList() {
        return productMap.values();
    }

    public int updataQuantitySold(int id, int quantity) {
        Product product = productMap.get(id);
        if (quantity < 1 || quantity > product.getQuantity())
            return product.getQuantitySold();
        product.setQuantitySold(quantity);
        return product.getQuantitySold();
    }
}
