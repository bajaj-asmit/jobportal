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

    <title>remove user </title>
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
  
  <%
  
  DBhandler dao=new DBhandler();
  LinkedList<employe> list=dao.getemployes();
  int counter=1;
  %>
    <table class="table">
    <thead>
    <tr>
    <!-- ENAME             VARCHAR2(30)  
EMAIL             VARCHAR2(30)  
PASS              VARCHAR2(15)  
DOB               VARCHAR2(15)  
SECTOR            VARCHAR2(15)  
EMPPHOTO          VARCHAR2(100) 
ENUM              VARCHAR2(20)  
EMPNO    NOT NULL NUMBER(4) -->
    <th scope="col">Sr No</th>
    <th scope="col">Employe number</th>
    <th scope="col">name</th>
    <th scope="col">email</th>
    <th scope="col">date of birth</th>
    <th scope="col">sector</th>
    <th scope="col">phone number</th>
    <th scope="col">Remove</th>
    </tr>
    </thead>
    <tbody>
    <%
    for(employe emp:list)
    {
    %>
    <tr>
      <th scope="row"><%=counter++ %></th>
      <td><%=emp.getStrempno() %></td>
      <td><%=emp.getStrEname() %></td>
      <td><%=emp.getStrEid() %></td>
      <td><%=emp.getStrdob() %></td>
      <td><%=emp.getStrsec() %></td>
      <td><%=emp.getStrEnum() %></td>
      <td><a href="removeUser?srno=<%=emp.getStrempno() %>" class="btn btn-primary">Remove</a></td>
    </tr>
    <%
    }
    %>
    </tbody>
    </table>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>