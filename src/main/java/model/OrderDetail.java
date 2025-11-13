/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private int orderDetailId;
    private int orderId;
    private int bookVarId;
    private int quantity;
    private float price;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailId, int orderId, int bookVarId, int quantity, float price) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.bookVarId = bookVarId;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(int orderId, int bookVarId, int quantity, float price) {
        this.orderId = orderId;
        this.bookVarId = bookVarId;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getBookVarId() {
        return bookVarId;
    }

    public void setBookVarId(int bookVarId) {
        this.bookVarId = bookVarId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetailDTO{" + "orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", bookVarId=" + bookVarId + ", quantity=" + quantity + ", price=" + price + '}';
    }
    
    
}
