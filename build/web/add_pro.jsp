

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%ResultSet rs=null;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String catmsg=(String) request.getAttribute("prmsg");
            if(catmsg==null)
            {
                out.println("");
            }
            else
            {
                out.println(catmsg);
            }
            %>  
        
        <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();
             rs=st.executeQuery("select * from category");
            %>
       
        <form action="add_pro" method="post" enctype="multipart/form-data">
        <h1>hello, admin</h1>
        Select Category:<select name="pro_cat">
            <option selected>Select Category</option>
            <%
            while(rs.next()){
            %>
            <option value="<%=rs.getString("cat_id")%>" ><%=rs.getString("cat_name")%></option>
            <%
            }
            %>
        </select><br/><br/>
        Product Name:<input type="text" name="pro_name" placeholder="Enter Product Name"/><br/><br/>
        Description<input type="text" name="pro_detail" placeholder="Enter Product Detail"/><br/><br/>
        Price<input type="text" name="pro_price" placeholder="Enter Price"/><br/><br/>
        Quantity<input type="text" name="pro_qty" placeholder="Enter Quantity"/><br/><br/>
        Upload:<input type="file" name="pro_img"/><br/><br/>
        <input type="submit" value="Add">
    </form>
        <a href="admin_home.jsp">Back to Main Menu</a>
         <%
             }
            catch(Exception e) {
            out.println("Error Message while insertion: " + e);
        }

    %>
    <table cellpadding="10" border="2">
    <tr>
        <th>Product Name</th>
        <th>Product Detail </th>
        <th>Product Price</th>
        <th>Product Quantity </th>
        <th>Product category</th>
    </tr>
    <%
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();
            ResultSet rs1=st.executeQuery("select * from product");
            while (rs1.next()) {
                out.println("<tr>");
                out.println("<td>" + rs1.getString("pro_name") + "</td>");
                out.println("<td>" + rs1.getString("pro_detail") + "</td>");
                out.println("<td>" + rs1.getString("pro_price") + "</td>");
                out.println("<td>" + rs1.getString("pro_qty") + "</td>");
                out.println("<td>" + rs1.getString("catgory_id") + "</td>");
                out.println("<td><a href=\"pro_edit.jsp?em=" + rs1.getInt("pro_id") + "\">Edit</a></td>");
                out.println("<td><a href=\"pro_delete.jsp?em=" + rs1.getInt("pro_id") + "\">Delete</a></td>");
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
