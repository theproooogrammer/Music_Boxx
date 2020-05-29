<%@page import="com.musicbox.userAction1.UserAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    //ADD THE SONGS TO LSTEN LATER AND REDIRRECTING TO THE PAGE FROM WHICH THE SONG HAS BEEN REQUESTED TO ADD TO LIST
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

    if(session.getAttribute("username")==null){
            String var="";
            var=request.getParameter("var");
            session.setAttribute("var",var);
            response.sendRedirect("login.jsp");	
    }
       
    String name = request.getParameter("username");
       
    try{
            UserAction userAction=new UserAction();
            String username =(String)session.getAttribute( "username" ) ;
            String songname=request.getParameter("songn");
            userAction.create_listen_later(songname,username);

            //THIS VARIABLE IS SET SO THAT PAGE FROM WHICH IT HAS BEEN CALLED CAN BE REMEMBERED
            String var=request.getParameter("var");;

            if(var.equals("albumlist"))
                response.sendRedirect("albumlist.jsp");
            else if(var.equals("artistlist"))
                response.sendRedirect("artistlist.jsp");
            else if(var.equals("genrelist"))
                response.sendRedirect("genrelist.jsp");	
            
    }catch(Exception ex){
         System.out.println("not done");
    }
%>          


