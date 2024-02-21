<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html> 
 <html>
 <head>
     <link href="css/bootstrap.min.css" rel="stylesheet" >
  
    <link rel="stylesheet" href="style.css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
          <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <title>pdf</title>
 <style>
body{
  overflow: hidden;
}
*{
margin:0px;
padding:0px;
}
 embed{

 width:70vw;

 height:94vh;
 
   frameBorder:0;
    scrolling=:auto;
 }
 #maindiv{
 position:relative;
 }
  #full_mode{
  color:#F5F5F5;
  font-size:20px;
  position: absolute;
  left:57.4vw;
  top:0.7vw;
    font-weight:0;
 
  padding:9px;
  cursor:pointer;
  }
 #full_mode:hover{
border-radius:50px;
background-color:rgba(225,225,225,0.1);


 
 }
 
  @media only screen and (max-width: 800px ) {
  #full_mode {
    position: absolute;
  left:49.1vw;
  top:1vw;
  }
}
 
 </style>
 </head>
 <body class="bg-light">
 <div id='nav'><jsp:include page="nav.jsp"></jsp:include> 
 </div>
<% 	 String  s= request.getParameter("b_id");
try{
int id=Integer.parseInt(s);	
	Class.forName("org.postgresql.Driver"); 
	Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
	String sql = "Select * from e_book where book_id=?"; 
PreparedStatement ps= con.prepareStatement(sql);
ps.setInt(1,id);ResultSet rs=	ps.executeQuery();rs.next();
out.print("  <div class='d-flex' id='maindiv'>"
+"<i class='icon-fullscreen ' id='full_mode' title='fullScreen'></i>"+
"<div id='embeddiv'><embed src="+rs.getString(5)+" type='application/pdf' class='bg-info'>"
+"</div>"
+"<div id='review'>"
+"<input value="+rs.getInt(1)+" type='hidden' id='hidden_book_id'>"

+"<small style='display:none;' id='hidden_name'>"+rs.getString(2)+"</small>"
+"</div>"
+"</div>");
out.print("");
int st_id = (Integer) session.getAttribute("stud_id");
  String   sql1="call insertsearch(?,?)";
 CallableStatement cs=con.prepareCall(sql1);
   cs.setInt(1, id);cs.setInt(2,st_id);cs.execute(); }catch(Exception e){out.print(e);}%>  
 </body>
 
 
 <script type="text/javascript">
 $(document).ready(function(){
var book_id	 =$('#hidden_book_id').val();
var book_name =	$('#hidden_name').html();

	 $.ajax({
		 url:'review.jsp',
		 data:{book_id:book_id,book_name:book_name},
		 success:function(data){
			 $('#review').html(data);
		 }
	 });
	 $('#full_mode').toggle(function () {
		 $('#full_mode').attr('title','Exit full Screen');
 $('embed').css({'width':'100vw','height':'100vh'});
 $('#full_mode').css('position','absolute');
 $('#full_mode').css('left','88.4%');
 $('#full_mode').css('top','1.2%');
		 $('#nav').hide();
		 $('#review').hide()
		}, function () {
			 $('#full_mode').attr('title','fullScreen');
			 $('embed').css('width','70vw');
			 $('embed').css('height','90vh');
			 $('#full_mode').css('position','absolute');
			 $('#full_mode').css('left','58%');
			 $('#full_mode').css('top','1.8%');
			 $('#nav').show();
			 $('#review').show()
		}
		);
	 
 });

 </script>
 </html>
 
