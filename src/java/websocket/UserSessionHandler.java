/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.Session;
import model.User;
import org.json.JSONObject;

public class UserSessionHandler {
    public static Map<Session, String> mapSession = new HashMap<>();
    
    public static void addSession(Session session, String username) {
        mapSession.put(session, username);
    }
    
    public static int getNoSession(){
        return mapSession.size();
    }
    
    public static String[] getOnlineUser(){
        String[] list = new String[getNoSession()+1];
        int i = 0;
        for(Session s: mapSession.keySet()){
            list[i] = mapSession.get(s);
            i += 1;
        }
        return list;
    }
    

    public static void remove(Session session) {
        mapSession.remove(session);
    }
    
    public static Session getSessionByUsername(String userName){
        for(Session s: mapSession.keySet()){
           String temp = mapSession.get(s);
           if (temp.equals(userName)){
               return s;
           }
        }
        return null;
    }
    
    public static void challenge(Session fromSession, String toUser){
        Session toUserSession = getSessionByUsername(toUser);
        if (toUserSession != null){
            try {
                JSONObject JSONrespone = new JSONObject();
                JSONrespone.put("fromUser", mapSession.get(fromSession));
                JSONrespone.put("type", "challenge");
                toUserSession.getBasicRemote().sendText(JSONrespone.toString());
            } catch (IOException ex) {
                Logger.getLogger(UserSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public static void confirm(Session fromSession, String confirmResult, String toUser){
        Session toUserSession = getSessionByUsername(toUser);
        if (toUserSession != null){
            try {
                JSONObject JSONrespone = new JSONObject();
                JSONrespone.put("fromUser", mapSession.get(fromSession));
                JSONrespone.put("type", "confirm");
                JSONrespone.put("confirmResult", confirmResult);
                toUserSession.getBasicRemote().sendText(JSONrespone.toString());
            } catch (IOException ex) {
                Logger.getLogger(UserSessionHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
}