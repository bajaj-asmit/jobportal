<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
</style>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
  String ses=(String)session.getAttribute("eidadmin");
 
  try {
		
	  if(ses==(null))
	  {
	  	RequestDispatcher rd=request.getRequestDispatcher("authadmin");
	  	   rd.forward(request, response);
	  

	  }
	  
	  }
	  catch(NullPointerException e)
	  {
	     e.getMessage();
	     response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
	     RequestDispatcher rd=request.getRequestDispatcher("authadmin");
	     rd.forward(request, response);
	  }
	  %>


  <div class="hero">
  <nav>
  <img src="images/904-08.jpg" height="80px" width="80px" class="logo">
  <ul>
  
  <li><a href="#">Home</a></li>
  <li><a href="changeAdminPass.html">Change password</a></li>
  <li><a href="addjobs.jsp">Add jobs</a></li>
  <li><a href="removejobs.jsp">Remove jobs</a></li>
   <li><a href="removeUser.jsp">Remove users</a></li>
   <li><a href="userList.jsp">edit users</a></li>
    <li><a href="logOutadmin">logout</a></li>
  </ul>
  </nav>

  </div>
 
</body>
</html>