/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author luong
 */
public class BookVariant {
    private int variantId;
    private int bookId;
    private String variantName;
    private double price;
    private int stock;

    public BookVariant() {}

   

    public BookVariant(int variantId, int bookId, String variantName, double price, int stock) {
        this.variantId = variantId;
        this.bookId = bookId;
        this.variantName = variantName;
        this.price = price;
        this.stock = stock;
    }

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

    @Override
    public String toString() {
        return "BookVariant{" + "variantId=" + variantId + ", bookId=" + bookId + ", variantName=" + variantName + ", price=" + price + ", stock=" + stock + '}';
    }
    
    
    
}
