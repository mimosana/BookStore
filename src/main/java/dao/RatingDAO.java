/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Rating;
import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class RatingDAO {

    public List<Rating> ratingByBooks(int bookvarId) {
        List<Rating> list=new ArrayList<>();
        String sql = "select r.id,r.rating,r.createAt,r.comment,r.userId,u.userName\n"
                + "from Rating r join Users u on r.userId=u.id\n"
                + "where comment is not null and r.bookVarId=?";
        try(Connection conn=DBUtils.getConnection();
                PreparedStatement ps=conn.prepareStatement(sql);){
                ps.setInt(1, bookvarId);
                try(ResultSet rs=ps.executeQuery();){
                while(rs.next()){
                    Rating rate=new Rating(rs.getInt("id"), bookvarId, rs.getInt("rating"), rs.getString("comment"),  rs.getTimestamp("createAt"));
                    User user=new User();
                    user.setUserId(rs.getInt("userId"));
                    user.setUserName(rs.getString("userName"));
                    rate.setUser(user);
                    list.add(rate);
                }
                return list;
                }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("Database driver not found");
            return new ArrayList<>();
        } catch (SQLException ex) {
            Logger.getLogger(RatingDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.err.println("SQL error while fetching ratings for bookVarId: "+bookvarId);
            return new ArrayList<>();
        }
    }

    public static void main(String[] args) {
    }
}
