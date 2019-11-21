<%-- 
    Document   : cadastrarDespesaMensal
    Created on : 13/02/2018, 10:55:26
    Author     : ronan
--%>

<%@page import="modelo.OrcamentoMensal"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="../estilo.css">
    </head>
    <body class="site">
        <%@include file="../cabecalho.jsp"%>
        <%@include file="../menuAdm.jsp"%>
        <%@include file="../menu.jsp"%>
       <center><h1>Sistema PNAES</h1></center>
          <%
                DaoFactory daoFactory = new DaoFactory();
                Integer id = Integer.parseInt(request.getParameter("id"));
                OrcamentoMensal orcamentoMensal = daoFactory.getOrcamentoMensalDao().pesquisarPorId(id);
            %>

    <form  method="POST" action="../ServletOrcamentoMensal?opcao=alterar&id=<%=orcamentoMensal.getId()%>" id="conteudo">
        
            <fieldset>
                <legend>Cadastro de Renda Mensal</legend>
                Aluno: <input type="text" name="aluno"><%=orcamentoMensal.getAluno1()%><br/>
                Dependente 1: <input type="text" name="dep1"><%=orcamentoMensal.getDep1()%><br/>
                Dependente 2: <input type="text" name="dep2"><%=orcamentoMensal.getDep2()%><br/>
                Dependente 3: <input type="tel" name="dep3"><%=orcamentoMensal.getDep3()%><br/>
                Dependente 4: <input type="tel" name="dep4"><%=orcamentoMensal.getDep4()%><br/>
                Dependente 5: <input type="tel" name="dep5"><%=orcamentoMensal.getDep5()%><br/>
                Dependente 6: <input type="tel" name="dep6"><%=orcamentoMensal.getDep6()%><br/>
                OUTROS      : <input type="text" name="outras"><%=orcamentoMensal.getOutros()%><br/>
                 
            </fieldset>
            <fieldset>
                <legend>Cadastro de Despesa Mensal</legend>
                Moradia: <input type="text" name="moradia" value="<%=orcamentoMensal.getMoradia()%>"><br/>
                AGUA: <input type="text"name="agua"value="<%=orcamentoMensal.getAgua()%>"><br/>
                Energia: <input type="text"name="energia" value="<%=orcamentoMensal.getEnergia()%>"><br/>
                Telefone: <input type="tel"name="telefone" value="<%=orcamentoMensal.getTelefone()%>"><br/>
                Farmacia: <input type="tel"name="farmacia" value="<%=orcamentoMensal.getFarmacia()%>"><br/>
                Outros: <input type="text"name="outras" value="<%=orcamentoMensal.getOutras()%>"><br/>
                 
            </fieldset>
                <input type="reset" value="Limpar"/>
                <input type="submit" value="Atualizar"/>            
                         
        </form>
         <%@include file="../rodape.jsp"%>
    </body>
</html>
