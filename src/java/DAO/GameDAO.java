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
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBConnection;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

/**
 *
 * @author phantuan
 */
public class GameDAO extends DBConnection {

    public GameDAO() {

    }

    public int[][] createMap(String key, int size) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        for (int i = 1; i <= size * size; i++) {
            list.add(i);
        }
        int[][] map = new int[size][size];

        while (key.length() < size * size) {
            key += key;
        }
        for (int i = 0; i < size; i++) {
            String s = "";
            for (int j = 0; j < size; j++) {
                int c = (int) key.charAt(i * size + j);
                int index = c % list.size();
                map[i][j] = list.get(index);
                list.remove(index);
                s += "-" + map[i][j];
            }
            System.out.println(s);
        }

        return map;
    }
    
    public int getIDByUsername(String username){
        int ID = 0;
        try {
            Statement state = this.conn.createStatement();
            String sql = "SELECT * FROM players WHERE username = '" + username + "'";
            ResultSet resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                ID = resultSet.getInt("ID");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GameDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ID;
    }
    
    public void saveResult(String user1, String user2, String winUser, int timePlay) {
        try {
            Statement state = this.conn.createStatement();
            String sql;
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
            LocalDateTime endTime = LocalDateTime.now();
            LocalDateTime startTime = endTime.minus(timePlay,ChronoUnit.SECONDS);
            System.out.println(endTime);
            System.out.println(startTime);
            if (!winUser.equals("tie")) { // if there is a win player
                
                sql = "INSERT INTO `matches` (`ID`, `ID_player1`, `ID_player2`, `start_time`, `end_time`, `result`) VALUES (NULL, '" + this.getIDByUsername(user1) +"', "
                        + "'"+ this.getIDByUsername(user2) +"', '"+startTime+"', '"+endTime+"', '"+this.getIDByUsername(winUser)+"');";
                
                state.execute(sql);
            }
            else{ // if tie
                System.out.println("HOA ROI");
                sql = "INSERT INTO `matches` (`ID`, `ID_player1`, `ID_player2`, `start_time`, `end_time`, `result`) VALUES (NULL, '" + this.getIDByUsername(user1) +"', "
                        + "'"+ this.getIDByUsername(user2) +"', '" +startTime+ "', '" + endTime + "', '0');";
                System.out.println(sql);
                
                state.execute(sql);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GameDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
