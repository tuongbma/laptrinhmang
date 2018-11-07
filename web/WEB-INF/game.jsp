<%-- 
    Document   : ranking.jsp
    Created on : Nov 2, 2018, 9:40:50 PM
    Author     : buith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Game</title>
        <style>
            .map {
                width: 500px;
                height: 500px;
                margin: 100px auto;
            }
            .row{
                width: 100%;
            }
            .row > div{
                cursor: pointer;
                float:left;
                width: 30px;
                padding: 25px;
                border: 1px solid gray;
                margin: 7px;
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
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <script src="./public/js/game.js"></script>
    </head>
    <body>
        <div>GAME</div>
        <div class="map">
            <%
                int[][] map = (int[][]) request.getAttribute("map");
                for (int i = 0; i < map.length; i++) {
            %>
            <div class="row">
                <%
                    for (int j = 0; j < map.length; j++) {%>
                <div><%= map[i][j]%><div></div></div>

                <%}%>

            </div>
            <%}

            %>

        </div>
    </body>
</html>
