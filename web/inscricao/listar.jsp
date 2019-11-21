<%-- 
    Document   : listar
    Created on : 11/03/2018, 12:21:16
    Author     : euzebio
--%>
<%@page import="modelo.Categoria"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Bolsa</title>
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
                            <div style="width: 90%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Lista de Inscritos</h4>
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
                                                        <div class="col-md-12">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Pesquisa por Bolsa</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pesquisa" class="form-control">
                                                                                <option value="">Selecione a Bolsa</option>
                                                                                <%                                                                                    DataFormat dataFormat = new DataFormat();
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
                                                                        <div class="col-md-2">
                                                                            <div style="margin: 25px 50px 75px 100px;">
                                                                                <button class="btn btn-primary" onclick="generate()">
                                                                                    <i class="fa fa-check-square-o"></i>Gerar PDF
                                                                                </button>
                                                                            </div>
                                                                        </div>    
                                                                    </div>
                                                                </div>
                                                            </form>                                                            
                                                        </div>
                                                    </div>
                                                    <%
                                                        List<Inscricao> inscricaos = new ArrayList<Inscricao>();
                                                        Integer bolsaId;
                                                        Integer categoriaId;
                                                        System.out.println("aqui = "+request.getParameter("pesquisa"));
                                                        System.out.println("aqui = "+request.getParameter("pCat"));
                                                        if ((request.getParameter("pesquisa") != null) && (request.getParameter("pCat") != null)) {
                                                            
                                                            if ((request.getParameter("pesquisa") != "") && (request.getParameter("pCat") != "")) {
                                                                try {
                                                                    System.out.println("aqui2");
                                                                    bolsaId = Integer.parseInt(request.getParameter("pesquisa"));
                                                                    System.out.println("aqui3");
                                                                } catch (NumberFormatException nb) {
                                                                    bolsaId = 0;
                                                                }
                                                                try {
                                                                    categoriaId = Integer.parseInt(request.getParameter("pCat"));
                                                                } catch (NumberFormatException nc) {
                                                                    categoriaId = 0;
                                                                }
                                                                inscricaos = daoFactory.getInscricaoDao().perquisarPorBolsaCategoria(categoriaId, bolsaId, edital.getId());
                                                            } else {
                                                                inscricaos = daoFactory.getInscricaoDao().perquisarPorEdital(edital.getId());
                                                            }
                                                        } else {
                                                            System.out.println("aqui10");
                                                            inscricaos = daoFactory.getInscricaoDao().perquisarPorEdital(edital.getId());
                                                        }
                                                    %>



                                                    <table id="basic-table" class="table table-striped table-responsive-md">

                                                        

                                                            <tr>
                                                                <th>Inscrição</th>
                                                                <th>Aluno</th>
                                                                <th>CPF</th>
                                                                <th>Bolsa 1ª Opção</th>
                                                                <th>Bolsa 2ª Opção</th>
                                                                <th>Data</th>                                                                    
                                                            </tr>
                                                            <%
                                                                for (Inscricao i : inscricaos) {
                                                            %>
                                                            <tr>
                                                                <td><%=i.getId()%></td>
                                                                <td><%=i.getAluno().getNome()%></td>
                                                                <td><%=i.getAluno().getCpf()%></td>
                                                                <td><%=i.getBolsa1().getNome()%></td>
                                                                <td><%=i.getBolsa2().getNome()%></td>
                                                                <td><%=dataFormat.formatarData(i.getDataInscricao())%></td>

                                                            </tr>
                                                            <%
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
        <script src='/pnaes/js/jspdf.plugin.autotable.js'></script>                                                       
    </body>
</html>