<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int uf_id = Integer.parseInt(request.getParameter("estado"));
    
    DaoFactory daoFactory = new DaoFactory();
    
    List<Cidade> cidades = daoFactory.getCidadeDao().buscarCidadePorUf(uf_id);
    out.println("<option value='Selecione a cidade'></option>");
    for (Cidade cidade : cidades) {
        out.println("<option value="+cidade.getId()+">"+cidade.getNome()+"</option>");
    }
    
%>