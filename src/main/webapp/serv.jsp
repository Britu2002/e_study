<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="emailsending.*" %>
<% 
   
  if(request.getParameter("email")!=null){
	  String to=request.getParameter("email");
	  String subject="E-learning study platform:Verify  Email OTP ";
      String msg = otpgenerate.otp(4);
	boolean b=	Mailer.send(subject, msg, to);  
	if(b){
	out.print(msg);
jdbc jdbc=new jdbc();
jdbc.insert(msg);

		}
		 }
if(request.getParameter("otp1")!=null){
	String s1=request.getParameter("otp1");
	jdbc jdbc=new jdbc();
int i =	jdbc.validotp(s1);
if(i!=0){	
	out.print("verfied");
	jdbc.update(s1);
}else{
	out.print("otp is expired");
}
}
  %> 

