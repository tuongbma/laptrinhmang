
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
    }else if(data['type'] == 'result'){
        clearInterval(inter);
        console.log("result " + data['result'])
        if(data['result'] == 'win'){
            alert("You win!!!!!");
        }else if(data['result'] == 'lose'){
            alert("You lose!!!!")
        }else{
            alert("Tie!!!!!")
        }
        playedAgain();
    }else if(data['type'] == 'replay'){
        window.location = "game?match=" + data['key'];
    }else if(data['type'] == 'refusePlay'){
        console.log(data)

        if(data['isAlert'] == 'yes'){
            alert("Your rival refused to replay!!!");
        }
        setTimeout(function (){
            window.location = "home";

        }, 1000);
        
    }
};

//Error
websocket.onerror = function (ev) {
    console.log('Error ' + ev.data);
};



var time_max = 10;
var time_play = 0;
var inter = setInterval(function () {
    time_play += 1;
    time_remain =  time_max - time_play;
    $(".clock").text("Time Remain: "+ time_remain +"s");
    if(time_remain == 0){
        clearInterval(inter);
        var data = {
            'type': 'timeup',
            'time_max': time_max
        };
        websocket.send(JSON.stringify(data));
    }
}, 1000);


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
            'currentValue': thisCurrentValue,
            'maxValue': maxValue,
            'time_play': time_play
        }
        websocket.send(JSON.stringify(data))
    } else {
        $(cover).css("display", "none");
        window.setTimeout(function () {
            $(cover).css("display", "block");
        }, 500);
    }

});


function playedAgain(){
    $(".overlay1").css("display", "block");
}

function confirmReplay(result){
    $(".overlay1").css("display", "none");
    var data = {
        'type': 'replay',
        'result': result
    }
    websocket.send(JSON.stringify(data));
}