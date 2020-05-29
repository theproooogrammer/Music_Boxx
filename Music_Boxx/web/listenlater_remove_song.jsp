<%@page import="com.musicbox.userAction1.UserAction"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

	if(session.getAttribute("username")==null){
            String var="";
            var=request.getParameter("var");
            session.setAttribute("var",var);
            
            response.sendRedirect("login.jsp");	
	}
        
    //JUST TO REMOVE SONGS FROM LISTEN LATER LIST.
        try {
                String username =(String)session.getAttribute("username");
                String sname=request.getParameter("name");
        
                UserAction userAction=new UserAction();
                userAction.remove_listen_later_songs(username, sname);
                response.sendRedirect("listenlater_viewlist.jsp");
        } catch (Exception e) {
        
        }

%>

