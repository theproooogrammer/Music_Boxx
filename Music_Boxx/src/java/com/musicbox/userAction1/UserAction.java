package com.musicbox.userAction1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//THIS CLASS CONTAINS THE USER ACTION I.E CREATION ON PLAYLIST ,LISTEN LATER
public class UserAction {
    
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public UserAction() {
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("connection succes");
	}catch(Exception e) {
            System.out.println("!connection succes");
            e.printStackTrace();
	}
    }
    
    public void create_playlist(String pname,String username,String songname){
            sql="insert into playlist(pname,username,songname)values('"+pname+"','"+username+"','"+songname+"')";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
    
    public ResultSet playlist_songs(String pname,String username){
             sql="select songname from playlist where pname='"+pname+"' AND username='"+username+"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
           return rs;
         }
    
    public ResultSet view_playlist(String username){
            sql="select DISTINCT pname from playlist where username='"+username+"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
            
            return rs;
        }
        
        public void insert_playlist(String pname,String username,String songname){
            sql="insert into playlist(pname,username,songname)values('"+pname+"','"+username+"','"+songname+"')";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
        
        public ResultSet song_path(String sname){
             sql="select sname,spath,sartist from songs where sname='"+sname+"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
                
            }catch(Exception e){}
            return rs;
         }
        
        public void remove_playlist(String pname,String username){
            sql="delete from playlist where pname='"+pname+"' and username='"+username+"' ";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
        
        public void remove_playlist_song(String pname,String username,String sname){
            sql="delete from playlist where pname='"+pname+"' and username='"+username+"' and songname='"+sname+"' ";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
    //=======================================================================================
        
        public void create_listen_later(String songname,String username){
            sql="insert into listenlater values('"+songname+"','"+username+"')";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
           
        public ResultSet listen_later_songs(String username){
             sql="select sname from listenlater where username='" +username+ "'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
           return rs;
         }
            
        public void remove_listen_later_songs(String username,String sname){
            sql="delete from listenlater where username='"+username+"' and sname='"+sname+"' ";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
        
}
