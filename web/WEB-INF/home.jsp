<%-- 
    Document   : home
    Created on : Nov 2, 2018, 9:44:53 AM
    Author     : buith
--%>
<%@include file="header.jsp"%>
        
<%

            ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");

            Map<Integer, Float> winningRateMap = (Map<Integer, Float>) request.getAttribute("winningRateMap");
//            System.out.println("Number of user = ");
%>
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
                            <p class="w3-center"><img src="<%= user.getImage()%>" style="height:200px;width:200px" alt="Avatar"></p>
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
                                <img src="./public/img/phanPost.jpg" style="width:100%" alt="Northern Lights" class="w3-margin-bottom">
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
                                <% int i = 1;%>
                                <c:forEach items="${listUser}" var="u">    
                                    <c:choose>
                                        <c:when test="${u.getUsername() == user.getUsername() }">

                                        </c:when>
                                        <c:otherwise>
                                            <tr id="${u.getUsername()}">
                                                <td><c:out value="<%= i%>"/></td>
                                                <td><c:out value="${u.getUsername()}"/></td>
                                                <td><c:out value="${winningRateMap.get(u.getID())}"/> % </td>
                                                <td class="imgStatus">
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
                                    <%i++;%>
                                </c:forEach>


                            </table>

                            <p><a href="ranking" style="text-decoration: none"><button class="w3-button w3-block w3-theme-l4">GO TO RANKING</button></a></p>
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
        </script>
        <script src="./public/js/websocket.js">

        </script>
</html>
