/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import utils.DBConnection;

/**
 *
 * @author phantuan
 */
public class Controller extends HttpServlet{
//    public DBConnection db; 
    public Controller(){
//        this.db = new DBConnection();
    }
    
    public boolean existUser(HttpServletRequest req){
        if(req.getSession().getAttribute("user") == null){
            return false;
        }
        return true;
    }
}
