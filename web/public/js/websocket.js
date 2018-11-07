/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var username = document.getElementById("username").innerHTML;

// WEB Socket
var wsUri = "ws://localhost:8080/laptrinhmang/websocket?username=" + username;
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

//Message Receved
websocket.onmessage = function (ev) {

    var data = JSON.parse(ev.data);
    if (data['type'] == 'challenge') {
        confirmChallenge(data['fromUser']);
    }
    if (data['type'] == 'confirm' && data['confirmResult'] == 'no') {
        alert("DEO CHOI !!!");
    }
    if (data['type'] == 'confirm' && data['confirmResult'] == 'yes') {
        window.location = "ranking";
    }
};

//Error
websocket.onerror = function (ev) {
    console.log('Error ' + ev.data);
};

function challenge(toUser) {
    
    var data = {
        "type": "challenge",
        "toUser": toUser
    }
    websocket.send(JSON.stringify(data));
}

function confirmChallenge(fromUser) {
    if (confirm("Accpet challenge from " + fromUser + " ???")) {
         var data = {
            "type": "confirm",
            "confirmResult": "yes",
            "toUser": fromUser
        }
        websocket.send(JSON.stringify(data));
        window.location = "ranking";
    } else {
        var data = {
            "type": "confirm",
            "confirmResult": "no",
            "toUser": fromUser
        }
        websocket.send(JSON.stringify(data));
    }
}
