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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Match;
import model.User;
import utils.CommonUtils;
import utils.DBConnection;

/**
 *
 * @author BMA GALAXY
 */
public class HomeDAO extends DBConnection {

    public class CustomComparator implements Comparator<User> {

        @Override
        public int compare(User u1, User u2) {
            if (u2.getScore() - u1.getScore() != 0) {
                if (u2.getScore() - u1.getScore() > 0) {
                    return 1;
                } else if (u2.getScore() - u1.getScore() == 0) {
                    return 0;
                }
                return -1;
            } else {
                if (u2.getWinningRate() - u1.getWinningRate() > 0) {
                    return 1;
                } else if (u2.getWinningRate() - u1.getWinningRate() == 0) {
                    return 0;
                }
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
            while (resultSet.next()) {
                listUser.add(new User(resultSet.getInt("ID"), resultSet.getString("name"), resultSet.getString("email"), resultSet.getString("username"), resultSet.getString("password"),
                        resultSet.getString("image"), this.getPoint(resultSet.getInt("ID")), this.getWinningRate(resultSet.getInt("ID"))));
            }
            Collections.sort(listUser, new CustomComparator());
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return listUser;
    }

    public float getWinningRate(int ID) {
        Statement state;
        try {
            int winMatches = 0, sumMatches = 0, loseMatches = 0;
            state = this.conn.createStatement();
            String sql = "SELECT COUNT(*) AS winMatches FROM matches WHERE result =" + ID; // get no of matches this player won
            ResultSet resultSet = state.executeQuery(sql);
            while (resultSet.next()) {
                winMatches = resultSet.getInt("winMatches");
            }

            sql = "SELECT COUNT(*) AS sumMatches FROM `matches` WHERE ID_player1 =" + ID + " OR ID_player2 = " + ID; // get no of matches this player played
            resultSet = state.executeQuery(sql);
            while (resultSet.next()) {
                sumMatches = resultSet.getInt("sumMatches");
            }
            if (sumMatches != 0) {
                float temp = (float) winMatches / sumMatches;
                DecimalFormat decimalFormat = new DecimalFormat("#.0");
                if (temp == 0) {
                    return 0;
                }
                String result = decimalFormat.format(temp * 100);
                float res = Float.parseFloat(result);
                return res;
            }

        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public float getPoint(int ID) {
        Statement state;
        int winMatches = 0, drawMatches = 0, loseMatches = 0; // a win match gets 1.5 points, a draws match get 0.5 point, and 0 point for a lose match
        float point = 0.f;
        try {
            state = this.conn.createStatement();
            String sql = "SELECT COUNT(*) AS winMatches FROM matches WHERE result =" + ID; // get no of matches this player won
            ResultSet resultSet = state.executeQuery(sql);
            while (resultSet.next()) {
                winMatches = resultSet.getInt("winMatches");
            }

            sql = "SELECT COUNT(*) AS loseMatches FROM `matches` WHERE (ID_player1 =" + ID + " OR ID_player2 = " + ID + ") AND result <> " + ID; // get no of matches this player won
            resultSet = state.executeQuery(sql);
            while (resultSet.next()) {
                loseMatches = resultSet.getInt("loseMatches");
            }

            sql = "SELECT COUNT(*) AS drawMatches FROM `matches` WHERE (ID_player1 =" + ID + " OR ID_player2 = " + ID + ") AND result = 0"; // get no of matches this player won
            resultSet = state.executeQuery(sql);
            while (resultSet.next()) {
                loseMatches = resultSet.getInt("drawMatches");
            }
            float temp = (float) (winMatches * 1.5 + drawMatches * 0.5);
            DecimalFormat decimalFormat = new DecimalFormat("#.00");
            String result = decimalFormat.format(temp);
            point = Float.parseFloat(result);
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return point;
    }

    public ArrayList<Match> getMatchHistoryList(int ID) {
        Statement state;
        String now = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
        try {
            state = this.conn.createStatement();
            String sql = "  SELECT mat.ID AS matchId, "
                            + " CASE p1.id "
                                + " WHEN "+ ID +" THEN p2.username "
                                + " ELSE p1.username  "
                            + " END AS rivalName, "
                            + " TIME_TO_SEC(TIMEDIFF(NOW(), mat.end_time)) AS endTime, "
                            + " CASE mat.result " 
                            + " WHEN "+ ID +" THEN 'WIN' "
                            + " WHEN 0 THEN 'TIE' "
                            + " ELSE 'LOSE' "
                            + " END as result "
                        + " FROM matches mat"
                        + " INNER JOIN players p1 ON mat.ID_player1 = p1.id"
                        + " INNER JOIN players p2 ON mat.ID_player2 = p2.id  "
                        + " WHERE mat.ID_player1= "+ ID +" OR mat.ID_player2 = "+ ID
                        + " ORDER BY mat.end_time DESC ";
            ResultSet rs = state.executeQuery(sql);
            ArrayList<Match> historyMatchList = new ArrayList<>();
            while(rs.next()) {
                Match match = new Match();
                match.setRivalName(rs.getString("rivalName"));
                String time = CommonUtils.convertTime(rs.getLong("endTime") );
                match.setTime(time);
                match.setResult(rs.getString("result"));
                historyMatchList.add(match);
            }
            return historyMatchList;
        } catch (SQLException ex) {
            Logger.getLogger(HomeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}