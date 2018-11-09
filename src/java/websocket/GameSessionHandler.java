/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

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

    public static void update(Session fromSession, int currentValue, int maxValue) {
        try {
            String fromUser = mapSession.get(fromSession);
            JSONObject JSONrespone = new JSONObject();
            JSONrespone.put("type", "update");
            JSONrespone.put("currentValue", currentValue);
            Session toSession = getRivalSession(fromUser);
            toSession.getBasicRemote().sendText(JSONrespone.toString());
            if (currentValue == maxValue) {
                System.out.println("END GAMEEEEEEEEEE");
                JSONrespone.put("type", "result");
                // send to winner
                JSONrespone.put("isWin", "yes");
                fromSession.getBasicRemote().sendText(JSONrespone.toString());

                JSONrespone = new JSONObject();
                JSONrespone.put("type", "result");

                JSONrespone.put("isWin", "no");
                toSession.getBasicRemote().sendText(JSONrespone.toString());

            }
        } catch (IOException ex) {
            Logger.getLogger(GameSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
