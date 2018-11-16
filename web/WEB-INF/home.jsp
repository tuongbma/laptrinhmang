<%-- 
    Document   : home
    Created on : Nov 2, 2018, 9:44:53 AM
    Author     : buith
--%>
<%@page import="java.util.Map"%>
<%@page import="DAO.HomeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="utils.CommonUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Home</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;

            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #99b2c1;

            }
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
            table {
              counter-reset: rowNumber;
            }

            table tr:not(#firstRow) {
              counter-increment: rowNumber;
            }

            table tr:not(#firstRow) td:first-child::before {
              content: counter(rowNumber);
              min-width: 1em;
              margin-right: 0.5em;
            }
            td, th {
                text-align: center;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    
    <body class="w3-theme-l5">
        <!-- Navbar -->
        <% User user = (User) request.getSession().getAttribute("user"); %>
        <div class="w3-top">
            <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
                <a href="home" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Home</a>
                
                <div style="float: right">
                    <p>Welcome <span id="username"><%= user.getUsername()%></span>, <a href="logout">Log out </a><p>
                </div>
            </div>
        </div>

<%
    ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
%>
<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
    <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>

</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px" >    
    <!-- The Grid -->
    <div class="w3-row">
        <!-- Left Column -->
        <div class="w3-col m3" style="max-width:250px">
            <!-- Profile -->
            <div class="w3-card w3-round w3-white"  style="position: fixed">
                <div class="w3-container">
                    <h4 class="w3-center">My Profile</h4>
                    <p class="w3-center"><img src="<%= user.getImage()%>" style="height:200px;width:200px" alt="Avatar"></p>
                    <hr>
                    <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i><%= user.getName()%></p>
                    <p><i class="fa  fa-envelope fa-fw w3-margin-right w3-text-theme"></i><%= user.getEmail()%></p>
                    <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> April 1, 1988</p>
                </div>
            </div>

            <br>

        </div>
        <!-- Middle Column -->
        <div class="w3-col m6" style = "max-width: 650px">

            <div class="w3-row-padding">
                <div class="w3-col m12">
                    <div class="w3-card w3-round w3-white">
                        <div class="w3-container w3-padding">
                            <h6 class="w3-opacity">What's on your mind, <%=user.getName()%>?</h6>
                            <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
                            <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
                        </div>
                    </div>
                </div>
            </div>



            <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                <img src="./public/img/thanh.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                <span class="w3-right w3-opacity">1 min</span>
                <h4>Bui Viet Thanh</h4> <br>
                <hr class="w3-clear">
                <p>
                    Just beat  
                    <span style="color: blue">Phan Tuan</span>
                    !!! What a loser :)))
                </p>
                <div class="w3-row-padding" style="margin:0 -16px">
                    <div>
                        <img src="./public/img/thanhpost.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
                    </div>
                </div>
                <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
                <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
            </div>  

            <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                <img src="./public/img/phantuan.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                <span class="w3-right w3-opacity">15 min</span>
                <h4>Phan Tuan</h4>
                <br>
                <hr class="w3-clear">
                <p>No more gaming. I need to study !!!</p>
                <div class="w3-row-padding" style="margin:0 -16px">
                    <div>
                        <img src="./public/img/phanPost.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
                    </div>
                </div>
                <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
                <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
            </div>

            <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                <img src="./public/img/hiep.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                <span class="w3-right w3-opacity">32 min</span>
                <h4>Truong Hoang Hiep</h4><br>
                <hr class="w3-clear">
                <p>So tired :( Miss you honey
                    <span style="color: blue">Ha Trang</span>
                    .
                </p>
                <div class="w3-row-padding" style="margin:0 -16px">
                    <div>
                        <img src="./public/img/hiepPost.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
                    </div>
                </div>
                <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
                <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
            </div> 

            <!-- End Middle Column -->
        </div>

                <!-- Right Column -->
                <div class="w3-col m5" style="max-width:450px">
                    <div class="w3-card w3-round w3-white w3-center" >
                        <div class="w3-container">
                            <p><b>TOURNAMENT RANKING</b></p>
                            <table align="center" id="rankingTable">
                                <tr id="firstRow">
                                    <th>No</th>
                                    <th onclick="sortTable(1)" style="cursor: pointer;"> Nickname <span> <img src="./public/img/arrow.jpg" width="15%"> </span></th>
                                    <th onclick="sortTable(2)" style="cursor: pointer;"><span>Point <img src="./public/img/arrow.jpg" width="35%"> </span></th>
                                    <th onclick="sortTable(3)" style="cursor: pointer;">Win rate <span> <img src="./public/img/arrow.jpg" width="35%"> </span></th>
                                    <th>Status</th>
                                    <th style="text-align: center;"><img src="./public/img/images.jpg" width="50%"></th>
                                </tr>
                               
                                <c:forEach items="${listUser}" var="u">    
                                    <c:choose>
                                        <c:when test="${u.getUsername() == user.getUsername() }">
                                            <tr id="${u.getUsername()}" style="background-color: yellow">
                                                <td></td>
                                                <td><c:out value="${u.getUsername()}"/></td>
                                                <td style="text-align: center;"><c:out value="${u.getScore()}"/></td>
                                                <td style="text-align: center;"><c:out value="${u.getWinningRate()}"/> % </td>
                                                <td class="imgStatus" style="text-align: center;">
                                                    <img src="./public/img/online.png" width="35%">
                                                </td>
                                                <td></td>
                                            </c:when>
                                            <c:otherwise>
                                            <tr id="${u.getUsername()}">
                                                <td></td>
                                                <td><c:out value="${u.getUsername()}"/></td>
                                                <td style="text-align: center;"><c:out value="${u.getScore()}"/></td>
                                                <td style="text-align: center;"><c:out value="${u.getWinningRate()}"/> % </td>
                                                <td class="imgStatus" style="text-align: center;">
                                                    <c:if test="${u.getStatus() == 1}">
                                                        <img src="./public/img/online.png" width="35%">
                                                    </c:if>
                                                    <c:if test="${u.getStatus() == 0}">
                                                        <img src="./public/img/offline.png" width="35%">
                                                    </c:if>
                                                </td>

                                        <td class="button1" style ="opacity: 0.3; cursor: none; display: 
                                            <c:if test="${u.getStatus() == 0}">
                                                block
                                            </c:if>

                                            <c:if test="${u.getStatus() == 1}">
                                                none
                                            </c:if>
                                            ">
                                            <button>OK</button>
                                        </td>
                                        <td class="button2" onclick="challenge('<c:out value="${u.getUsername()}"/>')" style ="opacity: 1; cursor: pointer; display: 
                                            <c:if test="${u.getStatus() == 0}">
                                                none
                                            </c:if>

                                            <c:if test="${u.getStatus() == 1}">
                                                block
                                            </c:if>
                                            ">
                                            <button>OK</button>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>


                    </table>

                    <!--<p><a href="ranking" style="text-decoration: none"><button class="w3-button w3-block w3-theme-l4">GO TO RANKING</button></a></p>-->
                </div>
                        <p><button class="w3-button w3-block w3-theme-l4" onclick="toogleHistory()">YOUR HISTORY</button></p>
                        <div class="w3-card w3-round w3-white w3-center" style="display: none" id="historyTab">
                            <%@include file="historyTab.jsp"%>
                        </div>
            </div>

            <!-- End Right Column -->
        </div>
                        
        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
<div class="overlay overlay1">
    <div class="popup">
        <div id = "challenge-popup"
             <p class="infor"></p>
            <div class="text-right">
                <button class="btn btn-cancel" onclick="confirmChallenge('cancel');">Cancel</button>
                <button class="btn btn-primary" onclick="confirmChallenge('ok');">OK</button>
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

<div class="overlay overlay3">
    <div class="popup">
        <div id = "timeout-popup"
             <p class="loading"></p>
        </div>
    </div>
</div>                       

<div class="overlay overlay4">
    <div class="popup">
        <div id = "refuse-popup"
             <p class="loading"></p>
        </div>
    </div>
</div>                       


<br>

<script>
    // Accordion
    function myFunction(id) {
        var x = document.getElementById(id);
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-theme-d1";
        } else {
            x.className = x.className.replace("w3-show", "");
            x.previousElementSibling.className =
                    x.previousElementSibling.className.replace(" w3-theme-d1", "");
        }
    }

    // Used to toggle the menu on smaller screens when clicking on the menu button
    function openNav() {
        var x = document.getElementById("navDemo");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else {
            x.className = x.className.replace(" w3-show", "");
        }
    }

            function toogleHistory() {
                var x = document.getElementById("historyTab");
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }

            function sortTable(n) {
                var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
                table = document.getElementById("rankingTable");
                switching = true;
                dir = "asc";
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("TD")[n];
                        y = rows[i + 1].getElementsByTagName("TD")[n];
                        if (dir == "asc") {
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        } else if (dir == "desc") {
                            if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                        switchcount++;
                    } else {
                        if (switchcount == 0 && dir == "asc") {
                            dir = "desc";
                            switching = true;
                        }
                    }
                }
            }
        </script>
        <script src="./public/js/websocket.js">

</script>
</html>
