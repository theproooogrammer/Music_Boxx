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


public class Recommendation {
    
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public Recommendation() {
        
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("connection succes");
	}catch(Exception e) {
            System.out.println("Recommendation NOT connection succes");
            e.printStackTrace();
	}
        
    }
    
    public ResultSet recomFromAlbum(String album,String name){
        sql="select * from songs where (salbum='"+album+"' AND sname <> '"+name+"') order by rand() limit 2; ";
            
        try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
        } catch (Exception e) {System.out.println("Recommendation recomFromAlbum"+e);}
            
        return rs;    
    }
    
    public ResultSet recomFromArtist(String artist,String name){
        sql="select * from songs where (sartist='"+artist+"' AND sname <> '"+name+"') order by rand() limit 1; ";
            
        try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
        } catch (Exception e) {System.out.println("Recommendation recomFromArtist"+e);}
            
        return rs;    
    }
    
    public ResultSet recomFromGenre(String genre,String name){
        sql="select * from songs where (sgenre='"+genre+"' AND sname <> '"+name+"') order by rand() limit 1;";
           
        try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
        } catch (Exception e) {System.out.println("Recommendation recomFromGenre"+e);}
            
        return rs;    
    }
    
    
}
