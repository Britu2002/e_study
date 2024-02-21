<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
       <link href="css/bootstrap.min.css" rel="stylesheet" >
   
    <link rel="stylesheet" href="style.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</head>
<style>
*{
margin:0px;
padding:0px;
}
</style>
<body>
<section>
    <ul id="uperul" class="m-0">
       <div class="d-flex ">
        <li class="h3 "style="margin-left:30px;font-family:Algerian"><span style="color:orangered">E</span>-study</li> 
 <l1 class="d-flex align-items-center">
 <span class="bg-white text-black" style="border-radius:40px;padding:2px 8px;padding-right:30px;">
 <i class="fa fa-search" aria-hidden="true"></i>
 <input type="text" placeholder="search" onkeypress="search()" id="search" style="outline:none; background: transparent;border:none;">
 </span></l1>      
</div>
        <li style="margin-right:30px">
        <a href="profile.jsp" class='text-decoration-none text-white'>   <%if(session.getAttribute("username")!=null){%>
         <img alt="img" src="img/user(1).png" width=25px; height="25px">
        	<%=session.getAttribute("username") %>
     <input value="<%=(String)session.getAttribute("username")%>" type="hidden"  id="checkSession">  
        	<% 
        
        	 }else{
        	out.print("<input value='' type='hidden'  id='checkSession'>") ; 	 
        	 } %></a> 
      
         </li>
    </ul>
  <jsp:include page="nav1.jsp"></jsp:include>
  
    </section>
 
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
  
      <img class="w-100" src="img/t1.jpg" alt="First slide" style="height:300px">
      <h1 class="position-absolute" style="top:60px;font-size:100px;color:white;left:450px;font-family:Algerian"><span style="color:orangered">E</span>-study</h1>
    </div>
  </div>
</div>
<div id="searchdiv"></div>
<jsp:include page="suggest.jsp"></jsp:include>
<div class="container text-center mt-3 mb-3">
<h1 class="bg-warning">BOOKS</h1>
</div>
<hr>

    <section>
   <div class="album py-5 bg-light">
        <div class="container ">

          <div class="row ">
          <%
try{ 
Class.forName("org.postgresql.Driver"); 
String sql = "Select * from e_book order by book_id desc"; 
Connection  con = DriverManager.getConnection("jdbc:postgresql:///e_study","postgres","ritu"); 
Statement st = con.createStatement(); 
ResultSet rs = null; 
 
rs= st.executeQuery(sql); 
while(rs.next()){
	
	%>
 <div class="col-md-4  ">
          <form action="second.jsp" >
              <div class="card mb-4   ">
 <img class="card-img-top shadow rounded"  alt="img" style="height: 225px;
  width: 70%; display: block;margin:0px 60px;" src="<%=rs.getString(6) %>" >
            <div class="card-header bg-white"> 
                <div class="card-body  ">
              <div  style="min-height:7.5vh ">  <p class="card-text small"><b>book name:</b><%=rs.getString(2) %></p></div>  
               <div style="min-height:7vh">     <p class="card-text small "><b>subject:</b><%=rs.getString(7) %></p></div>
                <div style="min-height:7vh">     <p class="card-text small"><b>auother:</b><%=rs.getString(3) %></p></div> 
           <input value="<%=rs.getInt(1)%>" type="hidden"  name="b_id">         
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                 <input type="submit" value="Read" class="btn btn-sm btn-outline-secondary" class="readSubmit" onclick=" return myfun()">
                    </div>
                    <small>
      <%int n=rs.getInt(4); for(int k=0;k<n;k++){out.print("<img alt='star' src='img/star.png' width='16px' height='16px'>");} %></small>
                   
                  </div>
                </div>
                </div> 
              </div>
              </form>
            </div>
	<%	
}
 con.close();
} 
catch(Exception e){ 
out.println(e); 
} 

%>
  </div>
        </div>
      </div>
    </section>
<jsp:include page="footor.jsp"></jsp:include>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" ></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    
   function myfun(){
	   var ch=document.getElementById("checkSession").value;
	   
	   if(ch==""){
		   Swal.fire({
			   icon: 'warning',
			   title: 'LOGIN....',
			   showCloseButton: true,
			   showConfirmButton: false,
			   footer: '<a href="login.jsp">first you login</a>'
			 })
		   return false;
	   }else{
		   return true;
	   }
	   
	 
	   
   }
   
    function search(){
    	$(document).ready(function(){
    		 var search=$('#search').val();
    	
       	  $.post({
       		  url:'search.jsp',
       		  data:{search:search},
       		  success:function(data){
       			 $('#searchdiv').html(data); 
       		  }
       	  });	
    	});
    	 
    	  
    }
  
    </script>
</html>
