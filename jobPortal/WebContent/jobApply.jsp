<%@page import="getter_setter.employe"%>
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

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
   <style>
   
   body{
   background-image:url(backgroundimg.jpg);
  
   }
   
   .box{
   position:absolute;
   border-radius:20px;
  
   top:150px;
   left:400px;
   width:950px;
   height:500px;
   background-color:white;
   }
   .box form .row{
   margin:20px;
   }
   </style>
    <title>Hello, world!</title>
  </head>
  <body>

   <%
        int counter=1;
        DBhandler dao=new DBhandler();
        String strsessionfield=(String)session.getAttribute("field");
        String strEmailid=(String)session.getAttribute("eid");
        String strsrno= request.getParameter("srno");
        int srno=Integer.parseInt(strsrno);
        LinkedList<employe> list1= dao.getEmployesbyEmpemail(strEmailid);
        LinkedList<jobs> list=dao.getjobsBySrno(srno);
        
        out.println(strEmailid);
        
        for(employe objemp:list1)
        {
        %>
        <div class="box">
        <h2>Apply</h2>
        <form action="applyjobs" method="post">
        	<div class="row">
        	  <div class="col-sm-2">
        	    Employe Name :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="text" value="<%=objemp.getStrEname() %>" name="enm" class="form-control" readonly>
        	  </div>	  
        	  
        	    <div class="col-sm-2">
        	    Email :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="email" value="<%=objemp.getStrEid() %>" name="eid" class="form-control" readonly>
        	  </div>	  
        	</div>
        
        <div class="row">
        	  <div class="col-sm-2">
        	     date of birth :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="text" value="<%=objemp.getStrdob() %>" name="dao" class="form-control" readonly>
        	  </div>	  
        	  
        	    <div class="col-sm-2">
        	    Phone number :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="email" value="<%=objemp.getStrEnum() %>" name="phn" class="form-control" readonly>
        	  </div>	  
        	</div>
        <% 
        }
                for(jobs objjob:list)
        {
        %>
        	
        	<div class="row">
        	  <div class="col-sm-2">
        	    Company Name :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="text" value="<%=objjob.getStrCnm() %>" name="cnm" class="form-control" readonly>
        	  </div>
        	  
               	  <div class="col-sm-2">
        	   job requirement :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="text" value="<%=objjob.getStrjobreq()%>"name="jreq" class="form-control" readonly>
        	  </div>  
        	</div>
        	
        	<div class="row">
        	  <div class="col-sm-2">
        	    field :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="text" value="<%=objjob.getStrfild() %>" name="field" class="form-control" readonly>
        	  </div>
        	  
               	  <div class="col-sm-2">
        	   Designation :
        	  </div>
        	  <div class="col-sm-2">
        	    <input type="text" value="<%=objjob.getStrdesi()%>" name="desi" class="form-control" readonly>
        	  </div>
        	  
        	</div>
        	<div class="row">
        	<div class="col-sm-2">
        	  <input type="hidden" value="<%=objjob.getSrno() %>" name="srno" class="btn btn-primary">
        	</div>
        	</div>
        	<div class="row">
        	<div class="col-sm-2">
        	  <input type="file" accept="application/pdf" required name="resume" class="from-control">
        	</div>
        	</div>
        	<div class="row">
        	<div class="col-sm-2">
        	  <input type="submit" class="btn btn-primary">
        	</div>
        	</div>
        	</form>
     </div>
        <% 
        }
     %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>