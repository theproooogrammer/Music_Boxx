<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    //VIEW TOTAL PLAYLISTS THAT THE USERS HAS.
    //playlist_view_Playlist ---->playlist_view_playlistsongs
    //I.E THE CORESPONDING SONGS IN THE SELECTED PLAYLIST CAN BE DISPLAYED

    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

    if (session.getAttribute("username") == null) {
        String var = "";
        var = request.getParameter("var");
        session.setAttribute("var", var);

        response.sendRedirect("login.jsp");
    }
    String name = request.getParameter("username");

%>

<%    if (session.getAttribute("username") == null) {
%>
<%@include file="header1.jsp" %>
<%
} else {
%>
<%@include file="header2.jsp" %>
<%            }

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
            <h1 class="mt-4 mb-3">PlayLists</h1>

            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="home.jsp">Home</a>
                </li>
                <li class="breadcrumb-item active">PlayLists</li>
            </ol>

            <div class="row">

                <%    Connection connection_playlist_view_Playlist = null;
                    PreparedStatement ps_playlist_view_Playlist = null;
                    ResultSet result_playlist_view_Playlist = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connection_playlist_view_Playlist = DriverManager.getConnection("jdbc:mysql://localhost/music_box", "root", "root");

                        String username = (String) session.getAttribute("username");
                        String songname = request.getParameter("songn");

                        session.setAttribute("songn", songname);

                        ps_playlist_view_Playlist = connection_playlist_view_Playlist.prepareStatement("select DISTINCT pname from playlist where username='" + username + "'");
                        result_playlist_view_Playlist = ps_playlist_view_Playlist.executeQuery();
                        //TO ADD PLAYLIST COUNT
                        int count = 1;
                        while (result_playlist_view_Playlist.next()) {

                %>
                <img width="220" height="150" src="img/dilwale.jpg">
                <div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <div class="card-body">

                            <h1></h1>
                            <br><table>
                                <tr>
                                    <td width="200"><h5>PlayList <%=count%></h5></td>
                                    <td><a style="color:red" href="playlist_remove_playlist.jsp?playn=
                                           <%=result_playlist_view_Playlist.getString("pname")%>">Delete</a></td>
                                </tr>

                            </table>

                            </h4>
                        </div>
                    </div>
                </div>
                <%
                        count++;
                    }
                    count = 1;
                %>      

            </div>

        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
                connection_playlist_view_Playlist.close();
                ps_playlist_view_Playlist.close();
                result_playlist_view_Playlist.close();
            } catch (Exception e) {
            }
        %>         
    </body>

</html>
