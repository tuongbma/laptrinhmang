/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.GameDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author phantuan
 */
public class GameController extends Controller{
    public GameController(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(!this.existUser(req)){
            resp.sendRedirect("login");
        }else{
            GameDAO gameDAO = new GameDAO();
            int map[][] = gameDAO.createMap(5);
            req.setAttribute("map", map);
            req.getRequestDispatcher("WEB-INF/game.jsp").forward(req, resp);
        }
    }
    
    
}
