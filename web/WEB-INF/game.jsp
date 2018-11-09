<%@page import="java.util.Map"%>
<%@page import="DAO.HomeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Spring Login Example</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <style>
            
            .popup {
                width: 33.333333%;
                padding: 15px;
                left: 0;
                margin-left: 33.333333%;
                border: 1px solid #ccc;
                border-radius: 10px;
                background: white;
                position: absolute;
                top: 15%;
                box-shadow: 5px 5px 5px #000;
                z-index: 10001;
                text-align: center;
                font-size: 20px; 

            }

            .overlay {
                display: none;
                position: fixed;
                width: 100%;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0,0,0,.85);
                z-index: 10000;
            }


        
            .map {
                width: 500px;
                height: 600px;
                margin: 50px auto;
            }
            .row{
                width: 100%;
            }
            .row > div{
                cursor: pointer;
                float:left;
                width: 20%;
                padding: 25px;
                border: 1px solid gray;
                margin: 5px;
                text-align: center;
                font-size: 20px;
                font-weight: bold; 
                position: relative;
            }
            .row > div > div {
                display: block;
                background: lightgray;
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
            .current-status {
                width: 50%;
                margin: 20px auto;
            }
            .clock {
                margin: 70px auto 20px;
                font-size: 35px;
                text-align: center;
            }
        </style>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    </head>
    
    <body class="w3-theme-l5">
        <!-- Navbar -->
        <% User user = (User) request.getSession().getAttribute("user"); %>
        <div class="w3-top">
            <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                <a href="home" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a>
                <a href="ranking" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Ranking"><i class="fa fa-trophy"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Account Settings"><i class="fa fa-user"></i></a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Messages"><i class="fa fa-envelope"></i></a>

                <div class="w3-dropdown-hover w3-hide-small">
                    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
                    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
                        <a href="#" class="w3-bar-item w3-button">One new friend request</a>
                        <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
                        <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
                    </div>
                </div>
                <div style="float: right">
                    <p>Welcome <span id="username"><%= user.getUsername()%></span>, <a href="logout">Log out </a><p>
                </div>
            </div>
        </div>
        
        <div class="clock">
            Time Remain: 60s
        </div>
        <div class="current-status"> 
            <div class="w3-light-grey">
                <div class="w3-container w3-green w3-center your-bar" style="padding: 0;height:20px;width:0%"></div>
            </div>
            <br>

            <div class="w3-light-grey">
                <div class="w3-container w3-red w3-center other-bar" style="padding: 0;height:20px;width:0%"></div>
            </div>
        
        </div>
        <div class="map">
            <%
                int[][] map = (int[][]) request.getAttribute("map");
                for (int i = 0; i < map.length; i++) {
            %>
            <div class="row">
                <%
                    for (int j = 0; j < map.length; j++) {%>
                <div><span><%= map[i][j]%></span><div></div></div>

                <%}%>

            </div>
            <%}

            %>

        <div class="overlay overlay1">
            <div class="popup">
                <div id = "challenge-popup"
                     <p class="infor">Wana play again???</p>
                    <div class="text-right">
                        <button class="btn btn-cancel" onclick="confirmReplay('yes');">YES</button>
                        <button class="btn btn-primary" onclick="confirmReplay('no');">NO</button>
                    </div>
                </div>
            </div>
        </div>
            
        <div class="overlay overlay2">
            <div class="popup">
                <div id = "loading-popup"
                     <p class="loading"></p>
                    <div class="text-right">
                        <img src="./public/img/loading.gif">
                    </div>
                </div>
            </div>
        </div>
        <script src="./public/js/game.js"></script>
    </body>
</html>
