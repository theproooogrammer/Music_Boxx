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
public class RecentlyPlayed {
    
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public RecentlyPlayed() {
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("connection succes");
	}catch(Exception e) {
            System.out.println("!connection succes");
            e.printStackTrace();
	}
    }
    
    public void recently_played(String sname,String username){
            sql="insert into recentlyplayed(sname,username)values('"+sname+"','"+username+"')";
            try {
                
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
                System.out.println("this is recently_search jsp");
                
            } catch (Exception e) {System.out.println("e1"+e);}
        }
        
        public ResultSet get_recently_played(String username){
            sql="select * from recentlyplayed where username='"+username+"' ORDER BY sno desc limit 10";
            try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            } catch (Exception e) {System.out.println("e2"+e);}
            return rs;
        }
        
        public ResultSet get_songfrom_sname(String sname){
            
            String sql="select * from songs where sname='"+sname+"' ";
            try {
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            } catch (Exception e) {System.out.println("e3"+e);}
            
            return rs;
        }
        
        public void remove_recently_searched(String username){
            sql="delete from recentlyplayed where username='"+username+"' ";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                ps.executeUpdate();
            }catch (Exception e) {System.out.println("e4"+e);}
        }
    
}
