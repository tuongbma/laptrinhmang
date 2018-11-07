/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.HomeDAO;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import websocket.UserSessionHandler;

/**
 *
 * @author buith
 */
public class HomeController extends Controller{
    
    public HomeController(){
        super();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!this.existUser(req)){
            resp.sendRedirect("login");
        }else{
            //TODO
            HomeDAO homeDAO = new HomeDAO();
            ArrayList<User> listUser = new ArrayList<>();
            listUser = homeDAO.getListUser();
            String[] onlineUser = UserSessionHandler.getOnlineUser();
            for(User user: listUser){
                user.setStatus(0);
                for(String username: onlineUser){
                    if(user.getUsername().equals(username)){
                        user.setStatus(1);
                        break;
                    }
                }
            }
            Map<Integer,String> winningRateMap = new HashMap<>();
            for (User u : listUser){
                winningRateMap.put(u.getID(), homeDAO.getWinningRate(u.getID()));
            }
            req.setAttribute("winningRateMap", winningRateMap);
            req.setAttribute("listUser", listUser);
            req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
        } 
    }
    
}
