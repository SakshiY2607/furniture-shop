

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
    <title>Amado - Furniture Ecommerce Template | Home</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

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
         <%@include file="/header.jsp" %>
        <!-- Header Area End -->
         <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>Send us your Message</h2>
                            </div>

                            <form action="feedback" method="post">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control" id="first_name" name="fname" value="" placeholder="Full Name" required>
                                    </div>
                                   
                                    <div class="col-12 mb-3">
                                        <input type="number" class="form-control" id="company" name="phone" placeholder="Phone no." value="">
                                    </div>
                                    <div class="col-12 mb-3">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="">
                                    </div>
                                   
<!--                                    <div class="col-12 mb-3">
                                        <input type="text" class="form-control mb-3" id="street_address" placeholder="Comment" value="">
                                    </div>-->
                                    <div class="col-12 form-group">
				<textarea class="common-textarea form-control"
                                          name="message" placeholder="Enter Messege" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Messege'" required=""></textarea>				
				<div class="col-lg-12">
				  
                                <input class="btn amado-btn w-10" type="submit" value="submit"  style="float: right;
                                       margin-top: 50px"/>										
				</div>
                                 
                                </div>
                                </div>
                            </form>
                        </div>
                        
                        
                        <div class="newsletter-form mb-100" style="margin-top: 50px">
							<div class="single-footer-widget">
								<h6>Our Contact</h6>
                                                                <p>Phone:</p>
                                                                <p class="text-primary"> +91-9116542158</p>
                                                                
                                                                <p>Email:</p>
                                                                <p class="text-primary"> sakshiyadav2607@gmail.com</p>
								
							</div>
						</div>	
                        
                    </div>
                        </div>
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
