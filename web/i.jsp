<%@page import="modelo.Inscricao"%>
<%@page import="dao.DaoFactory"%>
<%
        DaoFactory daoFactory = new DaoFactory();
        Integer alunoId = Integer.parseInt(session.getAttribute("aluno_id").toString());
        Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().perquisarPorAluno(alunoId).get(0);
    
%>