package utils;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;


public class DBConnection {
    public Connection conn = null;
    public DBConnection(){
        this.createConnection();
        if(this.conn == null){
            System.out.println("NULLLLLLLLLLLLLLLLL");
        }
    }
    public void createConnection() {
        
        String url = "jdbc:mysql://localhost:3306/laptrinhmang"; //MySQL URL and followed by the database name
        String username = "root"; //MySQL username
        String password = "root"; //MySQL password

        try {
            try {
                Class.forName("com.mysql.jdbc.Driver"); //loading mysql driver 
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            this.conn = (Connection) DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
            System.out.println("Printing connection object " + conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}