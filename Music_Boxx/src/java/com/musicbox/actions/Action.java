package com.musicbox.actions;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Action {
    
    String url="jdbc:mysql://Localhost:3306/music_box";
    String user1="root";
    String pass1="root"; 
    
    String sql;
    public boolean status=false; 
    ResultSet rs=null;	
    ResultSet rs1=null;
    Connection con ;

    public Action() {
        try {
		Class.forName("com.mysql.jdbc.Driver");	
		con = DriverManager.getConnection(url,user1,pass1);
		System.out.println("class Action connection succes");
	}catch(Exception e) {
            System.out.println("class Action !connection succes");
            e.printStackTrace();
	}
    }
    
    public void song_insert(String sname,String sartist, String arpath,String salbum,String alpath,String sgenre,String grpath,String spath){
        sql="insert into songs(sname,sartist,arpath,salbum,alpath,sgenre,grpath,spath) values('"+sname+"','"+sartist+"','"+arpath+"','"+salbum+"','"+alpath+"','"+sgenre+"','"+grpath+"','"+spath+"') ;";
            //sql="insert into s values('"+ spath +"');";
            try {
		PreparedStatement ps=con.prepareStatement(sql);
		ps.executeUpdate();
                ps.close();
            }
            catch(Exception e) {
			e.printStackTrace();
            }
        }
    /*
    public String store_spath(String spath){
            
        String a,b;
        a=spath.substring(61,66);
        a=a.concat("\\");
        System.out.println(a);
	b=spath.substring(66);
	System.out.println(b);
	spath=a.concat(b);
        return spath;
    }
    
    public String store_imgpath(String ipath){
            
        String a,b;
        a=ipath.substring(61,64);
        a=a.concat("\\");
        System.out.println(a);
	b=ipath.substring(64);
	System.out.println(b);
	ipath=a.concat(b);
        return ipath;
    }*/
    
    public String store_songPath(String spath){
           
        //spath=spath.replaceAll("/", "//"); 
        
        String temp="Songs_Info//songs";
        temp=temp.concat("//");
        spath=temp.concat(spath);  
        
        return spath;
    }
    
    public String store_albumImgPath(String ipath){
            
        //ipath=ipath.replaceAll("/","//");
        String temp="Songs_Info//Album_img";
        temp=temp.concat("//");
        ipath=temp.concat(ipath);
        return ipath;
    }
    
    public String store_artistImgPath(String ipath){
            
        //ipath=ipath.replaceAll("/","//");
        String temp="Songs_Info//Artist_img";
        temp=temp.concat("//");
        ipath=temp.concat(ipath);
        return ipath;
    }
    
    public String store_genreImgPath(String ipath){
            
        //ipath=ipath.replaceAll("/","//");
        String temp="Songs_Info//Genre_img";
        temp=temp.concat("//");
        ipath=temp.concat(ipath);
        return ipath;
    }
    
    

    
    public ResultSet album(){
            sql="select distinct salbum ,alpath from songs order by salbum asc";
            //select distinct salbum from songs order by salbum asc 
            try {
                PreparedStatement ps= con.prepareStatement(sql);
               rs=ps.executeQuery();
            } catch (Exception e) {}
            return rs;
        }
        
        public ResultSet albumList(String name){
            sql="select distinct sname,salbum,spath,alpath from songs where salbum='"+name+"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
            
            return rs;
        }
        
        public ResultSet artist(){
            sql="select distinct arpath,sartist from songs order by sartist asc";
            try {
                PreparedStatement ps= con.prepareStatement(sql);
               rs=ps.executeQuery();
            } catch (Exception e) {}
            return rs;
        }
        
        public ResultSet artistList(String name){
            sql="select * from songs where sartist='"+name+"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
            
            return rs;
        }
        
        public ResultSet genre(){
            sql="select distinct grpath,sgenre from songs order by sgenre asc ";
            try {
                PreparedStatement ps= con.prepareStatement(sql);
               rs=ps.executeQuery();
            } catch (Exception e) {}
            return rs;
        }
        
        public ResultSet genreList(String name){
            sql="select distinct sname,sgenre,grpath,spath from songs where sgenre='"+name+"'";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}
            
            return rs;
        }
        
        public ResultSet viewAllSongs(){
            sql="select * from songs";
            try{
                PreparedStatement ps=con.prepareStatement(sql);
                rs=ps.executeQuery();
            }catch(Exception e){}       
            return rs;
        }
        
}
