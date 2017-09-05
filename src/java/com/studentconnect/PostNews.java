package com.studentconnect;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Calendar;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(maxFileSize = 16177215)
public class PostNews extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        
        res.setContentType("text/html");
        
        HttpSession session = req.getSession();
        
        String news = req.getParameter("news");
        InputStream is = null;
        
        Part filePart = req.getPart("photo");
        if (filePart != null) {
            is = filePart.getInputStream();
        }
       
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
            if(!con.isClosed()){
             
                Statement stmt = con.createStatement();
                stmt.executeUpdate("create table if not exists n(nid int(10) NOT NULL AUTO_INCREMENT, news varchar(250), photo mediumblob, pdate date, PRIMARY KEY(nid))");
                
               
                
                Calendar calendar = Calendar.getInstance();
                java.sql.Date dateobj = new java.sql.Date(calendar.getTime().getTime());
                String sql = "insert into n (news, photo, pdate) VALUES (?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, news);
                if(is != null){
                    pst.setBlob(2, is);
                }
                pst.setDate(3, dateobj);
                pst.executeUpdate();
                
                res.sendRedirect("news.jsp");
            }
            con.close();
        }catch(ClassNotFoundException c){
            System.out.println(c);
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
