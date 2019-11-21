/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Inscricao;
import modelo.Visita;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletVisita", urlPatterns = {"/ServletVisita"})
public class ServletVisita extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            DaoFactory daoFactory = new DaoFactory();
            Inscricao inscricao;
            Visita visita = new Visita();
            GregorianCalendar dataVisita = new GregorianCalendar();
            SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy hh:mm");
            String opcao = request.getParameter("opcao");

            switch (opcao) {
                case "cadastrar":

                    //Setando dados do Visita
                    inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                    visita.setInscricao(inscricao);
                    dataVisita.setTime(formatador.parse(request.getParameter("dataVisita") + " " + request.getParameter("horario")));
                    visita.setIntroducao("");
                    visita.setSituacional("");
                    visita.setParecerSocial("");
                    visita.setDataVisita(dataVisita);
                    daoFactory.getVisitaDao().inserirOuAlterar(visita);

                    //Chamando o metodo inserir do dao e redirecionando para listar Visita
                    response.sendRedirect("visita/listar.jsp");
                    break;
                case "alterar":
                    visita = (Visita) daoFactory.getVisitaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    dataVisita.setTime(formatador.parse(request.getParameter("dataVisita") + " " + request.getParameter("horario")));
                    visita.setIntroducao("");
                    visita.setSituacional("");
                    visita.setParecerSocial("");
                    visita.setDataVisita(dataVisita);
                    daoFactory.getVisitaDao().inserirOuAlterar(visita);
                    response.sendRedirect("visita/listar.jsp");    
                    //Chamando o metodo alterar do dao e redirecionando para listar Visita
                    break;
                case "excluir":

                    visita.setId(Integer.parseInt(request.getParameter("id")));
                    //Chamando o metodo excluir do dao e redirecionando para listar Visita
                    daoFactory.getVisitaDao().excluir(visita);
                    request.getRequestDispatcher("visita/listar.jsp").forward(request, response);
                    break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(ServletVisita.class.getName()).log(Level.SEVERE, null, ex);
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
