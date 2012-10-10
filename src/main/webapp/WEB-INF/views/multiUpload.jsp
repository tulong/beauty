<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>My Uploadify Implementation</title>
   
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/uploadify.css">
   
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.uploadify-3.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
    	$('#file_upload').uploadify({
			 'formData' : {
					'userid' : '123'
				},
							'fileObjName' : 'imgFile',
							'swf' : '<%=request.getContextPath() %>/swf/uploadify.swf',
							'uploader' : './upload'
						// Your options here
						});
					});
				</script>
</head>

<body>
 
<input type="file" name="imgFile" id="file_upload" />

</body>
</html>