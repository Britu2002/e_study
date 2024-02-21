<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SIGN UP</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" >
       <link href="css/bootstrap.min.css.map" rel="stylesheet" >

    <script src="js/bootstrap.min.js"></script>
    <script src="jsfile.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
 <link rel="stylesheet" href="style.css">
</head>
<body>
<jsp:include page="nav1.jsp"></jsp:include>
<section class="h-100" style="background-color:navy">

<div class="container py-5 " >

<div class="col-sm">
 <div class="card card-registration my-4" >

 <div class="row g-0">
   <div class="col-sm ">
              <img src="img/bg3.jpg"
                alt="Sample photo" class="img-fluid"
                style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem; " />
            </div>
            
            <div class="col">
            <div class="col">
             <div class="card-body p-md-3 text-black">
            <h3>Registration from</h3>
            <div class="row" >
           <form id="form" >
           
          <div class="col pt-1">
                    <div class="form-outline mb-4" >
                      <input type="text" class="form-control form-control-sm" id="emailInput" name="email" />
                      <label class="form-label">Email</label>
                     <span id="emailSpan"></span>
                    </div>
                    
                    
                    <div class="form-outline mb-4">
                  <input type="text" class="form-control form-control-sm" id="nameInput" name="name"/>
                  <label class="form-label" for="form3Example8">Name</label>
                  <span id="nameSpan"></span>
                </div>
                                    <div class="form-outline mb-4">
                  <input type="text" class="form-control form-control-sm"  id="usernameInput" name="username"/>
                  <label class="form-label">Username/Scholor No.</label>
                   <span id="usernameSpan"></span>
                </div>
                
                                    <div class="form-outline mb-4">
                  <input type="number" class="form-control form-control-sm" id="mobileInput" name="mobile"/>
                  <label class="form-label" for="form3Example8">Moblie No.</label>
                  <span id="mobilespan"></span>
                </div>
                
                                    <div class="form-outline mb-4">
                  <input type="text" class="form-control form-control-sm" id="passwordInput" name="Password"/>
                  <label class="form-label" for="form3Example8">Password</label>
                    <span id="passwordspan"></span>
                </div>
               
                
                  </div>
                  
                  
                <div class="d-flex justify-content-between ">
                <div><p>have account<a href="login.jsp" class="link-primary m-1">login in</a></p></div>
                <div>
                  <button type="reset" class="btn btn-light btn-md" >Reset all</button>
                  <button type="button" class="btn btn-warning btn-md ms-2" id="submitbtn">Submit</button>
                  </div>
                </div>
               
                  </form>
                  
            </div>
            
          </div>
            </div>
            </div>
 </div>
 </div>

</div>
</div>
</section>
</body>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#submitbtn').click(function(){
var email=	$('#emailInput').val();
var email1=	$('#emailInput').val();
var mobile=	$('#mobileInput').val();
var name= $('#nameInput').val();
var Password=$('#passwordInput').val();
var username=	$('#usernameInput').val();
if(email==""){
	$('#emailSpan').css('color','red').html("is not empty");
	$('#emailInput').focus();
	return false;
}else if(emailInput()==false){
	return false
	}else if(IsEmail(email)==false){
	$('#emailSpan').css('color','red').html("use correct expression for email");
	$('#emailInput').focus();
	return false;}

if(name==""){
	$('#nameSpan').css('color','red').html("is not null")
	return false;
}
if(username==""){
$('#usernameSpan').css('color','red').html("is not null")
return false;
}else if(usernameInput()==false){
	return false;}

if(mobile==""){
	$('#mobilespan').css('color','red').html("is not null")
	return false;
}else if(mobileInput()==false){
	return false;
}

if(Password==""){
	$('#passwordspan').css('color','red').html("is not null")
	return false;
}
//$('#form').submit();
$.post({
	url:'EmailCheck',
	data:{email:email},
	 beforeSend: function(){
		  
		   swal({
  title: 'wait same second...',
  text: 'I will close in 2 seconds.',
  buttons: false
}) 
		   },
	success:function(data){
		 swal({text:'otp send on your email', content: "input",
		    }).then(function(inputValue){
		            if(inputValue==data){
		            $.post({
		        	 url:'EmailCheck',
		        	 data:{inputValue:inputValue,email1:email1,mobile:mobile,name:name,Password:Password,username:username},
		        	 beforeSend: function(){
		       		  
		      		   swal({
		        title: 'wait few second...',
		        text: 'I will close in 2 seconds.',
		        buttons: false
		      }) 
		      		   },
		        	 success:function(){
		        		 swal("register successfullly!", "You clicked the button!", "success");
		        		 	$('#emailInput').val("");
		        		 	$('#mobileInput').val("");
		        		 $('#nameInput').val("");
		        		 $('#passwordInput').val("");
		        		$('#usernameInput').val(""); 		 

}
		        	 
		         }) }else{
		            		
		  		            
		                swal("Sorry!", "wrong otp entered", "error");
		             
		            }
		        })
	}
	
});

});
});




</script>

</html>