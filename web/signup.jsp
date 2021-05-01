<%@page import="com.musicbox.loginReg.LoginReg"%>

<%
    if (session.getAttribute("username") == null) {
%>
<%@include file="header1.jsp" %>
<%
} else {
%>
<%@include file="header2.jsp" %>
<%            }

%>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>MuSIC BoX</title>
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
    </head>
    <body>
        <div style="width:75%;margin-left:20px;margin-top:20px,height 800px,margin-bottom 20px">					
            <div class="panel panel-primary">

                <%                    String name = request.getParameter("name");
                    String uname = request.getParameter("username");
                    String password = request.getParameter("password");
                    System.out.println(name + uname + password);

                %>
                <div class="alert alert-danger" role="alert">Sign Up failed </div>
                <%                try {
                        LoginReg reg = new LoginReg();
                        reg.register(name, uname, password);
                        System.out.println("successfuly inserted");
                        response.sendRedirect("loginUI.jsp");
                    } catch (Exception e) {
                        System.out.println("signup Exception" + e);
                    }
                %>

                <form action="signup.jsp" method="post">
                    <center><h3><label>SIGN UP</label></h3></center>
                    <center>
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="Enter Full Name" name="name" style="width:300px" required>
                        </div>
                    </center>
                    <center>
                        <div class="form-group col-md-6">
                            <input type="text" class="form-control" placeholder="Enter User Name" name="username" style="width:300px" required>
                        </div>
                    </center>
                    <center>
                        <div class="form-group col-md-6">
                            <input type="password" class="form-control" placeholder="Enter Password" name="password" style="width: 300px" required>
                        </div>
                    </center>
                    <center>
                        <button type="submit" class="btn btn-primary" style="width: 300px;">Login</button>
                    </center>
                </form>

            </div>
        </div>
    </body>
</html>