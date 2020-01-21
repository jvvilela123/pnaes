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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aluno;
import modelo.Despesa;

/**
 *
 * @author ronan
 */
@WebServlet(name = "ServletDespesa", urlPatterns = {"/ServletDespesa"})
public class ServletDespesa extends HttpServlet {

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
            Despesa despesa = new Despesa();
            Aluno aluno = new Aluno();
            String opcao = request.getParameter("opcao");
            try {
                switch (opcao) {

                    case "cadastrar":
                        //Setando dados do Despesa Mensal
                        despesa.setMoradia(Double.parseDouble(request.getParameter("moradia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setAgua(Double.parseDouble(request.getParameter("agua").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setEnergia(Double.parseDouble(request.getParameter("energia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setTelefone(Double.parseDouble(request.getParameter("telefone").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setFarmacia(Double.parseDouble(request.getParameter("farmacia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setOutrasDespesas(Double.parseDouble(request.getParameter("outrasDespesas").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setQualOutrasDespesas(request.getParameter("qualOutrasDespesas")!=null?request.getParameter("qualOutrasDespesas"):"");

                        aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        despesa.setAluno(aluno);
                        //Chamando o metodo inserir do dao e redirecionando para listar Orçamento
                        daoFactory.getDespesaDao().inserirOuAlterar(despesa);
                        response.sendRedirect("documento/upload.jsp");

                        break;
                    case "alterar":
                        //Setando dados do Despesa Mensal
                        despesa.setId(Integer.parseInt(request.getParameter("id")));
                        despesa.setMoradia(Double.parseDouble(request.getParameter("moradia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setAgua(Double.parseDouble(request.getParameter("agua").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setEnergia(Double.parseDouble(request.getParameter("energia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setTelefone(Double.parseDouble(request.getParameter("telefone").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setFarmacia(Double.parseDouble(request.getParameter("farmacia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setOutrasDespesas(Double.parseDouble(request.getParameter("outras").replace("R$", "").replace(".", "").replace(",", ".")));
                        aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        despesa.setAluno(aluno);

                        //Chamando o metodo alterar do dao e redirecionando para listar Despesa Mensal
                        daoFactory.getDespesaDao().inserirOuAlterar(despesa);
                        response.sendRedirect("listar.jsp");
                        break;
                    case "alterar_6_passo":
                        //Setando dados do Despesa Mensal
                        //despesa.setId(Integer.parseInt(request.getParameter("id")));
                        List<Despesa> despesas = daoFactory.getDespesaDao().perquisarListaPorAluno(Integer.parseInt(request.getParameter("aluno_id")));
                        if(despesas.size() > 0){
                         despesa = despesas.get(0);
                        }
                        despesa.setMoradia(Double.parseDouble(request.getParameter("moradia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setAgua(Double.parseDouble(request.getParameter("agua").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setEnergia(Double.parseDouble(request.getParameter("energia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setTelefone(Double.parseDouble(request.getParameter("telefone").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setFarmacia(Double.parseDouble(request.getParameter("farmacia").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setOutrasDespesas(Double.parseDouble(request.getParameter("outrasDespesas").replace("R$", "").replace(".", "").replace(",", ".")));
                        despesa.setQualOutrasDespesas(request.getParameter("qualOutrasDespesas")!=null?request.getParameter("qualOutrasDespesas"):"");
                        aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(request.getParameter("aluno_id")));
                        despesa.setAluno(aluno);

                        //Chamando o metodo alterar do dao e redirecionando para listar Despesa Mensal
                        daoFactory.getDespesaDao().inserirOuAlterar(despesa);
                        response.sendRedirect("home.jsp");
                        break;
                    case "excluir":
                        //Setando dados do Despesa Mensal
                        despesa.setId(Integer.parseInt(request.getParameter("id")));
                        //Chamando o metodo excluir do dao e redirecionando para listar Despesa Mensal
                        daoFactory.getDespesaDao().excluir(despesa);
                        response.sendRedirect("despesa/listar.jsp");

                }
            } catch (NumberFormatException ne) {
                Logger.getLogger(ServletDependente.class.getName()).log(Level.SEVERE, null, ne);
                System.out.println("Erro na renda!");
                out.println("<br><br><br><br><br><center><font color='red'><h1>Renda invalida!"+request.getParameter("moradia").replace("R$", "").replace(".", "").replace(",", ".")+"<br>A renda deve estar no formato 00.00</h1></font></center>");
                out.println("<a href='home.jsp'>voltar</a>");
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
