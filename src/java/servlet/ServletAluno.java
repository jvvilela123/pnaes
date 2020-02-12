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
import modelo.Campus;
import modelo.Cidade;
import modelo.Curso;
import modelo.Dependente;
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
            Campus campus = new Campus(); 
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
                    response.sendRedirect("home.jsp");
                    
                break;
                case "cadastrar":
                    
                    
                    //Setando dados do Aluno
                    try{
                        dtn.setTime(formato.parse(request.getParameter("dtn")));
                    }catch(ParseException e){
                        msg = "Data de Nascimento Invalida"; 
                        request.getRequestDispatcher("pessoa/cadastrar.jsp?msg="+msg+"&login="+request.getParameter("login")).forward(request, response);
                    }
                    try{
                    aluno.setNome(request.getParameter("nome"));
                    cpf = request.getParameter("cpf").replace(".", "");
                    aluno.setCpf(cpf.replace("-", ""));
                    
                    aluno.setSexo(request.getParameter("sexo"));
                    aluno.setAutoDeclaracao(request.getParameter("autoDeclaracao"));
                    aluno.setRg(request.getParameter("rg"));
                    aluno.setEmail(request.getParameter("email"));
                    aluno.setTelefone(request.getParameter("telefone"));
                    aluno.setDtn(dtn);
                    aluno.setMatricula(request.getParameter("matricula"));
                    aluno.setEstadoCivil(request.getParameter("estadoCivil"));
                   // aluno.setAtividadeProf(request.getParameter("atividadeProf"));
                   // aluno.setCarteira(request.getParameter("carteira"));
                    aluno.setNivel(1);
                    aluno.setStatusCadastro(0);
                    
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
                    
                    //Seta Endereço no Banco
                    endereco = daoFactory.getEnderecoDao().inserirOuAlterarComRetorno(endereco);
                    
                    //Seta Enderço na classe Aluno
                    aluno.setEndereco(endereco);
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    //response.sendRedirect("index.jsp");
                    }catch(ExceptionInInitializerError ce){
                        if (ce.getException().toString().contains("cpf")){
                            msg = "CPF já cadastrado";
                        }
                        else if(ce.getException().toString().contains("email")){
                            msg = "Email já cadastrado";
                        } else{
                            msg = "Erro ao Inserir o Cadastro";
                        }
                         
                        request.getRequestDispatcher("pessoa/cadastrar.jsp?msg="+msg+"&login="+request.getParameter("login")).forward(request, response);
                    }
                    response.sendRedirect("/pnaes/ServletLogin?primeiroCadastro=true&login="+request.getParameter("login"));
                    //request.getRequestDispatcher("/pnaes/ServletLogin?primeiroCadastro=true&login="+request.getParameter("login")).forward(request, response);
                   
                    break;
                case "preencher":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    
                    campus.setId(Integer.parseInt(request.getParameter("campus")));
                    curso.setCampus(campus);
                    curso.setId(Integer.parseInt(request.getParameter("curso")));
                    aluno.setCurso(curso);
                    aluno.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                    aluno.setMeioTransporte(request.getParameter("transporte"));
                    aluno.setEnsinoMedio(request.getParameter("ensinoMedio"));
                    aluno.setEnsinoFundamental(request.getParameter("ensinoFundamental"));
                    aluno.setEntradaIfto(request.getParameter("entrada"));
                    aluno.setPeriodoVisita(request.getParameter("visita"));
                    
                    if(request.getParameter("reprovousimounao")!=null){
                    aluno.setReprovou(request.getParameter("reprovousimounao").equals("Sim"));
                    if(request.getParameter("reprovousimounao").equals("Sim"))
                    aluno.setReprovouQuantas(Integer.parseInt(request.getParameter("reprovou")));
                    else
                    aluno.setReprovouQuantas(null);
                    }else{
                        aluno.setReprovou(false);
                        aluno.setReprovouQuantas(null);
                    }
                    
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("empresa/cadastrar.jsp");
                    break;
                    case "alterar_1_passo":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    
                   // campus.setId(Integer.parseInt(request.getParameter("campus")));
                   // curso.setCampus(campus);
                    curso.setId(Integer.parseInt(request.getParameter("curso")));
                    aluno.setCurso(curso);
                    aluno.setPeriodo(Integer.parseInt(request.getParameter("periodo")));
                    aluno.setMeioTransporte(request.getParameter("transporte"));
                    aluno.setEnsinoMedio(request.getParameter("ensinoMedio"));
                    aluno.setEnsinoFundamental(request.getParameter("ensinoFundamental"));
                    aluno.setEntradaIfto(request.getParameter("entrada"));
                    aluno.setPeriodoVisita(request.getParameter("visita"));
                    
                    if(request.getParameter("reprovousimounao")!=null){
                    aluno.setReprovou(request.getParameter("reprovousimounao").equals("Sim"));
                    if(request.getParameter("reprovousimounao").equals("Sim"))
                    aluno.setReprovouQuantas(Integer.parseInt(request.getParameter("reprovou")));
                    else
                    aluno.setReprovouQuantas(null);
                    }else{
                        aluno.setReprovou(false);
                        aluno.setReprovouQuantas(null);
                    }
                    
                    
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("home.jsp");
                    break;
                  case "cadastrar_3_passo":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    aluno.setDependeciaFamiliar(request.getParameter("dependenciaFamiliar"));
                    aluno.setMoradia(request.getParameter("moradia"));
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("moradia/cadastrar.jsp");
                    break; 
                 case "alterar_3_passo":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    aluno.setDependeciaFamiliar(request.getParameter("dependenciaFamiliar"));
                    aluno.setMoradia(request.getParameter("moradia"));
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    if(aluno.getMoradia().equals("sozinho") && aluno.getDependeciaFamiliar().equals("indepTodas")){
                        //Excluir os Dependentes
                        List<Dependente> dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(aluno.getId());
                        if(!dependentes.isEmpty()){
                            for(Dependente d : dependentes) {
                             daoFactory.getDependenteDao().excluir(d);
                            }
                        }
                    }
                    response.sendRedirect("home.jsp");
                    break;
                 case "cadastrar_4_passo":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    aluno.setOndeReside(request.getParameter("ondeReside"));
                    aluno.setTipoMoradia(request.getParameter("tipoMoradia"));
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("fichaMedica/cadastrar.jsp");
                    break;
                  case "alterar_4_passo":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    aluno.setOndeReside(request.getParameter("ondeReside"));
                    aluno.setTipoMoradia(request.getParameter("tipoMoradia"));
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("home.jsp");
                    break;
                case "alterar_dados_pessoais":
                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    
                    //Setando dados do Aluno
                    dtn.setTime(formato.parse(request.getParameter("dtn")));
                    aluno.setDtn(dtn);
                    aluno.setNome(request.getParameter("nome"));
                    //aluno.setCpf(request.getParameter("cpf"));
                    aluno.setSexo(request.getParameter("sexo"));
                    aluno.setAutoDeclaracao(request.getParameter("autoDeclaracao"));
                    aluno.setRg(request.getParameter("rg"));
                    aluno.setEmail(request.getParameter("email"));
                    aluno.setTelefone(request.getParameter("telefone"));
                    ufe.setId(Integer.parseInt(request.getParameter("ufe")));
                    aluno.setUfExpedicao(ufe);
                    
                    //Setando dados do Endereço
                    endereco = aluno.getEndereco();
                    endereco.setLogradouro(request.getParameter("logradouro"));
                    endereco.setNumero(request.getParameter("numero"));
                    endereco.setBairro(request.getParameter("bairro"));
                    endereco.setComplemento(request.getParameter("complemento")!=null?request.getParameter("complemento"):aluno.getEndereco().getComplemento());
                    endereco.setCep(request.getParameter("cep"));
                    
                    //uf.setId(Integer.parseInt(request.getParameter("uf")));
                    //cidade.setUf(uf);
                    cidade.setId(Integer.parseInt(request.getParameter("cidade")));
                    
                    
                    endereco.setCidade(cidade);
                    
                    endereco = daoFactory.getEnderecoDao().inserirOuAlterarComRetorno(endereco);
                    aluno.setEndereco(endereco);
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("documento/cadastrar.jsp?i_id="+request.getParameter("i_id"));
                    break;
                case "alterar_permissao":

                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    aluno.setNivel(Integer.parseInt(request.getParameter("nivel")));
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("usuario/listar.jsp?id_usuario="+aluno.getId());
                    break;
                case "excluir":

                    aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    daoFactory.getAlunoDao().excluir(aluno);
                    response.sendRedirect("aluno/listar.jsp");
                  break;
                  
              case "continuar_Inscricao":
                  aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                    aluno.setStatusCadastro(7);
                    daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                    response.sendRedirect("inscricao/inscricao.jsp");
                break;
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
