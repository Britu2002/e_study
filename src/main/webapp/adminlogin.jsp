<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>
<section class="vh-100 bg-ight">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card shadow-2-strong" style="border-radius: 1rem;">
            <div class="card-body p-5 ">
  
              <h3 class="mb-5 text-center">Admin Login</h3>
  <form action="" method="post">
              <div class="form-outline mb-4">
                <input type="text"  name="admin_user" class="form-control form-control-lg " required  />
                <label class="form-label mx-1 " for=""><i class="fa fa-user" aria-hidden="true"></i>Admin Username</label>
              </div>
  
              <div class="form-outline mb-4">
                <input type="password"  name="admin_pass" class="form-control form-control-lg" required/>
                <label class="form-label mx-1" for=""><i class="fa fa-key" aria-hidden="true"></i>Password</label>
              </div>
<div class="mb-2"style="text-align:right">
          <a href="" class="link-primary " style="text-decoration:none" onclick="return forget()"> forget password?</a>
         
          </div>
  <div class="form-outline mb-4">
                <input type="Submit" value="Login" class="form-control form-control-lg btn btn-primary btn-lg btn-block" />
              
              </div>
              </form>
            
              <hr class="my-4">
  
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%if(request.getParameter("admin_user")!=null && request.getParameter("admin_pass")!=null ){
String admin=request.getParameter("admin_user");
String pass=request.getParameter("admin_pass");
if(admin.equals("admin")&& pass.equals("admin")){
	response.sendRedirect("add_book.jsp");
}else{
	out.print("<script>"+
"	 swal('Wrong!','sorry wrong username and password', 'error');	"+
"</script>");
}
}
	%>


</html>