<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:if test="${!empty images}" >
<c:forEach items="${images}" var="image" >
<img src="${image.url}" width="250" height="150"/><br />
Name:${image.name }<br />
UserName:${image.userName }<br />
Id:${image.id }<br />
<%-- Price:${product.price }<br />
Style:${product.category.name }<br />
Brand:${product.brand }<br /> --%>
<a href="<%=request.getContextPath() %>/image/delete/${image.id}">delete</a><br />
</c:forEach>
</c:if>

</body>
</html>