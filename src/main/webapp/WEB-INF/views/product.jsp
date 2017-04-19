<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </p>
</body>
</html>
