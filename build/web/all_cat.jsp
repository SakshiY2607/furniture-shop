<%-- 
    Document   : all_cat
    Created on : Mar 18, 2019, 4:40:10 PM
    Author     : Ashish
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado- Furniture Ecommerce Template | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

    </head>
    <body>
       
                <%
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();

            %>

        <!-- Product Catagories Area Start -->
        <div class="products-catagories-area clearfix">
            <div class="amado-pro-catagory clearfix">
                 <% ResultSet rs1=st.executeQuery("select *from category");%>
                                     
                    <% while(rs1.next()){
                       
                    %>
                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.jsp?id=<%=rs1.getInt("cat_id")%>">
                        <img src="<%=rs1.getString("cat_img")%>" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>From ₹<%=rs1.getString("cat_price")%></p>
                            <h4><%=rs1.getString("cat_name")%></h4>
                        </div>
                    </a>
                </div>
                <%
            }
                %>
                
                <%
            							 }
           								 catch(Exception e) {
           								 out.println("Error Message while insertion: " + e);
      									  }

   										 %>

                                                                                 <!-- Single Catagory -->
               
                                                                                 
                
            </div>
        </div>
    </body>
</html>
