/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import DAO.GameDAO;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.Session;
import org.json.JSONObject;
import static websocket.UserSessionHandler.mapSession;

/**
 *
 * @author phantuan
 */
public class GameSessionHandler {

    public static Map<Session, String> mapSession = new HashMap<>();
    public static GameDAO gameDAO = new GameDAO();

    public static void addSession(Session session, String username) {
        mapSession.put(session, username);
    }

    public static void remove(Session session) {
        mapSession.remove(session);
    }

    public static Session getSessionByUsername(String userName) {
        for (Session s : mapSession.keySet()) {
            String temp = mapSession.get(s);
            if (temp.equals(userName)) {
                return s;
            }
        }
        return null;
    }

    public static Session getRivalSession(String fromUsername) {
        String key = UserSessionHandler.getKey(fromUsername);
        for (Session s : mapSession.keySet()) {
            String other = mapSession.get(s);
            if (!other.equals(fromUsername) && UserSessionHandler.getKey(other).equals(key)) {
                return s;
            }
        }
        return null;
    }

    public static void updateGame(Session fromSession, int currentValue, int maxValue, int timePlay) {
        try {
            String fromUser = mapSession.get(fromSession);
            JSONObject JSONrespone = new JSONObject();
            JSONrespone.put("type", "update");
            JSONrespone.put("currentValue", currentValue);
            Session toSession = getRivalSession(fromUser);
            String toUser = mapSession.get(toSession);
            toSession.getBasicRemote().sendText(JSONrespone.toString());
            if (currentValue == maxValue) {
                System.out.println("END GAMEEEEEEEEEE");
                JSONrespone.put("type", "result");
                // send to winner
                JSONrespone.put("result", "win");
                fromSession.getBasicRemote().sendText(JSONrespone.toString());

                JSONrespone = new JSONObject();
                JSONrespone.put("type", "result");

                JSONrespone.put("result", "lose");
                toSession.getBasicRemote().sendText(JSONrespone.toString());
                
                UserSessionHandler.expiredKey(fromUser);
                UserSessionHandler.expiredKey(toUser);
                
                gameDAO.saveResult(fromUser, toUser, fromUser, timePlay);
            }
        } catch (IOException ex) {
            Logger.getLogger(GameSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void tieGame(Session fromSession, int timeMax) {

        String fromUser = mapSession.get(fromSession);
        Session toSession = getRivalSession(fromUser);
        String toUser = mapSession.get(toSession);
        if (UserSessionHandler.getKey(toUser).charAt(0) != '-') {
            JSONObject JSONrespone = new JSONObject();
            JSONrespone.put("type", "result");

            JSONrespone.put("result", "tie");
            try {
                toSession.getBasicRemote().sendText(JSONrespone.toString());
                fromSession.getBasicRemote().sendText(JSONrespone.toString());
                UserSessionHandler.expiredKey(fromUser);
                UserSessionHandler.expiredKey(toUser);
                gameDAO.saveResult(fromUser, toUser, "tie", timeMax);

            } catch (IOException ex) {
                Logger.getLogger(GameSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public static void refusePlay(Session session, String isAlert){
        try {
            System.out.println("refused with alert: " + isAlert);
            JSONObject JSONrespone = new JSONObject();
            JSONrespone.put("type", "refusePlay");
            JSONrespone.put("isAlert", isAlert);
            session.getBasicRemote().sendText(JSONrespone.toString());
        } catch (IOException ex) {
            System.out.println("refused exception!!!!!!!!!!!!!!!!!!");
            Logger.getLogger(GameSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void replay(Session fromSession, String result) {
        String fromUser = mapSession.get(fromSession);
        Session toSession = getRivalSession(fromUser);
        String toUser = mapSession.get(toSession);
        if (result.equals("no")) {
            System.out.println("refused");
            refusePlay(toSession, "yes");            
            refusePlay(fromSession, "no");

        } else {
            if (UserSessionHandler.getKey(fromUser).charAt(0) == '-') {
                //first 'yes' confirm
                System.out.println("---------First 'yes'");
                UserSessionHandler.generateMatchKey(fromUser, toUser);
            } else {
                System.out.println("----Second 'yes'");
                try {
                    //second 'yes' confirm -> start new game
                    String key = UserSessionHandler.getKey(toUser);
                    JSONObject JSONrespone = new JSONObject();
                    JSONrespone.put("type", "replay");
                    JSONrespone.put("key", key);
                    fromSession.getBasicRemote().sendText(JSONrespone.toString());
                    toSession.getBasicRemote().sendText(JSONrespone.toString());

                } catch (IOException ex) {
                    Logger.getLogger(GameSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

}
