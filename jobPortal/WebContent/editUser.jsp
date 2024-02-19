<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="getter_setter.employe"%>
<%@page import="java.util.LinkedList"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
    .box{
    position:absolute;
    left:250px;
    top:200px;
    width:1200px;
    height: 500px;
    }
    .box form .row div {
    margin:5px;
    }
    .title{
    postion:absolute;
    left:250px;
    top:100px;
    }
    #emp{
    position:absolute;
    width:1300px;
    left:20px;
    top:10px;
    }
    </style>

    <title>edit user</title>
  </head>
  <body>
<!-- 
ENAME             VARCHAR2(30)  
EMAIL             VARCHAR2(30)  
PASS              VARCHAR2(15)  
DOB               VARCHAR2(15)  
SECTOR            VARCHAR2(15)  
EMPPHOTO          VARCHAR2(100) 
ENUM              VARCHAR2(20)  
EMPNO    NOT NULL NUMBER(4) 
 -->


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

</form>
 <div class="box">

<div class="title">
 <h2>Edit user</h2>
 </div>
 
<%

int getnum=Integer.parseInt(request.getParameter("srno"));

DBhandler dao=new DBhandler();
LinkedList<employe> list=dao.getempbySrno(getnum);

for(employe emp:list)
{

%>
<form action="EditUser1" method="post">
<div class="row">
<div class="col-sm-2">
name:
</div>
<div class="col-sm-2">
<input type="text" name="name" value="<%=emp.getStrEname() %>" class="form-control">

</div>
<div class="col-sm-2">
email
</div>
<div class="col-sm-2">
<input type="email" name="email" value="<%=emp.getStrEid() %>" class="form-control">
</div>

</div>

<div class="row">
<div class="col-sm-2">
password</div>
<div class="col-sm-2">
<input type="password" name="password" value="<%=emp.getStrpass() %>" class="form-control">
</div>
<div class="col-sm-2">
date of birth
</div>
<div class="col-sm-2">
<input type="date" name="dob" value="<%=emp.getStrsec() %>" class="form-control">

</div>
</div>
<div class="row">
<div class="col-sm-2">
Sector
</div>
<div class="col-sm-2">
<input type="text" name="sector" value="<%=emp.getStrsec() %>" class="form-control">

</div>
<div class="col-sm-2">
Phone number:
</div>
<div class="col-sm-2">
<input type="text" name="Enumber" value="<%=emp.getStrEnum() %>" class="form-control">
</div>

</div>
<div class="row">
<div class="col-sm-2">
<input type="hidden"  name="hiddenData" value="<%=emp.getStrempno()%>">
</div>
</div>
<div class="row">
<div class="col-sm-2">
<input type="submit" class="btn btn-primary" value="update">
</div>
</div>

</form>

 <%
}
 %>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
   
  </body>
</html>