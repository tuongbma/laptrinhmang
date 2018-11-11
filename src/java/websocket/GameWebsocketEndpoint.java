/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websocket;

import java.util.List;
import java.util.Map;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import org.json.JSONObject;

/**
 *
 * @author phantuan
 */
@ServerEndpoint(value = "/websocket_game")
public class GameWebsocketEndpoint {
    
    @OnOpen
    public void onOpen(Session session) {
        Map<String, List<String>> params = session.getRequestParameterMap();
        if (params.get("username") != null) {
            String username = params.get("username").get(0);
            System.out.println("onOpen game:: " + username);
            GameSessionHandler.addSession(session, username);
        } else {
            System.out.println("Conection was created without username!!");
        }

    }

    @OnClose
    public void onClose(Session session) {
        System.out.println("onClose:: " + session.getId());
        GameSessionHandler.remove(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("onMessage::From=" + session.getId() + " Message=" + message);
        JSONObject jsonObject = new JSONObject(message);
        String type = jsonObject.getString("type");
        if (type.equals("update")) {
            int currentValue = jsonObject.getInt("currentValue");
            int maxValue = jsonObject.getInt("maxValue");            
            int timePlay = jsonObject.getInt("time_play");
            GameSessionHandler.updateGame(session, currentValue, maxValue, timePlay);
        }else if(type.equals("timeup")){
            int timeMax = jsonObject.getInt("time_max");
            GameSessionHandler.tieGame(session, timeMax);
        }else if(type.equals("replay")){
            String result = jsonObject.getString("result");
            GameSessionHandler.replay(session, result);
        }
    }

    @OnError
    public void onError(Throwable t) {
        System.out.println("onError::" + t.getMessage());
    }
}
