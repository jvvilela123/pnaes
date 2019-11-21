<%@page import="modelo.FichaMedica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Ficha Medica</title>
        <script language=JavaScript src="../jquery.js" type="text/javascript"></script>
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

                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Sistema PNAES</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/fichaMedica/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Incluir Ficha Medica</button></a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Buscar Ficha Medica</label>
                                                                        <div class="col-md-6">
                                                                            <input type="text" name="pesquisa" id="pesquisa" class="form-control" placeholder="Nome da bolsa">
                                                                        </div>
                                                                        <div class="col-md-3">
                                                                            <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                                <i class="fa fa-check-square-o"></i>Buscar
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <%                                                       
                                                        List<FichaMedica> fichaMedicas = new ArrayList<FichaMedica>();
                                                        fichaMedicas = daoFactory.getFichaMedicaDao().perquisarPorAluno(alunoId);
                                                    %>
                                                    <table class="table table-bordered">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Doença Cronica</th>
                                                            <th>Uso de Medicamento</th>
                                                            <th>Doença Cronica na Familia</th>
                                                            <th>Deficiencia</th>
                                                            <th>Deficiencia na familia</th>
                                                            <th>Excluir</th>
                                                        </tr>
                                                        <%                     
                                                            for (FichaMedica fm : fichaMedicas) {
                                                        %>
                                                        <tr>
                                                            <td><%=fm.getId()%></td>
                                                            <td><%=fm.getTipoDoenca()%></td>
                                                            <td><%=fm.getMedicamento()%></td>
                                                            <td><%=fm.getDoencaCronica()%></td>
                                                            <td><%=fm.getDeficiencia()%></td>
                                                            <td><%=fm.getDeficienciaDep()%></td>
                                                            <td><a href="#" onclick="apagar(<%=fm.getId()%>)">Excluir</a></td>
                                                        </tr>
                                                        <%}%>
                                                    </table>    
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




