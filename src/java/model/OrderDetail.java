package model;

public class OrderDetail {
    private int orderId;
    private int variantId;
    private int quantity;
    private double price;
    private String bookTitle;
    private String variantName;

    // extra for JOIN
    private BookVariant varaint;
    public OrderDetail() {}
     public OrderDetail(int orderId, int variantId, int quantity, double price) {
        this.orderId = orderId;
        this.variantId = variantId;
        this.quantity = quantity;
        this.price = price;
        
    }

    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getVariantId() { return variantId; }
    public void setVariantId(int variantId) { this.variantId = variantId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }

    public String getVariantName() { return variantName; }
    public void setVariantName(String variantName) { this.variantName = variantName; }
    

   

    public BookVariant getVaraint() {
        return varaint;
    }

    public void setVaraint(BookVariant varaint) {
        this.varaint = varaint;
    }
    

    @Override
    public String toString() {
        return "OrderDetail{" + "orderId=" + orderId + ", variantId=" + variantId + ", quantity=" + quantity + ", price=" + price + ", varaint=" + varaint + '}';
    }
    
    

}

