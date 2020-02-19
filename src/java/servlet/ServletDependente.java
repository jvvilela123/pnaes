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
import modelo.Aluno;
import modelo.Dependente;
import modelo.Uf;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletDependente", urlPatterns = {"/ServletDependente"})
public class ServletDependente extends HttpServlet {

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
            Dependente dependente = new Dependente();
            Aluno aluno = new Aluno();
            Uf ufe = new Uf();
            GregorianCalendar dtn = new GregorianCalendar();
            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
            String opcao = request.getParameter("opcao");
            try { 
                String idIncricao = request.getParameter("i_id");
                switch (opcao) {

                    case "cadastrar":
                        try{
                        //Setando dados do Dependente
                        dependente.setNome(request.getParameter("nome"));
                        dependente.setCpfd(request.getParameter("cpf").equals("")?null:request.getParameter("cpf"));
                        dependente.setRg(request.getParameter("rg"));
                        
                        if(request.getParameter("ufe")!= null){
                        ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                        dependente.setUfExpedicao(ufe);
                        }
                        
                        dtn.setTime(formatador.parse(request.getParameter("dtn")));
                        dependente.setDtn(dtn);
                        dependente.setSexo(request.getParameter("sexo"));
                        dependente.setTelefone(request.getParameter("telefone"));
                        dependente.setEmail(request.getParameter("email"));
                        dependente.setGrauParentesco(request.getParameter("grauParentesco"));
                        dependente.setTipoDeficiente(request.getParameter("tipoDeficiencia"));
                        dependente.setAtividadeProf(request.getParameter("atividade"));
                        dependente.setRenda(Double.parseDouble(request.getParameter("renda").replace("R$", "").replace(".", "").replace(",", ".")));
                        aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        dependente.setEndereco(aluno.getEndereco());
                        dependente.setAluno(aluno);
                        //Chamando o metodo inserir do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().inserirOuAlterar(dependente);
                        
                        request.getRequestDispatcher("dependente/listar.jsp?msg=Membro Familiar "+dependente.getNome()+" foi incluído com sucesso!").forward(request, response);
                       // response.sendRedirect("dependente/listar.jsp?msg=Membro Familiar "+dependente.getNome()+" foi incluido com sucesso!");
                        
                        }catch(IllegalStateException | ExceptionInInitializerError ce){
                            request.getRequestDispatcher("dependente/listar.jsp?msg2=Membro Familiar já cadastrado.").forward(request, response);
                            //response.sendRedirect("dependente/cadastrar.jsp?msg=CPF Existente, por favor preencha corretamente ou deixe o campo CPF vazio.");
                        }
                        
                    break;
                    case "cadastrar_analise":
                        try{
                        //Setando dados do Dependente
                        dependente.setNome(request.getParameter("nome"));
                        dependente.setCpfd(request.getParameter("cpf").equals("")?null:request.getParameter("cpf"));
                        dependente.setRg(request.getParameter("rg"));
                        
                        if(request.getParameter("ufe")!= null){
                        ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                        dependente.setUfExpedicao(ufe);
                        }
                        
                        dtn.setTime(formatador.parse(request.getParameter("dtn")));
                        dependente.setDtn(dtn);
                        dependente.setSexo(request.getParameter("sexo"));
                        dependente.setTelefone(request.getParameter("telefone"));
                        dependente.setEmail(request.getParameter("email"));
                        dependente.setGrauParentesco(request.getParameter("grauParentesco"));
                        dependente.setTipoDeficiente(request.getParameter("tipoDeficiencia"));
                        dependente.setAtividadeProf(request.getParameter("atividade"));
                        dependente.setRenda(Double.parseDouble(request.getParameter("renda").replace("R$", "").replace(".", "").replace(",", ".")));
                        aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        dependente.setEndereco(aluno.getEndereco());
                        dependente.setAluno(aluno);
                        //Chamando o metodo inserir do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().inserirOuAlterar(dependente);
                       
                        response.sendRedirect("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg=Membro Familiar "+dependente.getNome()+" foi cadastrado com sucesso!");
                        //request.getRequestDispatcher("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg=Membro Familiar "+dependente.getNome()+" foi incluído com sucesso!").forward(request, response);
                       // response.sendRedirect("dependente/listar.jsp?msg=Membro Familiar "+dependente.getNome()+" foi incluido com sucesso!");
                        
                        }catch(IllegalStateException | ExceptionInInitializerError ce){
                            // StringidIncricao = request.getParameter("i_id");
                            response.sendRedirect("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg2=CPF do Membro Familiar Duplicado.");
                            //request.getRequestDispatcher("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg2=Membro Familiar já cadastrado.").forward(request, response);
                            //response.sendRedirect("dependente/cadastrar.jsp?msg=CPF Existente, por favor preencha corretamente ou deixe o campo CPF vazio.");
                        }
                        
                    break;
                    case "alterar":
                        try{
                        //Setando dados do Dependente
                        dependente = (Dependente) daoFactory.getDependenteDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                        dependente.setNome(request.getParameter("nome"));
                        dependente.setCpfd(request.getParameter("cpf").equals("")?null:request.getParameter("cpf"));
                        dependente.setRg(request.getParameter("rg"));
                        dependente.setSexo(request.getParameter("sexo"));
                        
                        if(request.getParameter("ufe")!= null){
                        ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                        dependente.setUfExpedicao(ufe);
                        }
                        
                        dtn.setTime(formatador.parse(request.getParameter("dtn")));
                        dependente.setDtn(dtn);
                        dependente.setTelefone(request.getParameter("telefone"));
                        dependente.setEmail(request.getParameter("email"));
                        dependente.setGrauParentesco(request.getParameter("grauParentesco"));
                        //dependente.setRenda(Double.parseDouble(request.getParameter("renda")));
                        //dependente.setTipoDeficiente(request.getParameter("tipoDeficiencia"));
                        dependente.setAtividadeProf(request.getParameter("atividade"));
                        dependente.setRenda(Double.parseDouble(request.getParameter("renda").replace("R$", "").replace(".", "").replace(",", ".")));
                        //Chamando o metodo alterar do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().inserirOuAlterar(dependente);
                        response.sendRedirect("dependente/listar.jsp?msg=Membro Familiar "+dependente.getNome()+" foi alterado com sucesso!");
                        
                        }catch(IllegalStateException |ExceptionInInitializerError ce){
                          //  response.sendRedirect("dependente/alterar.jsp?msg=CPF Existente, por favor preencha corretamente ou deixe o campo CPF vazio.&id="+request.getParameter("id"));
                          request.getRequestDispatcher("dependente/listar.jsp?msg2=Membro Familiar já cadastrado.").forward(request, response);
                        }
                        
                    break;
                    case "excluir":
                        //Setando dados do Dependente
                        dependente = (Dependente) daoFactory.getDependenteDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                       // dependente.setId(Integer.parseInt(request.getParameter("id")));
                        //Chamando o metodo excluir do dao e redirecionando para listar Dependente
                        daoFactory.getDependenteDao().excluir(dependente);
                        if(idIncricao==null)
                        request.getRequestDispatcher("dependente/listar.jsp?msg=Membro Familiar "+dependente.getNome()+" foi Excluído com sucesso!").forward(request, response);
                        else
                       request.getRequestDispatcher("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg=Membro Familiar "+dependente.getNome()+" foi Excluído com sucesso!").forward(request, response);
                        //response.sendRedirect("dependente/listar.jsp?msg=Membro Familiar "+dependente.getNome()+" foi Excluido com sucesso!");
                    break;

                }
            } catch (IOException | NumberFormatException | ParseException ex) {
                Logger.getLogger(ServletDependente.class.getName()).log(Level.SEVERE, null, ex);
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
