<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
    $(function() {
        $('div.container').on({
            hover: function() {
                var buttonDiv = $(this).children('div.button');
                buttonDiv.toggle();
            }
        });
          $("div.button").click(function(){
    alert(123);
  });
    });
</script>
<style>
div.container {
    position: relative;
    border: 1px solid #000;
}
div.button {
    position: absolute;
    left: 20px;
    top: 20px;
    width: 20px;
    height: 10px;
    display: none;
}
</style>
</head>
<body>

<c:if test="${!empty images}" >
<c:forEach items="${images}" var="image" >
<div class="container">
<img src="${image.url}" width="250" height="150"/><br />
Name:${image.name }<br />
UserName:${image.userName }<br />
Id:${image.id }<br />
<%-- Price:${product.price }<br />
Style:${product.category.name }<br />
Brand:${product.brand }<br /> --%>
<a href="<%=request.getContextPath() %>/image/delete/${image.id}">delete</a><br />

    <div class="button">
    <img alt="something to remember." src="<%=request.getContextPath() %>/img/pinterest_heart.png">
    </div>
</div>
</c:forEach>
</c:if>


</body>
</html>