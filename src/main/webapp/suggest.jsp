<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%if(session.getAttribute("stud_id")!=null){
    	%>
    	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
      <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <style>
    *{
    margin:0px;
    padding:0px;
    }
    
  .cards-wrapper{  display:flex; }    
.c{
margin:0px 10px;
}
    </style>
</head>
<body>

<%! int c=0; %>
<div id="mainc">
<div class="container text-center mt-3 mb-3 ">
<h1 class="bg-warning pb-2">Suggestion</h1>
</div>
<hr>
<div id="carouselExampleControlsNoTouching " class="carousel carousel-dark slide  " >
      
       
           <div class="album py-5 bg-light">
        <div class="container">
              <div class="row slider">
       
               
                      <%
                      try{
                    	
                  		int sid =(Integer)session.getAttribute("stud_id");

                  		Class.forName("org.postgresql.Driver"); 
                  		Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
                  		String sql="select * from suggestion1(?)";
                  		PreparedStatement ps=con.prepareStatement(sql);
                  		ps.setInt(1,sid);
                  	ResultSet rs =	ps.executeQuery();
                  	while(rs.next()){
                  		c++;
                  		%>
                  		
                  	    <div class="col-md-4 c">
                  	          <form action="second.jsp"  >
                        <div class="card mb-4 box-shadow">
                        
 <img class="card-img-top"  src="<%=rs.getString(6) %>" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                         <div class="card-header bg-white">
                          <div class="card-body">
                           <div  style="min-height:7.5vh ">  <p class="card-text small"><b>book name:</b><%=rs.getString(2) %></p></div>  
               <div style="min-height:7vh">     <p class="card-text small "><b>subject:</b><%=rs.getString(7) %></p></div>
                <div style="min-height:7vh">     <p class="card-text small"><b>auother:</b><%=rs.getString(3) %></p></div> 
                    <input value="<%=rs.getInt(1)%>" type="hidden"  name="b_id">         
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
               <input type="submit" value="Read" class="btn btn-sm btn-outline-secondary" id="readSubmit">
                  </div>
                  <small class="text-muted"><%=rs.getInt(4) %>  Star</small>
                </div>
                          </div>
                          </div>
                        </div>
                            </form>
                      </div>
            
                 	<%     	}
                  	
                  	}catch(Exception e){  }  %>
       </div>
           </div>
  
        
         
  
        </div>
        <button class="carousel-control-prev " type="button" id="prev" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
          <span class="carousel-control-prev-icon  "  aria-hidden="true" ></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next  " type="button"id="next" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
          <span class="carousel-control-next-icon " aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

   
 </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script>

	 $('.row').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  infinite: false,
		 
		  autoplaySpeed: 2000,
		  nextArrow:$('#next'),
		  prevArrow:$('#prev')
		});


  $(document).ready(function(){
 var card=  $('.c')
 if(card.length==0){
	 $('#mainc').hide();
 }




  });

</script>
</html>
    	<%
    }
    	%>
    
