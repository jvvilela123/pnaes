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
import modelo.Aluno;
import modelo.FichaMedica;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletFichaMedica", urlPatterns = {"/ServletFichaMedica"})
public class ServletFichaMedica extends HttpServlet {

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
            FichaMedica fichaMedica = new FichaMedica();
            Aluno aluno = new Aluno();
            String opcao = request.getParameter("opcao");
                
                switch(opcao){
                    case "cadastrar":
                         //Setando dados do Ficha Medica
                        
                    fichaMedica.setTemDoenca(request.getParameter("temDoenca"));
                    if(request.getParameter("temDoenca").equals("Sim"))
                    fichaMedica.setQualDoenca(request.getParameter("qualDoenca"));
                    
                    if(request.getParameter("qualDoenca").equals("Outros"))
                    fichaMedica.setQualDoenca(request.getParameter("qualDoencaOutro"));
                    
                    fichaMedica.setTemDoencaDep(request.getParameter("temDoencaDep"));
                    
                    if(request.getParameter("temDoencaDep").equals("Sim"))
                    fichaMedica.setQualDoenca(request.getParameter("qualDoencaDep"));
                    
                    if(request.getParameter("qualDoencaDep").equals("Outros"))
                    fichaMedica.setQualDoenca(request.getParameter("qualDoencaDepOutro"));
                    
                    fichaMedica.setTemMedicamento(request.getParameter("temMedicamento"));
                    
                    if(request.getParameter("temMedicamento").equals("Sim"))
                    fichaMedica.setQualMedicamento(request.getParameter("qualMedicamento"));
                    
                    fichaMedica.setTemMedicamentoDep(request.getParameter("temMedicamentoDep"));
                    
                    if(request.getParameter("temMedicamentoDep").equals("Sim"))
                    fichaMedica.setQualMedicamentoDep(request.getParameter("qualMedicamentoDep"));
                    
                    fichaMedica.setTemDeficiencia(request.getParameter("temDeficiencia"));
                    
                    if(request.getParameter("temDeficiencia").equals("Sim"))
                    fichaMedica.setQualDeficiencia(request.getParameter("qualDeficiencia"));
                    
                    fichaMedica.setTemDeficienciaDep(request.getParameter("temDeficienciaDep"));
                    
                    if(request.getParameter("temDeficienciaDep").equals("Sim"))
                    fichaMedica.setQualDeficienciaDep(request.getParameter("qualDeficienciaDep"));
                    
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    fichaMedica.setAluno(aluno);
                    //Chamando o metodo inserir do dao e redirecionando para listar Ficha Medica
                    daoFactory.getFichaMedicaDao().inserirOuAlterar(fichaMedica);
                    response.sendRedirect("documento/upload.jsp");
                break;
                case "alterar":
                     //Setando dados da Ficha Medica
                    fichaMedica.setId(Integer.parseInt(request.getParameter("id")));
                    fichaMedica.setQualDoenca(request.getParameter("tipoDoenca"));
                    fichaMedica.setTemMedicamento(request.getParameter("medicamento"));
                    fichaMedica.setTemDoenca(request.getParameter("doencaCronica"));
                    fichaMedica.setTemDeficiencia(request.getParameter("deficiencia"));
                    fichaMedica.setTemDeficienciaDep(request.getParameter("deficienciaDep"));
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    fichaMedica.setAluno(aluno);
                     //Chamando o metodo inserir do dao e redirecionando para listar Ficha Medica
                    daoFactory.getFichaMedicaDao().inserirOuAlterar(fichaMedica);
                    response.sendRedirect("fichaMedica/listar.jsp");
                break;
                 case "excluir":
                    //Setando dados do Ficha Medica
                    fichaMedica.setId(Integer.parseInt(request.getParameter("id")));  
                      //Chamando o metodo excluir do dao e redirecionando para listar Ficha Medica
                    daoFactory.getFichaMedicaDao().excluir(fichaMedica);
                    response.sendRedirect("fichaMedica/listar.jsp");
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
