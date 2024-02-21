<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="org.apache.pdfbox.rendering.*"%>
  <%@page import="java.io.*,java.awt.image.BufferedImage,org.apache.pdfbox.pdmodel.*,org.apache.pdfbox.tools.imageio.*" %>
    <%
    String imageFilename= (String)request.getAttribute("iname");
	try {
String uploadPath = "D://aj//maven_project//emailsending//src//main//webapp//pdf/"+imageFilename;
		PDDocument doc =PDDocument.load(new File(uploadPath));
		PDFRenderer pdfRenderer =new PDFRenderer(doc);
BufferedImage image =pdfRenderer.renderImageWithDPI(0,300,ImageType.RGB);
String dir = "D://aj//maven_project//emailsending//src//main//webapp//img/";
String fileName = dir+imageFilename+".png";
ImageIOUtil.writeImage(image, fileName,300);
doc.close()	;

out.print("sucess");

	} catch (IOException e) {
		
		e.printStackTrace();
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