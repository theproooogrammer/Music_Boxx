<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%	
    //ANY NEW SONG THAT CAN BE ADDED TO THE PLAYIST OR CREATING NEW PLAYLIST
    //THIS PAGE CAN BE CALLED FOR ANY SONGS'S 'MORE' OPTION
    //FOR EG :- albumlist---->playlist_addSong----------->playlist_insert_playlist
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	if(session.getAttribute("username")==null){
            String var="";
            var=request.getParameter("var");
            session.setAttribute("var",var);
            
            response.sendRedirect("login.jsp");	
	}
        String name = request.getParameter("username");
		
%>
                       
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
    <h1 class="mt-4 mb-3">Add Song To PlayLists</h1>
    
    <div class="row">
        <table   class="table ">
            <thead>
        <tr class="table-primary">
            <th scope="col">Create New Playlist</th>
            <th scope="col">    </th>
            <th scope="col">      </th>
            <th scope="col">    </th>
        </tr>
            
        </thead>    
        <!-- IN THIS NEW PLAYLIST CAN BE CREATED 
             playlist_addSong----TO----playlist_insert_playlist
        -->
        <tr><td width="400">
            <div class="panel-body">
            <h4>+ Create </h4> 
            <form action="playlist_insert_playlist.jsp" method="post">
		<div class="form-group">
                    <input type="text" class="form-control" style="width:120%" placeholder="Enter Play List Name" name="newplayname" required></input>
                </div>
								
		<div class="form-group" >
                    <button type="submit" class="btn btn-primary" style="width:120%" >Create</button>
		</div>
            </form>
        </div> </td>       
        </tr>                
   </table> 
      
        </div>
    
    <ol class="breadcrumb">
      <li class="breadcrumb-item active">Add To Existing Playlist</li>
    </ol>

    <div class="row">
        
<%
    //VIEW THE EXISTING PLAYLIST FOR ADD THE SONG TO THE EXISTING PLAYLIST
    //JUST BY CLICKING THE HYPERLINK OF PLAYLIST
    //playlist_addSong------->playlist_insert_playlist
    Connection connection_playlist_addSong = null;
    PreparedStatement psSelect_playlist_addSong = null;
    ResultSet result_playlist_addSong = null;

        String var="";
        var=request.getParameter("var");
        session.setAttribute("var",var);

try{
	Class.forName("com.mysql.jdbc.Driver");
	connection_playlist_addSong = DriverManager.getConnection("jdbc:mysql://localhost/music_box","root","root");
        String username =(String)session.getAttribute( "username" ) ;
        String songname=request.getParameter("songn");

        session.setAttribute("songn",songname);
	psSelect_playlist_addSong = connection_playlist_addSong.prepareStatement("select DISTINCT pname from playlist where username='"+username+"'");
        result_playlist_addSong = psSelect_playlist_addSong.executeQuery();
        
             while(result_playlist_addSong.next())
                {
              
                    if(result_playlist_addSong.getString("pname")!=null){
			%>  
                        
                        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <div class="card-body">
            
              <h1><a href="playlist_insert_playlist.jsp?playn=<%=result_playlist_addSong.getString("pname")%> "><%=result_playlist_addSong.getString("pname") %></a></h1>
              
              
            </h4>
          </div>
        </div>
      </div>
                        
      
                        <% }
                         else{%>
      <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
        <div class="card h-100">
          <div class="card-body">
            
              <h1><a href="playlist_view_playlist.jsp?playn=<%=result_playlist_addSong.getString("pname")%>">%></a></h1>
             
              
            </h4>
          </div>
        </div>
      </div>
   <%    }
                            
		} %>
	
    </div>

                
    
        
       </div>
                        	
        
 
                

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%         
     
    connection_playlist_addSong.close();
    psSelect_playlist_addSong.close();
    result_playlist_addSong.close();
    }
    catch (Exception e) {

    }
%>         
</body>

</html>
