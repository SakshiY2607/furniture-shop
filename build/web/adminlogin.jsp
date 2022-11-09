

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="adminlogin" method="post" style="text-align: center; margin-top: 200px;">
		<h1>Log in Here!!</h1>
		<input type="text" name="email" placeholder="Enter Email"><br/><br/>
	<input type="password" name="pass" placeholder="Enter password"><br/><br/>
	<button type="submit" value="Login">Login</button><br/><br/>
	</form>
        <a href="index.jsp" style="text-align: center">Back to Login</a>
    </body>
</html>
