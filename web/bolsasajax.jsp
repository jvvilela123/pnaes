<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Bolsa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int bolsa_id = Integer.parseInt(request.getParameter("bolsa"));
    int edital_id = Integer.parseInt(request.getParameter("edital"));
    DaoFactory daoFactory = new DaoFactory();
    Edital edital = new Edital();
    edital = (Edital) daoFactory.getEditalDao().pesquisarPorId(edital_id);
    List<Bolsa> bolsas = edital.getBolsas();
   out.println("<option selected='' disabled='' value=''>Selecione a 2ª opção de Auxílio</option>");
    for (Bolsa b : bolsas) {
        if(b.getId() != bolsa_id)
      out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
      }
      
    
%>