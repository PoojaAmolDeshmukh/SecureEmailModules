<%@ page import ="java.io.*,java.sql.*,java.util.*" %>
<%
	String name = request.getParameter("name");
	String fname = request.getParameter("fname");
	String coll_name = request.getParameter("coll_name");
	String d_name = request.getParameter("d_name");
    String date = request.getParameter("date");
	String month = request.getParameter("mnt");
	String year = request.getParameter("yr");
	String dob = date+" "+month+" "+year;
    int reg_no = Integer.parseInt(request.getParameter("reg_no"));
    String sex = request.getParameter("gender");
	String phone = request.getParameter("phone");
    String doj = request.getParameter("doj");
    String email = request.getParameter("email");
           try
           {
              Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

			  Connection cc=null;
			  cc=DriverManager.getConnection("jdbc:odbc:searchengine","","");
			  Statement s=cc.createStatement();
       		  PreparedStatement p1=cc.prepareStatement("select * from student where reg_no = ?");
              p1.setInt(1,reg_no);
              ResultSet rs1=p1.executeQuery();	
			  int count=1;
 
			  if(rs1.next())
              {
                  if(reg_no == rs1.getInt(6))
                  {
                       count = 0;
                  }
              }
   
   			  if(count == 0)
              {
              	 response.sendRedirect("Stuexists.html");
                 //out.print("User Alredy Exist");
              }
              else
              {
                   PreparedStatement p2=cc.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?)");
           	       p2.setString(1,name);
              	   p2.setString(2,fname);
                   p2.setString(3,coll_name);
                   p2.setString(4,d_name);
                   p2.setString(5,dob);
                   p2.setInt(6,reg_no);
                   p2.setString(7,sex);
                   p2.setString(8,phone);
                   p2.setString(9,doj);
                   p2.setString(10,email);

	               p2.executeUpdate();	
	               response.sendRedirect("stusuccess.html");  
               
               }

            }
			catch(Exception e)
			{
           		response.sendRedirect("stfail.html");         
              	out.println("Exception " + e);
			} 	
%>
