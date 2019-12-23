<%-- 
    Document   : listarEntrevista
    Created on : 15/02/2018, 08:15:22
    Author     : ronan
--%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Resultado</title>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Resultado</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../Servlet?opcao=cadastrar">
                                                        <div class="form-body">

                                                            <table class="table table-striped table-responsive-md">
                                                                <tr>
                                                                    <th>Inscrição</th>
                                                                    <th>Aluno</th>
                                                                    <th>Per Capita</th>
                                                                    <th>Observação</th>
                                                                    <th>Bolsa 1</th>
                                                                    <th>Resultado</th>
                                                                    <th>Bolsa 2</th>
                                                                    <th>Resultado</th>
                                                                    <th>Finalizar</th>
                                                                </tr>
                                                                <%                                                                    
                                                                    List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().listar();
                                                                    
                                                                    Double total1 = new Double(0);
                                                                    Double td = new Double(0);
                                                                    Double perCapita = new Double(0);
                                                                    int i = 0;

                                                                    for (Entrevista e : entrevistas) {
                                                                        dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(e.getInscricao().getAluno().getId());
                                                                        empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(e.getInscricao().getAluno().getId());
                                                                        for (Dependente d : dependentes) {
                                                                            i++;
                                                                            td = td + d.getRenda();
                                                                        }
                                                                        total1 = empresa.getRenda() + td + empresa.getOrenda();
                                                                        perCapita = total1 / (i + 1);
                                                                %>
                                                                <tr>
                                                                    <td><%=e.getInscricao().getId()%></td>
                                                                    <td><%=e.getInscricao().getAluno().getNome()%></td>
                                                                    <td><script>document.write(formatarMoeda(<%=perCapita%>));</script></td>
                                                                    <td><%=e.getObservacao()%></td>                                                                    
                                                                    <td><%=e.getInscricao().getBolsa1().getNome()%></td>
                                                                    <td>
                                                                        <select id="resultado" name="resultado" class="form-control" required>
                                                                            <option selected="" disabled="">Selecione o Resultado</option>
                                                                            <option value="Classificado">Classificado</option>
                                                                            <option value="Reserva">Reserva</option>
                                                                            <option value="Desclassificado">Desclassificado</option>
                                                                        </select>
                                                                    </td>
                                                                    <td><%=e.getInscricao().getBolsa2().getNome()%></td>
                                                                    <td>
                                                                        <select id="resultado" name="resultado" class="form-control" required>
                                                                            <option selected="" disabled="">Selecione o Resultado</option>
                                                                            <option value="Classificado">Classificado</option>
                                                                            <option value="Reserva">Reserva</option>
                                                                            <option value="Desclassificado">Desclassificado</option>
                                                                        </select>
                                                                    </td>

                                                                    <%
                                                                        }
                                                                    %>
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