/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {
    List<CartItem> items;

    public Cart() {
        items=new ArrayList<>();
    }
    
    public List<CartItem> getAll(){
        return items;
    }
    
    public BookVariant getProductByIndex(int pid,List<BookVariant> list){
        for(BookVariant b:list){
            if(b.getBookId()==pid){
                return b;
            }
        }
        return null;
    }
    public CartItem getItem(int pid){
        for(CartItem i:items){
            if(i.getVariant().getVariantId()==pid){
                return i;
            }
        }
        return null;
    }
    //add Items
    public void addItems(CartItem item){
            if(getItem(item.getVariant().getVariantId())!=null){
                CartItem i=getItem(item.getVariant().getVariantId());
                i.setQuantity(i.getQuantity()+item.getQuantity());
            }else{
                items.add(item);
            }
        
        
    }
    
    //
    public Cart(String txt,List<BookVariant> listB){
        items=new ArrayList<>();
        String[] listItem=txt.split("\\|");
        for(String i:listItem){
            String[] listStrings=i.split(":");
            String pid=listStrings[0];
            String quantity=listStrings[1];
            
            try {
                int id=Integer.parseInt(pid);
                int quantityP=Integer.parseInt(quantity);
                BookVariant book=getProductByIndex(id, listB);
                CartItem item=new CartItem(book, quantityP, book.getPrice());
                addItems(item);
            } catch (Exception e) {
            }
            
        }
        
    }
}
