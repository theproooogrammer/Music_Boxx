<%@page import="com.musicbox.userAction1.UserAction"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%

            try {
                String pname = (String) session.getAttribute("playlistname");
                String username = (String) session.getAttribute("username");
                String sname = request.getParameter("name");

                UserAction userAction = new UserAction();
                userAction.remove_playlist_song(pname, username, sname);
                response.sendRedirect("playlist_view_playlistsongs.jsp");
            } catch (Exception e) {
                System.out.println("playlist_remove_playlistsong Exception" + e);
            }

        %>


    </body>
</html>
