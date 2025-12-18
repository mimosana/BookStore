package model;

public class BookVariant {
    private int variantId;
    private int bookId;
    private String variantName;
    private double price;
    private int stock;
    private String status;

    public BookVariant() {}

    public BookVariant(int variantId, int bookId, String variantName,
                       double price, int stock, String status) {
        this.variantId = variantId;
        this.bookId = bookId;
        this.variantName = variantName;
        this.price = price;
        this.stock = stock;
        this.status = status;
    }

    // getters & setters

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getVariantName() {
        return variantName;
    }

    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
