/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author Admin
 */
public class CartItemsDTO {
    private int cartItemID;
    private int cartId;
    private int quanlity;
    private int productVarId;

    public CartItemsDTO(int cartItemID, int cartId, int quanlity, int productVarId) {
        this.cartItemID = cartItemID;
        this.cartId = cartId;
        this.quanlity = quanlity;
        this.productVarId = productVarId;
    }

    public CartItemsDTO(int cartId, int quanlity, int productVarId) {
        this.cartId = cartId;
        this.quanlity = quanlity;
        this.productVarId = productVarId;
    }

    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }

    public int getProductVarId() {
        return productVarId;
    }

    public void setProductVarId(int productVarId) {
        this.productVarId = productVarId;
    }

    @Override
    public String toString() {
        return "CartItemsDTO{" + "cartItemID=" + cartItemID + ", cartId=" + cartId + ", quanlity=" + quanlity + ", productVarId=" + productVarId + '}';
    }
    
    
}
