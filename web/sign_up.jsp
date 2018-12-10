<%-- 
    Document   : newjsp
    Created on : 29 Ιουλ 2018, 3:00:08 μμ
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
        <title>Sign_Up_Page</title>
  
           <style>
              
                form {
                /* Just to center the form on the page */
                margin: 0 auto;
                width: 400px;
                text-align: center;
                /* To see the outline of the form */
                padding: 2em;
                border: 2.5px solid #FAFAD2;
                border-radius: 1em;
                background:#E6E6FA;
                opacity:0.7;
                position: absolute;
                top: calc(50% - 120px);
                left: calc(50% - 215px);
                
              }
              
              form div + div {
                margin-top: 1em;
              }

              label {
                /* To make sure that all labels have the same size and are properly aligned */
                display: inline-block;
                width: 90px;
                text-align: center;
              }

              input, textarea {
                /* To make sure that all text fields have the same font settings
                   By default, textareas have a monospace font */
                font: 1.2em Arial;
                color:  #5c85d6;
                height: 45px;
                text-align: center;
                

                /* To give the same size to all text fields */
                width: 400px;
                box-sizing: border-box;
                border-radius: 0.5em;

                /* To harmonize the look & feel of text field border */
                border: 2px solid #999;
              }

              input:focus, textarea:focus {
                /* To give a little highlight on active elements */
                border-color: #000;
                font: 1.2em Arial;
                
              }

              textarea {
                /* To properly align multiline text fields with their labels */
                vertical-align: top;
             
                /* To give enough room to type some text */
                height: 5em;
              }

              
              button {
                /* This extra margin represent roughly the same space as the space
                   between the labels and their text fields */
                margin-left: .5em;
                box-sizing: border-box;
                border-radius: 0.5em;
                height: 45px;
                text-align: center;
                width: 300px;
                font: 1.2em Arial;
               
              }
              
               p{
                font: 1em italic;
                color: #E6E6FA;
                text-align: right;
              
                
        }
        
        .header{
                    position: absolute;
                    top: calc(50% - 200px);
                    left: calc(50% - 480px);
                    z-index: 2;
            }

            .header div{
                    float: left;
                    color: #fff;
                    font-family: 'Exo', sans-serif;
                    font-size: 60px;
                    font-weight: 200;
            }

            .header div span{
                    color: #adc2eb !important;
                    font-size: 45px;
            }
      
                </style>
       
    </head>
    
    
    <body style  = "background: url(Trees.png); background-size:100%;">
        
        <form id="form_id" method="post" name="myform">
        <input type="text" name="username" id="username" placeholder="Please enter your username..."/>
        <p>
        <input type="password" name="password" id="password" placeholder="Please enter your password..."/>
        </p>
         <p>
        <input type="text" name="category" id="category" placeholder="Please enter your category..."/>
        </p>
        <br>
         <input type="button" value="Sign Up" id="submit" onclick="thank_you()"/>
        <br>
        </form>
       
        <div class="header">
	<div> Sign Up <span> to continue...</span></div>
	</div>
        
      <p> ©Copyright 2018 Petrou Elena </p>
     
          <%
            
               String   userName   = request.getParameter("username"); 
               String   passworD   = request.getParameter("password"); 
               String   categ   = request.getParameter("category");
         
               try {
                                         
               Class.forName("com.mysql.jdbc.Driver");
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mtel_project","root","");
               System.out.println("Database Established;");
               Statement st = con.createStatement();
               //ResultSet rs = st.executeQuery("select * from users");
		st.executeUpdate("insert into mtel_project.users(username,password,category) values('"+userName+"','"+passworD+"','"+categ+"')");	
               //st.executeUpdate("insert into users(username, password, category)values('"+userName+"','"+passworD+"','"+categ+"')");
               
                } catch (Exception e){
                System.out.println(e);
                        
    }
          %>
          
            <script>
              
        function thank_you(){
        
         window.location = "http://localhost:8080/File_MTEL/Thank_you.html"; // Redirecting to other page.
       
        }
       
        
        </script>
        
    </body>
</html>
