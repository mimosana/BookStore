/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.BookVariantDao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {
    private int userId;
    private List<CartItem> items;
    private BookVariantDao variantDao = new BookVariantDao();
    
    public Cart(){
        items=new ArrayList<>();
    }

    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
    
    
    public CartItem getBookInList(int variantId){
        for(CartItem i:items){
            if(i.getVariant().getVariantId()==variantId)
                return i;
        }
        return null;
    }
    public boolean deleteItem(int variantId){
        return items.remove(getBookInList(variantId));
    }
    
    public int getQuantityOfItem(int variantid){
        return getBookInList(variantid).getQuantity();
    }
            
    public void addItemToLocalList(int variantId,int quatity){
        CartItem item=getBookInList(variantId);
        
        if(item!=null){
            int newquantity=quatity+item.getQuantity();
            if(newquantity<=variantDao.getQuantity(variantId))
              item.setQuantity(newquantity);
        }else{
            BookVariant variant=variantDao.getVariant(variantId);
            if(variant!=null){
                if(quatity<=variant.getStock()){
                CartItem cartItem=new CartItem();
                cartItem.setUserid(getUserId());
                cartItem.setVariant(variant);
                cartItem.setQuantity(quatity);
                this.items.add(item);
                }
            }
        }
    }
    public int getSizeOfList(){
        return items.size();
    }
    public double getTotalQuantity(){
        double sum=0;
        for(CartItem i:items){
            sum+=(i.getQuantity()*i.getVariant().getPrice());
        }
        return sum;
    }
    
    
}
