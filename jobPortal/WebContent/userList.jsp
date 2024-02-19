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

    <title></title>
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
  
<!-- 
ENAME             VARCHAR2(30)  
EMAIL             VARCHAR2(30)  
PASS              VARCHAR2(15)  
DOB               VARCHAR2(15)  
SECTOR            VARCHAR2(15)  
EMPPHOTO          VARCHAR2(100) 
ENUM              VARCHAR2(20)  
EMPNO    NOT NULL NUMBER(4) -->
<%
DBhandler dao=new DBhandler();
LinkedList<employe> list= dao.getemployes();

%>    
<table class="table">
<thead>
<tr>
<th scope="col">Employe Id</th>
<th scope="col">Employe name</th>
<th scope="col">Employe email</th>
<th scope="col">password</th>
<th scope="col">date of birth</th>
<th scope="col">sector</th>
<th scope="col">Phone number</th>
<th scope="col">Edit data </th>
</tr>
</thead>
<tbody>
<%
for(employe empobj:list)
{
%>
<tr>
<td><%=empobj.getStrempno() %></td>
<td><%=empobj.getStrEname() %></td>
<td><%=empobj.getStrEid() %></td>
<td><%=empobj.getStrpass() %></td>
<td><%=empobj.getStrdob() %></td>
<td><%=empobj.getStrsec() %></td>
<td><%=empobj.getStrEnum() %></td>
<td><a href="editUser?srno=<%=empobj.getStrempno() %>" class="btn btn-success">Edit</a></td>
<%
}
%>
</tbody>
</table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>