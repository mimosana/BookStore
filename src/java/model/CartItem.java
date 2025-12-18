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
    private int userid;
    private BookVariant variant;
    private int quantity;

    public CartItem() {
    }

    public CartItem(int userid, BookVariant variant, int quantity) {
        this.userid = userid;
        this.variant = variant;
        this.quantity = quantity;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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

    @Override
    public String toString() {
        return "CartItem{" + "userid=" + userid + ", variant=" + variant + ", quantity=" + quantity + '}';
    }
    
    
    
       
    
}
