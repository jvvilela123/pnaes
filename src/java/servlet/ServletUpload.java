/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
            } catch (FileUploadException e) {
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
                        File diretorio = new File(getServletContext().getRealPath("/")+nedital+"/alunos/"+cpf);
                        
                        diretorio.mkdirs();                   
                        if(item.getFieldName().equals("foto")){
                            File savedFile = new File(diretorio+"/"+cpf+".jpg");
                            item.write(savedFile);
                        }else if(item.getFieldName().equals("da")){
                            File savedFile = new File(diretorio+"/da.pdf");
                            item.write(savedFile);                        
                        }else if(item.getFieldName().equals("dd")){
                            File savedFile = new File(diretorio+"/dd.pdf");
                            item.write(savedFile);
                        }
                        else if(item.getFieldName().equals("dr")){
                            File savedFile = new File(diretorio+"/dr.pdf");
                            item.write(savedFile);
                        }else if(item.getFieldName().equals("dp")){
                            File savedFile = new File(diretorio+"/dp.pdf");
                            item.write(savedFile);
                        }else if(item.getFieldName().equals("od")){
                            File savedFile = new File(diretorio+"/od.pdf");
                            item.write(savedFile);
                        }
                        response.sendRedirect("inscricao/inscricao.jsp");
                    } catch (Exception ex) {
                        //ex.printStackTrace();
                        out.println(ex);
                        
                    }
                }
            }
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
