<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
     <link href="css/bootstrap.min.css" rel="stylesheet" >
    <jsp:include page="nav1.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-image:url('img/p_bg.jpg');
background-size:100vw 100vh;
}

</style>
</head>
<body>
<div class="container  mt-5 w-50 rounded border p-0 shadow-lg" style="backdrop-filter: blur(10px);">
<div class="text-center  py-2 bg-warning d-flex  justify-content-center align-items-center rounded"><h5>Your Profile</h5></div>
<table class="table text-center  ">

  <tbody >
  <tr >
      <th class="py-3 border-0" class="border-0"><img src="img/user(1).png" width="25px" height="25px">Name</th>
     
      <td class="border-0" ><%=session.getAttribute("name1")%></td>
    
    </tr>
 <tr >
      <th class="py-3 border-0"><img src="img/gmail.png">  Email</th>
     
      <td class="border-0"><%=session.getAttribute("gmail") %></td>
    
    </tr>
     <tr >
      <th class="py-3 border-0"><img src="img/id-card.png">  Username</th>
     
      <td class="border-0"><%=session.getAttribute("username") %></td>
    
    </tr>
     <tr class="py-3">
      <th scope="row"class="py-3 border-0"><img src="img/call.png">   Mobile</th>
     
      <td><%=session.getAttribute("mob") %></td>
    
    </tr>
     <tr class="py-3 ">
      <th scope="row"class="py-3 border-0"><img src="img/key.png" width="25px" height="25px">   Password</th>
     
      <td class="border-0"><%=session.getAttribute("pass") %></td>
    
    </tr>
			
	
  
  </tbody>
    
</table>
</div>
<jsp:include page="footor.jsp"></jsp:include>
</body>
</html>