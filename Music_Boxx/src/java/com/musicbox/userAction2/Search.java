package com.musicbox.userAction2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Search {
        
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public Search() {
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("connection succes for Search");
	}catch(Exception e) {
            System.out.println("!connection succes for Search");
            e.printStackTrace();
	}
    }
    
    public ResultSet search_song(String sname){
            sql="select * from songs where sname LIKE '" + "%"+ sname + "%" +"'";
           try {
                PreparedStatement ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
               
                System.out.println("search_song(String sname)");
            } catch (Exception e) {
               System.out.println("search_song(String sname)"+e);
            }
           
           
            return rs;
        }
    
    public void search_table(String sartist,String username,int count){
            sql="insert into search values('"+sartist+"','"+username+"',"+count+");";
            try {
                
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
                
            } catch (Exception e) {}
        }
         
        public ResultSet count(String sartist,String username){
           sql="select count from search where sartist='"+sartist+"' and username='"+username+"' ";
            
           try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            } catch (Exception e) {}
            return rs;
        }
        
        public void updatecount(String sartist,String username,int count){
            sql="update search set count="+count+" where sartist='"+sartist+"' AND username='"+username+"'; ";
           
            try {
                
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
                
            } catch (Exception e) {}
        }
        
        public boolean present(String sartist,String username){
            sql="select sartist,username from search where sartist='"+sartist+"' and username='"+username+"' ";
            
            try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
                status=rs.next();
            } catch (Exception e) {}
            return status;
           
        }
}
