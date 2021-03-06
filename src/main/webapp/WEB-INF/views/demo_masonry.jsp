<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.wwt.cn.beauty.model.Image"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script
	src="<%=request.getContextPath()%>/js/masonry/jquery-1.7.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/js/masonry/jquery.masonry.min.js"></script>
<script
	src="<%=request.getContextPath()%>/js/masonry/jquery.infinitescroll.min.js"></script>
<script src="<%=request.getContextPath()%>/js/lightbox/lightbox.js"></script>
<link href="<%=request.getContextPath()%>/css/lightbox/lightbox.css"
	rel="stylesheet" />

<!-- tag -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.12/jquery-ui.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/tag/tag-it.js"
	type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<link href="<%=request.getContextPath()%>/css/tag/jquery.tagit.css"
	rel="stylesheet" type="text/css">
<!-- This is an optional CSS theme that only applies to this widget. Use it in addition to the jQuery UI theme. -->
<link href="<%=request.getContextPath()%>/css/tag/tagit.ui-zendesk.css"
	rel="stylesheet" type="text/css">


<style>
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

	<div id="container" class="clearfix">

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
						<ul id="${image.id }" class="tagit">
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
	<nav id="page-nav"> <!--   <a href="../pages/2.html"></a> --> <a
		href="./loading/2"></a> </nav>

	<script>
		$(function() {
			//tags
			$(".tagit").tagit({
				onTagClicked : function(event, tag) {
					/* window.open("http://www.w3schools.com"+"?tagvalue="+$(this).tagit('tagLabel', tag)); */
				}
			}).tagit(
					'option',
					'onTagAdded',
					function(evt, tag) {
						// Add this callbackafter we initialize the widget,
						// so that onTagAdded doesn't get called on page load.

						$.get("./addTag", {
							id : $(this).attr('id'),
							tag : $(this).tagit('tagLabel', tag)
						});

					});

			$('.box').on({
				hover : function() {
					var buttonDiv = $(this).children('div.button');
					buttonDiv.toggle();
				}
			});
			$("div.button").click(function() {
				alert(123);
			});

			var $container = $('#container');

			$container.imagesLoaded(function() {
				$container.masonry({
					itemSelector : '.box'
				});
			});

			$container.infinitescroll({
				navSelector : '#page-nav', // selector for the paged navigation 
				nextSelector : '#page-nav a', // selector for the NEXT link (to page 2)
				itemSelector : '.box', // selector for all items you'll retrieve
				loading : {
					finishedMsg : 'No more pages to load.',
					img : 'http://i.imgur.com/6RMhx.gif'
				}
			},
			// trigger Masonry as a callback
			function(newElements) {
				// hide new items while they are loading
				var $newElems = $(newElements).css({
					opacity : 0
				});
				// ensure that images load before adding to masonry layout
				$newElems.imagesLoaded(function() {
					// show elems now they're ready
					$newElems.animate({
						opacity : 1
					});
					$container.masonry('appended', $newElems, true);
				});

				//add new elems js function, by vincent
				$newElems.on({
					hover : function() {
						var buttonDiv = $(this).children('div.button');
						buttonDiv.toggle();
					}
				});
				//find div.button under newElems, by vincent
				$newElems.find("div.button").click(function() {
					alert(123);
				});

				//tags
				$newElems.find("ul.tagit").tagit(
						{
							onTagClicked : function(event, tag) {
								window.open("http://www.w3schools.com"
										+ "?tagvalue="
										+ $(this).tagit('tagLabel', tag));
							}
						}).tagit(
						'option',
						'onTagAdded',
						function(evt, tag) {
							// Add this callbackafter we initialize the widget,
							// so that onTagAdded doesn't get called on page load.
							alert('This tag is being added: '
									+ $(this).tagit('tagLabel', tag));
						});
			});

		});
	</script>
</body>
</html>