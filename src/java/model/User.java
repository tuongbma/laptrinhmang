/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author buith
 */
public class User {

    private int ID;
    private String name;
    private String email;
    private String username;
    private String password;
    private int status;
    private String image;
    private float score;
    private float winningRate;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int ID, String name, String email, String username, String password, String image, float score, float winningRate) {
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.username = username;
        this.password = password;
        this.image = image;
        this.score = score;
        this.winningRate = winningRate;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public float getWinningRate() {
        return winningRate;
    }

    public void setWinningRate(float winningRate) {
        this.winningRate = winningRate;
    }
    
    
}
