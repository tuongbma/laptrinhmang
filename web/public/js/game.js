
var thisCurrentValue = 0;
var otherCurrentValue = 0; 
var maxValue = $(".map > .row > div").length;

$(".row > div").click(function (){
    var cover = $(this).children("div");
    var value = parseInt($(this).children("span").text());
    $(cover).css("display", "none");
    if(thisCurrentValue == value - 1){
        thisCurrentValue += 1;
        var percent = parseInt(100*thisCurrentValue/maxValue);
        $(".your-bar").css("width", percent + "%");
        console.log(percent);
    }else{
        window.setTimeout(function (){
            $(cover).css("display", "block");
       }, 1000);
    }
    console.log(thisCurrentValue);

});


//
//
//var username = document.getElementById("username").innerHTML;
//// WEB Socket
//var wsUri = "ws://localhost:8080/laptrinhmang/websocket?username=" + username;
//console.log(wsUri);
//websocket = new WebSocket(wsUri);
//
////Connected to server
//websocket.onopen = function (ev) {
//    console.log('Connected to server ');
//}
//
////Connection close
//websocket.onclose = function (ev) {
//    console.log('Disconnected');
//};
//
//var fromUser;
////Message Receved
//websocket.onmessage = function (ev) {
//
//    var data = JSON.parse(ev.data);
//    if (data['type'] == 'challenge') {
//        fromUser = data['fromUser'];
//        $("#challenge-popup > p").text("Challenge from " + fromUser);
//        $(".overlay1").css("display", "block");
//        window.setTimeout(function () {
//            if (stop == 0) {
//                console.log("timeout");
//                var data = {
//                    "type": "confirm",
//                    "confirmResult": "timeout",
//                    "toUser": fromUser
//                }
//                websocket.send(JSON.stringify(data));
//                $(".overlay1").css("display", "none");
//            } else
//                stop = 0;
//        }, 5000);
//    } else if (data['type'] == 'confirm') {
//        $(".overlay2").css("display", "none");
//
//        if (data['confirmResult'] == 'yes')
//            window.location = "ranking";
//        else if (data['confirmResult'] == 'no')
//            alert("Challenge Denied !!!");
//        else if (data['confirmResult'] == 'timeout')
//            alert("Challenge Timeout !!!");
//    } else if (data['type'] == 'toggleStatus') {
//        var toggleUser = data['toggleUser'];
//        if ($("#" + toggleUser + " > .button1").css("display") == "block") {
//            $("#" + toggleUser + " > .button1").css("display","none");
//            $("#" + toggleUser + " > .button2").css("display","block");
//            $("#" + toggleUser + " > .imgStatus img").attr("src", "./public/img/online.png")
//        } else {
//            $("#" + toggleUser + " > .button2").css("display","none");
//            $("#" + toggleUser + " > .button1").css("display","block");
//            $("#" + toggleUser + " > .imgStatus img").attr("src", "./public/img/offline.png")
//        }
//    }
//};
//
////Error
//websocket.onerror = function (ev) {
//    console.log('Error ' + ev.data);
//};