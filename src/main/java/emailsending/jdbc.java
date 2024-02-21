package emailsending;
import java.sql.*;
import emailsending.reg;
public class jdbc {

public void insert(String otp) {
	try {
		Connection	 con=DriverManager.getConnection("jdbc:mysql:///otp_time","root","ritu");
		System.out.println("connected");
		PreparedStatement	 ps=con.prepareStatement("insert into otp(otp,is_expired,creation_time) values(?,?,now())");
		
		ps.setString(1,otp);
		ps.setInt(2,0);
	ps.executeUpdate();
	ps.close();
	con.close();

	} catch ( SQLException e) {

		e.printStackTrace();
	}
}
public int validotp(String otp1)throws SQLException {
System.out.println(otp1);
Connection con = DriverManager.getConnection("jdbc:mysql:///otp_time","root","ritu");
PreparedStatement  ps=con.prepareStatement("select count(*)from otp where otp=? and is_expired = 0 and now()<=date_add(creation_time,INTERVAL 30 SECOND)");
ps.setString(1, otp1);
ResultSet rs=ps.executeQuery();
rs.next();
int n=rs.getInt(1);
System.out.println(rs.getInt(1));
ps.close();
con.close();
 return n;
		}
public void update(String otp) {

try {
	Connection 	con = DriverManager.getConnection("jdbc:mysql:///otp_time","root","ritu");
	PreparedStatement ps=con.prepareStatement("update otp set is_expired = 1 where otp=?;");
	 ps.setString(1, otp);
	 ps.execute();
	 ps.close();
	 con.close();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}
public int insertreg(String email,String name,String username,String mobile,String password,String otp) {
	int result=0;

	try {
		int reg_otp=Integer.parseInt(otp);
		Class.forName("org.postgresql.Driver"); 
		Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
	String sql="INSERT INTO e_student(stud_gmail, reg_otp, stud_college_id, stud_name, stud_password, stud_mob)VALUES ( ?, ?, ?, ?, ?, ?)";
		//PreparedStatement ps=con.prepareStatement("insert into reg(email,name,username,moblie,password,otp)values(?,?,?,?,?,?)");
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,email);
	ps.setInt(2,reg_otp);
	ps.setString(3,username);
	ps.setString(4,name);
	ps.setString(5,password);
	ps.setString(6,mobile);
	result=ps.executeUpdate();
	
	ps.close();
	con.close();
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	return result;
}
	

}
