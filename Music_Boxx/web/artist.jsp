<%@page import="com.musicbox.actions.Action"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

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



<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MuSIC BoX</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">   


    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <!-- Bootstrap core CSS -->

    <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/vendor.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/4-col-portfolio.css" rel="stylesheet">
    <link href="css/album.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
  </head>

  <body>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Artist
        
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="home.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active">Artist</li>
      </ol>
<%
    
    ResultSet resultArtist = null;
    try{
	Action actionArtist=new Action();
        resultArtist=actionArtist.artist();
        //arpath ie Artist PATH
        String arpath;    
%>
        <div class="row">
<%
            while(resultArtist.next()){               
                 
                arpath=resultArtist.getString("arpath");                 
%>
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
            <div class="card h-100">
                <a href="artistlist.jsp?name=<%=resultArtist.getString("sartist")%>"style="height:100%;">
                    <img width="220" height="150" class="card-img-top" src="<%=arpath%>">
                </a>
                         
                <div class="card-body">

                      <a href="artistlist.jsp?name=<%=resultArtist.getString("sartist")%>"><%=resultArtist.getString("sartist") %></a>      
                </div>
            </div>
        </div>
<% 
            } 
%>
        </div>
              
    </div>

 <%   
     resultArtist.close();
     }catch(Exception e) {}

%>
 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    </body>
</html>