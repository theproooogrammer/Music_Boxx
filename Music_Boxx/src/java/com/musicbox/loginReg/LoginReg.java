package com.musicbox.loginReg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginReg {
   
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public LoginReg() {
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("connection succes");
	}catch(Exception e) {
            System.out.println("!connection succes");
            e.printStackTrace();
	}
    }
    
    
    
    public boolean checkStatus(String uname, String pass) throws SQLException {
	sql="select username,password from user where username='"+uname+"' AND password='"+pass+"'";//('"+songname+"','"+artist+"')
            try {
		PreparedStatement ps=con.prepareStatement(sql);
                ResultSet rs=ps.executeQuery();
		status=rs.next();
            }catch(Exception ex){
                System.out.println("!succes");
	}
	return status;
    }
        
    public ResultSet getname(String username){
        sql="select name from user where username='"+username+"'";
           try {
                PreparedStatement ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
            }catch (Exception e) {} 
        return rs;
    }
	
    public void register(String name,String uname,String password) {
	sql="insert into user values('"+name+"','"+uname+"','"+password+"');";
            try {
		PreparedStatement ps=con.prepareStatement(sql);
		ps.executeUpdate();
		ps.close();
            }catch(Exception e) {
                System.out.println(e);
		e.printStackTrace();
		}
	}
    
}
