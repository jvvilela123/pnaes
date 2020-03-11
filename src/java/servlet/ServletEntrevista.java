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
import modelo.Bolsa;
import modelo.Entrevista;
import modelo.Inscricao;


/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletEntrevista", urlPatterns = {"/ServletEntrevista"})
public class ServletEntrevista extends HttpServlet {

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
System.out.println("oi");
out.println(request.getParameter("opcao"));
            DaoFactory daoFactory = new DaoFactory();
            Inscricao inscricao;
            Entrevista entrevista = new Entrevista();
            
            GregorianCalendar dataEntrevista = new GregorianCalendar();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            
            String opcao = request.getParameter("opcao");

            switch (opcao) {
                case "cadastrar":
                    //Setando dados do Entrevista
                    inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                    inscricao.setStatus("Agendado");
                    entrevista.setInscricao(inscricao);

                    out.println("dataEntrevista = " + request.getParameter("dataEntrevista") + " " + request.getParameter("horario"));
                    dataEntrevista.setTime(formatador.parse(request.getParameter("dataEntrevista") + " " + request.getParameter("horario")));
                    entrevista.setDataAgendadaEntrevista(dataEntrevista);
                    entrevista.setLocal(request.getParameter("local"));
                    entrevista.setConcorrencia("");
                    entrevista.setParticipaProjetos(request.getParameter("participaProjetos"));
                    entrevista.setBolsaPermanente(request.getParameter("bolsaPermanente"));
                    entrevista.setOutraBolsa(request.getParameter("outraBolsa"));
                    entrevista.setObservacao("");
                   // entrevista.setResultado("");
                    daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);
                    response.sendRedirect("entrevista/horario.jsp");
                    break;
                
                case "cadastrarTudo":
                    //Setando dados do Entrevista
                   // int i,
                   // k = Integer.parseInt(request.getParameter("k"));
                   // for (i = 0; i < k; i++) {
                    System.out.println("oi");
                        Entrevista ent = new Entrevista();
                        inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                        inscricao.setStatus("Agendado");
                        ent.setInscricao(inscricao);
                        if(request.getParameter("horario")==null || request.getParameter("horario").equals(""))
                          response.sendRedirect("entrevista/horario.jsp?data="+request.getParameter("dataEntrevista")+"&local="+request.getParameter("local")+"&msg=Preencha o campo horario corretamente Ex: 08:00"+"&pBolsa="+request.getParameter("pb")+"&pCat="+request.getParameter("pc"));
                        else{
                        dataEntrevista.setTime(formatador.parse(request.getParameter("dataEntrevista") + " " + request.getParameter("horario")));
                        
                        ent.setDataAgendadaEntrevista(dataEntrevista);
                        ent.setLocal(request.getParameter("local"));
                        ent.setConcorrencia("");
                        ent.setParticipaProjetos(request.getParameter("participaProjetos"));
                        ent.setBolsaPermanente(request.getParameter("bolsaPermanente"));
                        ent.setOutraBolsa(request.getParameter("outraBolsa"));
                        ent.setObservacao("");
                       
                        //entrevista.setResultado("");
                        daoFactory.getEntrevistaDao().inserirOuAlterar(ent);
                        response.sendRedirect("entrevista/horario.jsp?data="+request.getParameter("dataEntrevista")+"&local="+request.getParameter("local")+"&pBolsa="+request.getParameter("pb")+"&pCat="+request.getParameter("pc"));
                        }
                 //   }                  
                    break;
                case "alterar":
                    //Setando dados do Aluno
                    entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                    
                    //dataEntrevista.setTime(formatador.parse(request.getParameter("dataEntrevista") + " " + request.getParameter("horario")));
                    entrevista.setDataAgendadaEntrevista(dataEntrevista);
                    entrevista.setLocal(request.getParameter("local"));
                    
                    //entrevista.setResultado("");
                    daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);
                    response.sendRedirect("entrevista/editarAgendamento.jsp");

                    //Chamando o metodo alterar do dao e redirecionando para listar entrevista                          
                    break;
                case "excluir":
                    //Setando dados do Aluno                        
                    entrevista.setId(Integer.parseInt(request.getParameter("id")));
                    //Chamando o metodo excluir do dao e redirecionando para listar aluno  
                    daoFactory.getEntrevistaDao().excluir(entrevista);
                    request.getRequestDispatcher("listar.jsp").forward(request, response);
                    break;
                case "entrevistar":
                    entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                    entrevista.setObservacao(request.getParameter("observacao"));
                    entrevista.setVulnerabilidade(request.getParameter("vulnerabilidade"));
                    entrevista.setConcorrencia(request.getParameter("concorrencia"));
                    entrevista.setCaracterizacao(request.getParameter("caracterizacao"));
                    entrevista.setParticipaProjetos(request.getParameter("participaProjetos"));
                    entrevista.setBolsaPermanente(request.getParameter("bolsaPermanente"));
                    entrevista.setOutraBolsa(request.getParameter("outraBolsa"));
                    entrevista.setObservacao(request.getParameter("observacao"));
                    dataEntrevista.setTime(date.parse(request.getParameter("dataEntrevista")));
                    entrevista.setDataEntrevista(dataEntrevista);
                    entrevista.setEntrevistador(request.getParameter("entrevistador"));
                    inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(entrevista.getInscricao().getId());
                    inscricao.setStatus("Finalizado");
                    entrevista.setInscricao(inscricao);
                    
                    daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);
                    response.sendRedirect("entrevista/entrevista.jsp");
                    break;
                case "finalizar":
                    entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                    
                    
                    inscricao = entrevista.getInscricao();
                    
                    Bolsa bolsa1 = new Bolsa();
                    bolsa1.setId(Integer.parseInt(request.getParameter("bolsa1")));
                    inscricao.setBolsa1(bolsa1);
                    
                    Bolsa bolsa2 = new Bolsa();
                    bolsa2.setId(Integer.parseInt(request.getParameter("bolsa2")));
                    inscricao.setBolsa2(bolsa2);
                    
                    daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
                    
                    entrevista.setResultadoBolsa1(request.getParameter("resultado1"));
              
                    entrevista.setResultadoBolsa2(request.getParameter("resultado2"));
                    
                    daoFactory.getEntrevistaDao().inserirOuAlterar(entrevista);
                    response.sendRedirect("resultado/resultado.jsp");
                    break;
                    
                case "dispensar":
                    inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                    inscricao.setStatus("Finalizado");
                    daoFactory.getInscricaoDao().inserirOuAlterar(inscricao);
                    ent = new Entrevista();
                    ent.setInscricao(inscricao);
                    ent.setResultado("Classificado");
                    daoFactory.getEntrevistaDao().inserirOuAlterar(ent);
                    response.sendRedirect("entrevista/horario.jsp?data="+request.getParameter("dataEntrevista")+"&local="+request.getParameter("local")+"&pBolsa="+request.getParameter("pb")+"&pCat="+request.getParameter("pc"));
                 break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(ServletEntrevista.class.getName()).log(Level.SEVERE, null, ex);
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
