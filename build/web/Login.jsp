<%-- 
    Document   : newjsp
    Created on : 31 Ιουλ 2018, 12:02:24 μμ
    Author     : Elena
--%>


<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
          <%
         
          try {
              
              String   userName   = request.getParameter("username"); 
              String   passworD   = request.getParameter("password"); 
                                          
              Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/new_database","root","");
               System.out.println("Database Established;");
               Statement st = con.createStatement();
               ResultSet rs = st.executeQuery("select * from new_database.users");
               
              //  ResultSet _user = st.executeQuery("select username from users where username='" + userName + "';");
               // ResultSet _password = st.executeQuery("select password from users where password='" + passworD+"';");
		
               boolean user_check = false;
               
               while (rs.next() && user_check == false) {
                   
                   if (userName.equals(rs.getString(1)) &&  passworD.equals(rs.getString(2))){
                        user_check=true;%>
                      
                       <script>
                        alert ("Login successfully...");
                         </script>
                         
                         <%if ((rs.getString(3).equals("tourism"))){ %>
                          <script>
                                 window.location = "http://localhost:8080/Final_Project/tourism.html";
                             </script>
                             <% }else if ((rs.getString(3).equals("music"))){%>
                              <script>
                             window.location = "http://localhost:8080/Final_Project/music.html";
                                </script>
                                <% }else{%>
                                <script>
                             window.location = "http://localhost:8080/Final_Project/photography.html";
                                </script>
                                  <% }%>
                                
                  <% }}%>
                    <%if (user_check ==false){ %>
                   <script>
                      alert("Invalid Log in.Please try again...");
                     window.location = "http://localhost:8080/Final_Project/main.html";  
                    </script>
                  <% } %>      
	
           <%} catch (Exception e){
                System.out.println(e);              
         }
       %>
   
     
    </body>
</html>
