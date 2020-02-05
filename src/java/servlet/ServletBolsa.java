/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Bolsa;
import modelo.Edital;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletBolsa", urlPatterns = {"/ServletBolsa"})
public class ServletBolsa extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
                DaoFactory daoFactory = new DaoFactory();
                Bolsa bolsa = new Bolsa();
                Edital edital = new Edital();
                String opcao = request.getParameter("opcao");
                
            switch(opcao) {
                case "cadastrar" :      
                    edital.setId(Integer.parseInt(request.getParameter("edital")));
                    bolsa.setEdital(edital);
                    bolsa.setNome(request.getParameter("nome"));
                    bolsa.setValor(Double.parseDouble(request.getParameter("valor")));
                    bolsa = daoFactory.getBolsaDao().inserirOuAlterarComRetorno(bolsa);
                  
                    response.sendRedirect("bolsa/listar.jsp");
                break;
                case "alterar":
                    bolsa.setId(Integer.parseInt(request.getParameter("id")));
                    bolsa.setNome(request.getParameter("nome"));
                    bolsa.setValor(Double.parseDouble(request.getParameter("valor")));
                    daoFactory.getBolsaDao().inserirOuAlterar(bolsa);
                    response.sendRedirect("bolsa/listar.jsp");
                break;
                case "excluir":
                    bolsa.setId(Integer.parseInt(request.getParameter("id")));
                    daoFactory.getBolsaDao().excluir(bolsa);
                    response.sendRedirect("bolsa/listar.jsp");
                break;
                    
            }
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
