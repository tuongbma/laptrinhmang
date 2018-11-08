/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import utils.DBConnection;


/**
 *
 * @author BMA GALAXY
 */
public class HomeDAO extends DBConnection {

    public ArrayList<User> getListUser() {
        Statement state;
        ArrayList<User> listUser = new ArrayList<>();
        try {
            state = this.conn.createStatement();
            String sql = "SELECT * FROM players WHERE username <> 'admin'";
            ResultSet resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                listUser.add(new User(resultSet.getInt("ID"),resultSet.getString("name"),resultSet.getString("email") , resultSet.getString("username"), resultSet.getString("password"),
                                resultSet.getString("image")));
                System.out.println("image: " + resultSet.getString("image"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listUser;
    }
    
    public String getWinningRate(int ID){
        Statement state;
        try {
            int winMatches = 0, sumMatches = 0;
            state = this.conn.createStatement();
            String sql = "SELECT COUNT(*) AS winMatches FROM matches WHERE result =" + ID;
            ResultSet resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                winMatches = resultSet.getInt("winMatches");
            }
            sql = "SELECT COUNT(*) AS sumMatches FROM `matches` WHERE ID_player1 =" + ID +" OR ID_player2 = " + ID;
            resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                sumMatches = resultSet.getInt("sumMatches");
            }
            if(sumMatches != 0){
                float temp = (float) winMatches/sumMatches;
                DecimalFormat decimalFormat = new DecimalFormat("#.00");
                if (temp == 0) return "0";
                String result = decimalFormat.format(temp*100);
                return result;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "0";
    }
    
    
    
}
