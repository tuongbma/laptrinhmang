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
//                if(user.getUsername().equals(((User) req.getSession().getAttribute("user")).getUsername())){
//                    listUser.remove(user);
//                    continue;
//                }
                
                for(String username: onlineUser){
                    if(user.getUsername().equals(username)){
                        user.setStatus(1);
                        break;
                    }
                }
            }
                    
            req.setAttribute("listUser", listUser);
            req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
        } 
    }
    
}
