<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String otp1 =(String)request.getParameter("otp1");
    	String hiddenValue =(String) request.getParameter("hiddenValue");
    	 if(otp1.trim().equals(hiddenValue.trim())){
    		
    		out.print("otp verified");
    		
    	 }else{ 
    		 out.println("value"+hiddenValue);
    		 out.println("otp"+otp1);
    		
    		 out.println("sorry");
    		 
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