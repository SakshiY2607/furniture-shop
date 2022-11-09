<%-- 
    Document   : shop
    Created on : Mar 18, 2019, 10:13:29 AM
    Author     : Ashish
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   String catid=request.getParameter("id");
   
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Shop</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

    </head>
    <body>
        <!-- Search Wrapper Area Start -->
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
        
        <%--<%@include file="/cat_nav.jsp?c_id=6" %>--%>
        
        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Catagories</h6>
                  <%
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();

            %>
            
             <% ResultSet rs1=st.executeQuery("select *from category");%>
                                     
                   

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                         <% String c = "";
                                while(rs1.next()){
                                   
                    %>
                        <li class="<%=c%>"><a href="#"><%=rs1.getString("cat_name")%></a></li>

                        <%
                         }
                                rs1.close();
                                con.close();
                                st.close();
                        %>
                    </ul>
                </div>
            </div>
            
             <%
            							 }
           								 catch(Exception e) {
           								 out.println("Error Message while insertion: " + e);
      									  }

   										 %>
           
        </div>
        <div class="amado_product_area section-padding-50">
            <div class="container-fluid">
            <div class="row">
                          <%
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/furniture_db", "root", "sakshi");
            Statement st=con.createStatement();

            %>
            
             <% ResultSet rs1=st.executeQuery("select *from product where catgory_id='"+catid+"'");%>
                

                    <!-- Single Product Area -->
                     <% String c = "";
                                while(rs1.next()){
                                    
                                    
                                    %>
                                
                    
                    <div class="col-12 col-sm-6 col-md-12 col-xl-6">
                        <div class="single-product-wrapper">
                            <!-- Product Image -->
                            <div class="product-img hover-content">
                                <a href="product_details.jsp?pid=<%=rs1.getInt("pro_id")%>">
                                    <img src="<%=rs1.getString("pro_img")%>" alt="">
                                </a>
                                <!-- Hover Thumb -->
                                <!--<img class="hover-img" src="img/product-img/product2.jpg" alt="">-->
                            </div>

                            <!-- Product Description -->
                            <div class="product-description d-flex align-items-center justify-content-between">
                                <!-- Product Meta Data -->
                                <div class="product-meta-data">
                                    <div class="line"></div>
                                    <p class="product-price">₹ <%=rs1.getInt("pro_price")%></p>
                                    <a href="product_details.jsp?pid=<%=rs1.getInt("pro_id")%>">
                                        <h5><%=rs1.getString("pro_name")%></h5>
                                    </a>
                                </div>
                                <!-- Ratings & Cart -->
                                <div class="ratings-cart text-right">
                                    <h6 ><%=rs1.getString("pro_qty")%> Items are InStock</h6>
                                    <div class="cart">
                                        <a href="cart?proid=<%=rs1.getInt("pro_id")%>" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="img/core-img/cart.png" width="30" height="30" alt="Add to Cart"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                    
                                    <% } %>

                  
                    
                        <%
            							 }
           								 catch(Exception e) {
           								 out.println("Error Message while insertion: " + e);
      									  }

   										 %>
                

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#">02.</a></li>
                                <li class="page-item"><a class="page-link" href="#">03.</a></li>
                                <li class="page-item"><a class="page-link" href="#">04.</a></li>
                            </ul>
                        </nav>
                    </div>
                </div></div>
            
                    
            </div>
        </div>
                                                                                 
                                        
                      
                      
                      
                      
    </div>
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
