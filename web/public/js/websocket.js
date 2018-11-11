/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var username = document.getElementById("username").innerHTML;
var stop = 0;
// WEB Socket

var wsUri = "ws://localhost:8080/laptrinhmang/websocket_home?username=" + username;
console.log(wsUri);
websocket = new WebSocket(wsUri);

//Connected to server
websocket.onopen = function (ev) {
    console.log('Connected to server ');
}

//Connection close
websocket.onclose = function (ev) {
    console.log('Disconnected');
};

var fromUser;
var key;
//Message Receved
websocket.onmessage = function (ev) {
    var data = JSON.parse(ev.data);
    if (data['type'] == 'challenge') {
        fromUser = data['fromUser'];
        key = data['key'];
        $("#challenge-popup > p").text("Challenge from " + fromUser);
        $(".overlay1").css("display", "block");
        window.setTimeout(function () {
            if (stop == 0) {     
                var data = {
                    "type": "confirm",
                    "confirmResult": "timeout",
                    "toUser": fromUser
                }
                websocket.send(JSON.stringify(data));
                $(".overlay1").css("display", "none");
            } else
                stop = 0;
        }, 5000);
    } else if (data['type'] == 'confirm') {
        $(".overlay2").css("display", "none");
        if (data['confirmResult'] == 'yes')
            window.location = "game?match=" + data['key'];
       else if (data['confirmResult'] == 'no'){
            $("#refuse-popup > p").text("Challenge request denied !!!");
            $(".overlay4").css("display", "block");
            $(".overlay4").click(function (){
                $(".overlay4").css("display", "none");
            });
        }
        else if (data['confirmResult'] == 'timeout'){
            $("#timeout-popup > p").text("Time out !!! No response.");
            $(".overlay3").css("display", "block");
            $(".overlay3").click(function (){
                $(".overlay3").css("display", "none");
            });
        }
    } else if (data['type'] == 'toggleStatus') {
        var toggleUser = data['toggleUser'];
        if ($("#" + toggleUser + " > .button1").css("display") == "block") {
            $("#" + toggleUser + " > .button1").css("display","none");
            $("#" + toggleUser + " > .button2").css("display","block");
            $("#" + toggleUser + " > .imgStatus img").attr("src", "./public/img/online.png")
        } else {
            $("#" + toggleUser + " > .button2").css("display","none");
            $("#" + toggleUser + " > .button1").css("display","block");
            $("#" + toggleUser + " > .imgStatus img").attr("src", "./public/img/offline.png")
        }
    }
};

//Error
websocket.onerror = function (ev) {
    console.log('Error ' + ev.data);
};

function challenge(toUser) {
    stop = 0;
    $("#loading-popup > p").text("Waiting for " + toUser);
    $(".overlay2").css("display", "block");
    var data = {
        "type": "challenge",
        "toUser": toUser
    }
    websocket.send(JSON.stringify(data));
}

function confirmChallenge(value) {
    stop = 1;
    if (value == "ok") {
        var data = {
            "type": "confirm",
            "confirmResult": "yes",
            "toUser": fromUser
        }
        websocket.send(JSON.stringify(data));
        window.location = "game?match=" + key;
    } else {
        var data = {
            "type": "confirm",
            "confirmResult": "no",
            "toUser": fromUser
        }
        websocket.send(JSON.stringify(data));
    }
    $(".overlay").css("display", "none");
}
