<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 3/9/2020
  Time: 9:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${products}" var="product">
<p>Product name: ${product.name}</p>
<p>Product price: ${product.unitPrice}</p>
<p>Product quantity: ${product.quantity}</p>
</c:forEach>
</body>
</html>
