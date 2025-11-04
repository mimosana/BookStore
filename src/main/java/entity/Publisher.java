/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Publisher {
    private int publisherId;
    private String name;

    public Publisher() {
    }

    public Publisher(int publisherId, String name) {
        this.publisherId = publisherId;
        this.name = name;
    }

    public Publisher(String name) {
        this.name = name;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "PublisherDTO{" + "publisherId=" + publisherId + ", name=" + name + '}';
    }
    
    
    
}
