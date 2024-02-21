

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import emailsending.Mailer;
import emailsending.jdbc;
import emailsending.otpgenerate;

/**
 * Servlet implementation class EmailCheck
 */
@WebServlet("/EmailCheck")
public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		if(request.getParameter("emailInput")!=null) {
			PrintWriter pw=response.getWriter();
	String email=		request.getParameter("emailInput");
	System.out.println(email);
			try {
				Class.forName("org.postgresql.Driver"); 
				Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
				PreparedStatement ps=con.prepareStatement("Select * from e_student where  stud_gmail=?");
				ps.setString(1,email);
			ResultSet rs=	ps.executeQuery();
				if(rs.next()) {
					response.setContentType("text/html");
					pw.print("Already exit");
				}else {
					response.setContentType("text/html");
					pw.print("");
				}
				rs.close();
				ps.close();
				con.close();
			}catch(Exception e) {
				
			
		}
		}
		if(request.getParameter("usernameInput")!=null) {
			PrintWriter pw=response.getWriter();
	String username=		request.getParameter("usernameInput");
	System.out.println(username);
			try {
				Class.forName("org.postgresql.Driver"); 
				Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
				PreparedStatement ps=con.prepareStatement("Select * from e_student where stud_college_id=?");
				ps.setString(1,username);
			ResultSet rs=	ps.executeQuery();
				if(rs.next()) {
					response.setContentType("text/html");
					pw.print("Already exit");
				}else {
					response.setContentType("text/html");
					pw.print("");
				}
				rs.close();
				ps.close();
				con.close();
			}catch(Exception e) {
				
			
		}
			
		}
		
		if(request.getParameter("email")!=null) {
			PrintWriter pw=response.getWriter();
			  String to=request.getParameter("email");
					  String subject="E-learning study platform:Verify  Email OTP ";
				      String msg = otpgenerate.otp(4);
				    System.out.println(to);
				  
					boolean b=	Mailer.send(subject, msg, to);  
					if(b){
					    pw.print(msg);

												}
				}
		if(request.getParameter("inputValue")!=null) {
			PrintWriter pw=response.getWriter();
			String to=request.getParameter("email1");
			  String name=request.getParameter("name");
			  String username=request.getParameter("username");
			  String phone=request.getParameter("mobile");
			  String password=request.getParameter("Password");
			  String otp=request.getParameter("inputValue");
			  username=username.trim();
			  password=password.trim();
			  jdbc j=new jdbc();
			  j.insertreg(to, name, username, phone, password, otp);
			  pw.print("sucessed");
			  
		}
	

	}

}
