<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Bolsa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int bolsa_id = Integer.parseInt(request.getParameter("bolsa"));
    int edital_id = Integer.parseInt(request.getParameter("edital"));
    DaoFactory daoFactory = new DaoFactory();
   
    
    List<Bolsa> bolsas = daoFactory.getBolsaDao().buscarBolsaPorEdital(edital_id);
   out.println("<option selected='' disabled='' value=''>Selecione a 2ª opção de Auxílio</option>");
    for (Bolsa b : bolsas) {
        if(b.getId() != bolsa_id)
      out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
      }
      
    
%>