/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import utils.DBConnection;

/**
 *
 * @author buith
 */
public class LoginDAO extends DBConnection{
    
    public boolean checkLogin(User user) {
        try {
            Statement state = this.conn.createStatement();
            String sql = "SELECT username, password FROM players WHERE username = '" + user.getUsername() +"'";
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                if (user.getUsername().equals(rs.getString("username")) && user.getPassword().equals(rs.getString("password"))) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
