<%@page import="com.musicbox.actions.Action"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<link href="css/modern-business.css" rel="stylesheet">
<style>
    	.img-style{
    		display:block;
    		magin-left:40px;
    		margin-right:90px;
    		margin-top:10px;
    		margin-bottom:20px;
    	
    	}
        .name-style{
            margin-top: 40px;
        }
    	
      	</style>
</head>
<body>
    <div class="container ">
        <table   class="table ">
       <%
        ResultSet resultGenrelist1 = null;
try{
    
        String grpath;
        
        
        String name=null;
        name=request.getParameter("name");
        if(name==null){
            name=(String)session.getAttribute("genrename");
        }
        
        session.setAttribute("genrename", name);
    
        Action action=new Action();
        resultGenrelist1=action.genreList(name);
        
        if(resultGenrelist1.next()){
           grpath= resultGenrelist1.getString("grpath");
           %>
           <tr>
               <td width="300">
           <img  src="<%=grpath%>" width="300px" height="200px" >
           </td>
           </tr>
        </table>
           
<%
%>
            <h1 class="mt-4 mb-3"><%=name%></h1>
            
<%  resultGenrelist1.close();
           
        }
    
} catch(Exception e){}
       
        
%>

        <div calss="row-md-">

<div class="media-body">  

    
    <!-- Page Heading/Breadcrumbs -->
   

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="home.jsp">Home</a>
        </li>
        <li class="breadcrumb-item "> <a href="genre.jsp">Genres</a></li>
          <li class="breadcrumb-item active">Genres-Song-List</li>
      </ol>  
      
    </div>


</div>
<div>
<table class="table ">
  <thead >
    <tr class="table-primary">
      <th scope="col">Song</th>
      <th scope="col">Genres</th>
      <th scope="col">      </th>
       <th scope="col">      </th>
     </tr>
  </thead>
  
        
<%

ResultSet resultGenrelist2 = null;
try{
	
        String name=null;
        name=request.getParameter("name");
        if(name==null){
            name=(String)session.getAttribute("genrename");
        }
        
        session.setAttribute("genrename", name);
    
        Action action=new Action();
        resultGenrelist2=action.genreList(name);
                
 %>
     <%
             while(resultGenrelist2.next())
                {
                     String path=resultGenrelist2.getString("spath");   
%>
      

       
       
<tr>

<td width="30%"><%=resultGenrelist2.getString("sname") %>  </td>
<td width="30%"><%=resultGenrelist2.getString("sgenre") %></td>
<td width="30%"><audio controls src="<%=path %>"  width="400" height="40"></audio></td>
<td width="30%">
    <div class="btn-group dropright">
    <button type="button" class="btn btn-secondary">
    More
    </button>
    <button type="button" class="btn btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="sr-only">Toggle Dropright</span>
    </button>
    <div class="dropdown-menu">
  
    <a class="dropdown-item " href="playlist_addSong.jsp?songn=<%=resultGenrelist2.getString("sname")%>&var=genrelist">Add To Play List</a>
    <a class="dropdown-item" href="listenlater_addSong.jsp?songn=<%=resultGenrelist2.getString("sname")%>&var=genrelist">Listen Later</a>
    <a class="dropdown-item" href="share_toUI.jsp?songn=<%=resultGenrelist2.getString("sname")%>&var=genrelist">Suggest Song</a>
        
    </div>
    </div>
 </td>

</tr>
     <% 
                            
		} %>
    </table>
    </div>
    </div>


 <%         
     

	resultGenrelist2.close();		
}
catch(Exception e){}
%>
 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>