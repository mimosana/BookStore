/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.math.BigDecimal;

/**
 *
 * @author Admin
 */
public class BookVariants {
    private int bookVarId;
    private String edition;
    private String language;
    private int bookId;
    private BigDecimal price;
    private int stock;
    private Book book;

    public BookVariants() {
    }

    public BookVariants(String edition, String language, int bookId, BigDecimal price, int stock) {
        this.edition = edition;
        this.language = language;
        this.bookId = bookId;
        this.price = price;
        this.stock = stock;
    }

    public BookVariants(int bookVarId, String edition, String language, int bookId, BigDecimal price, int stock) {
        this.bookVarId = bookVarId;
        this.edition = edition;
        this.language = language;
        this.bookId = bookId;
        this.price = price;
        this.stock = stock;
    }

    public BookVariants(int bookVarId, String edition, String language, int bookId, BigDecimal price, int stock, Book book) {
        this.bookVarId = bookVarId;
        this.edition = edition;
        this.language = language;
        this.bookId = bookId;
        this.price = price;
        this.stock = stock;
        this.book = book;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
    

    public int getBookVarId() {
        return bookVarId;
    }

    public void setBookVarId(int bookVarId) {
        this.bookVarId = bookVarId;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "BookVariantsDTO{" + "bookVarId=" + bookVarId + ", edition=" + edition + ", language=" + language + ", bookId=" + bookId + ", price=" + price + ", stock=" + stock + ", book=" + book + '}';
    }
    
    
    
}
