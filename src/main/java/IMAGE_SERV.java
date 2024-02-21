import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig
@WebServlet("/IMAGE_SERV")

public class IMAGE_SERV extends HttpServlet {
private static final long serialVersionUID = 1L;
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	Part file=request.getPart("image_file");
	String imageFilename =file.getSubmittedFileName();
	System.out.println(imageFilename);
String uploadPath = "D://aj//maven_project//emailsending//src//main//webapp//img/"+imageFilename;
System.out.println(uploadPath);

	FileOutputStream fos=new FileOutputStream(uploadPath); 
	InputStream is=file.getInputStream();
	byte []data=new byte[is.available()];
	is.read(data);
	fos.write(data);
	fos.close();	

System.out.println("upload");
response.sendRedirect("dynamic_image.html");
	}

}
