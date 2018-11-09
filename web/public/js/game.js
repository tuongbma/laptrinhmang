
var thisCurrentValue = 0;
var otherCurrentValue = 0;
var maxValue = $(".map > .row > div").length;




var username = document.getElementById("username").innerHTML;
// WEB Socket
var wsUri = "ws://localhost:8080/laptrinhmang/websocket_game?username=" + username;
websocket = new WebSocket(wsUri);

//Connected to server
websocket.onopen = function (ev) {
    console.log('Connected to server ');
};

//Connection close
websocket.onclose = function (ev) {
    console.log('Disconnected');
};

var fromUser;
//Message Receved
websocket.onmessage = function (ev) {

    var data = JSON.parse(ev.data);
    if (data['type'] == 'update') {
        otherCurrentValue = parseInt(data['currentValue']);
        var percent = parseInt(100 * otherCurrentValue / maxValue);

        $(".other-bar").css("width", percent + "%");
    }
};

//Error
websocket.onerror = function (ev) {
    console.log('Error ' + ev.data);
};





$(".row > div").click(function () {
    var cover = $(this).children("div");
    var value = parseInt($(this).children("span").text());
    if (thisCurrentValue == value - 1) {
        $(cover).remove();
        thisCurrentValue += 1;
        var percent = parseInt(100 * thisCurrentValue / maxValue);
        $(".your-bar").css("width", percent + "%");
        var data = {
            'type': 'update',
            'fromUser': username,
            'currentValue': thisCurrentValue,
            'maxValue': maxValue
        }
        websocket.send(JSON.stringify(data))
    } else {
        $(cover).css("display", "none");
        window.setTimeout(function () {
            $(cover).css("display", "block");
        }, 500);
    }

});