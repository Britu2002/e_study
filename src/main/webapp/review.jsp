<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
      
<style>
*{
margin:0;
padding:0;
}



form{

width:100%;



}
#icon{
padding:7px;
border-radius:30px;
padding-right:20px;


}
#icon:hover{
background-color:rgba(0,225,0,0.1);
cursor:pointer;

}

#likebtn{
border:none;
background:transparent;
}
</style>
</head>
<body class="bg-info">
<input value="<%=(Integer)session.getAttribute("stud_id")%>" type="hidden" id="s_id">
<div class="text-center m-2">
<p class="h4"><%if(request.getParameter("book_name")!=null){
String b_name=	request.getParameter("book_name");out.print(b_name);}%></p></div>
<form class="bg-warning">
<div class="bg-info">
<button id='likebtn' title='I like this'>
<i class="fa fa-thumbs-up" aria-hidden="true" style="font-size:24px;margin:2px;" id="icon" >
<small>2.3k</small>
</i>
</button>
<input type="text"  placeholder="Add a comment"  id="comment" class="m-0" style="height:30px;">
<input value="<%try{
int d=Integer.parseInt(request.getParameter("book_id"));
out.print(d);}catch(Exception e){} %>" type="hidden" id="b_id" style="width:20px;">

<input type="button" value="send" id="comment_sub" class="btn btn-primary btn-sm">
</div>
</form>
<div id="show_review_data"class="" style="overflow-x: hidden;;height:70vh;"></div>
</body>
<script>
$(document).ready(function(){
	  readrecords();

	$('#likebtn').toggle(function () {
		
		$('#icon').css('color','red')
		}, function () {
			$('#icon').css('color','black')	
		});
	
	$('#comment_sub').click(function(){
		var s_id=$('#s_id').val();
		var b_id=$('#b_id').val();
		var comment=$('#comment').val();
	
		if(comment==''){
			$('#comment').focus();
			return false;
			}
		$.ajax({
			url:'show_reviewing.jsp',
			data:{comment:comment,s_id:s_id,b_id:b_id},
			success:function(data){
				$('#comment').val('');
				readrecords();
				
			}
	
		});
	
	});


});


function  readrecords(){
	var book_id=$('#b_id').val();
	 $.ajax({
		 url:'Comment_s.jsp',
		 data:{book_id:book_id},
	 success:function(data){
		 $('#show_review_data').html(data);
		 }
	 });
}
</script>
</html>
