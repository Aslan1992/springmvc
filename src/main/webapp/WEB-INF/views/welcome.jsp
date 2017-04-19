<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="jumbotron">
    <h1> ${greeting}</h1>
    <p> ${tagline}</p>
</div>

<a href="#" onclick="showForm()">Create own game</a>

<form id="myForm" action="/createGame" hidden method="GET">
    Give name for your game: <br>
    <input type="text" name="gamename">
    <input type="submit" value="create">
</form>

<p>Created games: </p>
 <c:forEach items="${waitingGames}" var="waitingGame">
     <a href="/enterForGame?gamename=${waitingGame.key}">${waitingGame.key}</a> <br>
 </c:forEach>
<script>
    function showForm() {
        $("myForm").hidden = false;
    }
    function $(elementId) {
        return document.getElementById(elementId);
    }
</script>
</body>
</html>
