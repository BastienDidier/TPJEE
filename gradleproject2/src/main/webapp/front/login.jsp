<%-- 
    Document   : login.jsp
    Created on : 2 avr. 2020, 15:44:23
    Author     : Etu
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
 <% HttpSession userSession = request.getSession();
    if (userSession.getAttribute("identifiant") != null) {
        
        response.sendRedirect("accueil.html");
       
    }%>
<html>
    <head>
       <meta charset="utf-8">
    </head>
    <body>
        <h1>Connexion</h1>
        <form action="check_login.jsp" method="post">
            <table>
                <tr>
                    <td><label for="email">Email : </label></td>
                    <td><input type="text" name="email" id="email" required></td>
                </tr>
                <tr>
                    <td><label for="pass">Mot de passe : </label></td>
                    <td><input type="password" name="pass" id="pass" required></td>
                </tr>
            </table>
            <div>
                <input type="submit" value="Envoyer">
            </div>
        </form>
        <a href="inscription.html">Inscription</a>

    </body>
</html>
