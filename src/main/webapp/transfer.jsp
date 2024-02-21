<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*"%>
    <%
    try{
    	 Class.forName("org.postgresql.Driver"); 

    	 Connection	 con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
    	String   sql="call insertsearch(4,4)";
    	 		CallableStatement cs=con.prepareCall(sql);
    //	PreparedStatement ps= 		con.prepareStatement("{call insertSearch(2,4)");
    //	ps.execute();
    	 		//cs.setInt(1, 2);
    	 		//cs.setInt(2, 4);
    	 		cs.execute();
    	 		out.print("success");	
    }catch(Exception e){
    	out.print(e);
    }
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>