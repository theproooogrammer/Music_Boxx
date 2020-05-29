/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.musicbox.userAction2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Acer
 */
public class Share_songs {
    
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public Share_songs() {
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("connection succes");
	}catch(Exception e) {
            System.out.println("!connection succes");
            e.printStackTrace();
	}
    }
    
    public ResultSet sendHistory(String senderusername){
            
      sql="select receiverusername,songname from share where senderusername='"+senderusername+"' ";
            try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            } catch (Exception e) {System.out.println("get_recently_played"+e);}
            return rs;
    }
    
    public void addShareSong(String senderusername,String receiverusername,String songname){
        sql="insert into share(senderusername,receiverusername,songname)values('"+senderusername+"','"+receiverusername+"','"+songname+"')";
            try {
                
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
                
                
            } catch (Exception e) {System.out.println("addShareSong"+e);}
        }
    
    public ResultSet shareSongList(String receiverusername){
             sql="select senderusername,songname from share where receiverusername='" + receiverusername +"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
           return rs;
         }
        
    public void deleteShareSong(String username,String sname){
            sql="delete from share where receiverusername='"+username+"' and songname='"+sname+"' ";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch(Exception e){}   
        }
}
