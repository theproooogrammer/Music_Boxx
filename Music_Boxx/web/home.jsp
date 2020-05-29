<%
    if(session.getAttribute("username")==null){
        %>
        <%@include file="header1.jsp" %>
        <%
    }else{
        %>
        <%@include file="header2.jsp" %>
        <%
    }

%>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MuSIC BoX</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

         <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin.css" rel="stylesheet">
  </head>

  <body>

   

    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" >
              <img src="img/1_1.jpg" style="width :100%">
              <div class="carousel-caption d-none d-md-block">
              
             
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item">
              <img src="img/2.jpg" style="width:100%">
	
                 <div class="carousel-caption d-none d-md-block">
              
               </div>  
            </div>
       
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item"  >
              <img src="img/3.jpg" style="width:100%">
	
         
            <div class="carousel-caption d-none d-md-block">
              
              
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    

    <!-- Footer -->
    <footer >
   <div class="container">
				<div class="row">
					<div class="col-md-12">
        
   <%@include file="recently_searchedonly4.jsp" %>

     
						<p>Powered by MuSIC BoX 2018 All Rights Reserved</p>
					</div>
				</div>
			</div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    
    
  </body>

</html>