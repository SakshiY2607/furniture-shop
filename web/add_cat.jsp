

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p><i>
            <%
            String catmsg=(String) request.getAttribute("catmsg");
            if(catmsg==null)
            {
                out.println("");
            }
            else
            {
                out.println(catmsg);
            }
            %>                
            </i></p>
        <form action="add_cat" method="post">
            <h1>hello, admin</h1>
            <input type="text" name="cat_name" placeholder="Enter Category Name">
            <input type="text" name="cat_detail" placeholder="Enter Category Detail">
            <input type="submit" value="Add">
        </form>
        <a href="admin_home.jsp">Back to Main Menu</a>
    

<table cellpadding="10" border="2">
    <tr>
        <th>Category name</th>
        <th>Category Detail </th>
    </tr>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from category");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("cat_name") + "</td>");
                out.println("<td>" + rs.getString("cat_detail") + "</td>");
                out.println("<td><a href=\"cat_edit.jsp?em=" + rs.getInt("cat_id") + "\">Edit</a></td>");
                out.println("<td><a href=\"cat_delete.jsp?em=" + rs.getInt("cat_id") + "\">Delete</a></td>");
                out.println("</tr>");
            }
            st.close();
            con.close();
        } catch (Exception e) {
            out.println("Error Message while insertion: " + e);
        }

    %>
</table>
    </body>
</html>
