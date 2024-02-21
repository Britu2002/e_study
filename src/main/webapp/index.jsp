<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="shortcut icon" href="#">
<style>
#resend{
border:none;
color:red;
background-color: transparent;
display:none;

}

</style>
</head>
<body>
<h1>email verify</h1>
<p id="msgtag"></p>

<input type="text" id="hiddenValue" style="display:none;">
<span  class="err"></span><label>Email:</label><input type="text" id="email" ><br><br>
<label>otp:</label><input type ="text" id="disabledbtn" disabled >
<input type='button' value='send otp' id="sendbtn" > 
<p id="counter"></p>
<button id="resend" >resend otp again</button>
<input type="button" value="verify" style="display:none;" id="submitbtn">

<script>

$(document).ready(function(){
	
	 function countdown() {
	        var seconds = 30
	        function timer() {
	          var counter = document.getElementById("counter");
	          seconds=seconds-1;
	          counter.innerHTML =
	            "0:" + (seconds < 10 ? "0" : "") + seconds;
	          if (seconds > 0) {
	            setTimeout(timer, 1000);
	          } else {
	        	  document.getElementById("counter").innerHTML=" ";
	           var x= document.getElementById("resend");
	           x.style.display="block";
	          }
	        }
	        timer();
	      }
	      
$('#resend').click(function(){
	$('#sendbtn').click();
});
	$('#sendbtn').click(function(){
		$('#resend').hide();
var email=	$('#email').val();
if(email==""){

	$('.err').css('color','red').html("*")
	$('#email').css('border','1px solid red').css('border-radius','4px')
	return false;
}else{
	$('.err').html("")
	$('#email').css('border-color','')
}


$.ajax({
	url:'serv.jsp',
	type:'post',
	data:{email:email},
	   beforeSend: function(){
		    $("#msgtag").html("loading....").css('background-color','#ADD8E6');
		   },
	success:function(data){
		$( "#disabledbtn" ).prop( "disabled", false );
		
		$('#sendbtn').hide();
		$('#submitbtn').show();
		$("#msgtag").html("check email for the otp").css('background-color','green');
		$('#hiddenValue').val(data);
		countdown();

		  },error:function(){
		$('#msgtag').html("Sending failed because of invalid destination addresses....").css('background-color','rgba(255, 99, 71, 1)')
		$("#loader").hide();
	$( "#disabledbtn" ).prop( "disabled",true);
	
	}
	
	
});
});
$('#submitbtn').click(function(){
	$('#resend').hide();
	var otp1 =	$('#disabledbtn').val();
if(email=""){
		$('.err').css('color','red').html("*")
		$('#email').css('border','1px solid red').css('border-radius','4px')
		return false;
	}else if(otp=""){
		$('#disabledbtn').css('border','1px solid red').css('border-radius','4px')
		return false;
	}else{
		$('.err').html("")
		$('#email').css('border-color','')
	}
	$.ajax({
		url:'serv.jsp',
		type:'post',
		data:{otp1:otp1},
		 beforeSend: function(){
			    $("#msgtag").html("loading....").css('background-color','#ADD8E6');
			    
			   },
		success:function(data){
			
				//$("#msgtag").html(data);
				if(data=="verfied"){
					window.location.href ="welcome.jsp";
				}else{
					$('#submitbtn').hide();
					$('#sendbtn').show();
					$( "#disabledbtn" ).prop( "disabled",true);
					
					 $("#resend").html("");
				}
				
				
				 
			
		},error:function(){
			$("#msgtag").html("if you dont't recive have otp use another email");
			$("#loader").hide();
		}
		
		
	});
	
	});	
});

</script>
</body>
</html>