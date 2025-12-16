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
    private BookVariant variant;
    private int quantity;
    private double price;

    public CartItem() {}

    public CartItem(BookVariant variant, int quantity, double price) {
        this.variant = variant;
        this.quantity = quantity;
        this.price = price;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    
    
}
