<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Curso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int curso_id = Integer.parseInt(request.getParameter("curso"));
    
    DaoFactory daoFactory = new DaoFactory();
    
    Curso curso = (Curso) daoFactory.getCursoDao().pesquisarPorId(curso_id);
    out.println("<option value='Selecione o periodo'></option>");
   for (int i =1; i <= curso.getqPeriodo(); i++){
        out.println("<option value="+i+">"+i+"º "+curso.getTipoPeriodo()+"</option>");
        //out.println("<option value="+curso.getId()+">"+curso.getTipoPeriodo()+"</option>");
        //curso.setTipoPeriodo(curso.getTipoPeriodo());
    }
      
    
%>