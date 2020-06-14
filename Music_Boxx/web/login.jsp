
<%@page import="com.musicbox.loginReg.LoginReg"%>
                          
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
    .one{
        margin-left: 410px;
        margin-top: 10px;
    } 
    .two
    {
        
margin-top: 100px;
    
   
    }
    </style>
	</head>
<%
    
			String uname=request.getParameter("userName");
			String pass=request.getParameter("password");
                        
                        LoginReg reg=new LoginReg();
                        boolean status=reg.checkStatus(uname, pass);
                        System.out.println(uname);
                        System.out.println(pass);
                        System.out.println(status);
			try{
			
			if(uname.equals("admin") && pass.equals("admin")) {
				HttpSession session2=request.getSession();
				session.setAttribute("username", uname);
				response.sendRedirect("admin.jsp");
			}
				
			else if(status){
				HttpSession session2=request.getSession();
				session.setAttribute("username", uname);
                            
                                String var=(String)session.getAttribute("var");
                                System.out.println("loginVar"+var);
                                int count=0;
                                
                                if(var.equals("albumlist")){
                                response.sendRedirect("albumlist.jsp");
                                }else if(var.equals("artistlist")){
                                response.sendRedirect("artistlist.jsp");
                                }else if(var.equals("genrelist")){
                                response.sendRedirect("genrelist.jsp");
                                }else if(var.equals("viewPlaylist")){
                                response.sendRedirect("playlist_view_Playlist.jsp");
                                }else if(var.equals("listenlaterlist")){
                                response.sendRedirect("listenlater_viewlist.jsp");
                                }else if(var.equals("suggestlist")){
                                response.sendRedirect("suggestlist.jsp");
                                }else if(var.equals("loginUI")){
                                response.sendRedirect("user.jsp");    
                                }
                                
				
                                
			}
			else {
                            %>

		
                            <%
				
			}
		   }
		   catch(Exception e) {
				e.printStackTrace();
			}	
		   
		   
		%>
	
	<body>
            <div class="container">
                <div class="two">
        <form action="login.jsp" method="post">
               <center><h3><label>Login</label></h3></center>
     <center><div class="form-group col-md-6">
             <input type="text" class="form-control" placeholder="Enter User Name" name="userName" style="width:300px" required>
    </div></center>
      <center><div class="form-group col-md-6">
              <input type="password" class="form-control" placeholder="Enter Password" name="password" style="width: 300px" required>
  </div></center>
               <center><button type="submit" class="btn btn-primary" style="width: 300px;">Login</button></center>
</form>
                    <div class="one">
                      New Users.? Sign Up <a href="signupUI.jsp">Here</a>
                  </div>
                </div>
            </div>
        </body>
</html>