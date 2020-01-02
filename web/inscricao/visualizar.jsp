<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Aluno"%>
<%@page import="util.DataFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DataFormat dataFormat = new DataFormat();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Visualizar Inscrição</title>
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
        </script>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">
            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-12">
                                <div class="card">
                                    <%
                                            alunoId = Integer.parseInt(request.getParameter("id"));
                                            aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(alunoId);
                                           despesa = daoFactory.getDespesaDao().perquisarClassePorAluno(alunoId);
                                           Inscricao inscricao =  (Inscricao) daoFactory.getInscricaoDao().perquisarClassePorAluno(alunoId);
                                           List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarListaPorAluno(alunoId);
                                           empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                           fichaMedica = daoFactory.getFichaMedicaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                           dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                        
                                        %>

                                    <div class="card-header">
                                        <h4 class="card-title" id="striped-row-layout-icons">Dados da Inscrição do Aluno: <%=aluno.getNome()%></h4>
                                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                        </div>
                                    </div>
                                         </div>
                                     
                                       <%@include file="../inscricao/dadosInscricao.jsp" %>
                                    <div class="form-actions center">
     <a href="/pnaes/inscricao/listar.jsp"><button  class="btn btn-primary" type="button" >Voltar</button></a>&nbsp;
 </div>

                               
                            </div>
 
                        </div>

                    </div>
                                       
                </div>
            </div>
        </div>
    </body>
</html>