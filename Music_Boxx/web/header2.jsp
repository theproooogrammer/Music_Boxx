<%@page import="java.sql.ResultSet"%>
<%@page import="com.musicbox.loginReg.LoginReg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
<link href="css/modern-business.css" rel="stylesheet"></head>
<body>
<!-- Navigation -->
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      
    <div class="container">
      <a class="navbar-brand" href="home.jsp">MuSIC BoX</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Browse
            </a>
             <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="artist.jsp">Artist</a>
                <a class="dropdown-item" href="album.jsp">Album</a>
                <a class="dropdown-item" href="genre.jsp">Genres</a>
              </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              My Music
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="playlist_view_Playlist.jsp?var=viewPlaylist">PlayList</a>
                <a class="dropdown-item" href="listenlater_viewlist.jsp?var=listenlaterlist">Listen Later</a>
                <a class="dropdown-item" href="share_songs_list.jsp?var=suggestlist">Suggestion</a>
            </div>
          </li>
        
          <li>
            <div>
              <div class="input-group">
                  <form style="width:600px" class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                      <input style="width:400px" type="text" name="lyrics" class="form-control" placeholder="Search for...">
                  <span class="input-group-btn">
                    <button class="btn btn-secondary" type="submit">Go!</button>
                  </span>
                  </form>  
                  
                </div>
            </div>  
          </li>
<%
        String name_header2=null;
        String username=(String)session.getAttribute("username"); 

        LoginReg reg=new LoginReg();
        ResultSet result_header2=reg.getname(username);
        
        if(result_header2.next()){
            name_header2=result_header2.getString("name");
            name_header2=name_header2.toUpperCase();
        }
        else{
            name_header2="ADMIN";
        }
    
%>  
    <%  
        if(name_header2.equals("ADMIN")){
            %>
        <li class="nav-item">
              <a class="nav-link"href="admin.jsp"><%=name_header2%></a>
        </li>
            <%
        }
        else{
        %>
        <li class="nav-item">
            <a class="nav-link"href="user.jsp"><%=name_header2%></a>
        </li>
        <%
        }
    %>
        <li class="nav-item">
              <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>