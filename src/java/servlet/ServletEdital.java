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
import modelo.Campus;
import modelo.Edital;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletEdital", urlPatterns = {"/ServletEdital"})
public class ServletEdital extends HttpServlet {

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
            GregorianCalendar dataInicial = new GregorianCalendar();
            GregorianCalendar dataFinal = new GregorianCalendar();
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            DaoFactory daoFactory = new DaoFactory();
            Edital edital = new Edital();
            Campus campus = new Campus();
            
            String opcao = request.getParameter("opcao");
            String msg;
            
            switch(opcao) {
                case "cadastrar" :
                    edital.setNumero(request.getParameter("numero"));
                    campus.setId(Integer.parseInt(request.getParameter("campus_id")));
                    edital.setCampus(campus);
                    dataInicial.setTime(formato.parse(request.getParameter("dataInicial")));                    
                    edital.setDataInicial(dataInicial);
                    dataFinal.setTime(formato.parse(request.getParameter("dataFinal")));
                    edital.setDataFinal(dataFinal);
                    daoFactory.getEditalDao().inserirOuAlterar(edital);
                    response.sendRedirect("home.jsp");
                break;
                case "alterar":
                    formato = new SimpleDateFormat("dd/MM/yyyy");
                    edital.setId(Integer.parseInt(request.getParameter("id")));
                    campus.setId(Integer.parseInt(request.getParameter("campus_id")));
                    edital.setCampus(campus);
                    edital.setNumero(request.getParameter("numero"));
                    dataInicial.setTime(formato.parse(request.getParameter("dataInicial")));
                    edital.setDataInicial(dataInicial);
                    dataFinal.setTime(formato.parse(request.getParameter("dataFinal")));
                    edital.setDataFinal(dataFinal);
                    
                    daoFactory.getEditalDao().inserirOuAlterar(edital);
                    response.sendRedirect("edital/listar.jsp");
                break;
                case "excluir":
                    edital.setId(Integer.parseInt(request.getParameter("id")));
                    daoFactory.getEditalDao().excluir(edital);
                    response.sendRedirect("edital/listar.jsp");
                break;
                    
            }
            
                     
        }catch (IllegalStateException es) {
                
            Logger.getLogger(ServletEdital.class.getName()).log(Level.SEVERE, null, es);
            //msg = {"Não e possível exluir o edital está em uso"};
           
        } catch (ParseException ep) {
            
            Logger.getLogger(ServletEdital.class.getName()).log(Level.SEVERE, null, ep);
        }
        catch (Exception ex) {
            
            Logger.getLogger(ServletEdital.class.getName()).log(Level.SEVERE, null, ex);
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
