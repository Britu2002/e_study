

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
 * Servlet implementation class servelt_Session
 */
@WebServlet("/servelt_Session")
public class servelt_Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servelt_Session() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
//		PrintWriter pw=response.getWriter();
//		pw.print("welcome");
		Cookie ck=new Cookie("abc","123");
		response.addCookie(ck);
	
//	Cookie[] c=	request.getCookies();
//	for(int i=0;i<c.length;i++) {
//		 String name = c[i].getName();
//		  String value = c[i].getValue();
//		  pw.print("name"+name);
//		  pw.print("value"+value);
//	}
//		HttpSession ses=	request.getSession(false);
//		
//		pw.print(ses);
//		if(ses==null) {
//			pw.print("not created any session");
//			
//		}else{
//			pw.print("created");
//			
//		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
	

	}

}
