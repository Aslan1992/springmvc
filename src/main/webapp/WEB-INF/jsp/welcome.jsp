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
<%--<p id="p1"></p>--%>
<%--<input type="text" id="inp"/>--%>
<%--<button onclick="stopRequesting()">stop requesting</button>--%>
<script>
//    var input = document.getElementById("inp");
//    input.oninput = function () {
//        var http = new XMLHttpRequest();
//        http.open('POST', '/changeText', true)
//        http.send(input.value);
//    }
//
//    var timerId = setTimeout(doIt, 1000);
//
//    function doIt() {
//        var http = new XMLHttpRequest();
//        http.open('GET', '/getText', false)
//        http.send();
//        if (http.status == 200) {
//            document.getElementById("p1").innerHTML = http.responseText;
//        }
//        timerId = setTimeout(doIt, 1000);
//    }
//
//    function stopRequesting() {
//        clearTimeout(timerId);
//    }
</script>
</body>
</html>
