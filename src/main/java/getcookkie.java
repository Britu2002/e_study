

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class getcookkie
 */
@WebServlet("/getcookkie")
public class getcookkie extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getcookkie() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath())



//		
		
//		PrintWriter pw=response.getWriter();

		String sessionid = null;
		Cookie[] cookies = request.getCookies(); 
		
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) 
			{ if (cookies[i].getName().equals("sessionid")) 
			{ 
				sessionid = cookies[i].getValue(); 
				break; } }
			} 
		if (sessionid == null) { 
			sessionid = generateSessionId(); 
			Cookie c = new Cookie("sessionid", sessionid);
			c.setMaxAge(60 * 60 * 24 * 365 * 10);
			c.setSecure(true);
			c.setHttpOnly(true);
			response.addCookie(c);
			}
	
//		pw.println(session.getId());
//		Cookie[] c=	request.getCookies();
//		for(int i=0;i<c.length;i++) {
//			 String name = c[i].getName();
//			  String value = c[i].getValue();
//			  pw.print("name"+name);
//			  pw.print("value"+value);
	//	}
	}
	private static String generateSessionId() { 
		String uid = new java.rmi.server.UID().toString(); 
	
		return uid;  
	} 
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	}
	

}
