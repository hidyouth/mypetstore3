package cus21047.web.mypetstore.domain;

import java.io.Serializable;
import java.math.BigDecimal;

public class CartItem  implements Serializable {
    private static final long serialVersionUID = 6620528781626504362L;

    private Item item;//商品
    private int quantity;//个数
    private boolean inStock;//是否在库存，目前默认库存总是true
    private BigDecimal total;//总价

    public boolean isInStock() {
        return inStock;
    }

    public void setInStock(boolean inStock) {
        this.inStock = inStock;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
        calculateTotal();
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        calculateTotal();
    }

    public void incrementQuantity() {
        quantity++;
        calculateTotal();
    }

    private void calculateTotal() {
        if (item != null && item.getListPrice() != null) {
            total = item.getListPrice().multiply(new BigDecimal(quantity));
        } else {
            total = null;
        }
    }
}
