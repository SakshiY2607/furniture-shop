<%-- 
    Document   : test
    Created on : Mar 19, 2019, 11:45:59 PM
    Author     : Ashish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>hello, admin</h1>
         <form action="upload.jsp" method="post" enctype="multipart/form-data">
        
         Product Name:<input type="text" name="title" placeholder="Enter Product Name"/><br/><br/>
        Upload:<input type="file" name="file"/><br/><br/>
        <input type="submit" value="Add">
    </form>
    </body>
</html>
