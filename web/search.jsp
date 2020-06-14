<%@page import="com.musicbox.userAction2.Recommendation"%>
<%@page import="com.musicbox.userAction2.RecentlyPlayed"%>
<%@page import="com.musicbox.userAction2.Search"%>
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

    <title>Aurticle</title>
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
    		margin-top:50px;
    		margin-bottom:30px;
    	
    	}
        .name-style{
            margin-top: 40px;
        }
    	
      	</style>
</head>
<body>
    <div class="container">
        <div>
                <table   class="table ">
<%
    String sname=null;
    String sartist=null;
    String salbum=null;
    String sgenre=null;
    String alpath=null;
    String path=null;
    
    ResultSet result1=null;
    ResultSet result2=null;
    
    String sname1=null;
    String sname2=null;  
    int count=0;
    
    try{
        sname1=request.getParameter("lyrics");
        sname2=request.getParameter("playn");
        
        if(sname1==null){
            sname=sname2;
        }
        else if(sname2==null){
            sname=sname1;
        }
        
        
        Search search=new Search();
        
        //problem with this is while redirecting the page gets refreashed so the session is agian set to null
        //and that session is getted nut thw values are getting insert into datbase
        session.setAttribute("searchsong",sname);
        sname=(String)session.getAttribute("searchsong");
        
        result1=search.search_song(sname);
        System.out.println("search.jsp"+sname);
        System.out.println("search.jsp"+result1);
        if(result1.next()){
            
        path=result1.getString("spath");    
        sname=result1.getString("sname");
        sartist=result1.getString("sartist");
        salbum=result1.getString("salbum");
        sgenre=result1.getString("sgenre");
        alpath= result1.getString("alpath");
        System.out.println("search.jsp"+path);
        if(session.getAttribute("username")!=null){
            String username =(String)session.getAttribute( "username" ) ;
            RecentlyPlayed recentlyPlayed=new  RecentlyPlayed();
            recentlyPlayed.recently_played(sname, username);
        }
		
%>
<tr>
    <td>
        <h5>Searched Result</h5>
    </td>
</tr>

<tr>
    <td>
        <img  src="<%=alpath%>"width="300px" height="200px">
    </td>
</tr>

<tr class="table-primary">
      <th scope="col">Song</th>
      <th scope="col">Artist</th>
      <th scope="col">      </th>
      <th scope="col">      </th>
</tr>

<tr>

<td width="30%"><%=sname %>  </td>
<td width="30%"><a href="artistlist.jsp?name=<%=result1.getString("sartist")%>"><%=result1.getString("sartist")%></a></td>
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
        
    <a class="dropdown-item " href="playlist_addSong.jsp?songn=<%=result1.getString("sname")%>&var=search">Add To Play List</a>
    <a class="dropdown-item" href="listenlater_addSong.jsp?songn=<%=result1.getString("sname")%>&var=search">Listen Later</a>
    <a class="dropdown-item" href="share_toUI.jsp?songn=<%=result1.getString("sname")%>&var=search">Suggest Song</a>
        
    </div>
    </div>
 </td>

</tr>
    </table>

<table   class="table ">
    
    <tr class="table-primary">
      <th scope="col">Similar Songs</th>
      <th scope="col">      </th>
      <th scope="col">      </th>
      <th scope="col">      </th>
</tr>
<tr>
<% 
    
    Recommendation recommendation=new Recommendation();
    //resultRecommendation1 HOLD RECOMMENDATION BASED ON THE ALBUM I.E IT WILL RECOMMEND 
    //OTHER SONGS FROM THE SEARCHED SONG
    ResultSet resultRecommendation1=recommendation.recomFromAlbum(salbum,sname);
   
    while(resultRecommendation1.next()){   
        alpath=resultRecommendation1.getString("alpath");
%>
<td width="300">
    
    <img class="card-img-top" src="<%=alpath%>">    
    <h5><a href="search.jsp?playn=<%=resultRecommendation1.getString("sname")%>">
                              <%=resultRecommendation1.getString("sname") %>
    </a></h5>           
</td> 
<%
    }
    //resultRecommendation2 HOLD RECOMMENDATION BASED ON THE ARTIST I.E IT WILL RECOMMEND 
    //OTHER ARTIST'S SONGS FROM THE SEARCHED SONG

    ResultSet resultRecommendation2=recommendation.recomFromArtist(sartist,sname);
   
    while(resultRecommendation2.next()){   
        alpath=resultRecommendation2.getString("alpath");
%>
<td width="300">
    <img class="card-img-top" src="<%=alpath%>">
    <h5><a href="search.jsp?playn=<%=resultRecommendation2.getString("sname")%>">
                              <%=resultRecommendation2.getString("sname") %>
    </a></h5>           
</td>   
<%
    }

    //resultRecommendation3 HOLD RECOMMENDATION BASED ON THE GENRE I.E IT WILL RECOMMEND 
    //OTHER SONGS FROM THE GENRE OF THE SEARCHED SONG

    ResultSet resultRecommendation3=recommendation.recomFromGenre(sgenre,sname);
   
    while(resultRecommendation3.next()){ 
        alpath=resultRecommendation3.getString("alpath");
%>
<td width="300">
    <img class="card-img-top" src="<%=alpath%>">
    <h5><a href="search.jsp?playn=<%=resultRecommendation3.getString("sname")%>">
                              <%=resultRecommendation3.getString("sname") %>
    </a></h5>           
</td></tr>    
</table>
<%
    }
}
else{
%>
			<font color='red'>Song NoT Found</font>
<%
		}
    } catch (Exception e) {}

%>

 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>