/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Author {
    private int authorId;
    private String name;

    public Author() {
    }

    public Author(String name) {
        this.name = name;
    }

    public Author(int authorId, String name) {
        this.authorId = authorId;
        this.name = name;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "AuthorDTO{" + "authorId=" + authorId + ", name=" + name + '}';
    }
    
    
    
}
