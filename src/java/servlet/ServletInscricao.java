/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Bolsa;
import modelo.Edital;
import modelo.Inscricao;


/**
 *
 * @author euzebio
 */
@WebServlet(name = "ServletInscricao", urlPatterns = {"/ServletInscricao"})
public class ServletInscricao extends HttpServlet {

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

            List<Inscricao> li;
            
            GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance(); 
            TimeZone tz = TimeZone.getTimeZone("America/Araguaina");
            TimeZone.setDefault(tz);
            cal.setTimeZone(tz);
            
            GregorianCalendar dataInscricao = new GregorianCalendar();
            DaoFactory daoFactory = new DaoFactory();
            Edital edital = new Edital();
          
            String opcao = request.getParameter("opcao");
            String df = new String();
            Inscricao inscricao = new Inscricao();
            Bolsa bolsa1 = new Bolsa();
            Bolsa bolsa2 = new Bolsa();
            Aluno aluno = new Aluno();
            String msg = "";
            switch (opcao) {
                case "inscricao":

                    bolsa1.setId(Integer.parseInt(request.getParameter("bolsa1")));
                    bolsa2.setId(Integer.parseInt(request.getParameter("bolsa2")));
                    
                    //alterar o status Cadastro Aluno 
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    aluno.setStatusCadastro(8);
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    //aluno.setId(Integer.parseInt(request.getParameter("aluno_id")));
                    edital.setId(Integer.parseInt(request.getParameter("edital_id")));
                    inscricao.setAlmocaIfto(request.getParameter("almocoIfto"));
                    inscricao.setBolsa1(bolsa1);
                    inscricao.setBolsa2(bolsa2);
                    inscricao.setAluno(aluno);
                    inscricao.setDataInscricao(dataInscricao);
                    inscricao.setMotivoBolsa(request.getParameter("motivoBolsa"));
                    inscricao.setJustificativa(request.getParameter("justificativa"));
                    
                    inscricao.setStatus("Pendente");
                    inscricao.setEdital(edital);
                    li = daoFactory.getInscricaoDao().perquisarAlunoPorEdital(inscricao.getAluno().getId(), inscricao.getEdital().getId());
                    if (li.isEmpty()) {
                        daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
                        msg = "Inscrição efetuada com sucesso";
                    } else if (li.get(0).getEdital().getId().equals(inscricao.getEdital().getId())) {
                        msg = "O canditado já esta Inscrito";
                    } else {
                        daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
                        msg = "Inscrição efetuada com sucesso";
                    }
                    request.getRequestDispatcher("home.jsp?msg=" + msg).forward(request, response);
                break;
                case "alterar":
                    inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                   // inscricao.setJustificativa(request.getParameter("justificativa"));
                    inscricao.setDocumentosFaltantes(request.getParameter("docf"));
                    inscricao.setStatus("Analizado");
                    inscricao.setResultadoAnaliseDocumental(request.getParameter("resultadoAnalise"));
                    inscricao.setObservacaoAnaliseDocumental(request.getParameter("observacaoAnaliseDocumental"));
                    inscricao.setUsuarioAlterou(request.getParameter("usuario"));

                    daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
                    response.sendRedirect("documento/documento.jsp");
                break;
               case "alterar_analise":
                    inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                   // inscricao.setJustificativa(request.getParameter("justificativa"));
                    inscricao.setDocumentosFaltantes(request.getParameter("docf"));
                    inscricao.setStatus("Analizado");
                    inscricao.setResultadoAnaliseDocumental(request.getParameter("resultadoAnalise"));
                    inscricao.setObservacaoAnaliseDocumental(request.getParameter("observacaoAnaliseDocumental"));
                    inscricao.setUsuarioAlterou(request.getParameter("usuario"));

                    daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
                    response.sendRedirect("documento/documento.jsp?analisados=1");
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
