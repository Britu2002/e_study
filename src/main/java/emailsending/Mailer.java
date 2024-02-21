package emailsending;

import java.util.Properties;
import javax.activation.*;
import javax.mail.*;
import javax.mail.internet.*;


public class Mailer {

	public static boolean send(String subject,String msg,String to) {
	boolean	b=false;
		final String user="emaildemootp@gmail.com";//change accordingly  
		final String pass="azkrxfjbvdmmulrg";  
		
		Properties props = new Properties();  
		props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly  
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.ssl.enable","true");
		props.put("mail.smtp.auth", "true");  
		

		
		
		Session session = Session.getDefaultInstance(props,  
				 new javax.mail.Authenticator() {  
				  protected PasswordAuthentication getPasswordAuthentication() {  
				   return new PasswordAuthentication(user,pass);  
				   }  
				});  
		

		
		try { 	
			
			MimeMessage message = new MimeMessage(session);  
			 message.setFrom(new InternetAddress(user));  
			 message.setRecipient(Message.RecipientType.TO,new InternetAddress(to)); 
			 
		
	
			 message.setSubject(subject);
				MimeMultipart mimepart=	new MimeMultipart("related");
				MimeBodyPart bodypart =new	MimeBodyPart();
				String htmltext ="<p>Dear Customer,your OTP to verify email  is <b>"+msg+"</b> Regards,studyPlatfrom</p><img src='cid:image' width='500px' height='300px'>";
				bodypart.setContent(htmltext,"text/html");
				mimepart.addBodyPart(bodypart);
			MimeBodyPart messagebodypart =new	MimeBodyPart();		
				DataSource fds =new FileDataSource("C:\\\\Users\\\\heman\\\\OneDrive\\\\Desktop\\\\studylogo.jpg");
				messagebodypart.setDataHandler(new DataHandler(fds));
				messagebodypart.setHeader("content-ID","<image>");
				mimepart.addBodyPart(messagebodypart);

				message.setContent(mimepart);
				Transport.send(message); 
			
			 b=true;
			 System.out.print("done");
			  
			 } catch (MessagingException e) {  
			    throw new RuntimeException(e);  
			 } 
		return b;

	}				   
				   
		
	  
}
