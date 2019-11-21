<%@page import="modelo.Inscricao"%>
<%@page import="java.util.GregorianCalendar"%>
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
        <title>Lista de Classificados</title>
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
            function apagar(id) {
                if (window.confirm("Deseja realmente excluir?")) {
                    var url = "../ServletEdital?opcao=excluir&id=" + id;
                    window.location = url;
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Lista de Classificados</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Inscricao</th>
                                                            <th>Aluno</th>
                                                            <th>Telefone</th>
                                                            <th>Documentos Faltantes</th>
                                                            <th>Resultado</th>
                                                            <th>Alterar</th>
                                                        </tr>
                                                        <%                                                            
                                                            List<Inscricao> Inscricoes = daoFactory.getInscricaoDao().listar();
                                                            for (Inscricao i : Inscricoes) {
                                                                out.println("<tr>");
                                                                out.println("<td>" + i.getId() + "</td>");
                                                                out.println("<td>" + i.getAluno().getNome() + "</td>");
                                                                out.println("<td>" + i.getAluno().getTelefone() + "</td>");
                                                                out.println("<td>" + i.getDocumentosFaltantes() + "</td>");
                                                                out.println("<td>" + i.getResultado() + "</td>");
                                                        %>
                                                        <td><a href="alterar.jsp?i_id=<%=i.getId()%>"><img src="/pnaes/img/editar.png"/></a></td>
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
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>