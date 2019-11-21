<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int categoria_id = Integer.parseInt(request.getParameter("categoria"));
    
    DaoFactory daoFactory = new DaoFactory();
    
    List<Curso> cursos = daoFactory.getCursoDao().buscarCursoPorCategoria(categoria_id);
    out.println("<option value='Selecione a cidade'></option>");
    for (Curso curso : cursos) {
        out.println("<option value="+curso.getId()+">"+curso.getNome()+"</option>");
        //out.println("<option value="+curso.getId()+">"+curso.getTipoPeriodo()+"</option>");
        //curso.setTipoPeriodo(curso.getTipoPeriodo());
    }
      
    
%>