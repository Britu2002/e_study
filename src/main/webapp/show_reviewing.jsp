<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getParameter("comment")!=null){
String comment=	request.getParameter("comment");
try{
int book_id=Integer.parseInt(request.getParameter("b_id"));
		int stud_id=(Integer)(session.getAttribute("stud_id"));
			Class.forName("org.postgresql.Driver"); 
	Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
	String sql = "select * from insert_update_review(?,?,?,?)"; 
	PreparedStatement ps= con.prepareStatement(sql);
	ps.setInt(1,book_id);
	ps.setInt(2, 0);
	ps.setString(3,comment);
	ps.setInt(4,stud_id);
	ResultSet rs=	ps.executeQuery();
		}catch(Exception e){out.print(e);}
}

%>


</body>
</html>