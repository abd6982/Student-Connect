package com.studentconnect;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Calendar;

public class PostComment extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        
        res.setContentType("text/html");
        
        String fname = "";
        HttpSession session = req.getSession();
        int rno = 0;
        if (session != null) {
            if (session.getAttribute("user") != null) {
                rno = Integer.parseInt((String) session.getAttribute("user"));
            }
        }
        
        String tag = req.getParameter("tag");
       
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
            if(!con.isClosed()){
             
                Statement stmt = con.createStatement();
                stmt.executeUpdate("create table if not exists comment(cid int(10) NOT NULL AUTO_INCREMENT, fname varchar(10), tag varchar(300), sdate date, PRIMARY KEY(cid))");
                ResultSet rs = stmt.executeQuery("select * from t where rno = " + rno);
                
                while(rs.next()){
                fname = rs.getString("fname");
               }
                rs.close();
                
                Calendar calendar = Calendar.getInstance();
                java.sql.Date dateobj = new java.sql.Date(calendar.getTime().getTime());
                String sql = "insert into comment (fname, tag, sdate) VALUES (?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, fname);
                pst.setString(2, tag);
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
