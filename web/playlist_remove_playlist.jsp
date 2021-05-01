<%@page import="com.musicbox.userAction1.UserAction"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <%

            try {
                String username = (String) session.getAttribute("username");
                String pname = request.getParameter("playn");
                UserAction userAction = new UserAction();
                userAction.remove_playlist(pname, username);
                response.sendRedirect("playlist_view_Playlist.jsp");
            } catch (Exception e) {
                System.out.println("playlist_remove_playlist Exception" + e);
            }

        %>


    </body>
</html>
