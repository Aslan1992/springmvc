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

<button onclick="toServer(game)" disabled>to server</button>
<button onclick="fromServer()">from server</button>
<button onclick="createNewGame()">create new game</button>
<button onclick="currentGameProcessInfo()">check status</button>
<script>

    var gameBoard = $("gameBoard");

    function $(elementId) {
        return document.getElementById(elementId);
    }

    function GameProcess(name, state) {
        this.name = name;
        this.state = state;
        var victoryItems;
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
        game.state[line(elementId)][column(elementId)] = "S";
        gameBoard.onmouseup = null;
    }

    function line(str) {
        return parseInt(str.charAt(0));
    }

    function column(str) {
        return parseInt(str.charAt(1));
    }

    function toServer(myObject) {
        var http = new XMLHttpRequest();
        http.open('POST', '/toServer', false);
        http.setRequestHeader('Content-Type', 'application/json');
        http.send(JSON.stringify(myObject));
    }

    function fromServer() {
        var http = new XMLHttpRequest();
        http.open('GET', '/fromServer?name=' + gameName, false);
        http.send();
        game = JSON.parse(http.responseText);
        drawOnUi(game.state);
        gameBoard.onmouseup = listenMouseUp;
    }

    function drawOnUi(stateArr) {
        for (var i = 0; i < BOARD_SIZE; i++) {
            for (var j = 0; j < BOARD_SIZE; j++) {
                $(i + "" + j).innerHTML = stateArr[i][j];
            }
        }
    }

    function createNewGame() {
        for (var i = 0; i < BOARD_SIZE; i++) {
            for (var j = 0; j < BOARD_SIZE; j++) {
                game.state[i][j] = "";
            }
        }
        drawOnUi(game.state);
    }

    function currentGameProcessInfo() {
        var http = new XMLHttpRequest();
        http.open("GET", "/currentGameProcessInfo?name=" + gameName, false);
        http.send();
        $("gameInfo").innerHTML = http.responseText;
        if (http.responseText.includes("in progress")) {
        }
    }

    <%--var url = window.location.toString();--%>
    <%--var params = url.split('=');--%>
    <%--var gameName = (params[1] != null) ? params[1] : "${gameName}";--%>


    <%--var xflag = true;--%>
    <%--var timerId = setTimeout(currentGameProcessInfo, 2000);--%>
    <%--var gameProcess = new GameProcess(gameName, initArrayOfBoardState());--%>




    <%--function startGame() {--%>
    <%--gameBoard.onmouseup = function(e) {--%>
    <%--e = e || window.event;--%>
    <%--var elementId = (e.target || e.srcElement).id;--%>
    <%--var value = (xflag) ? "X" : "O";--%>
    <%--if ($(elementId).innerHTML === "") {--%>
    <%--var lineNumber = line(elementId);--%>
    <%--var columnNumber = column(elementId);--%>
    <%--gameProcess.state[lineNumber][columnNumber] = value;--%>
    <%--xflag = !xflag;--%>
    <%--toServer(gameProcess);--%>
    <%--secondTimerId = setTimeout(fromServer, 1000);--%>
    <%--}--%>
    <%--}--%>
    <%--}--%>

    <%--function line(str) {--%>
    <%--return parseInt(str.charAt(0));--%>
    <%--}--%>

    <%--function column(str) {--%>
    <%--return parseInt(str.charAt(1));--%>
    <%--}--%>


    function initArrayOfBoardState() {
        var boardState = new Array(BOARD_SIZE);
        for (var i = 0; i < boardState.length; i++) {
            boardState[i] = new Array(BOARD_SIZE);
        }
        return boardState;
    }


    <%--function drawUI(state) {--%>
    <%--for (var i = 0; i < BOARD_SIZE; i++) {--%>
    <%--for (var j = 0; j < BOARD_SIZE; j++) {--%>
    <%--$(i + "" + j).innerHTML = state[i][j];--%>
    <%--}--%>
    <%--}--%>
    <%--}--%>

    <%----%>
    <%--//Domain objects--%>
    <%--function GameProcess(name, state) {--%>
    <%--this.name = name;--%>
    <%--this.state = state;--%>
    <%--var victoryItems = null;--%>
    <%--}--%>

</script>
</body>
</html>
