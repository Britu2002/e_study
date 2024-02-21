package emailsending;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class hello {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
System.out.println("send message...");
String message="Dear Customer,your OTP to verify email  is "+ otpgenerate.otp(4)+" Regards,studyPlatfrom";
String subject="E-learning study platform:Verify  Email OTP ";
String to="bansalritu2002@gmail.com";
String from ="emaildemootp@gmail.com";
sendEmail(message,subject,to,from);

	}

	
	private static void sendEmail(String message, String subject, String to, String from) {
		String host="smtp.gmail.com";
	Properties properties=	System.getProperties();
//	System.out.println(properties);
	properties.put("mail.smtp.host", host);
	properties.put("mail.smtp.port", "465");
	properties.put("mail.smtp.ssl.enable","true");
	properties.put("mail.smtp.auth","true");
Session session=	Session.getInstance(properties,new Authenticator() {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			// TODO Auto-generated method stub
			return new PasswordAuthentication("emaildemootp@gmail.com","azkrxfjbvdmmulrg");
		}
	});
session.setDebug(true);
MimeMessage m=new MimeMessage(session);
try {
	m.setFrom(from);
	m.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	m.setSubject(subject);
	m.setText(message);
//	String path ="C:\\Users\\heman\\OneDrive\\Desktop\\studylogo.jpg";
	
	
	Transport.send(m);
	System.out.println("sent success");
} catch (MessagingException e) {

	e.printStackTrace();
}
	}


}
