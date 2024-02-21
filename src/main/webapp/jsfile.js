/**
 * 
 */
 
 
 function usernameInput(){
var b=false;
var usernameInput=$('#usernameInput').val();
$.post({
	url:"EmailCheck",
	type:"post",
	async: false,
	data:{usernameInput:usernameInput},
	success:function(data){
		if("Already exit"==data){
			$('#usernameSpan').css('color','red').html(data);
			}else{$('#usernameSpan').html(data);
			b=true;}}
})
return b;
}

function emailInput(){
	var b =false;
var emailInput=$('#emailInput').val();

		$.post({
			url:"EmailCheck",
			async: false,
			type:"post",
			data:{emailInput:emailInput},
			success:function(data){
				if("Already exit"==data){
					$('#emailSpan').css('color','red').html(data);
				
				}else{
					$('#emailSpan').html(data)
		b=true;
					}
			
				
				}
			
		})
	return b
		}

	
function IsEmail(email) {
	  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  if(!regex.test(email)) {
	    return false;
	  }else{
	    return true;
	  }
	}

function mobileInput(){
	var mobile =$('#mobileInput').val();
		if(mobile.toString().length!=10){
			if(mobile.toString().length>10){
				$('#mobilespan').css('color','red').html("length is more")
				return false;
			}else{
				$('#mobilespan').css('color','red').html("length is less")
				return false;
			}	
		return false;
			}else{
				$('#mobilespan').html("")
		return true;
			}
	
}
