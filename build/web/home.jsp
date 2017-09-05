<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
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
		 
function loadDoc(n) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     document.getElementById("disc").innerHTML = this.responseText;
    }
  };
  switch(n)
  {
  case 1:
          { 
		  xhttp.open("GET", "disc5.html", true);
         break;
		 }
  case 2:
          { 
		  xhttp.open("GET", "disc4.html", true);
         break;
		 }
  case 3:
          { 
		  xhttp.open("GET", "disc3.html", true);
         break;
		 }
  }
  xhttp.send();
}
		  </script>
<style>
*{
   margin:0px;
   padding:0px;
}
body{
       background-size:100% 100%;
       background-attachment: fixed;
       font-family:Courier;
	   color:white;
        background-image:url("img/bac.jpg");
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
	width: 100%;
	box-shadow:0px 10px 10px rgb(100,100,100);
   }
   div#nav
   {
  
   padding-top:140px;
   width:100%;
   height:40%;
   	box-shadow:0px 10px 10px rgb(100,100,100);
   }
   table
   {
   width:100%;
   height:100%
   }
   #news{
     background-size:100% 100%;
     background-image:url("img/newsf.jpg");
	 width:33%;
	 height:100%;
   } 
      #mentor{
     background-size:100% 100%;
     background-image:url("img/bacf.jpg");
	 width:33%;
	 height:100%;
	 }
	    #profile{
     background-size:100% 100%;
     background-image:url("img/profilef.jpg");
	 width:33%;
	 height:100%;
	 }
	 .screen
	 {
	 width:100%;
	 height:100%;
	 display:none;
	    background-color:rgba(255,165,10,.5);
	 }
	 div#main a{
				   text-decoration:none;
				   color:white;
				   display:block;
				   height:40px;
				   width:70px;
				   text-align:center;
				  
				    background-color:rgba(10,10,10,.8);
				   transition:all 0.3s ease-in;
				   }
	div#main td:hover .screen
      {
	  display:block;
	  }	

#disc
{
background-color:rgba(250,250,250,.7);
color:black;
font-size:30px;
width:100%;
height:40%;
}	 
   footer{
    
        width:100%;
        height:10%;
        background-color:orange;
	    box-shadow:0px 4px 5px rgb(100,30,0);
      }
	  #foot{
    
        width:100%;
        height:60px;
        background-color:black;
	    box-shadow:0px 5px 5px rgb(100,30,0);
      }
	 .news.hidden
	  {
	  opacity:0;
	  transform:translateX(-200px)translateY(00px);
	  }
 .mentor.hidden
	  {
	  opacity:0;
	  transform:translateX(00px)translateY(-200px);
	  }
.profile.hidden
	  {
	  opacity:0;
	  transform:translateX(200px)translateY(00px);
	  }
	  .disc.hidden
	  {
	  opacity:0;
	  transform:translateX(00px)translateY(200px);
	  }
	  .h
{
	opacity:1;
	transition:all 2.5s ease;
}
	  
</style>
<header>
<div id="head">
    <a href="">
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
</header>

<div id="main">
   <div id="nav">
 <table>
   <tr>
      <td id="news" class="news h hidden">
	     <div class="screen">  
		 <center>
		 <br><br>
            <a href="news.jsp"><br>go</a><br>
			 <a class="triger" href="#l1" onclick="loadDoc(1)"><br>learn</a>
			 </center>
         </div>
	  </td> 
	   <td id="mentor" class="mentor h hidden">
        <div class="screen"> 
 <center>		
  <br><br>
         <a href="projecthub.jsp"><br>go</a><br>
		  <a class="triger" href="#l2" onclick="loadDoc(2)"><br>learn</a>
		   </center>
		 </div>
	  </td> 
	  <td id="profile" class="profile h hidden">
	      <div class="screen"> 
		   <center>
		    <br><br>
            <a href="profile.php"><br>go</a><br>
			 <a class="triger" href="#l3" onclick="loadDoc(3)"><br>learn</a>
			  </center>
			</div>
	  </td> 
    </tr>
</table>	
   </div>
 <div id="disc" class="disc h hidden">
 ff
 </div>
</div>

<footer>
<div id="foot">
</div>
</footer>
</body>
</html>