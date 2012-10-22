<?xml version="1.0" encoding="UTF-8" ?>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><decorator:title default="Beauty" /></title>
  <meta charset='utf-8'>
  

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/masonry/style.css" />
    <%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pagify/style.css" type="text/css">
 --%>
 
 
    <%-- <script src="<%=request.getContextPath() %>/js/pagify/jquery-1.6.4.min.js" type="text/javascript"></script>
     <script src="<%=request.getContextPath() %>/js/pagify/pagify.js" type="text/javascript"></script>
    --%>
<!--     <script type='text/javascript'>
      $(document).ready(function() {
        $('#page_holder').pagify({
          pages: ['home', 'login', 'demo','multiUpload'],
          animation: 'fadeIn',
          'default': 'home',
          cache: true
        });
      });
    </script> -->
    
    
  <decorator:head />
</head>
<body>
<div id='pagify_container'>
    <header>
      <h1>Beauty<small>God gives us eyes, because of Beauty!</small></h1>
      <nav>
        <a href='<%=request.getContextPath() %>/'>Home</a>
        <a href='/login'>Login</a>
        <a href='<%=request.getContextPath() %>/image/demo'>Demo</a>
        <a href='<%=request.getContextPath() %>/image/multiUpload'>MultiUpload</a>
      </nav>
    </header>
    
    <div id='page_holder' />
    

<P>  Welcome!  <%=request.getContextPath() %></P>


    <hr />
    <decorator:body />
    <hr />
    <h1>Footer</h1><a href="mailto:someone@example.com?Subject=Hello%20Beauty">
Send Mail</a>
</body>
</html>