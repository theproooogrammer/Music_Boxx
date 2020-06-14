
<%@page import="com.musicbox.userAction2.RecentlyPlayed"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Auricle</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" />
<link rel="stylesheet" type="text/css" href="/_c/3.0.ie.css" media="all" />
<link rel="stylesheet" type="text/css" href="/_c/3.0.ie-old.css" media="all" />
<link rel="stylesheet" type="text/css" href="/_c/3.0.ie-legacy.css" media="all" />
    	
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script type="text/javascript">jwplayer.key="p6yWMlKPlqdT3DqwJynNnvI4YNAIFrAQ6BZqQw==";</script>		
	        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" />
	        
    	<link rel="stylesheet" type="text/css" href="/_c/3.0.ie.css" media="all" />
    	
        
    	<link rel="stylesheet" type="text/css" href="/_c/3.0.ie-old.css" media="all" />
    	
    
    	<link rel="stylesheet" type="text/css" href="/_c/3.0.ie-legacy.css" media="all" />
    	

  </head>

  <body>


    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">
          
          <table>
              <tr>
              <h3>
                 <a href ="recently_searched.jsp">Recently Searched + </a> 
              </h3>
              </tr>
          </table>
          
         
        
      </h1>

      <ol class="breadcrumb">
       
        
      </ol>
<%
        int countRS=1;
        try {
                       ResultSet resultRS1=null;
                       RecentlyPlayed recentlyPlayed=new  RecentlyPlayed();
                       String username =(String)session.getAttribute("username") ;
                       ResultSet resultRS=recentlyPlayed.get_recently_played(username);
                        
                        
                
        %>
        <div class="row">
        <%
            String alpath;
           
             while(resultRS.next()){
                 
                 String sname=resultRS.getString("sname");
                 resultRS1=recentlyPlayed.get_songfrom_sname(sname);
                 while(resultRS1.next()){
                            
                        alpath=resultRS1.getString("alpath"); 
                         if(countRS<5){
                           
     %>
        <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
    <div class="card h-100">
          
                <a href="search.jsp?playn=<%=resultRS1.getString("sname")%>" style="height:100% ;"</a>
                <img class="card-img-top" src="<%=alpath%>"></a>
            <div class="card-body">
    
                   <a href="search.jsp?playn=<%=resultRS1.getString("sname")%>"><%=resultRS1.getString("sname") %></a></a>
  
              
           
            </div>
          </div>
        </div>
       <%          }
 countRS++; 
                }

                          
		} 
       %>
       
       
    </div>
              
</div>

 <%         
     }catch(Exception e) {
     System.out.println("eeee"+e);
    }

%>

    </body>
</html>