

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import emailsending.thum;

@MultipartConfig
@WebServlet("/servlet_thumbnail")
public class servlet_thumbnail extends HttpServlet {
	private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	RequestDispatcher rd=request.getRequestDispatcher("add_book.jsp");
	String b_name=request.getParameter("book_name");
	String book_by=request.getParameter("book_by");
	String book_subject=request.getParameter("book_subject");
Part file=request.getPart("image_file");
String tempsplit=file.getSubmittedFileName();
	String imageFilename =tempsplit;
	imageFilename  = imageFilename.replaceAll("\\s", "");
	System.out.println(imageFilename);
	String temp=imageFilename.split("\\.")[1];
	System.out.println(temp);
	if(temp.equals("pdf")) {
		
		String uploadPath = "D://aj//maven_project//emailsending//src//main//webapp//pdf/"+imageFilename;
		File f=new File(uploadPath);
		System.out.println(uploadPath);
		if(f.exists()) {
			request.setAttribute("add_book_status","already_exit_file_name");	
		}else {
			FileOutputStream fos=new FileOutputStream(uploadPath); 
			InputStream is=file.getInputStream();
			byte []data=new byte[is.available()];
			is.read(data);
			fos.write(data);
		fos.flush();
			fos.close();
try {
	String img_name=	thum.imgconvert(imageFilename);
			Class.forName("org.postgresql.Driver"); 
			Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
			String sql="INSERT INTO e_book(book_name, book_by, rating, book_directory, book_tumnail, book_subject)"
					+ "	VALUES (?, ?, ?, ?, ?, ?);";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,b_name);
			ps.setString(2, book_by);
			ps.setInt(3, 0);
			ps.setString(4,"pdf/"+imageFilename);
			ps.setString(5,"img/"+img_name);
			ps.setString(6,book_subject);
			ps.execute();
			System.out.println("book inserted");
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		request.setAttribute("add_book_status","true");
		}
		
	}else {
		request.setAttribute("add_book_status","false");
	}

	rd.forward(request, response);
//	PrintWriter pw=response.getWriter();
//	pw.print("pdfvsucess");

		
	}

}
