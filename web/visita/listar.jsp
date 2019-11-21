<%@page import="modelo.Visita"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Edital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Visita</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Lista de Visitas</h4>
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
                                                            <a href="/pnaes/visita/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Agendar Visita</button></a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Buscar Aluno</label>
                                                                        <div class="col-md-6">
                                                                            <input type="text" name="pesquisa" id="pesquisa" class="form-control" placeholder="Nome do Aluno">
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
                                                        <%                                                            
                                                            DataFormat dataFormat = new DataFormat();
                                                            List<Visita> visita = daoFactory.getVisitaDao().listar();
                                                        %>

                                                        <table class="table table-bordered">
                                                            <tr>

                                                                <th>Inscrição</th>
                                                                <th>Aluno</th>
                                                                <th>Visitar</th>
                                                              
                                                            </tr>
                                                            <% 
                                                           
                                                            List<Visita>visitas = daoFactory.getVisitaDao().listar();
                                                            for (Visita vi : visitas) {
                                                                    out.println("<tr>");
                                                                    out.println("<td>" + vi.getId() + "</td>");
                                                                    out.println("<td>" + vi.getInscricao().getAluno().getNome() + "</td>");
                                                                    out.println("<td><a href=\"cadastrar.jsp?e_id=" + vi.getId() + "\">Entrevistar</a></td>");
                                                               
                                                            
                                                        %>
                                                            <tr>

                                                                <td><%=vi.getInscricao()%></td>
                                                                <td><%=vi.getInscricao().getAluno().getNome()%></td>
                                                              
                                                            </tr>
                                                            <%
                                                                }
                                                            %>
                                                        </table> 
                                                    </div>
                                                    <div class="element-box-content">
                                                        <a href="/pnaes/home.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">Voltar ao Menu</button> </a>
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


