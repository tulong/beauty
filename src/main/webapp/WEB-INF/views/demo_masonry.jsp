<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.wwt.cn.beauty.model.Image" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div id="container" class="clearfix">
    
<c:if test="${!empty images}" >
<c:forEach var="image" items="${images}">
  <div class="box photo col3">
    <a href="${image.url }" title="${image.name }"><img src="${image.url }" alt="${image.name }"></a>
  </div>

</c:forEach>
</c:if>
  
</div> <!-- #container -->
<nav id="page-nav">
<!--   <a href="../pages/2.html"></a> -->
  <a href="./loading/2"></a>
</nav>

<script src="../js/masonry/jquery-1.7.1.min.js"></script>
<script src="../js/masonry/jquery.masonry.min.js"></script>
<script src="../js/masonry/jquery.infinitescroll.min.js"></script>
<script>
  $(function(){

    var $container = $('#container');
  
    $container.imagesLoaded( function(){
      $container.masonry({
        itemSelector : '.box'
      });
    });
  
  $container.infinitescroll({
      navSelector  : '#page-nav',    // selector for the paged navigation 
      nextSelector : '#page-nav a',  // selector for the NEXT link (to page 2)
      itemSelector : '.box',     // selector for all items you'll retrieve
      loading: {
          finishedMsg: 'No more pages to load.',
          img: 'http://i.imgur.com/6RMhx.gif'
        }
      },
      // trigger Masonry as a callback
      function( newElements ) {
        // hide new items while they are loading
        var $newElems = $( newElements ).css({ opacity: 0 });
        // ensure that images load before adding to masonry layout
        $newElems.imagesLoaded(function(){
          // show elems now they're ready
          $newElems.animate({ opacity: 1 });
          $container.masonry( 'appended', $newElems, true ); 
        });
      }
    );
  
  
  });
</script>
</body>
</html>