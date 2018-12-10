<%-- 
    Document   : insertdata
    Created on : 30 Ιουλ 2018, 10:19:32 πμ
    Author     : Elena
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            
               //String   userName   = request.getParameter("username"); 
               String   passworD   = request.getParameter("password"); 
               String   categ   = request.getParameter("category");
         
               try {
                                         
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtel_project","root","");
               System.out.println("Database Established;");
               Statement st = con.createStatement();
               //ResultSet rs = st.executeQuery("select * from users");
		st.executeUpdate("insert into mtel_project.users(username,password,category) values('"+passworD+"','"+categ+"')");	
               //st.executeUpdate("insert into users(username, password, category)values('"+userName+"','"+passworD+"','"+categ+"')");
               out.println("Data inserted!");
                } catch (Exception e){
                System.out.println(e);
                        
    }
          %>
    </body>
</html>
