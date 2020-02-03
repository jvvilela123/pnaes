<%@page import="modelo.Categoria"%>
<%@page import="util.DataFormat"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Inscricao"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Horario</title>
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            $(document).ready(function () {
                $('#pBolsa').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });
                $('#pCat').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });
            });
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Marcar Entrevista</h4>
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
                                                            <form class="form form-horizontal form-bordered" method="POST" action="horario.jsp">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="pBolsa">Pesquisa por Bolsa</label>
                                                                    <div class="col-md-4">
                                                                        <select name="pBolsa" class="form-control">
                                                                            <option value="">Selecione a Bolsa</option>
                                                                            <%                                                                            DataFormat dataFormat = new DataFormat();
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
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                        <i class="fa fa-check-square-o"></i>Buscar
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>

                                                        <form method="POST" action="../ServletEntrevista?opcao=cadastrarTudo" class="form-horizontal">
                                                            <table class="table table-striped table-responsive-md">

                                                                <tr>
                                                                    <th>Data</th>
                                                                    <th><input class="form-control" name="dataEntrevista" type="date" value="" required=""></th>
                                                                    <th>Local</th>
                                                                    <th><input class="form-control" name="local" type="text" value="" required=""></th>
                                                                </tr>
                                                                <tr><td></td></tr>
                                                                <tr>
                                                                    <th>Inscrição</th>
                                                                    <th>Aluno</th>
                                                                    <th>Curso</th>
                                                                    <th>Horario</th>
                                                                </tr>
                                                                <%
                                                                    List<Inscricao> inscricoes = daoFactory.getInscricaoDao().perquisarPorEdital(edital.getId());

                                                                    if (request.getParameter("pBolsa") != null && request.getParameter("pCat") != null) {

                                                                        String bolsaId = request.getParameter("pBolsa").trim();
                                                                        String categoriaId = request.getParameter("pCat").trim();
                                                                        
                                                                        if (!bolsaId.equals("") && !categoriaId.equals("")) {
                                                                            System.out.println("bolsaId1 = "+bolsaId);
                                                                        System.out.println("categoriaId1 = "+categoriaId);
                                                                            inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsaECategoria(Integer.parseInt(categoriaId), Integer.parseInt(bolsaId), edital.getId());
                                                                        } else if (!bolsaId.equals("") && categoriaId.equals("")) {
                                                                            System.out.println("bolsaId2 = "+bolsaId);
                                                                        System.out.println("categoriaId2 = "+categoriaId);
                                                                            inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsa(Integer.parseInt(bolsaId), edital.getId());
                                                                        } else if (bolsaId.equals("") && !categoriaId.equals("")) {
                                                                            System.out.println("bolsaId3 = "+bolsaId);
                                                                        System.out.println("categoriaId3 = "+categoriaId);
                                                                            inscricoes = daoFactory.getInscricaoDao().perquisarPorCategoria(Integer.parseInt(categoriaId), edital.getId());
                                                                        }
                                                                        System.out.println("bolsaId = "+bolsaId);
                                                                        System.out.println("categoriaId = "+categoriaId);
                                                                    }
                                                                    int k =0;
                                                                    for (Inscricao i : inscricoes) {
                                                                        System.out.println("i = " + i.getId());
                                                                        if (i.getStatus().equals("Analizado")) {
                                                                            
                                                                            
                                                                %>
                                                                    
                                                                <tr>
                                                                    <td><%=i.getId()%></td>
                                                                    <td><%=i.getAluno().getNome()%></td>
                                                                    <td><%=i.getAluno().getCurso().getNome()%></td>
                                                                    <td><input class="form-control" name="horario<%=k%>" type="text" maxlength="5" OnKeyPress="formatar('##:##', this)" required=""></td>
                                                                    <td><input name="i_id<%=k%>" type="hidden" value="<%=i.getId()%>">

                                                                </tr>
                                                                <%
                                                                            k++;
                                                                        }
                                                                    }

                                                                %>
                                                                <td><input name="k" type="hidden" value="<%=k%>">
                                                            </table>
                                                            <input class="btn btn-primary" name="marcar" type="submit" value="Marcar"/>
                                                        </form>
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
