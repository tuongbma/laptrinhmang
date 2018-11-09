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
public class Match {
    private String usernamePlayer1;
    private String usernamePlayer2;
    private String startTime;
    private String endTime;
    private Long result;

    public String getUsernamePlayer1() {
        return usernamePlayer1;
    }

    public void setUsernamePlayer1(String usernamePlayer1) {
        this.usernamePlayer1 = usernamePlayer1;
    }

    public String getUsernamePlayer2() {
        return usernamePlayer2;
    }

    public void setUsernamePlayer2(String usernamePlayer2) {
        this.usernamePlayer2 = usernamePlayer2;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Long getResult() {
        return result;
    }

    public void setResult(Long result) {
        this.result = result;
    }
    
    
}
