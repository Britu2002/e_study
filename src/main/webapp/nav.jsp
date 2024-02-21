<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="css/bootstrap.min.css" rel="stylesheet" >
   
    <link rel="stylesheet" href="style.css">
    <style>
    .nav-link{
	text-decoration:none; 
	color:white;
	font-weight:500;
	
}
.nav-link:hover{
color:orange;
}



    </style>
   
</head>

<body>
 <ul >
<span id='left' class="">
 <span class=" ml-2">
                <li class="m-1"><a href='welcome.jsp'class='nav-link '>Home</a></li>
                  <li class="m-1"><a href='About.jsp'class='nav-link '>About</a></li>
             <li class="m-1"><%if(session.getAttribute("username")!=null){
            	 int st =(Integer)session.getAttribute("stud_id");
          
        
        	 } %></li>
 <li class="m-1"><%if(session.getAttribute("username")!=null){
            	 int st =(Integer)session.getAttribute("stud_id");
           out.print("<a href='history.jsp'class='nav-link'>Recent</a>");
        
        	 } %></li>

            </span>
        </span>
<div id="right">
<%if(session.getAttribute("username")!=null){

	out.print("<li><img src='img/sign-up.png' width='15px' height='15px'> <a href='logout.jsp?'onMouseOver=this.style.color='orange' onMouseOut=this.style.color='white' >Logout</a></li>");
}else{
	out.print("<li><img src='img/sign-up.png' width='15px' height='15px'> <a href='login.jsp' onMouseOver=this.style.color='orange' onMouseOut=this.style.color='white' > Login</a></li>");
} %>

   
<li> <img src="img/login.png" width="15px" height="15px"><a href="signup.jsp" onMouseOver=this.style.color='orange' onMouseOut=this.style.color='white'>SignUp</a></li>
        </div>
    </ul>
</body>
</html>