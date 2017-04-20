<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<a href="/new">create own game</a>

<h4>Connect to created games: </h4>
<c:forEach items="${createdGames}" var="game">
    <a href="/connectToGame?name=${game.name}"><p>${game.name}</p></a>
</c:forEach>

<script>
    function $(elementId) {
        return document.getElementById(elementId);
    }
</script>
</body>
</html>
