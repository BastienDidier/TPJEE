<%-- 
    Document   : generationtableau
    Created on : 24 mars 2020, 14:35:32
    Author     : Bastien
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <style>
            table, th, td {
                border: 1px solid black;
              }
        </style>
    </head>
    <body>
        <p>JSP PAGE</p>
        <% int premier = Integer.parseInt(request.getParameter("premier"));
            int dernier = Integer.parseInt(request.getParameter("dernier"));
            int pas = Integer.parseInt(request.getParameter("pas"));
            int i = premier; %>
        <table>
            <tr>
                <td>Euro</td>
                <td>Dollar</td>
            </tr>
            <% while(i < dernier) { %>
                <tr>
                    <td><%= i %></td>
                    <td><%= i*1.05 %></td>
                </tr>
                <% i= i +pas; %>
            <% } %>
        </table>
    </body>
</html>
