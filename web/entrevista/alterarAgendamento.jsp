<%-- 
    Document   : entrevistar
    Created on : 17/05/2018, 08:17:06
    Author     : ronan
--%>

<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Dependente"%>
<%@page import="modelo.Bolsa"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Entrevista</title>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <div class="content-header-right col-md-6 col-12" >

                        </div>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Entrevistar</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Dados do Candidato para a Entrevista
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <%                                                                DataFormat dataFormat = new DataFormat();

                                                                //SimpleDateFormat date2 = new SimpleDateFormat("yyyy-MM-dd hh:mm");
                                                                Entrevista entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                                                                Inscricao inscricao = entrevista.getInscricao();
                                                                empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                                                fichaMedica = daoFactory.getFichaMedicaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                                                dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                                                List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                                                despesa = daoFactory.getDespesaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                                            %>
                                                            <%@include file="../inscricao/dadosInscricao.jsp" %>
                                                        </div>
                                                        <div class="col-md-6">

                                                            <div class="col-md-3">
                                                                <img src="/pnaes/alunos/<%=inscricao.getAluno().getCpf()%>/<%=inscricao.getAluno().getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" class="img_aluno">

                                                            </div>
                                                            <form class="form form-horizontal striped-rows form-bordered" method="POST" action="/pnaes/ServletEntrevista?opcao=alterarAgendamento&e_id=<%=entrevista.getId()%>">
                                                                <div class="form-body">
                                                                    <table class="table table-striped table-responsive-md">
                                                                        <tr>
                                                                            <th>Numero da Inscrição:</th>
                                                                            <td><%=entrevista.getInscricao().getId()%></td>
                                                                        </tr> 
                                                                        <tr>
                                                                            <th>Nome:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getNome()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Curso:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getCurso().getNome()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Auxilio 1:</th>
                                                                            <td><%=entrevista.getInscricao().getBolsa1().getNome()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Auxilio 2:</th>
                                                                            <td><%=entrevista.getInscricao().getBolsa2().getNome()%></td>
                                                                        </tr>
                                                                        <%

                                                                            if (entrevista.getDataAgendadaEntrevista() != null) {
                                                                        %>
                                                                        <tr>
                                                                            <th>Data da Entrevista:</th>
                                                                            <td><input name='dataEntrevista' type='text' value='<%=dataFormat.formatarData(entrevista.getDataAgendadaEntrevista())%>'></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Hora da Entrevista:</th>
                                                                            <td><input name='horario' type='text' value='<%=dataFormat.formatarHora(entrevista.getDataAgendadaEntrevista())%>'></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Local da Entrevista:</th>
                                                                            <td><input name='local' type='text' value='<%=entrevista.getLocal()%>'></td>
                                                                        </tr>
                                                                        
                                                                        <% } else {%>
                                                                        <tr>
                                                                            <th>Data da Entrevista:</th>
                                                                            <td> Dispensado </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Hora da Entrevista:</th>
                                                                            <td> - </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Local da Entrevista:</th>
                                                                            <td> - </td>
                                                                        </tr>
                                                                        <%    }     %>
                                                                        <tr>
                                                                        <td colspan="2">
                                                                            <a href="/pnaes/entrevista/listarAgendamento.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <button type="submit" value="Salvar" class="btn btn-primary os-icon os-icon-save">
                                                                                <i class="fa fa-check-square-o"></i> Salvar
                                                                            </button></td>
                                                                        </tr>
                                                                    </table>
                                                                </div>

                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
