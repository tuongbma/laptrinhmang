/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.HomeDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Match;
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
            User userSession =(User) req.getSession().getAttribute("user");
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
            ArrayList<Match> listHistory = homeDAO.getMatchHistoryList(userSession.getID());
            req.setAttribute("listUser", listUser);
            req.setAttribute("listHistory", listHistory);
            req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
        } 
    }
    
}
