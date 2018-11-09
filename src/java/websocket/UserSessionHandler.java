/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.Session;
import model.User;
import org.json.JSONObject;

public class UserSessionHandler {

    public static Map<Session, String> mapSession = new HashMap<>();
    public static Map<String, String> matchKey = new HashMap<>();

    public static void addSession(Session session, String username) {
        toggleStatus(username);
        mapSession.put(session, username);
    }

    public static int getNoSession() {
        return mapSession.size();
    }

    public static String[] getOnlineUser() {
        String[] list = new String[getNoSession() + 1];
        int i = 0;
        for (Session s : mapSession.keySet()) {
            list[i] = mapSession.get(s);
            i += 1;
        }
        return list;
    }

    public static void remove(Session session) {
        String username = mapSession.get(session);
        mapSession.remove(session);
        toggleStatus(username);
    }

    public static void toggleStatus(String username) {
        JSONObject JSONrespone = new JSONObject();
        JSONrespone.put("toggleUser", username);
        JSONrespone.put("type", "toggleStatus");
        for (Session sess : mapSession.keySet()) {
            try {
                sess.getBasicRemote().sendText(JSONrespone.toString());
            } catch (IOException ex) {
                Logger.getLogger(UserSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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

    public static void challenge(Session fromSession, String toUser) {
        Session toUserSession = getSessionByUsername(toUser);
        if (toUserSession != null) {
            try {
                String fromUser = mapSession.get(fromSession);
                JSONObject JSONrespone = new JSONObject();
                JSONrespone.put("fromUser", fromUser);
                JSONrespone.put("type", "challenge");
                String key = generateMatchKey(10);
                JSONrespone.put("key", key);
                matchKey.put(fromUser, key);

                toUserSession.getBasicRemote().sendText(JSONrespone.toString());

            } catch (IOException ex) {
                Logger.getLogger(UserSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public static void confirm(Session fromSession, String confirmResult, String toUser) {
        Session toUserSession = getSessionByUsername(toUser);
        if (toUserSession != null) {
            try {
                String fromUser = mapSession.get(fromSession);
                JSONObject JSONrespone = new JSONObject();
                JSONrespone.put("fromUser", fromUser);
                JSONrespone.put("type", "confirm");
                JSONrespone.put("confirmResult", confirmResult);
                if (confirmResult.equals("yes")) {
                    System.out.println("confirm yesssssssssssssssssssssssssss");
                    String key = matchKey.get(toUser);
                    matchKey.put(fromUser, key);
                    JSONrespone.put("key", key);
                }
                toUserSession.getBasicRemote().sendText(JSONrespone.toString());
            } catch (IOException ex) {
                Logger.getLogger(UserSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public static String generateMatchKey(int len) {
        if (len < 10) {
            len = 10;
        }
        String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rnd = new SecureRandom();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        System.out.println("gen key --- " + sb.toString());
        return sb.toString();
    }

    public static void generateMatchKey(String user1, String user2) {
        String key = generateMatchKey(10);
        matchKey.put(user1, key);
        matchKey.put(user2, key);
    }

    public static boolean isValidMatch(String username, String key) {
        int cnt = 0;
        if (matchKey.get(username) != null && matchKey.get(username).equals(key)) {
            for (String u : matchKey.keySet()) {
                if (matchKey.get(u).equals(key)) {
                    cnt += 1;
                }
            }
        }
        if (cnt == 2) {
            return true;
        }
        return false;
    }

    public static String getKey(String username) {
        return matchKey.get(username);
    }

    public static void removeKey(String user) {
        matchKey.remove(user);
    }

    public static void expiredKey(String user) {
        String key = matchKey.get(user);
        System.out.println("before expired :" + key);
        matchKey.put(user, "-" + key);
                System.out.println("after expired:" + matchKey.get(user));

    }

}
