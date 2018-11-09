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
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Match;
import model.User;
import utils.DBConnection;


/**
 *
 * @author BMA GALAXY
 */
public class HomeDAO extends DBConnection {
    
    public class CustomComparator implements Comparator<User> {
    @Override
    public int compare(User u1, User u2) {
        if (u2.getScore() - u1.getScore() != 0){
            return u2.getScore() - u1.getScore();
        }
        else{
            if(u2.getWinningRate() - u1.getWinningRate() > 0) return 1;
            else if(u2.getWinningRate() - u1.getWinningRate() == 0) return 0;
            return -1;
        }
    }
}
    
    public ArrayList<User> getListUser() {
        Statement state;
        ArrayList<User> listUser = new ArrayList<>();
        try {
            state = this.conn.createStatement();
            String sql = "SELECT * FROM players WHERE username <> 'admin' ";
            ResultSet resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                listUser.add(new User(resultSet.getInt("ID"),resultSet.getString("name"),resultSet.getString("email") , resultSet.getString("username"), resultSet.getString("password"),
                                resultSet.getString("image"), this.getPoint(resultSet.getInt("ID")), this.getWinningRate(resultSet.getInt("ID")))); 
            }
            Collections.sort(listUser, new CustomComparator());
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listUser;
    }
    
    public float getWinningRate(int ID){
        Statement state;
        try {
            int winMatches = 0, sumMatches = 0, loseMatches = 0;
            state = this.conn.createStatement();
            String sql = "SELECT COUNT(*) AS winMatches FROM matches WHERE result =" + ID; // get no of matches this player won
            ResultSet resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                winMatches = resultSet.getInt("winMatches");
            }
            
            sql = "SELECT COUNT(*) AS sumMatches FROM `matches` WHERE ID_player1 =" + ID +" OR ID_player2 = " + ID; // get no of matches this player played
            resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                sumMatches = resultSet.getInt("sumMatches");
            }
            if(sumMatches != 0){
                float temp = (float) winMatches/sumMatches;
                DecimalFormat decimalFormat = new DecimalFormat("#.00");
                if (temp == 0) return 0;
                String result = decimalFormat.format(temp*100);
                float res = Float.parseFloat(result);
                return res;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int getPoint(int ID){
        Statement state;
        int winMatches = 0, drawMatches = 0, loseMatches = 0, point = 0; // a win match gets 3 points, a draws match get 1 point, and 0 point for a lose match
        try {
            state = this.conn.createStatement();
            String sql = "SELECT COUNT(*) AS winMatches FROM matches WHERE result =" + ID; // get no of matches this player won
            ResultSet resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                winMatches = resultSet.getInt("winMatches");
            }
            
            sql = "SELECT COUNT(*) AS loseMatches FROM `matches` WHERE (ID_player1 =" + ID +" OR ID_player2 = " + ID + ") AND result <> " + ID; // get no of matches this player won
            resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                loseMatches = resultSet.getInt("loseMatches");
            }
            
            sql = "SELECT COUNT(*) AS drawMatches FROM `matches` WHERE (ID_player1 =" + ID +" OR ID_player2 = " + ID + ") AND result = 0"; // get no of matches this player won
            resultSet = state.executeQuery(sql);
            while(resultSet.next()){
                loseMatches = resultSet.getInt("drawMatches");
            }
            point = winMatches*3 + drawMatches;
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return point;
    }
    
    public ArrayList<Match> getMatchHistoryList(int ID) {
        Statement state;
        try {
            state = this.conn.createStatement();
            String sql = " SELECT matches.*, AB.username1, AB.username2 "
                        + " FROM matches, "
                    +  "( " 
                        + " SELECT A.id, A.username AS username1, B.username AS username2 "
                        + " FROM "  
                        +   " ( " 
                        +       "  SELECT matches.id, players.username " 
                        +      "  FROM matches, players " 
                        +       "  WHERE players.ID = matches.ID_player1 " 
                        +   " ) A, " 
                        +   " ( " 
                        +       "  SELECT matches.id, players.username " 
                        +      "  FROM  matches, players " 
                        +       "  WHERE players.ID = matches.ID_player2 " 
                        +   " ) B " 
                        +       "  WHERE A.id = B.id " 
                    + " ) AS AB  " 
                    + " WHERE " 
                    + " AB.id = matches.id and (matches.ID_player1 = " + ID +" OR matches.ID_player2 = " + ID +" )";
            ResultSet resultSet = state.executeQuery(sql);
            ArrayList<Match> historyMatchList = new ArrayList<>();
            while(resultSet.next()) {
                Match match = new Match();
                match.setUsernamePlayer1(resultSet.getString("username1"));
                match.setUsernamePlayer2(resultSet.getString("username2"));
                match.setEndTime(resultSet.getString("end_time"));
                match.setStartTime(resultSet.getString("start_time"));
                match.setResult(resultSet.getLong("result"));
                historyMatchList.add(match);
            }
            return historyMatchList;
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
