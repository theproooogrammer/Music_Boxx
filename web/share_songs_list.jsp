<%@page import="com.musicbox.userAction1.UserAction"%>
<%@page import="com.musicbox.actions.Action"%>
<%@page import="com.musicbox.userAction2.Share_songs"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    if (session.getAttribute("username") == null) {
%>
<%@include file="header1.jsp" %>
<%
} else {
%>
<%@include file="header2.jsp" %>
<%            }

    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

    if (session.getAttribute("username") == null) {

        String var = "";
        var = request.getParameter("var");
        session.setAttribute("var", var);
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

</head>
<body>
    <div class="container">
        <div class="four">
            <!-- Page Heading/Breadcrumbs -->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="home.jsp">Home</a>
                </li>
                <li class="breadcrumb-item active">Suggestion</li>
            </ol>
        </div>
        <div>
            <table   class="table ">
                <thead >
                <h4>  Shared Songs To You</h4><br>    
                <tr class="table-primary">
                    <th scope="col">Shared from</th>
                    <th scope="col">Song</th>
                    <th scope="col">      </th>
                    <th scope="col">Remove</th>
                </tr>
                </thead>
                <%    //Request for this page is donwe from header of website
                    //this displays the list all the share song to users
                    Connection connection = null;
                    PreparedStatement psSelect = null;
                    ResultSet result = null;
                    ResultSet result2 = null;
                    try {
                        Share_songs share_songs = new Share_songs();
                        UserAction userAction = new UserAction();
                        String receiverusername = (String) session.getAttribute("username");
                        result = share_songs.shareSongList(receiverusername);

                        while (result.next()) {
                            String sname = result.getString("songname");
                            result2 = userAction.song_path(sname);
                            while (result2.next()) {

                %>
                <tr>
                    <td width="30%"><%=result.getString("senderusername")%>  </td>
                    <td width="30%"><%=result2.getString("sname")%></td>
                    <td width="30%"><embed src="<%=result2.getString("spath")%>" autoplay="false" autostart="false" width="400" height="40" ></td>
                    <td width="30%"><a style="color:red" href="share_songs_remove.jsp?name=<%=result2.getString("sname")%>">Remove Song</a></td>
                </tr>
                <%
             }
         } %>
            </table>
        </div>
    </div>
    <%

        } finally {
            if (psSelect != null) {
                psSelect.close();
            }
            if (connection != null) {
                connection.close();
            }
            if (result != null) {
                result.close();
            }
        }
    %>
    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>