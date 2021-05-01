<%@page import="com.musicbox.userAction2.Share_songs"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

    if (session.getAttribute("username") == null) {

        response.sendRedirect("login.jsp");
    }
    String name = request.getParameter("username");

    ResultSet result_share_add_toDB = null;
    try {

        String senderusername = (String) session.getAttribute("username");
        String songname = (String) session.getAttribute("songn");
        String receiverusername = request.getParameter("rusername");

        Share_songs share_songs = new Share_songs();
        share_songs.addShareSong(senderusername, receiverusername, songname);

        String var = "";
        var = (String) session.getAttribute("var");

        if (var.equals("albumlist")) {
            response.sendRedirect("albumlist.jsp");
        } else if (var.equals("artistlist")) {
            response.sendRedirect("artistlist.jsp");
        } else if (var.equals("genrelist")) {
            response.sendRedirect("genrelist.jsp");
        }

        //connection_playlist_insert_playlist.close();
        //psInsert_playlist_insert_playlist.close();
    } catch (Exception e) {
        System.out.println("share_add_toDB Exception" + e);
    }


%>	
