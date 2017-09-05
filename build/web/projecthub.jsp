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
	   background-image:url("img/bacff.jpg");
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
	  background-color:red;
	  }
	  
 div#main
   {
    position:static;
	margin-left:2%;
	width: 96%;
    background-color:rgba(10,10,10,.5);
	box-shadow:0px 10px 10px rgb(100,100,100);
   }
 div.mainpro
   {
    position:static;
	padding-top:140px;
	margin-left:3%;
	width: 94%;
	 transition:all 1.5s ease-in;
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
	  .hidden
	  {
	  opacity:0;
	  transform:translateX(00px)translateY(800px);
	  }
	  .h
	  {
	  opacity:1;
	  transition:all 4s ease-in;
	  }
	  
</style></div>
<header>
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
</header>

<div id="main">
   <div class="mainpro h hidden">
   <center><h1>Engineering Projects</h1><center>

<h3>Hello, in this section you would get the projects which is required in your colleges for the presentation or for anything you would like to do.<br/>
The projects are divided under the categories of the engineering branches.</h3>
<h1 align="center"><strong>Computer Science and Information Technology</strong></h1>

<h2 align="center">Hotel Management System in Java </h2>

<table>
<tr>
<th>
<img  src="img/Hotel-Management-System.png" alt="Smiley face" height="500" width="400">
</th>
<td>This Hotel Management Project in Java is designed once and can be updated many times, so the burden of application maintenance is short listed by all the general guidelines.<br/> 
The main task for  Hotel Management Project in java is ahead to see all the things whether they are running smoothly or not, this software will be capable of doing or performing following tasks: <br/>
?     Reservation. <br/>
?     Registration. <br/>
?     Billing/Clearance of Guest Folio. <br/>
?     Checkout. <br/>
This Hotel Management Project in java is developed keeping in mind the various aspects of hotels in public sector as well as in private sector. This software is intended to be developed for Deluxe Class / Super-Deluxe Class Hotels. A Comparison will be done of Deluxe Class Hotels in public sector and in private sector and then the resultant / desired software will be developed. <br/>
This Hotel Management project in java uses Java as its front end and MS-Access database management system will be used as ?Backend? which will be capable of recording information and high level language ?Java? will serve as ?Front end? for the software. The database will be capable of doing following operations: <br/>
?     Keeping records of various customers that visit in the hotel.<br/>
?     Keeping records of various items that are served to the customers.<br/>
?     Keeping records of customer?s Check-in/Check-out timings. <br/>
</td>
</tr>
</table>

<h2 align="center">Speech To Text Conversion using Java API </h2>

<table>
<tr>
<th>
<img src="img/speech-api-lead.png" alt="Smiley face" height="300" width="400">
</th>
<td>Speech Recognition is the process of converting spoken input to digital output, such as text. Speech recognition systems provide computers with the ability to listen to user speech and determine what is said.<br/> 
The Speech Recognition process can be divided into these four steps: <br/>
1. Speech is converted to digital signals.<br/>
2. Actual speech sounds are extracted from the sounds (based on energy of the sounds).<br/> 
3. The extracted sounds are put together into ?speech frames.?<br/> 
4. The speech frames are compared with words from the grammar file to determine the &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;spoken word.<br/>
</td>
</tr>
</table>

<h2 align="center">College Maintenance System</h2>

<table>
<tr>
<th>
<img src="img/slide_1.jpg" alt="Smiley face" height="300" width="400">
</th>
<td>College Maintenance system is a tool to maintain student related records such as student Personal records like name address city etc.,student semester , exam related information also be maintain in the system. Student reports etc. <br/>
 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Modules: <br/>
? Student<br/>  
? semester <br/>
? Marks Obtained<br/> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Features: <br/>
1. Maintain marks information<br/> 
2. Maintain student information <br/>
3. maintain semester information <br/>
</td>
</tr>
</table>

<h2 align="center">Simple Payroll application in Java </h2>
<table>
<tr>
<th>
<img src="img/payroll-management-asp-net-project.jpg" alt="Smiley face" height="300" width="400">
</th>
<td>Payroll System is a central part of any business or professional application. Payroll System is not a single module to be in focus. To Payroll a person , that person time sheet also be taken into consideration. <br/>
First let us do the very simple apps for payroll <br/>
 
The project is easy to understand and you can edit the code information easily in order to build a new functionality. <br/>
 
Features:<br/> 
? Easy to maintain<br/>
? User Information maintenance.  <br/>
? Add delete maintain Interfaces <br/>
</td>
</tr>
</table>

<h1 align="center"><strong>Mechanical Engineering</strong></h1>

<h2 align="center">Design and Fabrication of Gear and Spline cutting attachment for Lathe </h2>
<table>
<tr>
<th>
<img src="img/DesignandFabrication.jpg" alt="Smiley face" height="300" width="400">
</th>
<td>Mechanical engineering without production and manufacturing is meaningless and inseperable.<br/>
Production and manufacturing process deals with conversation of raw materials input to finished products as per required dimensions specifications and efficiently using recent technology.<br/>
Our project design and fabrication of spline cutting attachment is used to cut gear or splines over the cylinderical job.<br/>
Our main aim is to prove lathe is a versatile machine so this gear cutting is done by lathe itself.<br/>

</td>
</tr>
</table>

<h2 align="center">Electromagnetic Shearing Machine</h2>
<table>
<tr>
<th>
<img src="img/Manual_Electromagnetic_Shearing_Machine-2.jpg" alt="Smiley face" height="300" width="400">
</th>
<td>As industrial is coming up across the globe various innovations and inventions are being carried by human to fasten various processes associated with manufacturing and align things.<br/>
One such thing is industrial automation unit. In this automation unit various machines those can be adopted easily are also getting developed.<br/>
Considering the example of piping industry where plastic are PVCs piping to be cut.<br/>
There can be various types of shearing machines depending on parts to be cut process of cutting, requirement of cutting length these machines are certainly good at work but as ith amost all types of machines. <br/>

</td>
</tr>
</table>

<h2 align="center">Gas Kit for Two Wheeler </h2>
<table>
<tr>
<th>
<img src="img/Gast.png" alt="Smiley face" height="300" width="400">
</th>
<td>An attempt has been made in this project to use alternative fuel in two stroke gasoline engine.<br/>Out fore most aim is to use non conventional fuel against conventional fuel which is becoming scarce and costly nowdays.<br/>
With this air is less polluted than conventional fuels.
<br/>I is also good with regard to economical considerations in our project we have installed LPG fuel system to two stroke vehicle where in we can use both gasoline and LPG.<br/>
The alternations made to install LPG in the vehicle are discussed.<br/>
LPG from storage tank comes to adjustable regulator through a primary delivery valve fitted at the mouth of the LPG cylinder.<br/>
</td>
</tr>
</table>

<h1 align="center"><strong>Electrical Engineering</strong></h1>

<h2 align="center">GSM Based Automatic Energy Meter Reading </h2>
<table>
<tr>
<th>
<img src="img/GSM-based-AMR.jpg" alt="Smiley face" height="300" width="400">
</th>
<td>&nbsp;&nbsp;&nbsp;&nbsp;The purpose of this project is to remote monitoring and control of the Domestic
Energy meter. This system enables the Electricity Department to read the meter readings
regularly without the person visiting each house. This can be achieved by the use of
Microcontroller unit that continuously monitors and records the Energy Meter readings in
its permanent (non-volatile) memory location. This system also makes use of a GSM
modem for remote monitoring and control of Energy Meter.<br/>
The Microcontroller based system continuously records the readings and the live
meter reading can be sent to the Electricity department on request. This system also can
be used to disconnect the power supply to the house in case of non-payment of electricity
bills. A dedicated GSM modem with SIM card is required for each energy meter.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;The major building blocks of this project are:<br/>
1. Microcontroller based control system with regulated power supply.<br/>
2. GSM Modem for remote communication<br/>
3. Electromagnetic Relay and Relay Driver for Power Supply Control.<br/>
4. Digital Energy Meter.<br/>
5. LCD Display to display the meter readings.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Features:<br/>
1. Provides user friendly remote energy meter monitoring.<br/>
2. Supports controlling of meter.<br/>
3. Can be controlled any where in the world.<br/>
4. Non-volatile memory based energy-reading storing.<br/>
5. Auto disconnect feature.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Applications:<br/>
1. Electricity departments.<br/>
2. Household Energy meter monitoring.<br/>
3. Railway electrical systems.<br/>
4. Industrial Energy remote monitoring.<br/>
5. Remote controlling systems.<br/>
</td>
</tr>
</table>

<h2 align="center">Controlling of AC Lamp Dimmer through Mobile phone</h2>
<table>
<tr>
<th>
<img src="img/NE555-internal-block-diagram.png" alt="internal-block-diagram" height="300" width="400">
</th>
<td>&nbsp;&nbsp;&nbsp;&nbsp;The project aims in designing a system which is capable of controlling the AC
lamp dimming operation through Mobile phone using DTMF technology. As the world
gets more and more technologically advanced, we find new technology coming in deeper
and deeper into our personal lives even at home. Home automation is becoming more and
more popular around the world and is becoming a common practice.<br/>
The process of home automation works by making everything in the house
automatically controlled using technology to control and do the jobs that we would
normally do manually. It is much easier to install home automation in a house while it is
still being built, since you have the ability to put things inside the walls to save space.
Though, people who have houses already built can still have home automation done in a
less intrusive ways.<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Features:<br/>
1. Aims at energy conservation.<br/>
2. Provides user friendly graphical interface.<br/>
3. Provides fast access using mobile phone.<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;The project provides learning?s on the following advancements:<br/>
1. Characteristics of DTMF technology.<br/>
2. Conversion of AC supply to DC supply.<br/>
3. Interfacing DTMF decoder to Microcontroller.<br/>
4. Lamp dimmer circuitry.<br/>
5. Embedded C programming.<br/>
6. PCB designing<br/>

</td>
</tr>
</table>

<h2 align="center">Touch screen operated industrial oil dispensing system (OIL SCADA) </h2>
<table>
<tr>
<th>
<img src="img/touchscreenoil.jpg" alt="Smiley face" height="300" width="400">
</th>
<td>&nbsp;&nbsp;&nbsp;&nbsp;The project aims in designing a system which is capable of dispensing required
amount of oil given by the user through touch screen. This system also provides the
security of accessing through password enabled feature. Liquid dispensing systems are
quite commonly found in our daily life in different places like offices, Bus stands,
Railway stations, Petrol pumps. Here we are going to present modern era liquid
dispensing system which is meant to be operated with touch screen interfacing. Operators
of the dispensing systems should be trained perfectly so that they hold the controls until
the required amount of liquid is dispensed instead of this hard core mechanism we are
designing with a touch screen based dispensing system which is going to dispense the
particular to the required amount and is turned off immediately, the major advantage here
is there is no need for any mandatory person to take care about the system. This system
needs a password for activation and activates only when password entered is correct.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;The major features of this project are:<br/>
1. Touch screen based user interface.<br/>
2. Graphical LCD based display system for oil dispensed.<br/>
3. Accuracy in the amount of oil dispensed.<br/>
4. Password protected system.<br/>
&nbsp;&nbsp;&nbsp;&nbsp;The project provides learning?s on the following advancements:<br/>
1. Characteristics of the Touch screen.<br/>
2. Touch Screen interfacing with Microcontroller.<br/>
3. DC motor working.<br/>
4. DC motor interfacing to Microcontroller<br/>

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