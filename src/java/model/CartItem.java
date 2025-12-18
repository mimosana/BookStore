/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author luong
 */
public class CartItem {
     private int userId;
    private int variantId;
    private int quantity;

 
    private String bookTitle;
    private String variantName;
    private double price; 

    private BookVariant variant;

    public CartItem() {}

    public CartItem(int userId, int variantId, int quantity, String bookTitle, String variantName, double price) {
        this.userId = userId;
        this.variantId = variantId;
        this.quantity = quantity;
        this.bookTitle = bookTitle;
        this.variantName = variantName;
        this.price = price;
    }
     public CartItem(int userId, BookVariant variant, int quantity) {
        this.userId = userId;
        this.variant = variant;
        this.quantity = quantity;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }
    
   

    

   

    public BookVariant getVariant() {
        return variant;
    }

    public void setVariant(BookVariant variant) {
        this.variant = variant;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
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

    
    
    @Override
    public String toString() {
        return "CartItem{" + "userId=" + userId + ", variant=" + variant + ", quantity=" + quantity + '}';
    }
    
    
    
       
    
}
