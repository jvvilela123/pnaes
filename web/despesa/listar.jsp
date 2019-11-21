<%@page import="modelo.Despesa"%>
<%@page import="modelo.Dependente"%>
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
        <title>Cadastro de Orcamento</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Despesa Mensal</h4>
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
                                                            <a href="/pnaes/despesa/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Incluir Despesa dp Aluno</button></a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Buscar Orcamento</label>
                                                                        <div class="col-md-6">
                                                                            <input type="text" name="pesquisa" id="pesquisa" class="form-control" placeholder="Nome do edital">
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
                                                            
                                                            List<Dependente> dependentes = new ArrayList<Dependente>();
                                                            List<Despesa> despesa = new ArrayList<Despesa>();
                                                            aluno = daoFactory.getAlunoDao().pesquisarPorId(Integer.parseInt(session.getAttribute("aluno_id").toString()));
                                                            dependentes = daoFactory.getDependenteDao().perquisarPorAluno(alunoId);
                                                            despesa = daoFactory.getDespesaDao().perquisarPorAluno(alunoId);
                                                        %>  
                                                        <table class="table table-bordered">
                                                            <tr>
                                                                <th>Nome do Aluno</th> 
                                                                <th>Moradia</th>
                                                                <th>AGUA</th>
                                                                <th>Energia</th>
                                                                <th>Telefone</th>
                                                                <th>Farmacia</th>
                                                                <th>Outras</th>
                                                                <th>Total</th>
                                                                <th>EDITAR</th>
                                                                <th>EXCLUIR</th>
                                                            </tr>


                                                            <%
                                                                Double total = new Double(0);
                                                                for (Despesa dm : despesa) {
                                                                    total = dm.getAgua() + dm.getEnergia() + dm.getMoradia() + dm.getTelefone() + dm.getFarmacia() + dm.getOutrasDespesas();
                                                            %>
                                                            <tr>
                                                                <td><%=dm.getAluno().getNome()%></td>
                                                                <td><%=dm.getMoradia()%></td>
                                                                <td><%=dm.getAgua()%></td>
                                                                <td><%=dm.getEnergia()%></td>
                                                                <td><%=dm.getTelefone()%></td>
                                                                <td><%=dm.getFarmacia()%></td>
                                                                <td><%=dm.getOutrasDespesas()%></td>
                                                                <td><%=total%></td>
                                                                <td><a href="alterar.jsp?id=<%=dm.getId()%>"><img src="/pnaes/img/editar.png"/></a></td>
                                                                <td><a href="#" onclick="apagar(<%=dm.getId()%>)"><img src="/pnaes/img/excluir.png"/></a></td>
                                                            </tr>
                                                            <% }%>  
                                                        </table>
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



