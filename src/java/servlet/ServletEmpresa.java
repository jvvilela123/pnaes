/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Cidade;
import modelo.Empresa;
import modelo.Endereco;
import modelo.Uf;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletEmpresa", urlPatterns = {"/ServletEmpresa"})
public class ServletEmpresa extends HttpServlet {

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
            Aluno aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
            Empresa empresa = new Empresa();
            String opcao = request.getParameter("opcao");
           
        try {
            switch (opcao) {
                
                case "cadastrar":
                    
                    //Setando dados do Empresa
                    empresa.setTemCarteira(request.getParameter("carteira").equals("sim"));
                    empresa.setAtividade(request.getParameter("atividade")!=null?request.getParameter("atividade"):null);
                    empresa.setNome(request.getParameter("nome")!=null?request.getParameter("nome"):null);
                    empresa.setTelefone(request.getParameter("telefone")!=null?request.getParameter("telefone"):null);
                    
                    if(request.getParameter("renda")!=null && !request.getParameter("renda").equals(""))
                    empresa.setRenda(Double.parseDouble(request.getParameter("renda").replace("R$", "").replace(".", "").replace(",", ".")));
                    else
                    empresa.setRenda(0.00);
                    
                    if(request.getParameter("orenda")!=null && !request.getParameter("orenda").equals(""))
                    empresa.setOrenda(Double.parseDouble(request.getParameter("orenda").replace("R$", "").replace(".", "").replace(",", ".")));
                    else
                    empresa.setOrenda(0.00);
                     
                   // seta aluno na empresa
                    empresa.setAluno(aluno);
                    
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                    
                    //redireciona para o próximo passo
                    response.sendRedirect("dependente/listar.jsp");
                   
                    break;
                case "alterar_2_passo":
                    
                    empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(Integer.parseInt(request.getParameter("aluno_id")));
                     //Setando dados do Empresa
                    empresa.setTemCarteira(request.getParameter("carteira").equals("sim"));
                    empresa.setAtividade(request.getParameter("atividade")!=null?request.getParameter("atividade"):null);
                    empresa.setNome(request.getParameter("nome")!=null?request.getParameter("nome"):null);
                    empresa.setTelefone(request.getParameter("telefone")!=null?request.getParameter("telefone"):null);
                    
                    if(request.getParameter("renda")!=null && !request.getParameter("renda").equals(""))
                    empresa.setRenda(Double.parseDouble(request.getParameter("renda").replace("R$", "").replace(".", "").replace(",", ".")));
                    else
                    empresa.setRenda(0.00);
                    
                    if(request.getParameter("orenda")!=null && !request.getParameter("orenda").equals(""))
                    empresa.setOrenda(Double.parseDouble(request.getParameter("orenda").replace("R$", "").replace(".", "").replace(",", ".")));
                    else
                    empresa.setOrenda(0.00);
                    
                   // seta aluno na empresa
                    empresa.setAluno(aluno);
                   
                    //Altera a empresa
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                     
                    //redireciona para a pagina inicial
                   response.sendRedirect("home.jsp");
                    break;
                    case "alterar_dados_ocupacao":
                    
                    empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(Integer.parseInt(request.getParameter("aluno_id")));
                     //Setando dados do Empresa
                    empresa.setTemCarteira(request.getParameter("carteira").equals("sim"));
                    empresa.setAtividade(request.getParameter("atividade")!=null?request.getParameter("atividade"):null);
                    empresa.setNome(request.getParameter("nome")!=null?request.getParameter("nome"):null);
                    empresa.setTelefone(request.getParameter("telefone")!=null?request.getParameter("telefone"):null);
                    
                    if(request.getParameter("renda")!=null && !request.getParameter("renda").equals(""))
                    empresa.setRenda(Double.parseDouble(request.getParameter("renda").replace("R$", "").replace(".", "").replace(",", ".")));
                    else
                    empresa.setRenda(0.00);
                    
                    if(request.getParameter("orenda")!=null && !request.getParameter("orenda").equals(""))
                    empresa.setOrenda(Double.parseDouble(request.getParameter("orenda").replace("R$", "").replace(".", "").replace(",", ".")));
                    else
                    empresa.setOrenda(0.00);
                    
                   // seta aluno na empresa
                    empresa.setAluno(aluno);
                   
                    //Altera a empresa
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                     
                    //redireciona para a pagina inicial
                   // response.sendRedirect("home.jsp");
                     String idIncricao = request.getParameter("i_id");
                    //request.getRequestDispatcher("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg=Ocupação do Estudante foi alterada com sucesso!").forward(request, response);
                    response.sendRedirect("documento/cadastrar.jsp?i_id="+idIncricao+"&editar=1&msg=Renda do Estudante foi alterada com sucesso!");
                    break;
                case "alterar":
                    //Setando dados do Empresa
                    empresa = daoFactory.getEmpresaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    empresa.setNome(request.getParameter("nome"));
                    empresa.setTelefone(request.getParameter("telefone"));
                   
                    //aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    empresa.setAluno(aluno);
                    //Chamando o metodo alterar do dao e redirecionando para listar empresa                     
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                    response.sendRedirect("empresa/listar.jsp");
                    break;
                case "excluir":
                    //Setando dados da Empresa
                    empresa = daoFactory.getEmpresaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    
                  
                    //Chamando o metodo excluir do dao e redirecionando para listar aluno  
                    daoFactory.getEmpresaDao().excluir(empresa);
                    response.sendRedirect("empresa/listar.jsp");
            }
            } catch (NumberFormatException ne) {
                String msg = "Preencha corretamente todos os campos! Formato: (R$ 0,00)";
                
                if(opcao.equals("cadastrar"))
                   response.sendRedirect("empresa/cadastrar.jsp?msg=" + msg);
                // request.getRequestDispatcher("despesa/cadastrar.jsp?msg=" + msg).forward(request, response);
                else  if(opcao.equals("alterar_2_passo"))
                    response.sendRedirect("empresa/alterar_2_passo.jsp?msg=" + msg);
                 // request.getRequestDispatcher("despesa/alterar_6_passo.jsp?msg=" + msg).forward(request, response);
                
                //System.out.println("Erro na renda!");
               // out.println("<br><br><br><br><br><center><font color='red'><h1>Renda invalida!"+request.getParameter("moradia").replace("R$", "").replace(".", "").replace(",", ".")+"<br>A renda deve estar no formato 00.00</h1></font></center>");
               // out.println("<a href='home.jsp'>voltar</a>");
            }   catch (ExceptionInInitializerError e) {
                 String msg = "Ocupação já cadastrada";
                 request.getRequestDispatcher("home.jsp?msg="+msg).forward(request, response);
               // response.sendRedirect("home.jsp?msg=" + msg);
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
