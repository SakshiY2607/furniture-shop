<%-- 
    Document   : yourorder
    Created on : Mar 19, 2019, 2:50:12 PM
    Author     : Ashish
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String ss ="";
    String qtyy ="";
    long i =0;
    int q = 0;
    int p =0;
    int o_id=0;
    int p_id=0;
    String btn =" ";
    String link =" ";
    %>
    
    <%
    
   String cat=request.getParameter("idd");
   String uid=session.getAttribute("user_id").toString();
%>

<html>
    <head>
        <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Checkout</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/custom.css">
    <link rel="stylesheet" href="style.css">

    </head>
    <body>
       <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

         <!-- Header Area Start -->
         <%@include file="/header.jsp" %>
        <!-- Header Area End -->
        
        <% 
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();
                        %>

        <div class="cart-table-area section-padding-100 ">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Your Orders</h2>
                        </div>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Date</th>
                                        <th>Price</th>
                                        <th style=" background-color: #f5f7fa;">Status</th>
                                        <th style=" background-color: #f5f7fa;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                  <%ResultSet rs1 =st.executeQuery("select *from orders where user_id='"+uid+"'");%>
                                     <%
          						  while(rs1.next()){
                                                             // ss= rs1.getString("cart_id");
          					  %>
                                    <tr>
                                        <td class="cart_product_img">
                                            <a href="#"><img src="<%=rs1.getString("pro_img")%>" alt="Product"></a>
                                        </td>
                                        <td class="cart_product_desc">
                                            <h5><%=rs1.getString("pro_name")%></h5>
                                        </td>
                                        <td class="price">
                                            <span><%=rs1.getInt("order_date")%></span>
                                        </td>
                                         <td class="price">
                                            <span><%=rs1.getInt("order_qty")%>&nbsp*&nbsp₹ <%=rs1.getInt("pro_price")%></span>
                                        </td>
                                         <td class="price">
                                            <span><%=rs1.getString("order_status")%></span>
                                        </td>
                                        <td class="qty">
                                            
                                            <% 
                                            String comp = rs1.getString("order_status");
                                            
                                            if(comp.equals("Cancelled")){
                                                 p_id =rs1.getInt("pro_id");
                                               btn="View"; 
                                               link =("product_details.jsp?pid="+p_id);
                                            
                                                
                                               }
                                            else{
                                                 p_id =rs1.getInt("order_id");
                                               btn ="Cancel"; 
                                               link =("cancel?oid="+p_id);
                                            
                                              }
                                            %>
                                            <div class=" mt-30 mb-30">
                        <a href="<%=link%>" class="btn btn-template-main btn-sm"><%=btn%></a>
            </div>
                                            
                                                
                                               
                                          
                                        </td>
                                    </tr>
                                    <%
                                                          }
                                    %>
                                </tbody>
                            </table>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
                        
                        <%
            							 }
           								 catch(Exception e) {
           								 out.println("Error Message while insertion: " + e);
      									  }

   										 %>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->
        <%@include file="/footer.jsp" %>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

    </body>
</html>
