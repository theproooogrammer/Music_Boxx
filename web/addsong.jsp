<%@page import="com.musicbox.actions.Action"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
          
<%

try{
    
                String sname=new String(request.getParameter("songname"));
		String sartist=request.getParameter("artist");
                String arpath =new String (request.getParameter("artistp"));
                String salbum=request.getParameter("album");
                String alpath =new String (request.getParameter("albump"));
                String sgenre=request.getParameter("genres");
                String grpath =new String (request.getParameter("genresp"));
                String spath=new String (request.getParameter("songp"));
                
                
                
                Action action=new Action();
                
                arpath=action.store_artistImgPath(arpath);
                alpath=action.store_albumImgPath(alpath);
                grpath=action.store_genreImgPath(grpath);
                spath=action.store_songPath(spath);
                
                System.out.println(arpath);
                System.out.println(alpath);
                System.out.println(grpath);
                System.out.println(spath);
                action.song_insert(sname, sartist,arpath, salbum,alpath, sgenre,grpath,spath);
                System.out.println("successfuly inserted");
                System.out.println("successfuly inserted");
                response.sendRedirect("addsongUI.jsp");

}
catch(Exception ex){
     System.out.println("not done"+ex);
			
		}
	
		
	
	%>	
		