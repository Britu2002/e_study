<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent</title>
</head>
<body>
  <jsp:include page="nav1.jsp"></jsp:include>
  <div class="container " style="margin-top:40px">
  <div class="table-responsive">
 
   <table class="table"  border=1>
  <thead>
    <tr class="text-center bg-warning">
   
     <th scope="col">Book</th>
      <th scope="col">Book Name</th>
      <th scope="col">book Subject </th>
      <th scope="col">Author</th>
    <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  try {
	int s_id=(Integer)  session.getAttribute("stud_id");
		Class.forName("org.postgresql.Driver");
		Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
		String sql = "Select * from e_recent where r_stud_id= ? Order by read_time desc"; 
		
		PreparedStatement ps= con.prepareStatement(sql);
		ps.setInt(1,s_id);
	
	ResultSet rs=	ps.executeQuery();
	int c=0;
	while(rs.next()) {
		c++;
		%>
				<tr class="text-center "> <td><img src='<%=rs.getString(8)%>'alt='img' width="100px" height="100px" class="shadow bg-succcess"></td> 
				 <td><%=rs.getString(5) %></td> 
				  <td><%=rs.getString(9) %></td> 
				 <td><%=rs.getString(4)%></td>  
				 <td><form action="second.jsp">  <input value="<%=rs.getInt(2)%>" type="hidden"  name="b_id" > 
				   <input type="submit" value="Read" class="btn btn-sm btn-outline-secondary" class="readSubmit " onclick=" return myfun()">
				   </form></td>
				   </tr>
		<% 

	}
	
	if(c==0){
		%>
	<tr  class="text-center bg-light"><td colspan=5><small>NO Result found</small></td></tr>
			
		<% 
	}
	} catch (ClassNotFoundException | SQLException e) {
	
		e.printStackTrace();
	} 
  %>
   
     
  	</tbody>
</table>
  </div>
  
</div>
<jsp:include page="footor.jsp"></jsp:include>
</body>
</html>