
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Insert title here</title>
<style>
form{
position:absolute;
left:350px;
top:200px;
width:1200px;
height:500px;
}
form .row div{
margin:5px;
}
</style>
</head>
<body>
<!-- COMPANY_NAME          VARCHAR2(100) 
JOBREQ                VARCHAR2(20)  
WORKEXP               VARCHAR2(10)  
FIELD                 VARCHAR2(5)   
DESIGNATION           VARCHAR2(20)  
VACCANY               VARCHAR2(50)  
LOGO                  VARCHAR2(100)  -->
<form action="addjobs" method="post">
<div class="row">
<div class="col-sm-2">
Enter company name:
</div>
<div class="col-sm-2">
<input type="text" name="cmpnm" class="form-control">
</div>

<div class="col-sm-2">
Enter Job requirement:
</div>
<div class="col-sm-2">
<input type="text" name="jreq" class="form-control">
</div>
</div>

<div class="row">

<div class="col-sm-2">
Enter work experince:
</div>

<div class="col-sm-2">
<input type="text" name="jobexp" class="form-control">
</div>
<div class="col-sm-2">
Enter Field:
</div>

<div class="col-sm-2">
<input type="text" name="jobexp" class="form-control">
</div>

</div>

<div class="row">

<div class="col-sm-2">
Enter designation:
</div>
<div class="col-sm-2">
<input type="text" name="desi" class="form-control">
</div>

<div class="col-sm-2">
Enter total vacanicies:
</div>

<div class="col-sm-2">
<input type="text" name="vacc" class="form-control">
</div>

</div>

<div class="row">
<div class="col-sm-2">
upload logo
</div>

<div class="col-sm-2">
<input type="file" action="/image/" class="form-control" name="img">
</div>
</div>

<div class="row">
<div class="col-sm-2">
<input type="submit" class="btn btn-primary" value="Add">
</div>
</div>

</form>
</body>
</html>