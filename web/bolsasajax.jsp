<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Bolsa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int bolsa_id = Integer.parseInt(request.getParameter("bolsa"));
    DaoFactory daoFactory = new DaoFactory();
    Edital edital = new Edital();
    edital = daoFactory.getEditalDao().pesquisarPorId(1);
    List<Bolsa> bolsas = edital.getBolsas();
   out.println("<option selected='' disabled='' value=''>Selecione a 2ª opção de Auxílio</option>");
    for (Bolsa b : bolsas) {
        if(b.getId() != bolsa_id)
      out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
      }
      
    
%>