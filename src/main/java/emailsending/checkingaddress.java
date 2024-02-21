package emailsending;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class checkingaddress {

	public static void main(String[] args) {
		ArrayList<String> emails = new ArrayList<String>();  
        emails.add("@gmail.com");  
        emails.add("ritu bansal@domin.com]]$.in.jsp...");  
        emails.add("javaTpoint.name@domain.com");  
        emails.add("javaTpoint#@domain.co.in");  
        emails.add("javaTpoint@domain.com");  
        emails.add("javaTpoint@domaincom");  
        //Add invalid emails in list  
        emails.add("@yahoo.com");  
        emails.add("javaTpoint#domain.com");  
        //Regular Expression   
        String regex = "^(.+)@(.+)$";  
        //Compile regular expression to get the pattern  
        Pattern pattern = Pattern.compile(regex);  
        //Iterate emails array list  
        for(String email : emails){  
            //Create instance of matcher   
            Matcher matcher = pattern.matcher(email);  
            System.out.println(email +" : "+ matcher.matches()+"\n");  
        }  
System.out.print(validateEmail("@gmail.com"));		
	}
	public static  boolean validateEmail(String email) {
	    boolean isValid = false;
	    try {
	        // Create InternetAddress object and validated the supplied
	        // address which is this case is an email address.
	        InternetAddress internetAddress = new InternetAddress(email); // strict
	        internetAddress.validate();
	        isValid = true;
	    } catch (AddressException e) {
	        System.out.println("Bad eMail address: " + email);
	    }
	    return isValid;
	}

}
