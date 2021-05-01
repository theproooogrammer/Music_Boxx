<%-- 
    Document   : share_songs_remove
    Created on : 26 May, 2020, 2:50:27 PM
    Author     : Acer
--%>

<%@page import="com.musicbox.userAction2.Share_songs"%>
<%@page import="java.sql.ResultSet"%>
<%
    ResultSet result_share_songs_remove = null;

    try {
        String username = (String) session.getAttribute("username");
        String sname = request.getParameter("name");

        Share_songs share_songs = new Share_songs();
        share_songs.deleteShareSong(username, sname);
        response.sendRedirect("share_songs_list.jsp");
        result_share_songs_remove.close();
    } catch (Exception e) {
        System.out.println("share_songs_remove Exception" + e);
    }

%>
