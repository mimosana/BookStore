/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author luong
 */
public class OrderDetail {
    private int orderId;
    private int variantId;
    private int quantity;
    private double price;

    // extra for JOIN
    private BookVariant varaint;
    

    public OrderDetail() {}

    

    public OrderDetail(int orderId, int variantId, int quantity, double price) {
        this.orderId = orderId;
        this.variantId = variantId;
        this.quantity = quantity;
        this.price = price;
        
    }

    public BookVariant getVaraint() {
        return varaint;
    }

    public void setVaraint(BookVariant varaint) {
        this.varaint = varaint;
    }
    
    

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
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

    @Override
    public String toString() {
        return "OrderDetail{" + "orderId=" + orderId + ", variantId=" + variantId + ", quantity=" + quantity + ", price=" + price + ", varaint=" + varaint + '}';
    }
    
    

}

