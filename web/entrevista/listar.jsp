<%-- 
    Document   : listarEntrevista
    Created on : 15/02/2018, 08:15:22
    Author     : ronan
--%>

<%@page import="modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Bolsa"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Entrevista</title>
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
                    var url = "../ServletBolsa?opcao=excluir&id=" + id;
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Lista de Entrevista</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/bolsa/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Cadastar Bolsa</button></a>
                                                        </div>
                                                        
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Pesquisa por Bolsa</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pesquisa" class="form-control">
                                                                                <option value="">Selecione a Bolsa</option>
                                                                                <%
                                                                                    DataFormat dataFormat = new DataFormat();
                                                                                    List<Bolsa> bolsas = daoFactory.getBolsaDao().listar();
                                                                                    for (Bolsa b : bolsas) {
                                                                                        out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pCat">Pesquisa por Categoria</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pCat" class="form-control">
                                                                                <option value="">Selecione a Categoria</option>
                                                                                <%
                                                                                    List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                                    for (Categoria c : categorias) {
                                                                                        out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                                <i class="fa fa-check-square-o"></i>Buscar
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                            <form class="form form-horizontal form-bordered" method="POST" action="../ServletPdf?opcao=inscricao">
                                                                <div class="form-body">

                                                                    <div class="col-md-2">
                                                                        <div class="element-box-content">
                                                                            <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                                <i class="fa fa-check-square-o"></i>Gerar PDF
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>  
                                                    <%
                                                        List<Entrevista> entrevistas = new ArrayList<Entrevista>();
                                                        Integer bolsaId;
                                                        Integer categoriaId;
                                                        if ((request.getParameter("pesquisa") != null) && (request.getParameter("pCat") != null)) {
                                                            if ((request.getParameter("pesquisa") != "") && (request.getParameter("pCat") != "")) {
                                                                try {
                                                                    bolsaId = Integer.parseInt(request.getParameter("pesquisa"));
                                                                } catch (NumberFormatException nb) {
                                                                    bolsaId = 0;
                                                                }
                                                                try {
                                                                    categoriaId = Integer.parseInt(request.getParameter("pCat"));
                                                                } catch (NumberFormatException nc) {
                                                                    categoriaId = 0;
                                                                }
                                                                entrevistas = daoFactory.getEntrevistaDao().perquisarPorBolsaCategoria(categoriaId, bolsaId, edital.getId());
                                                            } else {
                                                                entrevistas = daoFactory.getEntrevistaDao().perquisarPorEdital(edital.getId());
                                                            }
                                                        } else {
                                                            entrevistas = daoFactory.getEntrevistaDao().perquisarPorEdital(edital.getId());
                                                        }
                                                            entrevistas = daoFactory.getEntrevistaDao().perquisarPorEdital(edital.getId());
                                                        
                                                    %>                        
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Inscrição</th>
                                                            <th>Aluno</th>
                                                            <th>Data</th>
                                                            <th>Hora</th>
                                                            <th>Local</th>
                                                        </tr>
                                                        <%  
                                                            for (Entrevista e : entrevistas) {
                                                                out.println("<tr>");
                                                                out.println("<td>" + e.getInscricao().getId() + "</td>");
                                                                out.println("<td>" + e.getInscricao().getAluno().getNome() + "</td>");
                                                                out.println("<td>" + dataFormat.formatarData(e.getDataEntrevista()) + "</td>");
                                                                out.println("<td>" + dataFormat.formatarHora(e.getDataEntrevista()));
                                                                out.println("<td>" + e.getLocal() + "</td>");
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