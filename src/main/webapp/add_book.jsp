<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <title>Document</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <style>*{margin:0px;padding:0px}
    body{background-image:url('img/add_book.avif')}
   input{background:none;border:none;border-bottom:2px solid white;outline:none;
   border-radius:1px;width:90%;padding:0.5rem 1px;}
 ul{  margin:0; background-color: rgb(4, 34, 68);list-style-type: none; display: flex;
    justify-content: space-between; align-items: center; color:white }
 #nav{  display:flex; }
   li{padding:0px 20px;line-height: 50px;font-size: 30px;cursor: pointer; }
 li a{display: inline-block;  text-decoration: none; color: white; }
li a:hover{color: lightblue;}
 a:is(:link,:active,:visited).active{color: lightblue;border-bottom: 5PX solid lightblue;
    border-radius: 1px;transition: 0.5 ease;}
.bsign{display:flex;}</style></head>
<body >
<input type="hidden" id="status" value="<%=request.getAttribute("add_book_status") %>">
  <ul id="navbar">
<div id= "nav">
<li><a href="welcome.jsp">Home</a></li>
<li><a href="About.jsp" >About</a></li></div>
 <div class="bsign"><li id="logout"><a href="logout.jsp">logout</a></li> </div></ul>
<div class="container  w-50 py-2 text-white" style="margin-top:80px;backdrop-filter: blur(10px);" >
<h1 class="bg-warning text-center"><i class="fa fa-book" aria-hidden="true"></i> Add books</h1><hr>
<form action="servlet_thumbnail" method="post" enctype="multipart/form-data" >
<table class=" w-100">

<tr class="m-5" >
<td><label class="form-label mx-1" for=""><i class="fa-solid fa-file-pdf"></i> book upload</label></td>
<td ><input type="file" name="image_file"  class="mb-4 ml-4 border-0"> </td></tr> 
<tr class=" p-2" >
<td><label class="form-label-lg mx-1 mb-2">book_name</label></td>
<td><input type="text"  class=" mb-4 h2"name="book_name" required/></td></tr> 

<tr class="m-5"  >
<td><label class="form-label mx-1 mb-2" for="">subject</label> </td>
<td><input type="text"   class="  mb-4 h2 "name="book_subject" required/></td></tr> 

 <tr class="m-5" >
<td>   <label class="form-label mx-1" for="">book auother</label> </td>
<td>  <input type="text"  class=" mb-4 h2"name="book_by" required/></td></tr> 

</table>
 <div class="form-outline mb-4">
  <input type="submit"value="ADD book" class="form-control form-control-lg btn btn-primary btn-lg btn-block"></div>
   </form> </div></body>
   
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status =document.getElementById("status").value;
if(status=="true"){
	 swal("ADD book sucessfully!", "You clicked the button!", "success");	
	 document.getElementById("status").value="";
}
if(status=="false"){
	 swal("sorry!", "book save only  in pdf from", "error");	
	 document.getElementById("status").value="";
}
if(status=="already_exit_file_name"){
	 swal("sorry!", "this file is already exit", "error");	
	 document.getElementById("status").value="";
}
</script>
 

</script>

</html>