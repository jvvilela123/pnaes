<%-- 
    Document   : entrevistar
    Created on : 17/05/2018, 08:17:06
    Author     : ronan
--%>

<%@page import="modelo.Visita"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Visita</title>
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
                            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">

                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="card-bootstrap.html">Cards</a>
                                    <a class="dropdown-item" href="component-buttons-extended.html">Buttons</a>
                                </div>
                            </div>
                        </div>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Visita</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <%                                                        Visita visita = (Visita) daoFactory.getVisitaDao().pesquisarPorId(Integer.parseInt(request.getParameter("v_id")));
                                                    %>
                                                    <div class="col-md-3">
                                                        <img src="/pnaes/img/alunos/<%=visita.getInscricao().getAluno().getCpf()%>/<%=visita.getInscricao().getAluno().getCpf()%>" width="150" height="200">
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEntrevista?opcao=entrevistar&e_id=<%=entrevista.getId()%>">
                                                        <div class="form-body">
                                                            <table class="table table-striped table-responsive-md">
                                                                <tr>
                                                                    <th>Numero da Inscrição:</th>
                                                                    <td><%=visita.getInscricao().getId()%></td>
                                                                </tr> 
                                                                <tr>
                                                                    <th>Nome:</th>
                                                                    <td><%=visita.getInscricao().getAluno().getNome()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>CPF:</th>
                                                                    <td><%=visita.getInscricao().getAluno().getCpf()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="introducao">Introdução</label></td>
                                                                    <td><textarea  cols="40" rows="4" name="introducao"></textarea></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="situacional">Caraterização Situacional</label></td>
                                                                    <td><textarea  cols="40" rows="4" name="situacional"></textarea></td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label class="col-md-3 label-control" for="parecerSocial">Parecer Social</label></td>
                                                                    <td><textarea  cols="40" rows="4" name="árecerSocial"></textarea></td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                    <td><button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                            <i class="ft-x"></i> Limpar
                                                                        </button>
                                                                        <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                            <i class="fa fa-check-square-o"></i>Enviar
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
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>