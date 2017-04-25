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
<div id="gameInfo"></div>
<h4>Creator - 'X', Incomer - 'O'</h4>
<h4>Player: ${player}</h4>
<div id="who"></div>
<table id="gameBoard">
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
<button onclick="fromServer()">from server</button>
<script>

    var gameBoard = $("gameBoard");

    function $(elementId) {
        return document.getElementById(elementId);
    }

    function GameProcess(name, state) {
        this.name = name;
        this.state = state;
        var victoryItems = null;
    }

    var url = window.location.toString();
    var params = url.split('=');
    var gameName = (params[1] != null) ? params[1] : "${gameName}";
    const BOARD_SIZE = 3;
    var game = new GameProcess(gameName, initArrayOfBoardState());

    gameBoard.onmouseup = listenMouseUp;

    function listenMouseUp(e) {
        e = e || window.event;
        var elementId = (e.target || e.srcElement).id;
        var item = game.state[line(elementId)][column(elementId)];
        if (item == undefined || item === "") {
            game.state[line(elementId)][column(elementId)] = ("${player}" === "creator") ? "X" : "0";
        }
        toServer(game, "${player}");
        gameBoard.onmouseup = null;
    }

    function whoMadeStep() {
        var http = new XMLHttpRequest();
        http.open('GET', '/whoMadeStep?name=' + gameName, false);
        http.send();
        $("who").innerHTML = http.responseText;
    }

    function line(str) {
        return parseInt(str.charAt(0));
    }

    function column(str) {
        return parseInt(str.charAt(1));
    }

    function toServer(myObject, playerRole) {
        var http = new XMLHttpRequest();
        http.open('POST', '/toServer?playerRole=' + playerRole, false);
        http.setRequestHeader('Content-Type', 'application/json');
        http.send(JSON.stringify(myObject));
    }

    function fromServer() {
        var http = new XMLHttpRequest();
        http.open('GET', '/fromServer?name=' + gameName, false);
        http.send();
        game = JSON.parse(http.responseText);
        whoMadeStep();
        drawOnUi(game.state);
        if ($("who").innerHTML !== "${player}") {
            gameBoard.onmouseup = listenMouseUp;
        }
    }

    function drawOnUi(stateArr) {
        for (var i = 0; i < BOARD_SIZE; i++) {
            for (var j = 0; j < BOARD_SIZE; j++) {
                $(i + "" + j).innerHTML = stateArr[i][j];
            }
        }
    }
    
    var timerId = setTimeout(currentGameProcessInfo, 1000);

    function currentGameProcessInfo() {
        var http = new XMLHttpRequest();
        http.open("GET", "/currentGameProcessInfo?name=" + gameName, false);
        http.send();
        $("gameInfo").innerHTML = http.responseText;
        if (http.responseText.includes("in progress")) {
            clearTimeout(timerId);
        } else {
            timerId = setTimeout(currentGameProcessInfo, 1000);
        }
    }

    function initArrayOfBoardState() {
        var boardState = new Array(BOARD_SIZE);
        for (var i = 0; i < boardState.length; i++) {
            boardState[i] = new Array(BOARD_SIZE);
        }
        return boardState;
    }
</script>
</body>
</html>
