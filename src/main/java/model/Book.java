/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;

/**
 *
 * @author Admin
 */
public class Book {
    private int bookId;
    private String name;
    private int publishYear;
    private String image;
    private String description;
    private String status;
    private List<BookVariants> variants;
    private Author author;
    private Publisher publisher;

    public Book() {
    }

    public Book(String name, int publishYear, String image, String description, String status) {
        this.name = name;
        this.publishYear = publishYear;
        this.image = image;
        this.description = description;
        this.status = status;
    }

    public Book(int bookId, String name, int publishYear, String image, String description, String status) {
        this.bookId = bookId;
        this.name = name;
        this.publishYear = publishYear;
        this.image = image;
        this.description = description;
        this.status = status;
    }

    public Book(int bookId, String name, int publishYear, String image, String description, String status, List<BookVariants> variants) {
        this.bookId = bookId;
        this.name = name;
        this.publishYear = publishYear;
        this.image = image;
        this.description = description;
        this.status = status;
        this.variants = variants;
    }

    public Book(int bookId, String name, int publishYear, String image, String description, String status, List<BookVariants> variants, Author authour, Publisher publisher) {
        this.bookId = bookId;
        this.name = name;
        this.publishYear = publishYear;
        this.image = image;
        this.description = description;
        this.status = status;
        this.variants = variants;
        this.author = authour;
        this.publisher = publisher;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author authour) {
        this.author = authour;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }
    
    

    public List<BookVariants> getVariants() {
        return variants;
    }

    public void setVariants(List<BookVariants> variants) {
        this.variants = variants;
    }
    
    

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BookDTO{" + "bookId=" + bookId + ", name=" + name + ", publishYear=" + publishYear + ", image=" + image + ", description=" + description + ", status=" + status + ", variants=" + variants + ", author=" + author + ", publisher=" + publisher + '}';
    }
    

    

    
    
}
