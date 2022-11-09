<%-- 
    Document   : user.jsp
    Created on : Mar 17, 2019, 5:36:24 PM
    Author     : Ashish
--%>

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
    <title>Furniture Store | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

    
     <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    
    
    
    
<script src="https://www.gstatic.com/firebasejs/5.9.3/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyD3aa7ZAEQWp1oD86PYH9ka2TKtWUdEVUk",
    authDomain: "furniture-cf37a.firebaseapp.com",
    databaseURL: "https://furniture-cf37a.firebaseio.com",
    projectId: "furniture-cf37a",
    storageBucket: "",
    messagingSenderId: "467155316221"
  };
  firebase.initializeApp(config);
</script>

 <script src="fire.js"></script>
    

    </head>
    <body>
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
         <%--<%@include file="/header.jsp" %>--%>
        <!-- Header Area End -->
        
         
            <div class="container-fluid bg-blue">
                <div class="row">                   
        <div class="page-wrapper  p-t-60 p-b-100 font-poppins col-12 col-lg-12">
        <div class="wrapper wrapper--w780 ">
            <div class="card card-3">
                <div class="card-heading"></div>
                <div class="card-body">
                    <div class="newsletter-text mb-50" style="text-align: center">
                        <h1 class="text-white">Welcome Here!</h1>
                    </div>
                    <h2 class="title" style="text-align: center">LogIn</h2>
                    <form action="user" method="POST">
                       <div class="input-group">
                            <input class="input--style-3" type="email" placeholder="Email" name="email">
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" type="password" placeholder="password" name="password">
                        </div>
                        
<!--                        <div class="input-group">
                            <input class="input--style-3" type="password" placeholder="password" name="password" hidden>
                        </div>
                        <div class="input-group">
                            <input class="input--style-3" type="password" placeholder="password" name="password" hidden>
                        </div>-->
                        
                        <div class="p-t-10">
                            <button class="btn btn--pill btn--green" type="submit">LogIn</button>
                        </div>
                    </form>
                    
                    <div class="p-t-10">
                        <a class="text-white" style="font-size: 16px" href="user_reg.jsp">Create an Account</a>
                        </div>
                </div>
             
                    
                
                
            </div>
        </div>
       </div>
        </div>
            </div>
         </div>
         <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->
        <%--<%@include file="/footer.jsp" %>--%>
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
    
    
    
     <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

    
    </body>
</html>
