/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package front.gradleproject2;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Etu
 */
@WebServlet(name = "ServletGenerationTableau", urlPatterns = {"/generationtableau"})
public class ServletGenerationTableau extends HttpServlet {
    private ServletContext context; 
    public void init(ServletConfig config){
        context = config.getServletContext();
    }
    
    private void increment()
    {
        Integer valCompteur = 0;
        if(context.getAttribute("compteurUtilisations") != null){
            Object val = context.getAttribute("compteurUtilisations");
            valCompteur = (Integer)val;
        }
        valCompteur++;
        context.setAttribute("compteurUtilisations", valCompteur);
    }
    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            increment();
            int premier = Integer.parseInt(request.getParameter("premier"));
            int dernier = Integer.parseInt(request.getParameter("dernier"));
            int pas = Integer.parseInt(request.getParameter("pas"));
            Integer valCompteur = 0;
            if(context.getAttribute("compteurUtilisations") != null){
                Object val = context.getAttribute("compteurUtilisations");
                valCompteur = (Integer)val;
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletGenerationTableau</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h5>"+valCompteur+"</h5>");
            int i = premier;
            out.println("<table>");
            out.println("<tr><td>Euro</td><td>Dollar</td></tr>");
            while (i < dernier ){
                
                out.println("<tr>");
                out.println("<td>"+i+"</td>");
                out.println("<td>"+i*1.05+"</td>");
                out.println("</tr>");
                i = i + pas;
            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
