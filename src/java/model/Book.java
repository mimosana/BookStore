/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author luong
 */
public class Book {
    private int bookId;
    private String title;
    private String author;
    private String description;
    private String image;
    private int categoryId;
    
    private List<BookVariant> listVariant;

    public Book() {}

    public Book(int bookId, String title, String author, String description, String image, int categoryId,List<BookVariant> listVariant) {
        this.bookId = bookId;
        this.title = title;
        this.author = author;
        this.description = description;
        this.image = image;
        this.categoryId = categoryId;
        this.listVariant = listVariant;
    }

    public List<BookVariant> getListVariant() {
        return listVariant;
    }

    public void setListVariant(List<BookVariant> listVariant) {
        this.listVariant = listVariant;
    }

    
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Book{" + "bookId=" + bookId + ", title=" + title + ", author=" + author + ", description=" + description + ", image=" + image + ", categoryId=" + categoryId + ", listVariant=" + listVariant + '}';
    }
    
    
    
    
}
