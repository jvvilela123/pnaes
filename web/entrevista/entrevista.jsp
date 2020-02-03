<%-- 
    Document   : entrevista
    Created on : 17/05/2018, 08:19:11
    Author     : ronan
--%>

<%@page import="modelo.Entrevista"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fazer Entrevista</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Avaliar Aluno</h4>
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
                                                        <div class="col-md-6">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="entrevista.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Buscar Aluno</label>
                                                                        <div class="col-md-6">
                                                                            <input type="text" name="pesquisa" id="pesquisa" class="form-control" placeholder="Nome do aluno">
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
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Inscrição</th>
                                                            <th>Aluno</th>
                                                            <th>Entrevistar</th>

                                                        </tr>
                                                        <%  
                                                            List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().listar();
                                                            String nome;
                                                        if (request.getParameter("pesquisa") != null) {
                                                            if (!request.getParameter("pesquisa").equals("")) {
                                                                nome = request.getParameter("pesquisa");
                                                                entrevistas = daoFactory.getEntrevistaDao().perquisarPorNomeAluno(nome);
                                                                
                                                            }
                                                        }                                                            
                                                            for (Entrevista en : entrevistas) {
                                                                if (en.getInscricao().getStatus().equals("Agendado")) {
                                                                    out.println("<tr>");
                                                                    out.println("<td>" + en.getInscricao().getId() + "</td>");
                                                                    out.println("<td>" + en.getInscricao().getAluno().getNome() + "</td>");
                                                                    out.println("<td><a href=\"cadastrar.jsp?e_id=" + en.getId() + "\">Entrevistar</a></td>");

                                                                }
                                                            }
                                                        %>
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