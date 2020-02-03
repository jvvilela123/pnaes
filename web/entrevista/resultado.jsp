<%-- 
    Document   : listarEntrevista
    Created on : 15/02/2018, 08:15:22
    Author     : ronan
--%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV"%>
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
        <%@include file="../imports.jsp" %>
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
            
            $(document).ready(function() {
                $('#tabelaResultado').DataTable( {
                    "language": {
                    "sEmptyTable": "Nenhum registro encontrado",
                    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                    "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sInfoThousands": ".",
                    "sLengthMenu": "_MENU_ resultados por página",
                    "sLoadingRecords": "Carregando...",
                    "sProcessing": "Processando...",
                    "sZeroRecords": "Nenhum registro encontrado",
                    "sSearch": "Pesquisar",
                    "oPaginate": {
                        "sNext": "Próximo",
                        "sPrevious": "Anterior",
                        "sFirst": "Primeiro",
                        "sLast": "Último"
                    },
                    "oAria": {
                        "sSortAscending": ": Ordenar colunas de forma ascendente",
                        "sSortDescending": ": Ordenar colunas de forma descendente"
                    },
                    "select": {
                        "rows": {
                            "_": "Selecionado %d linhas",
                            "0": "Nenhuma linha selecionada",
                            "1": "Selecionado 1 linha"
                        }
                    }
                        

                    }
                } );
            } );
        </script>
        
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
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEntrevista?opcao=finalizar">
                                                        <div class="form-body">

                                                            <table class="table table-striped table-responsive-md" id="tabelaResultado">
                                                                <thead>
                                                                <tr>
                                                                    <th>Inscrição</th>
                                                                    <th>Aluno</th>
                                                                    <th>Ensino Fundamental</th>
                                                                    <th>Ensino Médio</th>
                                                                    <th>Vulnerabilidade</th>
                                                                    <th>Renda Per Capita</th>
                                                                    <th>Observação</th>
                                                                    <th>Bolsa 1</th>
                                                                    <th>Resultado</th>
                                                                    <th>Bolsa 2</th>
                                                                    <th>Resultado</th>
                                                                    <th>Finalizar</th>
                                                                </tr>
                                                               </thead>
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
                                                                        //DecimalFormat decimal = new DecimalFormat("0.00");
                                                                %>
                                                                <tr>
                                                                    <td><%=e.getInscricao().getId()%></td>
                                                                    <td><%=e.getInscricao().getAluno().getNome()%></td>
                                                                    <td><%=e.getInscricao().getAluno().getEnsinoFundamental()%></td>
                                                                    <td><%=e.getInscricao().getAluno().getEnsinoMedio()%></td>
                                                                     <td><%=e.getVulnerabilidade()%></td>
                                                                    <!--<td><script>document.write(formatarMoeda());</script></td>-->
                                                                    <td>R$ <%=decimal.format(perCapita)%></td>  
                                                                    <td><%=e.getObservacao()%></td>                                                                    
                                                                    <td><%=e.getInscricao().getBolsa1().getNome()%></td>
                                                                    <td>
                                                                        <select  name="resultado" class="form-control" required>
                                                                            <option selected="" disabled="">Selecione o Resultado</option>
                                                                            <option value="Classificado">Classificado</option>
                                                                            <option value="Reserva">Reserva</option>
                                                                            <option value="Desclassificado">Desclassificado</option>
                                                                        </select>
                                                                    </td>
                                                                    <td><%=e.getInscricao().getBolsa2().getNome()%></td>
                                                                    <td>
                                                                        <select  name="resultado2" class="form-control" required>
                                                                            <option selected="" disabled="">Selecione o Resultado</option>
                                                                            <option value="Classificado">Classificado</option>
                                                                            <option value="Reserva">Reserva</option>
                                                                            <option value="Desclassificado">Desclassificado</option>
                                                                        </select>
                                                                    </td>
                                                                    <td><button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                            <i class="fa fa-check-square-o"></i>Salvar Resultado
                                                                        </button></td>
                                                                     </tr>

                                                                    <%
                                                                        }
                                                                    %>
                                                                    <tfoot>
                                                                <tr>
                                                                    <th>Inscrição</th>
                                                                    <th>Aluno</th>
                                                                    <th>Ensino Fundamental</th>
                                                                    <th>Ensino Médio</th>
                                                                    <th>Vulnerabilidade</th>
                                                                    <th>Per Capita</th>
                                                                    <th>Observação</th>
                                                                    <th>Bolsa 1</th>
                                                                    <th>Resultado</th>
                                                                    <th>Bolsa 2</th>
                                                                    <th>Resultado</th>
                                                                    <th>Finalizar</th>
                                                                </tr>
                                                                    </tfoot>
                                                            </table>
                                                              <table class="table table-striped table-responsive-md">
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