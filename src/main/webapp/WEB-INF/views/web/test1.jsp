<%@include file="/common/taglib.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: itcha
  Date: 14/03/2020
  Time: 5:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${lstProductBranch}" var="lstProductBranch">
    <h1>${lstProductBranch.name}</h1>
</c:forEach>
</body>
</html>
