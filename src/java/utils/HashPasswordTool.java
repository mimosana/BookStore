/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.UserDAO;
import java.util.List;
import model.User;

/**
 *
 * @author luong
 */


import dao.UserDAO;
import model.User;

import java.util.List;

public class HashPasswordTool {

    public static void main(String[] args) {

        UserDAO dao = new UserDAO();


        List<User> users = dao.getAllUser();
        if (users == null || users.isEmpty()) {
            System.out.println("Không có user nào trong DB!");
            return;
        }

        System.out.println("Found " + users.size() + " users. Starting hash...");

    
        int count = 0;
        for (User u : users) {
            String plain = u.getPassword();

            if (plain == null || plain.isEmpty()) {
                System.out.println("Skipping user " + u.getUsername() + " - password null");
                continue; 
            }

       
            String hashed = PasswordUtil.hashPassword(plain);

       
            boolean success = dao.updatePassword(u.getUserId(), hashed);
            if (success) {
                System.out.println("Updated user: " + u.getUsername());
                count++;
            } else {
                System.out.println("Failed to update user: " + u.getUsername());
            }
        }

        System.out.println("DONE! Total hashed users: " + count);
    }
}
