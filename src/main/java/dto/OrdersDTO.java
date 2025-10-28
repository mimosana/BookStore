/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class OrdersDTO {
    private int ordersId;
    private int userId;
    private LocalDate date;
    private String shippingAddress;
    private String shippingCity;
    private String postalCode;
    private String status;

    public OrdersDTO() {
    }


    public OrdersDTO(int ordersId, int userId, LocalDate date, String shippingAddress, String shippingCity, String postalCode, String status) {
        this.ordersId = ordersId;
        this.userId = userId;
        this.date = date;
        this.shippingAddress = shippingAddress;
        this.shippingCity = shippingCity;
        this.postalCode = postalCode;
        this.status = status;
    }

    public OrdersDTO(int userId, LocalDate date, String shippingAddress, String shippingCity, String postalCode, String status) {
        this.userId = userId;
        this.date = date;
        this.shippingAddress = shippingAddress;
        this.shippingCity = shippingCity;
        this.postalCode = postalCode;
        this.status = status;
    }
    
    

    public int getOrdersId() {
        return ordersId;
    }

    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public String getShippingCity() {
        return shippingCity;
    }

    public void setShippingCity(String shippingCity) {
        this.shippingCity = shippingCity;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "OrdersDTO{" + "ordersId=" + ordersId + ", userId=" + userId + ", date=" + date + ", shippingAddress=" + shippingAddress + ", shippingCity=" + shippingCity + ", postalCode=" + postalCode + ", status=" + status + '}';
    }
    
    
    
    
    
    
}
