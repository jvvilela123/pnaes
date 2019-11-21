<%-- 
    Document   : documento
    Created on : 06/04/2018, 14:36:55
    Author     : ronan
--%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Bolsa"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaiar Aluno</title>
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
                                                    <div class="col-md-12">
                                                        <form class="form form-horizontal form-bordered" method="POST" action="documento.jsp">
                                                            <div class="form-group row">
                                                                <label class="col-md-2 label-control" for="pBolsa">Pesquisa por Bolsa</label>
                                                                <div class="col-md-3">
                                                                    <select name="pBolsa" class="form-control">
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


                                                                <label class="col-md-2 label-control" for="pCat">Pesquisa por Categoria</label>
                                                                <div class="col-md-3">
                                                                    <select name="pCat" id="pCat" class="form-control">
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
                                                        </form>
                                                    </div>
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Inscrição</th>
                                                            <th>Aluno</th>
                                                            <th>Documento</th>
                                                        </tr>
                                                        <%
                                                            List<Inscricao> inscricoes = daoFactory.getInscricaoDao().perquisarPorEdital(edital.getId());

                                                            if (request.getParameter("pBolsa") != null && request.getParameter("pCat") != null) {

                                                                String bolsaId = request.getParameter("pBolsa").trim();
                                                                String categoriaId = request.getParameter("pCat").trim();

                                                                if (!bolsaId.equals("") && !categoriaId.equals("")) {
                                                                    System.out.println("bolsaId1 = " + bolsaId);
                                                                    System.out.println("categoriaId1 = " + categoriaId);
                                                                    inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsaCategoria(Integer.parseInt(categoriaId), Integer.parseInt(bolsaId), edital.getId());
                                                                } else if (!bolsaId.equals("") && categoriaId.equals("")) {
                                                                    System.out.println("bolsaId2 = " + bolsaId);
                                                                    System.out.println("categoriaId2 = " + categoriaId);
                                                                    inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsa(Integer.parseInt(bolsaId), edital.getId());
                                                                } else if (bolsaId.equals("") && !categoriaId.equals("")) {
                                                                    System.out.println("bolsaId3 = " + bolsaId);
                                                                    System.out.println("categoriaId3 = " + categoriaId);
                                                                    inscricoes = daoFactory.getInscricaoDao().perquisarPorCategoria(Integer.parseInt(categoriaId), edital.getId());
                                                                }

                                                            }
                                                            for (Inscricao i : inscricoes) {
                                                                System.out.println("conferir = " + i.getResultado());
                                                                if (i.getResultado() == null) {
                                                                    System.out.println("conferir aki = " + i.getResultado());

                                                                    out.println("<tr>");
                                                                    out.println("<td>" + i.getId() + "</td>");
                                                                    out.println("<td>" + i.getAluno().getNome() + "</td>");
                                                                    out.println("<td><a href=\"cadastrar.jsp?i_id=" + i.getId() + "\">Conferir</a></td>");
                                                                    out.println("</tr>");
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