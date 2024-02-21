<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.box {
    inline-size: 324px;
   
    overflow-wrap: break-word;
}
    
</style>
</head>
<body>
<div class="row  ">
  <div class="" style="width:60vh" >
    <div class="card shadow-0 border-0 bg-light ">
      <div class="card-body p-2">
       <div class="form-outline mb-1">
       
          <label class="form-label" for="">Comments</label>
        </div>
<%
try{
		int book_id=Integer.parseInt(request.getParameter("book_id"));
		//int book_id=11;
          Class.forName("org.postgresql.Driver"); 
	Connection  con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/e_study","postgres","ritu");
	String sql = "select * from show_review(?);"; 
	PreparedStatement ps= con.prepareStatement(sql);
	ps.setInt(1,book_id);

	ResultSet rs=	ps.executeQuery();
	while(rs.next()){
	%>
	
   <div class="card mb-3">
          <div class="card-body">
            <p><%=rs.getString(1)%></p>

            <div class="d-flex " >
              <div class="d-flex">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(32).webp" alt="avatar" width="25"
                  height="25" />
                <p class="small mb-0 ms-2 box" ><%=rs.getString(2) %></p>
              </div>
              <div class="d-flex flex-row align-items-center " >
                <p class="small text-muted mb-0 " ></p>
                <i class="far fa-thumbs-up ms-2 fa-xs text-black" style="margin-top: -0.16rem;"></i>
              </div>
            </div>
          </div>
        </div>
         
    
	<% 
		
		
	}
		}catch(Exception e){out.print(e);}

%>
 </div>
    </div>
  </div>
</div>
</body>
</html>