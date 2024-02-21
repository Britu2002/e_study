<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="nav.js" defer></script>
<style>
*{
margin:0px;
padding:0px;
}


 ul{
          margin:0;    
       background-color: rgb(4, 34, 68);
           list-style-type: none;
        display: flex;
                 justify-content: space-between;
            align-items: center;
        
        color:white
     
        }
        
       #nav{
       display:flex;
       }
        
        li{
padding:0px 9px;
            line-height: 50px;
            font-size: 24px;
            cursor: pointer;
        
        }
        li a{
            display: inline-block;
              text-decoration: none;
            color: white;
          
        }
        li a:hover{
    color: lightblue;
 
   
}
 a:is(:link,:active,:visited).active{
    color: lightblue;
    border-bottom: 5PX solid lightblue;
    border-radius: 1px;
    transition: 0.5 ease;
}
.bsign{
display:flex;
}

</style>
</head>
<body>
 <%if(session.getAttribute("username")!=null){%>
<input value="<%=(String)session.getAttribute("username")%>" type="hidden"  id="checkSession">  
    <%  }else{%>
     <input value="" type="hidden"  id="checkSession">     
        	<% }%> 
 <ul id="navbar" class="p-0">
<div id="nav">
  <li ><a href="welcome.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
   <li><a href="About.jsp" >About</a></li>
   <li ><a href="history.jsp" id="recent" onclick="return theFunction();">Recent</a></li> 

   </div>
 <div class="bsign">
<li id="logout"><a href="logout.jsp">logout</a></li>
<li id="login"><a href="login.jsp">login</a></li>
<li ><a href="signup.jsp">signup</a></li>
<li ><a href="adminlogin.jsp">Admin</a></li>
           </div>
        </ul>
</body>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
    function theFunction () {
    	var ch=	$('#checkSession').val();
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
</script>
<script>

$(document).ready(function(){
	var ch=	$('#checkSession').val();
	if(ch==""){
		$('#login').show();
		$('#logout').hide();
	}else{
		$('#login').hide();
		$('#logout').show();
	}
	
	
	
})


</script>
</html>