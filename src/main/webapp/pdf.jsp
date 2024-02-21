<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        embed{
            width:100vw;
            height:100vh;
        }
    </style>
</head>
<body>
<%
try{ 
Class.forName("org.postgresql.Driver"); 
String sql = "Select * from e_book"; 
Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu"); 
Statement st = con.createStatement(); 
ResultSet rs = null; 
 
rs= st.executeQuery(sql); 
while(rs.next()){
	
	%>
<div>
<form action="second.jsp" target="_blank">
<img src = "<%= rs.getString(6) %>" width="200px" height="200px">
<h3><%=rs.getString(2) %></h3>
<p><%=rs.getString(3) %></p>
<small><%=rs.getInt(4) %></small>
<input  value ="<%=rs.getInt(1)%>" type="text" name="id">
<input type= "submit" value= "submit">
</form>
</div>
	<%	
}
 con.close();
} 
catch(Exception e){ 
out.println(e); 
} 

%>

</body>
</html>