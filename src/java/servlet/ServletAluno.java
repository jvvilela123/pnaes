/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.DaoFactory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Cidade;
import modelo.Curso;
import modelo.Endereco;
import modelo.Uf;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletAluno", urlPatterns = {"/ServletAluno"})
public class ServletAluno extends HttpServlet {

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
            GregorianCalendar dtn = new GregorianCalendar();
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            DaoFactory daoFactory = new DaoFactory();
            Aluno aluno = new Aluno();
            Endereco endereco = new Endereco();
            Cidade cidade = new Cidade();
            Uf uf = new Uf();
            Uf ufe = new Uf();
            Curso curso = new Curso(); 
            String opcao = request.getParameter("opcao");
            String msg = new String();
            String cpf = new String();

            switch (opcao) {
                case "upload":
                    try {
				/*Faz o parse do request*/
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

				/*Escreve a o arquivo na pasta img*/
				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						item.write(new File(request.getServletContext().getRealPath("img")+ File.separator + "uploadfile"));
					}
				}

				request.setAttribute("message", "Arquivo carregado com sucesso");
                    }catch (Exception ex) {
				request.setAttribute("message", "Upload de arquivo falhou devido a "+ ex);
                    }
                    response.sendRedirect("pessoa/cadastrar.jsp");
                    
                break;
                case "cadastrar":
                    
                    
                    //Setando dados do Aluno
                    try{
                        dtn.setTime(formato.parse(request.getParameter("dtn")));
                    }catch(ParseException e){
                        msg = "Data de Nascimento Invalida"; 
                        request.getRequestDispatcher("pessoa/cadastrar.jsp?msg="+msg).forward(request, response);
                    }
                    aluno.setNome(request.getParameter("nome"));
                    cpf = request.getParameter("cpf").replace(".", "");
                    aluno.setCpf(cpf.replace("-", ""));
                    
                    aluno.setSexo(request.getParameter("sexo"));
                    aluno.setRg(request.getParameter("rg"));
                    aluno.setEmail(request.getParameter("email"));
                    aluno.setTelefone(request.getParameter("telefone"));
                    aluno.setDtn(dtn);
                    aluno.setMatricula(request.getParameter("matricula"));
                    aluno.setEstadoCivil(request.getParameter("estadoCivil"));
                   // aluno.setAtividadeProf(request.getParameter("atividadeProf"));
                   // aluno.setCarteira(request.getParameter("carteira"));
                    aluno.setNivel(1);
                    aluno.setStatusCadastro("0");
                    
                    //Setando dados do Endereço
                    endereco.setLogradouro(request.getParameter("logradouro"));
                    endereco.setNumero(request.getParameter("numero"));
                    endereco.setBairro(request.getParameter("bairro"));
                    endereco.setComplemento(request.getParameter("complemento"));
                    endereco.setCep(request.getParameter("cep"));
                    //endereco.setId(1);
                    
                    //Setando os Objetos do Aluno
                    cidade.setId(Integer.parseInt(request.getParameter("cidade")));
                    uf.setId(Integer.parseInt(request.getParameter("uf")));
                    ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                    cidade.setUf(uf);
                    endereco.setCidade(cidade);
                    
                    aluno.setUfExpedicao(ufe);
                    //aluno.setEndereco(endereco);
                    
                    try{
                    //Chamando o metodo inserir do dao e redirecionando para listar aluno
                    daoFactory.getEnderecoDao().inserirOuAlterar(endereco);
                    List<Endereco> enderecos = daoFactory.getEnderecoDao().listar();
                    int tam = enderecos.size();
                    aluno.setEndereco(enderecos.get(tam-1));
                        daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                        response.sendRedirect("index.jsp");
                    }catch(ExceptionInInitializerError ce){
                        if (ce.getException().toString().contains("cpf")){
                            msg = "CPF já cadastrado";
                        }
                        else if(ce.getException().toString().contains("email")){
                            msg = "Email já cadastrado";
                        }
                         
                        request.getRequestDispatcher("pessoa/cadastrar.jsp?msg="+msg).forward(request, response);
                    }
                    
                    break;
                case "preencher":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    
                    curso.setId(Integer.parseInt(request.getParameter("curso")));
                    aluno.setCurso(curso);
                    aluno.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                    aluno.setMeioTransporte(request.getParameter("transporte"));
                    aluno.setEnsinoMedio(request.getParameter("ensinoMedio"));
                    aluno.setEnsinoFundamental(request.getParameter("ensinoFundamental"));
                    aluno.setEntradaIfto(request.getParameter("entrada"));
                    aluno.setPeriodoVisita(request.getParameter("visita"));
                    aluno.setReprovou(request.getParameter("reprovou"));
                    aluno.setDependeciaFamiliar(request.getParameter("dependenciaFamiliar"));
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("empresa/cadastrar.jsp");
                    break;
                case "alterar":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    dtn.setTime(formato.parse(request.getParameter("dtn")));
                    aluno.setNome(request.getParameter("nome"));
                    cpf = request.getParameter("cpf").replace(".", "");
                    aluno.setCpf(cpf.replace("-", ""));
                    aluno.setSexo(request.getParameter("sexo"));
                    aluno.setRg(request.getParameter("rg"));
                    aluno.setEmail(request.getParameter("email"));
                    aluno.setTelefone(request.getParameter("telefone"));
                   // aluno.setAtividadeProf(request.getParameter("atividadeProf"));
                    //aluno.setCarteira(request.getParameter("carteira"));
                    aluno.setDtn(dtn);
                    //aluno.setSenha(request.getParameter("senha"));
                    aluno.setMatricula(request.getParameter("matricula"));
                    curso.setId(Integer.parseInt(request.getParameter("curso_id")));
                    aluno.setCurso(curso);
                    aluno.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                    aluno.setMeioTransporte(request.getParameter("transporte"));
                    aluno.setEnsinoMedio(request.getParameter("ensinoMedio"));
                    aluno.setEnsinoFundamental(request.getParameter("ensinoFundamental"));
                    aluno.setEntradaIfto(request.getParameter("entrada"));
                    aluno.setPeriodoVisita(request.getParameter("visita"));
                    aluno.setDependeciaFamiliar(request.getParameter("dependenciaFamiliar"));

                    //Setando dados do Endereço
                    endereco.setLogradouro(request.getParameter("logradouro"));
                    endereco.setNumero(request.getParameter("numero"));
                    endereco.setBairro(request.getParameter("bairro"));
                    endereco.setComplemento(request.getParameter("complemento"));
                    endereco.setCep(request.getParameter("cep"));

                    //Setando os Objetos do Aluno
                    cidade.setId(Integer.parseInt(request.getParameter("cidade")));
                    uf.setId(Integer.parseInt(request.getParameter("uf")));
                    ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                    cidade.setUf(uf);
                    endereco.setCidade(cidade);
                    endereco.setId(1);
                    //endereco.setId(aluno.getEndereco().getId());
                    //out.println("id = " + aluno.getEndereco().getId());
                    //out.println("bairro = " + aluno.getEndereco().getBairro());
                    
                    aluno.setUfExpedicao(ufe);
                    aluno.setEndereco(endereco);
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("aluno/listar.jsp");
                    break;
                case "excluir":

                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    daoFactory.getAlunoDao().excluir(aluno);
                    response.sendRedirect("aluno/listar.jsp");
            }

        } catch (ParseException ex) {
            Logger.getLogger(ServletAluno.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ServletAluno.class.getName()).log(Level.SEVERE, null, ex);
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
