<%-- 
    Document   : header
    Created on : Mar 17, 2019, 3:52:53 PM
    Author     : Ashish
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    HttpSession session1 = request.getSession(false);
    String name =" ";
    int s =0;
    String u_id=session.getAttribute("user_id").toString();
    if(session1 == null){
         name= "LogIn";
//        name =session.getAttribute("name").toString(); 
    }
    else{
        if(session.getAttribute("name") != null){
            name =session.getAttribute("name").toString();    
        }
    }
  
   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="home.jsp"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="home.jsp">Home</a></li>
                    <!-- <li><a href="shop.html">Shop</a></li> -->
                    <li><a href="yourorder.jsp">Your Order</a></li>
                    <li><a href="adminlogin.jsp">Admin</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="cart.jsp">Cart</a></li>
                    <!--<li><a href="test.jsp">Test</a></li>-->
                </ul>
            </nav>
           <hr style="background-color: orange; height: 2px; border: 0;">
            
            <!-- Button Group -->
<!--            <div class="amado-btn-group mt-30 mb-100">
                 <a href="#" class="btn amado-btn mb-15">%Discount%</a> 
                <a href="test.jsp" class="btn amado-btn active">Popular this week</a>
            </div>-->
             <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();
                        %>
                        
                         <%ResultSet rs1 =st.executeQuery("select count(*) from cart where user_id='"+u_id+"'");%>
                                     <%
          						  while(rs1.next()){
                                                              s= rs1.getInt("count(*)");
          					  %>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="cart.jsp" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(<%=s%>)</span></a>
                 <%    }
            }
           				catch(Exception e) {
           				out.println("Error Message while insertion: " + e);
      					 }

   										 %>
                <a href="#" class="fav-nav"><img src="img/core-img/user1.png" alt=""><%=name%></a>
                <%
                
                if(name != "LogIn" ){
                   // String a="hidden";
                %>
                <a href="logout.jsp?key1=2" class=" fa fa-sign-out" > &nbspLogout</a>
                <% 
                }
                %>
                <!-- <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a> -->
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
    </body>
</html>
