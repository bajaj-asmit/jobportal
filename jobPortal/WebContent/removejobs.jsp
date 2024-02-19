<%@page import="getter_setter.jobs"%>
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

    <title>job portal</title>
  </head>
  <body>
  <%
  DBhandler dao=new DBhandler();
  LinkedList<jobs> list=dao.getjobs();
  int counter=1;
  %>

     <table class="table">
  <thead>
    <tr>
      <th scope="col">sr no</th>
      <th scope="col">index</th>
      <th scope="col">company name</th>
      <th scope="col">job reqirement</th>
      <th scope="col">work experience</th>
      <th scope="col">job field</th>
      <th scope="col">job designation</th>
      <th scope="col">job vacancies</th>
      <th scope="col">delete </th>
    </tr>
  </thead>
  <tbody>
   <%
      if(!list.isEmpty())
	  {
 
    for(jobs objjobs:list){
    	    
    %>
    <tr>
    <!-- SRNO         NOT NULL NUMBER(3)     
COMPANY_NAME          VARCHAR2(100) 
JOBREQ                VARCHAR2(20)  
WORKEXP               VARCHAR2(10)  
FIELD                 VARCHAR2(5)   
DESIGNATION           VARCHAR2(20)  
VACCANY               VARCHAR2(50)  
LOGO                  VARCHAR2(100) -->
    
      
      <th scope="row"><%=counter++%></th>
      <td><%=objjobs.getSrno() %></td>
      <td><%=objjobs.getStrCnm() %></td>
      <td><%=objjobs.getStrjobreq() %></td>
      <td><%=objjobs.getStrwrkexp() %></td>
      <td><%=objjobs.getStrfild() %></td>
      <td><%=objjobs.getStrdesi() %></td>
      <td><%=objjobs.getStrvaccy() %></td>
      <td><a href="deleteJob?srno=<%=objjobs.getSrno() %>" class="btn btn-primary">delete</a></td>
    </tr>
    <%
    }
	  } else{
		  %>
	<th scope="row">sorry no data found</th>
		  
		  <%
	  }
    %>
    </tbody>
 </table>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>