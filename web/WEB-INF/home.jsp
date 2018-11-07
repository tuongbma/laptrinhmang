<%-- 
    Document   : home
    Created on : Nov 2, 2018, 9:44:53 AM
    Author     : buith
--%>

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

        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body class="w3-theme-l5">

        <%
            User user = (User) request.getSession().getAttribute("user");

            ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
//            System.out.println("Number of user = ");
%>
        <!-- Navbar -->

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

        <!-- Navbar on small screens -->
        <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
            <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
            <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>

        </div>

        <!-- Page Container -->
        <div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
            <!-- The Grid -->
            <div class="w3-row">
                <!-- Left Column -->
                <div class="w3-col m3" style="max-width:250px" >
                    <!-- Profile -->
                    <div class="w3-card w3-round w3-white">
                        <div class="w3-container">
                            <h4 class="w3-center">My Profile</h4>
                            <p class="w3-center"><img src="./public/img/tuongbma.jpg" style="height:200px;width:200px" alt="Avatar"></p>
                            <hr>
                            <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Designer, UI</p>
                            <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> London, UK</p>
                            <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> April 1, 1988</p>
                        </div>
                    </div>
                    <br>

                    <!-- Accordion -->
                    <div class="w3-card w3-round">
                        <div class="w3-white">
                            <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
                            <div id="Demo1" class="w3-hide w3-container">
                                <p>Some text..</p>
                            </div>
                            <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
                            <div id="Demo2" class="w3-hide w3-container">
                                <p>Some other text..</p>
                            </div>
                            <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
                            <div id="Demo3" class="w3-hide w3-container">
                                <div class="w3-row-padding">
                                    <br>
                                    <div class="w3-half">
                                        <img src="/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                    <div class="w3-half">
                                        <img src="/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <br>

                    <!-- Interests --> 
                    <div class="w3-card w3-round w3-white w3-hide-small">
                        <div class="w3-container">
                            <p>Interests</p>
                            <p>
                                <span class="w3-tag w3-small w3-theme-d5">News</span>
                                <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
                                <span class="w3-tag w3-small w3-theme-d3">Labels</span>
                                <span class="w3-tag w3-small w3-theme-d2">Games</span>
                                <span class="w3-tag w3-small w3-theme-d1">Friends</span>
                                <span class="w3-tag w3-small w3-theme">Games</span>
                                <span class="w3-tag w3-small w3-theme-l1">Friends</span>
                                <span class="w3-tag w3-small w3-theme-l2">Food</span>
                                <span class="w3-tag w3-small w3-theme-l3">Design</span>
                                <span class="w3-tag w3-small w3-theme-l4">Art</span>
                                <span class="w3-tag w3-small w3-theme-l5">Photos</span>
                            </p>
                        </div>
                    </div>
                    <br>

                    <!-- End Left Column -->
                </div>

                <!-- Middle Column -->
                <div class="w3-col m6" style = "max-width: 650px">

                    <div class="w3-row-padding">
                        <div class="w3-col m12">
                            <div class="w3-card w3-round w3-white">
                                <div class="w3-container w3-padding">
                                    <h6 class="w3-opacity">Social Media template by w3.css</h6>
                                    <p contenteditable="true" class="w3-border w3-padding">Status: Feeling Blue</p>
                                    <button type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i>  Post</button> 
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <img src="./public/img/phantuan.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
                        <span class="w3-right w3-opacity">1 min</span>
                        <h4>Phan Tuan</h4><br>
                        <hr class="w3-clear">
                        <p>HEY SON HEUNG MIN !!! MOTHERFUCKER !!!</p>
                        <div class="w3-row-padding" style="margin:0 -16px">
                            <div>
                                <img src="/tuanpost.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
                            </div>
                        </div>
                        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
                        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
                    </div>

                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <img src="./public/img/thanh.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                        <span class="w3-right w3-opacity">16 min</span>
                        <h4>Bui Viet Thanh</h4><br>
                        <hr class="w3-clear">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
                        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
                    </div>  

                    <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
                        <img src="./public/img/hiep.jpg" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
                        <span class="w3-right w3-opacity">32 min</span>
                        <h4>Truong Hoang Hiep</h4><br>
                        <hr class="w3-clear">
                        <p>Have you seen this?</p>
                        <img src="/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  Like</button> 
                        <button type="button" class="w3-button w3-theme-d2 w3-margin-bottom"><i class="fa fa-comment"></i>  Comment</button> 
                    </div> 

                    <!-- End Middle Column -->
                </div>

                <!-- Right Column -->
                <div class="w3-col m5" style="max-width:450px">
                    <div class="w3-card w3-round w3-white w3-center">
                        <div class="w3-container">
                            <p><b>TOURNAMENT RANKING</b></p>
                            <table align="center" >
                                <tr>
                                    <th>No</th>
                                    <th>Nickname</th>
                                    <th>Winning rate</th>
                                    <th>Status</th>
                                    <th>Challenge</th>
                                </tr>
                                <c:forEach items="${listUser}" var="u">    
                                    <c:choose>
                                        <c:when test="${u.getUsername() == user.getUsername() }">

                                        </c:when>
                                        <c:otherwise>
                                            <tr id="${u.getUsername()}">
                                                <td><c:out value="${u.getID()}"/></td>
                                                <td><c:out value="${u.getUsername()}"/></td>
                                                <td><c:out value="${u.getEmail()}"/></td>
                                                <td class="imgStatus">
                                                    <c:if test="${u.getStatus() == 1}">
                                                        <img src="./public/img/online.png" width="35%">
                                                    </c:if>
                                                    <c:if test="${u.getStatus() == 0}">
                                                        <img src="./public/img/offline.png" width="35%">
                                                    </c:if>
                                                </td>
                                                
                                                 

                                                <td class="button" <c:if test="${u.getStatus() == 0}">style="display:none;" </c:if> onclick="challenge('<c:out value="${u.getUsername()}"/>')" >
                                                    <button>OK</button>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>


                            </table>

                            <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
                        </div>
                    </div>
                    <br>

                    <br>

                    <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
                        <p>ADS</p>
                    </div>
                    <br>

                    <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
                        <p><i class="fa fa-bug w3-xxlarge"></i></p>
                    </div>

                    <!-- End Right Column -->
                </div>

                <!-- End Grid -->
            </div>

            <!-- End Page Container -->
        </div>
        <div class="overlay">
            <div class="popup">
                <p class="infor"></p>
                <div class="text-right">
                    <button class="btn btn-cancel" onclick="confirmChallenge('cancel');">Cancel</button>
                    <button class="btn btn-primary" onclick="confirmChallenge('ok');">OK</button>
                </div>
            </div>
        </div>


        <br>

        <!-- Footer -->
        <footer class="w3-container w3-theme-d3 w3-padding-16">
            <h5>Footer</h5>
        </footer>

        <footer class="w3-container w3-theme-d5">
            <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
        </footer>

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

            function challenge(id1, id2) { //id1 for who challenges, id2 for who is challenged

                alert('Wanna challenge ' + id2 + " ???")
            }
        </script>
        <script src="./public/js/websocket.js">

        </script>
</html>
