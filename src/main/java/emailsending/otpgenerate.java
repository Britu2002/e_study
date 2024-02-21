package emailsending;

import java.util.Random;


public class otpgenerate {

	public static String otp(int length) {
		String number ="0123456789";
		String otp="";
		Random random=new Random();
		for(int i=0;i<length;i++) {
			otp+=number.charAt(random.nextInt(number.length()));
			
		}
	
		return otp;
	}
}
