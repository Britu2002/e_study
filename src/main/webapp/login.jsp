<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%if(session.getAttribute("username")!=null){
    	response.sendRedirect("welcome.jsp");
    }
        	%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>login</title>
<link href="css/bootstrap.min.css" rel="stylesheet" >
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<script src="js/bootstrap.bundle.min.js" ></script> 
<link rel="stylesheet" href="style.css">
</head>
  <body>
 <input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
 <jsp:include page="nav1.jsp"></jsp:include>
<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card shadow-2-strong" style="border-radius: 1rem;">
            <div class="card-body p-5 ">
  
              <h3 class="mb-5 text-center">Sign in</h3>
  <form action="LoginServlet" method="post">
              <div class="form-outline mb-4">
                <input type="text"  name="user" class="form-control form-control-lg " required  />
                <label class="form-label mx-1 " for=""><i class="fa fa-user" aria-hidden="true"></i>username</label>
              </div>
  
              <div class="form-outline mb-4">
                <input type="password"  name="pass" class="form-control form-control-lg" required/>
                <label class="form-label mx-1" for=""><i class="fa fa-key" aria-hidden="true"></i>Password</label>
              </div>
<div class="mb-2"style="text-align:right">
          <a href="" class="link-primary " style="text-decoration:none" onclick="return forget()"> forget password?</a>
         
          </div>
  <div class="form-outline mb-4">
                <input type="Submit" value="Login" class="form-control form-control-lg btn btn-primary btn-lg btn-block" />
              
              </div>
              </form>
              <div class="mb-4  text-center">
     Don't have a account? <a href="signup.jsp" class="link-primary " style="text-decoration:none" >SIGN Up</a>
         
          </div>
              <hr class="my-4">
  
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
var status =document.getElementById("status").value;
if(status=="failed"){
	swal("wrong!", "Username and password", "error");
}
function forget(){
	alert('forget')
}

</script>
</html>