

import java.io.IOException;
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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		HttpSession session=request.getSession();
		Connection	 con =null;
		RequestDispatcher rd=null;
		try {
			Class.forName("org.postgresql.Driver"); 
		 con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
			PreparedStatement ps=con.prepareStatement("Select * from e_student where stud_college_id=? and stud_password=?");
			ps.setString(1, user);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
		int stud_id=rs.getInt(1);
			session.setAttribute("stud_id",stud_id);
				session.setAttribute("name1", rs.getString("stud_name"));
				session.setAttribute("username", rs.getString("stud_college_id"));
				session.setAttribute("gmail", rs.getString("stud_gmail"));
				session.setAttribute("mob", rs.getString("stud_mob"));
				session.setAttribute("pass", rs.getString(6));
				rd=request.getRequestDispatcher("welcome.jsp");
			}else {
				request.setAttribute("status","failed");
				rd=request.getRequestDispatcher("login.jsp");
			}
			rd.forward(request, response);
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally{
		try {
			con.close();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		}
	}

}
