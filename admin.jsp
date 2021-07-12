<%@ page import ="java.io.*,java.sql.*,java.util.*" %>
<%


	String name =  request.getParameter("name");
	String password = request.getParameter("pass");
	
              try
           {
              	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

				Connection cc=null;
				cc=DriverManager.getConnection("jdbc:odbc:searchengine","","");
				Statement s=cc.createStatement();
				PreparedStatement p1=cc.prepareStatement("select * from admin where name = ? and password=?");
				p1.setString(1,name);
				p1.setString(2,password);
				ResultSet rs1=p1.executeQuery();	
				int count=1;

 
				if(rs1.next())
                {
                      if(name.equals(rs1.getString(1))&& pass.equals(rs1.getString(2))
                       {
                        count = 0;
                  
                       }
                }

   
   				if(count == 0)
               {
                 response.sendRedirect("index.jsp");
                 //out.print("Adfail.html");
               }
               else
               {
                   response.sendRedirect("Adfail.html");
 	                            //out.print("Inserted");
                 }


           }catch(Exception e){
         //  response.sendRedirect("hai1.html");
              out.println("Exception " + e);}
          


%>