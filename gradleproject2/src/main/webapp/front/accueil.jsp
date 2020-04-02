<%-- 
    Document   : accueil.jsp
    Created on : 2 avr. 2020, 15:13:35
    Author     : Etu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

 <% 
     
     String email = "";
     String firstname = "";
     String name = "";
     String privilege = "";
           Context initCtx=null;
            try {
                initCtx = new InitialContext();
            } catch (NamingException ex) {
                System.out.println("Erreur de chargement du service de nommage");
            } 
            
            // Connexion ? la base de donn?es enregistr?e dans le serveur de nom sous le nom "sample"
            Object refRecherchee = initCtx.lookup("jdbc/__default");
            DataSource ds = (DataSource)refRecherchee;
            Connection con = ds.getConnection();
            HttpSession userSession = request.getSession();
            if (userSession.getAttribute("identifiant") != null) {
                 email = userSession.getAttribute("identifiant").toString();
                 name = userSession.getAttribute("name").toString();
                 firstname = userSession.getAttribute("firstname").toString();
                 privilege = userSession.getAttribute("privilege").toString();
            }
            else
            {
              response.sendRedirect("login.html");  
            }
           %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Info user</h1>
           <p>Name :<%= name %></p>
           <p>FirstName :<%= firstname %></p>
           <p>email :<%= email %></p>
           <p>privilege :<%= privilege %></p>
    </body>
</html>
