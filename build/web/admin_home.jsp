

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   
       response.setHeader("Cache-Control","no-cache");
       response.setHeader("Cache-Control","no-store");
       response.setHeader("Pragma","no-cache");
       response.setDateHeader("Expires",0);
       
        String name = "";
                if (session.getAttribute("name") == null) {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/adminlogin.jsp");
                    String msg1 = "Session Expired. Please login again";
                    request.setAttribute("msg1", msg1);
                    rd.forward(request, response);
                } else {
                    name = session.getAttribute("name").toString();
                }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h1>hello <%=name%></h1>
        <a href="add_cat.jsp"><button>Add Category</button></a>
        <a href="add_pro.jsp"><button>Add Product</button></a>
        <!--<a href="add_store.jsp"><button>Add Store</button></a>-->
        <a href="logout.jsp?key1=1"><button>Admin Logout</button></a>
        
    </body>
</html>
