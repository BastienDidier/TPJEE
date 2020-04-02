<%-- 
    Document   : checklogin
    Created on : 2 avr. 2020, 15:48:58
    Author     : Etu
--%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

 <% 
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
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            // Cr?ation d'une requ?te sans param?tres
            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery("SELECT * FROM USER WHERE USER.PASSWORD ='" + pass + "'  AND USER.EMAIL='" + email + "' " );
            
            /* TODO output your page here. You may use following sample code. */
            if ( email != "" && pass != "")
            {
                HttpSession userSession = request.getSession();
                userSession.setAttribute("identifiant", email);
                boolean toto = true;
                while(toto)
                {
                   
                    userSession.setAttribute("name", rs.getString("NAME"));
                    userSession.setAttribute("firstname", rs.getString("FIRSTNAME"));
                    userSession.setAttribute("privilege", rs.getString("PRIVILEGE"));
                    toto = false;
                }
                response.sendRedirect("accueil.html");
            }
            else
            {
                 response.sendRedirect("saisieincomplete.html");
            }
                
 %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Verif login</title>
    </head>
    <body>
    </body>
</html>
