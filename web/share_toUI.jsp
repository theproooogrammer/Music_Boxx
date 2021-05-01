
<%@page import="com.musicbox.userAction2.Share_songs"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>


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
    <%    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

        if (session.getAttribute("username") == null) {

            response.sendRedirect("login.jsp");
        }
        String name = request.getParameter("username");

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

        </head>
        <style>
            .five{
                width:700px;
                height:100px;
            }
            .four{
                margin-top: 10px;
            }
        </style>
        <style>                .img-style{
                display:block;
                magin-left:40px;
                margin-right:90px;
                margin-top:20px;
                margin-bottom:30px;

            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="five">
            </div>
            <div class="four">
                <!-- Page Heading/Breadcrumbs -->

                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="home.jsp">Home</a>
                    </li>
                    <li class="breadcrumb-item active">Suggestion</li>

                </ol>
            </div>
            <h4>  <%=session.getAttribute("username")%></h4>

            <div style="width:80%;height:600px;margin-left:20px;margin-top:20px">
                <div class="panel panel-primary">
                    <div class="panel-heading">

                        <%
//From any album,artist or gener 
//share_toUI--->share_add_toDB---->Redirect To From very request is done
                            try {

                                String var = "";
                                var = request.getParameter("var");
                                session.setAttribute("var", var);

                                String username = (String) session.getAttribute("username");
                                String songname = request.getParameter("songn");
                                session.setAttribute("songn", songname);
                        %>

                        <div class="panel-body">
                            <h5>Suggest to:-</h5> 
                            <form action="share_add_toDB.jsp" method="post">
                                <div class="form-group">
                                    <!--<input type=disable class="form-control" style="width:80%" disabled="disabled" value="request.getParameter("songn")%>"></input>
                                    <label for="disabled">request.getParameter("songn")%></label><br>-->
                                    <input type="email" class="form-control" style="width:80%" placeholder="enter username" name="rusername" required="required"></input>
                                </div>

                                <div class="form-group" >
                                    <button type="submit" class="btn btn-default" style="width:80%" >Suggest</button>
                                </div>
                            </form>
                        </div>

                        <div>
                            <table class="table ">
                                <thead >
                                    <tr class="table-primary">
                                        <th scope="col">Sent To</th>
                                        <th scope="col">Song </th>
                                    </tr>
                                </thead>
                                <tr >

                                    <%
                                        ResultSet result_share_toUI = null;
                                        Share_songs share_songs = new Share_songs();
                                        result_share_toUI = share_songs.sendHistory(username);
                                        while (result_share_toUI.next()) {
                                    %>

                                <h5><td><%=result_share_toUI.getString("receiverusername")%></td></h5>
                                <h5><td><%=result_share_toUI.getString("songname")%></td></h5>
                                </tr>             
                                <%
                                    }
                                %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%                    } catch (Exception e) {
            System.out.println("share_toUI Exception" + e);
        }
    %>  
</body>
</html>