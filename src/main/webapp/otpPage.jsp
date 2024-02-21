<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="emailsending.*"%>
    <%!String msg=""; %>
    <%

 if( request.getParameter("c_otp")!=null){
	
	 String s1=(String)request.getParameter("c_otp");

String email=(String)session.getAttribute("email");
String name=(String)session.getAttribute("name");
String username=(String)session.getAttribute("username");
String mobile=(String)session.getAttribute("phone");
String password=(String)session.getAttribute("password");
String otp=(String)session.getAttribute("otp");

	 if(s1.equals(otp)){
		 //jdbc j=new jdbc();
		 /* j.insertreg(email, name, username, mobile, password);*/
		   
		   response.sendRedirect("welcome.jsp");  
	
		 }else{
	msg="not vaild";
	 }
 } %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"  >
    <script src="js/bootstrap.bundle.min.js" ></script> 
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
  <body>

    <section class="vh-100" style="background-color: #9A616D;">
      <div class="container py-2 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
          <div class="col col-xl-7">
            <div class="card" style="border-radius: 1rem;">
             
              
             
                  <div class="card-body p-4 p-lg-5 text-black">
    
                    
    <form action="otpPage.jsp">
                      <div class="d-flex align-items-center mb-3 pb-1" >
                   
                        <span class="h1 fw-bold mb-0">Email verify </span>
                      </div>
    
                      <h5 class="fw-normal mb-1 pb-1" style="letter-spacing: 1px;">we will send you an one time otp on this  email:-<%out.print(session.getAttribute("email")); %></h5>
 <p>if you do not recive  email use another email</p>                 
                    
                      <div class="form-outline mb-4">
                        <input type="text"  class="form-control form-control-lg" name="c_otp" />
                        <label class="form-label">otp<span style="color:red">
                        <%
                        out.print(msg); %>
                         </span></label>
                      </div> 
    
                      <div class="pt-1 mb-4">
                      <input type="submit" id="submit" value="verify" class="btn btn-info btn-lg btn-block"> 
                    
                      </div>
    
                      <!-- <a class="small text-muted" href="#!">resend otp</a> -->
                </form>
                
              
                
                </div>
              </div>
          
          </div>
        </div>
      </div>
    </section>


  </body>

 <script>
 $(document).ready(function(){
	 $('#replace').click(function(){
		 alert('alert')
		 window.location.replace('welcome.jsp');
	 });
 });
 </script>
  
</html>