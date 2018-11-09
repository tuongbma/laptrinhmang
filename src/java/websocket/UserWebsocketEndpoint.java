/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.json.JSONObject;

@ServerEndpoint(value = "/websocket_home")
public class UserWebsocketEndpoint {


    @OnOpen
    public void onOpen(Session session) {
        Map<String, List<String>> params = session.getRequestParameterMap();
        if (params.get("username") != null) {
            System.out.println(params.toString());
            String username = params.get("username").get(0);
            System.out.println("onOpen:: " + username);

            UserSessionHandler.addSession(session, username);
            System.out.println("Number of session = " + UserSessionHandler.getNoSession());
        } else {
            System.out.println("Conection was created without username!!");
        }

    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose:: " + session.getId());
        UserSessionHandler.remove(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("onMessage::From=" + session.getId() + " Message=" + message);
        JSONObject jsonObject = new JSONObject(message);
        String type = jsonObject.getString("type");
        System.out.println("type = " + type);
        if (type.equals("challenge")){
            String toUser = jsonObject.getString("toUser");
            UserSessionHandler.challenge(session, toUser);
        }
        else if (type.equals("confirm")){
            String confirmResult = jsonObject.getString("confirmResult");
            String toUser = jsonObject.getString("toUser");
            
            UserSessionHandler.confirm(session, confirmResult, toUser);
        }

    }

    @OnError
    public void onError(Throwable t) {
        System.out.println("onError::" + t.getMessage());
    }
}
