<!doctype html>
<%@page import="getter_setter.employe"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Database.DBhandler"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
    *{
    margin:0;
    padding:0;
    box-sizing:border-box;
    list-style:none;
    font-family:'josefin Sans',sans-serif
    }
    body{
    background:#f3f3f3;
    }
    .wrapper{
    position:absolute;
    top:50%;
    left:50%;
    transform: translate(-50%,-50%);
    width:550px;
    display:flex;
    box-shadow: 0 1px 20px 0 rgba(69,90,100,0.08);
    }
    .wrapper .left{
    widt:35%;
    background: linear-gradient(to right,#01a9ac,#01dbdf);
    padding:30px 25px;
    border-top-left-radius:5px;
    border-bottom-left-radius:5px;
    text-align:center;
    color:#fff;
    }
    .wrapper .left img{
    margin-bottom:10px;
    border-radius:5px;
    }
    .wrapper .left h4{
    margin-bottom:10px;
    }
    .wrapper .left p{
    font-size:12px;
    }
    .wrapper .right{
    width:65%;
    background:#fff;
    border-top-right-radius:5px;
    border-bottom-right-radius:5px;
    padding:30px 25px;
    }
    
    .wrapper .right .info ,
    .wrapper .right .projects{
    margin-bottom:25px;
    }
    .wrapper .right .info h3,
    .wrapper .right .projects h3{
    margin-bottom:15px;
    padding-bottom:5px;
    border-bottom:1px solid #e0e0e0;
    color:#353c4e;
    text-transform:uppercase;
    letter-spacing:5px;
    }
    
    .wrapper .right .info_data,
    .wrapper .right .projects_data{
    display:flex;
    justify-content:space-between;
    word-spacing: 10px;
    }
    
    .wrapper .right .info_data .data,
    .wrapper .right .projects_data .data{
    width:45%;
    }
    .wrapper .right .info_data .data h4,
    .wrapper .right .projects_data .data h4{
    color:#353c4e;
    margin-bottom:5px;
    }
    .wrapper .right .info_data .data p,
    .wrapper .right .projects_data .data p{
    font-size:13px;
    margin-bottom:10px;
    color:#919aa3;
    }
    
    .wrapper .social_media ul{
    display:flex;
    
    }
    
    .wrapper .social_media ul li{
    width:45px;
    height:45px;
    background:linear-gradient(to right,#01a9ac,#01dbdf);
    margin-right:10px;
    border-radius:5px;
    line-height:45px;
    text-align:center;
    }
    .wrapper .social_media ul li a{
    color:#fff;
    display:block;
    font-size:18px;
    }
    </style>
    <title>Hello, world!</title>
  </head>
  <body>

<%
DBhandler dao=new DBhandler();
String ses=(String)session.getAttribute("eid");
LinkedList<employe> list=dao.getEmployesbyEmpemail(ses);

for(employe objemp: list)
{
	

%>
  <div class="wrapper">
  <div class="left">
  <img src="<%=objemp.getStrempphoto() %>" alt="image" width="100">
  <h4>unk<%=objemp.getStrEname() %></h4>
  <p>developer <%=objemp.getStrsec() %></p>
  
  </div>
  <div class="right">
     <div class="info">
     <h3> information</h3>
     <div class="info_data">
     <div class="data">
     <h4>Email</h4>
     <p><%=objemp.getStrEid() %></p>
     </div>
     <div class="data">
     <h4>phone</h4>
     <p><%=objemp.getStrEnum() %></p>
     </div>
     </div>
     </div>
     
     <div class="projects">
     <h3> projects</h3>
     <div class="projects_data">
     <div class="data">
     <h4>Recent</h4>
     <p>lorem data jkuicwuikcb kc ieui v uivei</p>
     </div>
     <div class="data">
     <h4>most viewed</h4>
     <p>dolor sit hwdvc uwe  eu u</p>
     </div>
     </div>
     </div>
     
     <div class="social_media">
      <ul>
      <li> <a href="#" class="fa fa-facebook"></a></li>
      <li> <a href="#" class="fa fa-twitter"></a></li>
      <li> <a href="#" class="fa fa-instagram"></a></li>
      
      </ul>
     </div>
     
  </div>
  </div>
<%
}
%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  </body>
</html>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             