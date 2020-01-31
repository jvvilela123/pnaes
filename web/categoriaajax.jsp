<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    int campus_id = Integer.parseInt(request.getParameter("campus"));
    int categoria_id = 0;
    DaoFactory daoFactory = new DaoFactory();
    
    List<Curso> cursos = daoFactory.getCursoDao().buscarCursoPorCampus(campus_id);
    out.println("<option selected='' disabled='' value=''>Selecione a Modalidade do Curso</option>");
    for (Curso curso : cursos) {
        if(categoria_id < curso.getCategoria().getId())
        out.println("<option value="+curso.getCategoria().getId()+">"+curso.getCategoria().getNome()+"</option>");
        categoria_id = curso.getCategoria().getId();
        //out.println("<option value="+curso.getId()+">"+curso.getTipoPeriodo()+"</option>");
        //curso.setTipoPeriodo(curso.getTipoPeriodo());
    }
      
    
%>