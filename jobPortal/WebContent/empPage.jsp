
<%@page import="java.util.LinkedList"%>
<%@page import="getter_setter.employe"%>
<%@page import="Database.DBhandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title></title>

  <style>
  
  *{
  margin:0;
  padding:0;
  font-family:'Poppins','sans-serif';
  box-sizing:border-box;
  }
  
  .hero{
  width:100%;
  min-height:100vh;
  background:#eceaff;
  color:#525252;
  }
  
  nav{
  background:#1a1a1a;
  
  width:100%;
  padding:10px 10%;
  display:flex;
  align-items:center;
  justify-content:space-between;
  position:relative;
  
  }
  .logo{
  width:120px;
  }
  .user-pic{
  width:40px;
  border-radius:50%;
  cursor:pointer;
  margin-left:30px;
  }
  
  nav ul{
  width:100%;
  text-align:right;
  }
  nav ul li{
  display:inline-block;
  list-style:none;
  margin:10px 20px;
  }
  nav ul li a{
  color:#fff;
  text-decoration:none;
  }
  .sub-menu-wrap{
  position:absolute;
  top:100%;
  right:10%;
  width:320px;
  max-height:0px;
  overflow:hidden;
  transition:max-height 0.5s;
  }
  .sub-menu-wrap.open-menu{
  max-height:400px;
  }
  .sub-menu{
  background:#fff;
  padding:20px;
  margin:10px;
  }
  .user-info{
  display:flex;
  align-items:center;
  }
  .user-info h3{
  font-weight:500;
  }
  .user-info img{
  width:60px;
  border-radius:50%;
  margin-right:15px;
  }
  .sub-menu hr{
  border: 0;
  height:1px;
  width:100%;
  background:#ccc;
  margin:15px 0 10px;
  }
  .sub-menu-link{
  display:flex;
  align-items:center;
  text-decoration:none;
  color:#525252;
  margin:12px 0;
 
  }
  .sub-menu-link p{
  width:100%;
  }
  .sub-menu-link img{
  width:40px;
  background:#e5e5e5;
  border-radius:50%;
  padding:8px;
  margin-right:15px;
  }
  .sub-menu-link span{
  font-size:22px;
  transition: transform 0.5s;
  }
  
  .sub-menu-link:hover span{
  transform:translateX(5px);
  }
  .sub-menu-link:hover p{
  font-weight:600;
  }
  
  </style>


  </head>
  <body>
  
  <%
response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
  String ses=(String)session.getAttribute("eid");
  
  try {
		
	  if(ses==(null))
	  {
	  	RequestDispatcher rd=request.getRequestDispatcher("authEmploye");
	  	   rd.forward(request, response);
	  

	  }
	  else
	  {
	  
	  out.println("session is not expierd current user "+ses);
	  
	  }
	  }
	  catch(NullPointerException e)
	  {
	     e.getMessage();
	     response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
	     RequestDispatcher rd=request.getRequestDispatcher("authEmploye");
	     rd.forward(request, response);
	  }
	  %>

  
 
  <div class="hero">
  <nav>
  
  <%
 
  
  
  DBhandler dao=new DBhandler();
  out.println(ses);
  LinkedList<employe> objlist=dao.getEmployesbyEmpemail(ses);
  
  for(employe objemp:objlist)
  {
	  
	  HttpSession session3=request.getSession();
	  session3.setAttribute("field", objemp.getStrsec());
  %> 
  
  
  <img src="images/904-08.jpg" height="80px" width="80px" class="logo">
  <ul>
  
  <li><a href="#">Home</a></li>
  <li><a href="passwordchange.html">Change password</a></li>
  <li><a href="#">About</a></li>
  <li><a href="#">Contact</a></li>
  </ul>
  <img src="<%=objemp.getStrempphoto() %>" class="user-pic" onclick="toggleMenu()">
  
  <div class="sub-menu-wrap" id="subMenu">
  <div class="sub-menu">
   <div class="user-info">
    <img src="<%=objemp.getStrempphoto() %>" alt="user image">
    <h2><%=objemp.getStrEname()  %></h2>
   </div>
   <hr>
   
   <a href="profile.jsp" class="sub-menu-link">
   <i class="fas fa-user-alt"></i>
   <p>Edit profile</p>
   <span>></span>
   </a>
    <a href="empjobs.jsp" class="sub-menu-link">
   <i class="fas fa-tasks"></i>
   <p>jobs</p>
   <span>></span>
   </a>
    <a href="#" class="sub-menu-link">
   <i class="fa fa-support"></i>
   <p>Help & Support</p>
   <span>></span>
   </a>
    <a href="LogOutEmp" class="sub-menu-link">
   <i class="fa fa-sign-out"></i>
   <p>Logout</p>
   <span>></span>
   </a>
  </div>
  </div>
  
<%
    }
%>  
  </nav>

  </div>

<script type="text/javascript">
let subMenu=document.getElementById("subMenu");

function toggleMenu()
{
	subMenu.classList.toggle("open-menu");
	}

</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
  </body>
</html>