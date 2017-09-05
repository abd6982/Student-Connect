package com.studentconnect;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class CreateAccount extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
        
        res.setContentType("text/html");
        
        int flag = 0;
        String n;
        
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        int rno = Integer.parseInt(req.getParameter("roll"));
        String pass = req.getParameter("pass");
        String univ = req.getParameter("univ");
        String college = req.getParameter("college");
        String sex = (req.getParameter("sex"));
        
        InputStream is = null;
        //File image = new File("D:/image.jpg");
        //is = new FileInputStream(image);
        Part filePart = req.getPart("image");
        if (filePart != null) {
            is = filePart.getInputStream();
        }
        
        PrintWriter out = res.getWriter();
        out.print("<html><body>");
        out.print("<b>Servlet Started</b>");
        out.print("<p>" + rno + "</p>");
      
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
            if(!con.isClosed()){
                System.out.println("Connected to MySQL");
            
                Statement stmt=con.createStatement();  
                stmt.executeUpdate("create table if not exists t(id int(10) NOT NULL AUTO_INCREMENT, fname varchar(10), lname varchar(10), rno int(10), univ varchar(25), college varchar(25), sex varchar(5), pass varchar(20), photo mediumblob, PRIMARY KEY(id))");
                String sql = "insert into t (fname, lname, rno, univ, college, sex, pass, photo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, fname);
                pst.setString(2, lname);
                pst.setInt(3, rno);
                pst.setString(4, univ);
                pst.setString(5, college);
                pst.setString(6, sex);
                pst.setString(7, pass);
                if(is != null){
                    pst.setBlob(8, is);
                }
                //pst.setBinaryStream(8, (InputStream)is, (int)(image.length()));
                int i = pst.executeUpdate();
                if(i > 0){
                        HttpSession session = req.getSession(true); 
			session.setAttribute("user", Integer.toString(rno));
			session.setMaxInactiveInterval(300);
                        res.sendRedirect("home.jsp");
                }
                else{
                        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			out.println("<font color=red>One or more fields was incorrect.</font>");
			rd.include(req, res);
                }
                out.print("<p>Account successfully created.</p>");
            }
            con.close();
        }catch(ClassNotFoundException c){
            System.out.println(c);
        }
        catch(Exception e){
            System.out.println(e);
        }
       out.print("</body></html>");
        
    }
}
