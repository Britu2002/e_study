package emailsending;
import java.awt.image.BufferedImage;
import java.io.*;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.apache.pdfbox.tools.imageio.ImageIOUtil;

public class thum {
public static String imgconvert(String pdf) throws Exception  {
	
	String pdfdir="D://aj//maven_project//emailsending//src//main//webapp//pdf/";
		PDDocument doc =PDDocument.load(new File(pdfdir+pdf));
		PDFRenderer pdfRenderer =new PDFRenderer(doc);
BufferedImage image =pdfRenderer.renderImageWithDPI(0,300,ImageType.RGB);
String dir = "D://aj//maven_project//emailsending//src//main//webapp//img/";
String temp=pdf.split("\\.")[0];
String fileName = dir+temp+".png";
ImageIOUtil.writeImage(image, fileName,300);
doc.close()	;
System.out.println("success");
return temp+".png";


	
}
//	public static void main(String[] args) {
//	
//		thum.imgconvert("java.pdf");	
//	
//	}

}
