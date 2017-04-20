<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Products</title>
</head>
<body>
    <h3>${product.name}</h3>
    <p>${product.description}</p>
    <p>
        <strong>Item code: </strong>
        <span>${product.productId}</span>
        <a href="<spring:url value="/products" />" class="btn btn-default">
            <span class="glyphicon-hand-left glyphicon"></span> back
        </a>
    </p>
</body>
</html>
