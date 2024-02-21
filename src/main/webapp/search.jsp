<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   
    <% if(request.getParameter("search")!= null){
    	
    	String searchval= request.getParameter("search");
  	 %>
  	 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>search</title>
<style>
.round{
border-radius:20px 118px 20px 118px;
}
 
</style>
</head>
<body>
<div class="container text-center mt-3 mb-3 ">
<h1 class="bg-warning pb-2 pt-2 round">Searching book</h1>
</div>
<hr>
 <section>
   <div class="album py-5 bg-light">
   <div class="container ">
   <div class="row">  <%
         try{ 
        	
Class.forName("org.postgresql.Driver"); 
String sql = "Select * from e_book where concat(book_name,book_subject,book_by) ilike ?"; 
Connection  con = DriverManager.getConnection("jdbc:postgresql:///e_study","postgres","ritu"); 
PreparedStatement ps = con.prepareStatement(sql); 
ps.setString(1,"%"+searchval+"%");
ResultSet rs = ps.executeQuery(); 
int c=0;
while(rs.next()){c++;%>

<div class="col-md-4 ">
          <form action="second.jsp" >
              <div class="card mb-4">
                <img class="card-img-top shadow rounded"  alt="img" style="height: 225px; width: 70%; display: block;margin:0px 60px;" src="<%=rs.getString(6) %>" >
              <div class="card-header bg-white">
                <div class="card-body">
            <div  style="min-height:7.5vh ">  <p class="card-text small"><b>book name:</b><%=rs.getString(2) %></p></div>  
               <div style="min-height:7vh">     <p class="card-text small "><b>subject:</b><%=rs.getString(7) %></p></div>
                <div style="min-height:7vh">     <p class="card-text small"><b>auother:</b><%=rs.getString(3) %></p></div> 
           <input value="<%=rs.getInt(1)%>" type="hidden"  name="b_id">         
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                 <input type="submit" value="Read" class="btn btn-sm btn-outline-secondary" class="readSubmit" onclick=" return myfun()">
                    </div>
                    <small>
      <%int n=rs.getInt(4); for(int k=0;k<n;k++){out.print("<img alt='star' src='img/star.png' width='16px' height='16px'>");} %></small>
                   
                  </div>
                </div>
                </div>
              </div>
              </form>
            </div>
	<%	
}
if(c==0){

	out.print("<p class='text-center h4'>Sorry! No Result Found</p>");
	out.print("<small class='text-center '>try adjusting your search or filter what you're looking for</small>");
}
 con.close();
 
} 
catch(Exception e){ 
out.println(e); 
} 

%>
  </div>
        </div>
      </div>
    </section>
</body>
</html>
  	 <% 
    } %>
