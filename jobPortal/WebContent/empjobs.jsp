<%@page import="getter_setter.jobs"%>
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
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="style.css">
   
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <style>
    *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family: sans-serif;
    
    }
    
    body{
    min-height:100vh;
    background:url(backgroundimg.jpg) center/ cover;
    display:flex;
    justify-content:center;
    align-items:center;
    }
    
    main.table{
    width:82vw;
    height:90vh;
    background-color:#fff5;
    
    backdrop-filter: blur(7px);
    box-shadow: 0 .4rem .8rem #0005;
    border-radius: .8rem;
    overflow:hidden;
    }
    
    .table_header{
    width:100%;
    height:10%;
    background-color: #fff4;
    padding: .8rem 1rem;
    }
    
    .table_body{
    widtg:95%;
    max-height:calc(89% - .8rem);
    background-color:#fffb;
    margin: .8rem auto;
    border-radius: .6rem;
    overflow:auto;
    }
    
    .table_body::-webkit-scrollbar{
    width:0.5rem;
    height:0.5rem;
    }
    
    .table_body::-webkit-scrollbar-thumb{
    border-radius: .5rem;
    background-color:#0004;
    visibility:hidden;
    }
    
    .table_body:hover::-webkit-scrollbar-thumb{
    visibility:visible;
    }
    
    table,th,td{
    border-collapse:collapse;
    padding:1rem;
    }
    
    thread th{
    position:sticky;
    top:0;
    left:0;
    background-color:#d5d1defe;
    
    }
    
    
    td img{
    width:36px;
    height:36px;
    margin-right: .5rem;
    border-radius:50%;
    vertical-align:middle;
    }
    
    table,th,td{
    padding:1rem;
    }
    
    .abc{
    text-decoration:none;
    }
    
    .modal-header {
            background: #F7941E;
            color: #fff;
        }
    
    </style>

    <title>Hello, world!</title>
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
	  
	  }
	  catch(NullPointerException e)
	  {
	     e.getMessage();
	     response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate");
	     RequestDispatcher rd=request.getRequestDispatcher("authEmploye");
	     rd.forward(request, response);
	  }
	  %>


  <main class="table">
     <section class="table_header">
        <h1>Jobs</h1>
     </section>
     <section class="table_body">
      <table>
        <thead>
        <tr>
        <th>sr no</th>
        <th>company name </th>
        <th>job requirement</th>
        <th>work experience</th>
        <th>field</th>
        <th>designation</th>
        <th>vacancies</th>
        
        </tr>
        </thead>
        <tbody>
        <%
        int counter=1;
        DBhandler dao=new DBhandler();
        String strsessionfield=(String)session.getAttribute("field");
        LinkedList<jobs> list=dao.getjobsbycategory(strsessionfield);
        
        for(jobs objjob:list)
        {
        
        %>
        <tr>
        <td><%=counter++ %></td>
        <td><img src="<%=objjob.getStrlogo() %>" alt="<%=objjob.getStrlogo() %>">&nbsp;&nbsp;<%=objjob.getStrCnm() %></td>
        <td><%=objjob.getStrjobreq() %></td>
        <td><%=objjob.getStrwrkexp() %></td>
        <td><%=objjob.getStrfild() %></td>
        <td><%=objjob.getStrdesi() %></td>
        <td><%=objjob.getStrvaccy() %></td>
        <% String strsno=objjob.getSrno(); %>
        <td> <a href="jobApply.jsp?srno=<%=strsno %>" value="<%=objjob.getSrno() %>"  class="abc" >Apply here</a>
		  	
					
		  </td>
        </tr>
        
        <%
        }
        %>
        
        </tbody>
      </table>
     </section>
  </main>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
  </body>
</html>