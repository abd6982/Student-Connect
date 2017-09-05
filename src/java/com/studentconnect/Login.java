package com.studentconnect;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        
        res.setContentType("text/html");
        
        int flag = 0;
        String p;
        int n;
        
        int rno = Integer.parseInt(req.getParameter("rno"));
        String pass = req.getParameter("pass");
        
        if(rno == 12345){
             HttpSession session = req.getSession(true); 
			session.setAttribute("user", Integer.toString(rno));
			session.setMaxInactiveInterval(30);
            res.sendRedirect("postnews.html");
         }
        
        PrintWriter out = res.getWriter();
        out.print("<html><body>");
        out.print("<b>Servlet Started</b>");
        
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:///student", "root", "root");
            if(!con.isClosed()){
                System.out.println("Connected to MySQL");
            
                Statement stmt=con.createStatement();  
                
                ResultSet rs = stmt.executeQuery("select * from t");  
                while(rs.next()){
         n = rs.getInt("rno");
         p = rs.getString("pass");

         
         if(n == rno && pass.equals(p)){
             flag = 1;
             break;
         }
      }
      rs.close();
            
            }
            con.close();
        }catch(ClassNotFoundException c){
            System.out.println("Class was not found");
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        if(flag == 1){
            HttpSession session = req.getSession(true); 
			session.setAttribute("user", Integer.toString(rno));
			session.setMaxInactiveInterval(30);
            res.sendRedirect("home.jsp");
        }
       out.print("</body></html>");
        
    }
}
