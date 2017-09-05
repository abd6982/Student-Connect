<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<body>
    <%
        if (session != null) {
            if (session.getAttribute("user") != null) {
                String name = (String) session.getAttribute("user");
                                String fname = "def", lname = "def";
                                int r = 0, flag = 0;
                             Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:///student", "root", "root");
            if(!con.isClosed()){
                System.out.println("Connected to MySQL");
            
                Statement stmt=con.createStatement();  
                
                
               int rno = Integer.parseInt((String) session.getAttribute("user"));
               ResultSet rs = stmt.executeQuery("select * from t");  
                while(rs.next()){
         //Retrieve by column name
         fname = rs.getString("fname");
         lname = rs.getString("lname");
         r = rs.getInt("rno");

         if(r == rno){
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
    %>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
          <script type="text/javascript">
		 
		  $(function(){
		  setTimeout(function(){
		  $('.h').removeClass('hidden');
		  },200);
		  })();
		  
		  </script>
                  <div><style>
*{
   margin:0px;
   padding:0px;
}
body{
       background-size:100% 100%;
       background-attachment: fixed;
       font-family:Courier;
	   color:white;
	   background-image:url("img/newsf.jpg");
    }
header{
        position:fixed;
        width:100%;
        height:20%;
        background-color:orange;
	    box-shadow:0px 4px 5px rgb(100,30,0);
      }
	  #head{
        position:fixed;
        width:100%;
        height:120px;
        background-color:black;
	    box-shadow:0px 5px 5px rgb(100,30,0);
      }
      
	      div#info
	  {
	  width:300px;
	  height:90px;
	  position:relative;
	  top:-80px;
	  left:70%;
	  }
 div#main
   {
    position:static;
	margin-left:2%;
	width: 96%;
    background-color:rgba(10,10,10,.5);
	box-shadow:0px 10px 10px rgb(100,100,100);
   }
 div.mainnews
   {
    position:static;
	padding-top:140px;
	margin-left:3%;
	width: 94%;
    background-color:rgba(255,165,10,.5);
	box-shadow:0px 10px 10px rgb(100,100,100);
   }
  
#table
{
margin-left:1%;
width:98%;
height:100%;
background: linear-gradient(to bottom right, white, #bcbdc4);

}
.h
{
	opacity:1;
	transition:all 2.5s ease;
}
	 #enter
		 {   
		     margin-left:10%;
			 width:80%;
			 background-color:rgba(10,10,10,.7);
			 border-radius:5px;
			 
		 }
 #newfeedintag
		 {   
		     margin-left:10%;
			 width:80%;
		     height:30px;
			 background-color:rgba(10,10,10,.7);
			border:0px;
		 }

		 #submit{
			 margin-left:60%;
			 margin-bottom:2%;
			 height:30px;
			 width:100px;
			 text-align:center;
			 background-color:green;
			 color:white;
		    border:0px;
		 }
   footer{
        position:relative;
		bottom:0px;
        width:100%;
        height:10%;
        background-color:orange;
	    box-shadow:0px 4px 5px rgb(100,30,0);
      }
	  #foot{
        position:relative;
		bottom:0px;
        width:100%;
        height:60px;
        background-color:black;
	    box-shadow:0px 5px 5px rgb(100,30,0);
      }
	  div.hidden
	  {
	  opacity:0;
	  transform:translateX(00px)translateY(80px);
	  }
          p{
                 width:100%;
        padding:5px;
        background-color:rgba(0,0,0,.5);
	    box-shadow:0px 5px 5px rgb(00,0,0);
              
          }
	  
                      </style></div>
<header>
<div id="head">
    <div id="head">
    <a href="home.jsp">
<img src="img/logo.png" height="90" width="300">
</a>
<div id="info">
    <%  if(flag == 1){
            out.print("<table height='90'><tr><td><img height='80px' width='75px' src='imagefetch.jsp'/></td><td>" + fname + " " + lname + "<br>" + r + "</td></tr></table>");
        } else {
                response.sendRedirect("index.html");
            }
            }
        }
    %>
</div>
</div>
</div>
</header>

<div id="main">
   <div class="mainnews">
     <table id="table">
	 <tr>
	 <td width="65%">
     	 <div class="newsfeed h hidden">
             
             <%
                String nws="def";
                int nid = 0;
                             Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:///student", "root", "root");
            if(!con.isClosed()){
                System.out.println("Connected to MySQL");
                
         Statement news = con.createStatement();
                
                ResultSet rs2 = news.executeQuery("select * from n ORDER BY pdate DESC");  
                while(rs2.next()){
                    nid = rs2.getInt("nid");
                    //session.removeAttribute("nid");
                    session.setAttribute("nid", Integer.toString(nid));
         nws = rs2.getString("news");
         out.print("<p><img height='100px' width='100px' src='newsimgfetch.jsp'/>" + nws + "</p><br>");
      }
      rs2.close();
      
            
            
            }
            con.close();
        }catch(ClassNotFoundException c){
            System.out.println("Class was not found");
        }
        catch(Exception e){
            System.out.println(e);
        }
    %>
             
             
         </div>
	 </td>
	 <td width="35%">
	     <div class="newsblog h hidden">
		 <div id="enter">
		 <form method="post" action="PostComment">
         <br>
         <input id="newfeedintag" type="text" placeholder="Comment..." name="tag"><br>
         <input id="submit" type="submit" value="post">
		 <br>
                 </form><br>
                 <%
                String name="def", comm="def";
                             Connection con2 = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con2 = DriverManager.getConnection("jdbc:mysql:///student", "root", "root");
            if(!con2.isClosed()){
                System.out.println("Connected to MySQL");
                
          Statement fetch = con2.createStatement();
                
                ResultSet rs1 = fetch.executeQuery("select * from comment ORDER BY cid DESC");  
                while(rs1.next()){
         name = rs1.getString("fname");
         comm = rs1.getString("tag");
         out.print("<p>" + name + "<br> " + comm + "</p><br><br>");
         
      }
      rs1.close();
      
            
            
            }
            con2.close();
        }catch(ClassNotFoundException c){
            System.out.println("Class was not found");
        }
        catch(Exception e){
            System.out.println(e);
        }
    %>
		 </div>
         </div>
	 </td>
	 </tr>
	 </table>
   </div>
</div>
<footer>
<div id="foot">
</div>
</footer>
</body>
</html>