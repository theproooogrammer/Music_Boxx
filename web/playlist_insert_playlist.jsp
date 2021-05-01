<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="header2.jsp" %>
<%//SIMPLY ADD THE SONG TO THE DATABSE 
    // albumlist---->playlist_addSong----------->playlist_insert_playlist
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    Connection connection_playlist_insert_playlist = null;
    PreparedStatement psInsert_playlist_insert_playlist = null;
    try {
        String pname = null;
        String pname1 = null;
        String pname2 = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection_playlist_insert_playlist = DriverManager.getConnection("jdbc:mysql://localhost/music_box", "root", "root");
        username = (String) session.getAttribute("username");
        String songname = (String) session.getAttribute("songn");

        pname1 = request.getParameter("newplayname");
        pname2 = request.getParameter("playn");

        if (pname1 == null) {
            pname = pname2;
        } else if (pname2 == null) {
            pname = pname1;
        }

        String query = "insert into playlist values('" + pname + "','" + username + "','" + songname + "')";
        psInsert_playlist_insert_playlist = connection_playlist_insert_playlist.prepareStatement(query);
        psInsert_playlist_insert_playlist.executeUpdate();

        String var = (String) session.getAttribute("var");

        if (var.equals("albumlist")) {
            response.sendRedirect("albumlist.jsp");
        } else if (var.equals("artistlist")) {
            response.sendRedirect("artistlist.jsp");
        } else if (var.equals("genrelist")) {
            response.sendRedirect("genrelist.jsp");
        } else if (var.equals("search")) {
            response.sendRedirect("search.jsp");
        }

        connection_playlist_insert_playlist.close();
        psInsert_playlist_insert_playlist.close();
    } catch (Exception e) {
        System.out.println("playlist_insert_playlist Exception "+e);
    }


%>
