<%@page import="com.musicbox.userAction1.UserAction"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    //VIEW THE SONGS IN THE CORESPONDING PLAYLIST
    //playlist_view_Playlist ---->playlist_view_playlistsongs
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
    //THis Because when this page is redirected from Removeplaylistsong, this page requires session to get playlist songs
    //But it uses getParameter playn when song to be added. 
    String pname = null;
    System.out.println("==================================== ");
    pname = (String) session.getAttribute("playlistname");
    if (pname != null) {
        System.out.println("playlist_view_playlistsongs if" + pname);
    } else {
        pname = request.getParameter("playn");
        System.out.println("playlist_view_playlistsongs else" + pname);
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
            <h1 class="mt-4 mb-3">PlayList Songs</h1>

            <div class="four">
                <!-- Page Heading/Breadcrumbs -->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="home.jsp">Home</a>
                    </li>
                    <li class="breadcrumb-item active"><a href="playlist_view_Playlist.jsp">Playlist</a></li>
                    <li class="breadcrumb-item active">Playlist Songs</li>
                </ol>

                <h4>  PlayList Name: - <%=pname%></h4>    

                <div class="row">

                    <table   class="table ">
                        <thead>
                            <tr class="table-primary">
                                <th scope="col">Song</th>
                                <th scope="col">Artist</th>
                                <th scope="col">      </th>
                                <th scope="col">Remove</th>
                            </tr>
                        </thead>

                        <%
                            //SELECTED PLAYLIST NAME
                            try {

                                session.setAttribute("playlistname", pname);
                                String username = (String) session.getAttribute("username");

                                UserAction actionplaylist = new UserAction();
                                //Same problem arise when song conating 2 artist is added to playlist
                                ResultSet result_playlist_view_playlistsongs1 = actionplaylist.playlist_songs(pname, username);
                                ResultSet result_playlist_view_playlistsongs2 = null;

                                while (result_playlist_view_playlistsongs1.next()) {

                                    String sname = result_playlist_view_playlistsongs1.getString("songname");
                                    result_playlist_view_playlistsongs2 = actionplaylist.song_path(sname);

                                    while (result_playlist_view_playlistsongs2.next()) {
                                        String path = result_playlist_view_playlistsongs2.getString("spath");

                        %>
                        <tr>

                            <td width="30%"><%=result_playlist_view_playlistsongs2.getString("sname")%>  </td>
                            <td width="30%"><a href="artistlist.jsp?name=<%=result_playlist_view_playlistsongs2.getString("sartist")%>">
                                    <%=result_playlist_view_playlistsongs2.getString("sartist")%></a></td>
                            <td width="30%"><audio controls src="<%=path%>"  width="400" height="40"></audio></td>
                            <td width="30%"><a style="color:red" href="playlist_remove_playlistsong.jsp?name=<%=result_playlist_view_playlistsongs2.getString("sname")%>">Remove Song</a></td>

                        </tr>
                        <%
                                    }

                                }
                                result_playlist_view_playlistsongs1.close();
                                result_playlist_view_playlistsongs2.close();
                            } catch (Exception e) {
                                System.out.println("playlist_view_playlistsongs Exception" + e);
                            }

                        %>
                    </table>

                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
