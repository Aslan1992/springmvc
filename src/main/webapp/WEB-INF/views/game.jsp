<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Game</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <style>
        table, th, td {
            border: 2px solid black;
            border-collapse: collapse;
        }
        th, td {
            text-align: center;
            width: 60px;
            height: 60px;
            font-size: large;
        }
    </style>
</head>
<body>
<h3 id="gameInfo"></h3>
<table>
    <tr>
        <td id="00"></td>
        <td id="01"></td>
        <td id="02"></td>
    </tr>
    <tr>
        <td id="10"></td>
        <td id="11"></td>
        <td id="12"></td>
    </tr>
    <tr>
        <td id="20"></td>
        <td id="21"></td>
        <td id="22"></td>
    </tr>
</table>

<button onclick="copyToUI()">copy to UI</button>
<script>
    function $(elementId) {
        return document.getElementById(elementId);
    }

    var url = window.location.toString();
    var params = url.split('=');
    var gameName = (params[1] != null) ? params[1] : "${gameName}";

    var timerId = setTimeout(currentGameProcessInfo, 2000);

    function currentGameProcessInfo() {
//        var http = new XMLHttpRequest();
//        http.open("GET", "/currentGameProcessInfo?name=" + gameName, false);
//        http.send();
//        $("gameInfo").innerHTML = http.responseText;
//        timerId = setTimeout(currentGameProcessInfo, 2000);
    }

    var gameProcess;
    
    function copyToUI() {
        var http = new XMLHttpRequest();
        http.open("GET", "/fromServer", false);
        http.send();
        gameProcess = JSON.parse(http.responseText);
        for(var i = 0; i < 3; i++) {
            for(var j = 0; j < 3; j++) {
                $(i+""+j).innerHTML = gameProcess.state[i][j];
            }
        }
    }


    //    var myTable = $("mytable");
    //
    //    var http = new XMLHttpRequest();
    //    var id;
    //
    //    var boardState;
    //
        //Domain objects
        function GameProcess(state) {
            this.state = state;
            var victoryItems = null;
        }
    //
    //    function Item(i, j) {
    //        this.i = i;
    //        this.j = j;
    //    }
    //
    //    function initBoard() {
    //        boardState = new Array(3);
    //        for(var i = 0; i < boardState.length; i++) {
    //            boardState[i] = new Array(3);
    //        }
    //    }
    //
    //    var gameProcess;
    //
    //    myTable.onmouseup = function (e) {
    //        e = e || window.event;
    //        id = (e.target || e.srcElement).id;
    //        toServer(gameProcess);
    // disable opportunity to make actions on UI
    // run requesting server cycle
    // when get new state of board stopping the ajax requests (2d player make choice) / or game over
    // enable opportunity to make actions on UI
    //    }
    //
    //    function toServer(myObject) {
    //        http.open('POST', '/toServer', false);
    //        http.setRequestHeader('Content-Type', 'application/json');
    //        http.send(JSON.stringify(myObject));
    //    }
    //
    //    var timerId = setTimeout(fromServer, 1000);
    //
    //    function fromServer() {
    //        http.open('GET', '/fromServer', false);
    //        http.send();
    //        if (http.status == 200 && http.responseText != "") {
    //            gameProcess = JSON.parse(http.responseText);
    //        }
    //        timerId = setTimeout(fromServer, 1000);
    //    }
    //
    //    function stopRequesting() {
    //        clearTimeout(timerId);
    //    }
</script>
</body>
</html>
