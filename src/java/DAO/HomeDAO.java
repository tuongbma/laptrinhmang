/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                listUser.add(new User(resultSet.getInt("ID"),resultSet.getString("name"),resultSet.getString("email") , resultSet.getString("username"), resultSet.getString("password")));
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listUser;
    }
    
}
