/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import DAO.LoginDAO;
import model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnOpen;

/**
 *
 * @author buith
 */
public class LoginController extends Controller {
    public LoginController() {
        super();
    }

    @Override
    @OnOpen
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (this.existUser(request)) {
            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        LoginDAO loginDAO = new LoginDAO();
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(userName, password);
        
        
        if(loginDAO.checkLogin(user)){
            request.getSession().setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            request.setAttribute("errMessage", "Invalid username/password!");
            request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);//forwarding the request
        }
    }
}
