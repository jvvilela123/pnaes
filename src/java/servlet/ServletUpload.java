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
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author euzebio
 */
@WebServlet(name = "ServletUpload", urlPatterns = {"/ServletUpload"})
public class ServletUpload extends HttpServlet {

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
            
            

            /*Faz o parse do request
            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

            //Escreve a o arquivo na pasta img//
            for (FileItem item : multiparts) {
                if (!item.isFormField()) {
                    item.write(new File(request.getServletContext().getRealPath("img") + File.separator + "1"));
                    item.write(new File(request.getServletContext().getRealPath("img") + File.separator + "2"));
                }
            }
            out.println("Upload de arquivo realizado com sucesso!"); 
             */
            String id = "";    
            int count1 = 0;
            String nedital = request.getParameter("nedital");
            String cpf = request.getParameter("cpf");
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;
            try {
                
                items = upload.parseRequest(request);
            } catch (Exception e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString();
                    
                } else {
                    try {
                        String itemName = item.getName();
                        out.println("nome = "+item.getName());
                        out.println("nomeCampo = "+item.getFieldName());
                        //File dir = new File(getServletContext().getRealPath("/")+nedital);
                        //File dire = new File(getServletContext().getRealPath("/")+nedital+"/alunos");
                        File diretorioFoto = new File(getServletContext().getRealPath("/")+"alunos/"+cpf);
                        File diretorioPdf = new File(getServletContext().getRealPath("/")+"alunos/"+cpf+"/"+nedital);
                        
                        diretorioFoto.mkdirs();
                        diretorioPdf.mkdirs();
                        if(!item.isInMemory()){
                            if(item.getFieldName().equals("foto")){
                                File savedFile = new File(diretorioFoto+"/"+cpf+".jpg");
                                item.write(savedFile);
                            }else if(item.getFieldName().equals("da")){
                                File savedFile = new File(diretorioPdf+"/da.pdf");
                                item.write(savedFile);                        
                            }else if(item.getFieldName().equals("dd")){
                                File savedFile = new File(diretorioPdf+"/dd.pdf");
                                item.write(savedFile);
                            }
                            else if(item.getFieldName().equals("dr")){
                                File savedFile = new File(diretorioPdf+"/dr.pdf");
                                item.write(savedFile);
                            }else if(item.getFieldName().equals("dp")){
                                File savedFile = new File(diretorioPdf+"/dp.pdf");
                                item.write(savedFile);
                            }else if(item.getFieldName().equals("od")){
                                File savedFile = new File(diretorioPdf+"/od.pdf");
                                item.write(savedFile);
                            }
                        }
                       // if(request.getParameter("alterar")!=null && request.getParameter("alterar").equals("1")){
                       //  response.sendRedirect("home.jsp");
                      //  }else{
                      //  response.sendRedirect("inscricao/inscricao.jsp");
                       // }
                        } catch (Exception ex) {
                        //ex.printStackTrace();
                        out.println(ex);
                        response.sendRedirect("home.jsp?msg=Falha ao Enviar os Arquivos, por vafor tente nomamente");
                        
                    }
                }
            }
            if(request.getParameter("aluno_id")!=null){
             DaoFactory daoFactory = new DaoFactory();
            Aluno aluno = new Aluno();
            aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
            //aluno.setId(Integer.parseInt(request.getParameter("aluno_id")));
            aluno.setStatusCadastro(6);
            daoFactory.getAlunoDao().inserirOuAlterar(aluno);
            }
             response.sendRedirect("home.jsp");
        } catch (Exception ex) {
            request.setAttribute("message", "Upload de arquivo falhou devido a " + ex);
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
