package model;

import java.util.Date;
import java.util.List;

public class Order {
    private int orderId;
    private int userId;
    private Date orderDate;
    private String status;
    private double total;
    private String receiverName;
    private String phone;
    private String shippingAddress;
    private String city;

    private List<Book> book;
    public Order() {}

    public Order(int orderId, int userId, Date orderDate, String status, double total, String receiverName, String phone, String shippingAddress, String city) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.status = status;
        this.total = total;
        this.receiverName = receiverName;
        this.phone = phone;
        this.shippingAddress = shippingAddress;
        this.city = city;
    }
    // Getter & Setter
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public Date getOrderDate() { return orderDate; }
    public void setOrderDate(Date orderDate) { this.orderDate = orderDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getReceiverName() { return receiverName; }
    public void setReceiverName(String receiverName) { this.receiverName = receiverName; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getShippingAddress() { return shippingAddress; }
    public void setShippingAddress(String shippingAddress) { this.shippingAddress = shippingAddress; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    

    

    public List<Book> getBook() {
        return book;
    }

    public void setBook(List<Book> book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", orderDate=" + orderDate + ", status=" + status + ", total=" + total + ", receiverName=" + receiverName + ", phone=" + phone + ", shippingAddress=" + shippingAddress + ", city=" + city + ", book=" + book + '}';
    }

    
    

    
    
}
