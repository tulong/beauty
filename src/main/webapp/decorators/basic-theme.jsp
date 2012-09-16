<?xml version="1.0" encoding="UTF-8" ?>

<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Beauty</title>
  <meta charset='utf-8'>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/pagify/style.css" type="text/css">

    <script src="<%=request.getContextPath() %>/js/pagify/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath() %>/js/pagify/pagify.js" type="text/javascript"></script>
    
    <script type='text/javascript'>
      $(document).ready(function() {
        $('#page_holder').pagify({
          pages: ['home', 'login', 'options'],
          animation: 'fadeIn',
          'default': 'home',
          cache: true
        });
      });
    </script>
</head>
<body>
<div id='container'>
    <header>
      <h1>Beauty<small>God gives us eyes, because of Beauty!</small></h1>
      <nav>
        <a href='./'>Home</a>
        <a href='/login'>login</a>
        <a href='#options'>Options</a>
        <a href='https://github.com/cmpolis/Pagify'>Github</a>
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