<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="container">


		<c:if test="${!empty images}">
			<c:forEach var="image" items="${images}">
				<div class="box photo col3">
					<a href="${image.url }" rel="lightbox" title="${image.name }"><img
						src="${image.url }" alt="${image.name }"
						style="cursor: url('http://cdn3.iconfinder.com/data/icons/fatcow/32x32_0560/magnifier_zoom_in.png'), auto"></a>
					<div class="button">
						<img alt="something to remember."
							src="<%=request.getContextPath()%>/img/pinterest_heart.png">
					</div>
					<div class="tags_placeholder">
						<ul class="tagit">
							<!-- Existing list items will be pre-added to the tags -->
							
							<c:if test="${!empty image.tags}">
								<c:forEach var="tag" items="${image.tags}">
									<li>${tag}</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>

			</c:forEach>
		</c:if>


	</div>
	<!-- #container -->
</body>
</html>