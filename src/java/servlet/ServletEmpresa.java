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
            Endereco endereco = new Endereco();
            Uf uf = new Uf();
            Cidade cidade = new Cidade();
            String opcao = request.getParameter("opcao");
           // String autonomo = new String();
        
            switch (opcao) {
                case "cadastrar":
                    //Setando dados do Empresa
                    empresa.setCarteira(request.getParameter("carteira"));
                    empresa.setTrabalha(request.getParameter("tab"));
                    if (request.getParameter("autonomo") != null) {
                        if (request.getParameter("autonomo").equals("nao")) {
                            empresa.setAtividade(request.getParameter("atividade")!=null?request.getParameter("atividade"):null);
                            empresa.setNome(request.getParameter("nome")!=null?request.getParameter("nome"):null);
                            empresa.setTelefone(request.getParameter("telefone")!=null?request.getParameter("telefone"):null);
                            empresa.setResponsavel(request.getParameter("responsavel")!=null?request.getParameter("responsavel"):null);
                            //Setando dados do Endereço
                            endereco.setLogradouro(request.getParameter("logradouro")!=null?request.getParameter("logradouro"):null);
                            endereco.setNumero(request.getParameter("numero")!=null?request.getParameter("numero"):null);
                            endereco.setBairro(request.getParameter("bairro")!=null?request.getParameter("bairro"):null);
                            endereco.setComplemento(request.getParameter("complemento")!=null?request.getParameter("complemento"):null);
                            endereco.setCep(request.getParameter("cep")!=null?request.getParameter("cep"):null);

                            //Setando os Objetos do Aluno
                            cidade.setId(Integer.parseInt(request.getParameter("cidade")!=null?request.getParameter("cidade"):null));
                            uf.setId(Integer.parseInt(request.getParameter("uf")!=null?request.getParameter("uf"):null));
                            cidade.setUf(uf);
                            endereco.setCidade(cidade);
                            empresa.setEndereco(endereco);
                            endereco = daoFactory.getEnderecoDao().inserirOuAlterarComRetorno(endereco);
                            empresa.setEndereco(endereco);
                        } else{
                            empresa.setAtividade("Autonomo");
                    }
                    }
                     if (request.getParameter("faz") != null)
                         empresa.setAtividade(request.getParameter("faz"));
                       
                    
                    empresa.setRenda(Double.parseDouble(request.getParameter("renda")));
                    empresa.setOrenda(Double.parseDouble(request.getParameter("orenda")));
                    
                   // seta aluno na empresa
                    empresa.setAluno(aluno);
                    
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                    response.sendRedirect("dependente/listar.jsp");
                    break;
                case "alterar_2_passo":
                    //Setando dados do Empresa
                     empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(aluno.getId());
                    // if(empresas.size() > 0){
                   //      empresa = empresas.get(0);
                   //  }
                    //Setando dados do Empresa
                    empresa.setCarteira(request.getParameter("carteira"));
                    empresa.setTrabalha(request.getParameter("tab"));
                    if (request.getParameter("autonomo") != null) {
                        
                        //Se for Funcionário(Carteira ou Público)
                        if (request.getParameter("autonomo").equals("nao") && empresa.getTrabalha().equals("sim")) {
                            empresa.setAtividade(request.getParameter("atividade")!=null?request.getParameter("atividade"):null);
                            empresa.setNome(request.getParameter("nome")!=null?request.getParameter("nome"):null);
                            empresa.setTelefone(request.getParameter("telefone")!=null?request.getParameter("telefone"):null);
                            empresa.setResponsavel(request.getParameter("responsavel")!=null?request.getParameter("responsavel"):null);
                            
                            //Setanto Endereço se existe
                            if(empresa.getEndereco()!= null)
                            endereco = empresa.getEndereco();
                            
                            //Alterano dados do Endereço
                            endereco.setLogradouro(request.getParameter("logradouro")!=null?request.getParameter("logradouro"):null);
                            endereco.setNumero(request.getParameter("numero")!=null?request.getParameter("numero"):null);
                            endereco.setBairro(request.getParameter("bairro")!=null?request.getParameter("bairro"):null);
                            endereco.setComplemento(request.getParameter("complemento")!=null?request.getParameter("complemento"):null);
                            endereco.setCep(request.getParameter("cep")!=null?request.getParameter("cep"):null);
                            cidade.setId(request.getParameter("cidade")!=null?Integer.parseInt(request.getParameter("cidade")):null);
                            uf.setId(request.getParameter("uf")!=null?Integer.parseInt(request.getParameter("uf")):null);
                            cidade.setUf(uf);
                            endereco.setCidade(cidade);
                            
                            //insere novo endereço ou altera se existe
                            endereco = daoFactory.getEnderecoDao().inserirOuAlterarComRetorno(endereco);
                            
                            //seta endereço na empresa
                            empresa.setEndereco(endereco);
                            
                            //Altera a empresa
                            daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                            
                         //Se For Autônomo
                        } else if(request.getParameter("autonomo").equals("sim") && empresa.getTrabalha().equals("sim")){
                            empresa.setNome(null);
                            empresa.setTelefone(null);
                            empresa.setResponsavel(null);
                            
                            //seta endereço para excluir se existir
                            endereco = empresa.getEndereco();
                            
                            empresa.setEndereco(null);
                            empresa.setAtividade("Autonomo");
                            
                            //Altera a empresa
                            daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                            
                            //Exclui endereço do bando se existir
                            if(endereco!=null)
                              daoFactory.getEnderecoDao().excluir(endereco);  
                           
                    }
                 }
                    //se for Desempregado ou Pensionista
                    if (request.getParameter("faz") != null && empresa.getTrabalha().equals("nao")){
                    empresa.setNome(null);
                    empresa.setTelefone(null);
                    empresa.setResponsavel(null);
                    
                    //seta endereço para excluir se existir
                    endereco = empresa.getEndereco();
                    
                    empresa.setEndereco(null);
                    empresa.setAtividade(request.getParameter("faz"));
                    
                    //Altera a empresa
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                    
                    //Exclui endereço do bando se existir
                    if(endereco!=null)
                         daoFactory.getEnderecoDao().excluir(endereco);
                    }
                    
                    //seta as rendas
                    empresa.setRenda(Double.parseDouble(request.getParameter("renda")));
                    empresa.setOrenda(Double.parseDouble(request.getParameter("orenda")));
                    
                    //seta o aluno na empresa
                    //aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                  //  empresa.setAluno(aluno);
                    
                    
                    
                    response.sendRedirect("home.jsp");
                    break;
                case "alterar":
                    //Setando dados do Empresa
                    empresa = daoFactory.getEmpresaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    empresa.setNome(request.getParameter("nome"));
                    empresa.setTelefone(request.getParameter("telefone"));
                    empresa.setResponsavel(request.getParameter("responsavel"));
                    //aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                    empresa.setAluno(aluno);
                    //Chamando o metodo alterar do dao e redirecionando para listar empresa                     
                    daoFactory.getEmpresaDao().inserirOuAlterar(empresa);
                    response.sendRedirect("empresa/listar.jsp");
                    break;
                case "excluir":
                    //Setando dados da Empresa
                    empresa = daoFactory.getEmpresaDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    
                    //Exclui endereço do bando se existir
                    if(empresa.getEndereco()!=null)
                         daoFactory.getEnderecoDao().excluir(empresa.getEndereco());
                    //Chamando o metodo excluir do dao e redirecionando para listar aluno  
                    daoFactory.getEmpresaDao().excluir(empresa);
                    response.sendRedirect("empresa/listar.jsp");
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
