/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Rating {
    private int id;
    private User user;
    private int bookVarId;
    private int rating;
    private String comment;
    private Timestamp createAt;

    public Rating() {
    }

    public Rating(int id, int bookVarId, int rating, String comment, Timestamp createAt) {
        this.id = id;
        this.bookVarId = bookVarId;
        this.rating = rating;
        this.comment = comment;
        this.createAt = createAt;
    }

    
    public Rating(int id, User user, int bookVarId, int rating, String comment, Timestamp createAt) {
        this.id = id;
        this.user = user;
        this.bookVarId = bookVarId;
        this.rating = rating;
        this.comment = comment;
        this.createAt = createAt;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    

    public int getBookVarId() {
        return bookVarId;
    }

    public void setBookVarId(int bookVarId) {
        this.bookVarId = bookVarId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "RatingDTO{" + "id=" + id + ", user=" + user + ", bookVarId=" + bookVarId + ", rating=" + rating + ", comment=" + comment + ", createAt=" + createAt + '}';
    }

    
    
    
}
