<%-- 
    Document   : listar
    Created on : 17/08/2018, 00:06:08
    Author     : euzebio
--%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Aluno</title>
        <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
            
            $(document).ready(function() {
                $('#tabelaAlunos').DataTable( {
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Sistema PNAES</h4>
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
                                                            <a href="/pnaes/aluno/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary" type="button">Cadastar Aluno</button></a>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Buscar Aluno</label>
                                                                        <div class="col-md-6">
                                                                            <input type="text" name="pesquisa" id="pesquisa" class="form-control" placeholder="Nome da bolsa">
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
                                                    <%                                
                                                        List<Aluno> alunos;
                                                        String nomeAluno;
                                                        if (request.getParameter("pesquisa") != null) {
                                                            if (request.getParameter("pesquisa") != "") {
                                                                nomeAluno = request.getParameter("pesquisa");
                                                                alunos = daoFactory.getAlunoDao().pesquisarPor(nomeAluno, "nome");
                                                            } else {
                                                                alunos = daoFactory.getAlunoDao().listar();
                                                            }
                                                        } else {
                                                            alunos = daoFactory.getAlunoDao().listar();
                                                        }
                                                    %>                     
                                                    <table class="table table-striped table-responsive-md" id="tabelaAlunos">
                                                        <thead>
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Nome</th>
                                                            <th>CPF</th>
                                                            <th>Telefone</th>
                                                            <th>Email</th>
                                                            <th>Matricula</th>
                                                            <th>Editar</th>
                                                            <th>Vizualizar</th>
                                                        </tr>
                                                        </thead>
                                                        <%
                                                            for (Aluno a : alunos) {
                                                        %>
                                                        <tr>
                                                            <td><%=a.getId()%></td>
                                                            <td><%=a.getNome()%></td>
                                                            <td><%=a.getCpf()%></td>
                                                            <td><%=a.getTelefone()%></td>
                                                            <td><%=a.getEmail()%></td>
                                                            <td><%=a.getMatricula()%></td>
                                                            <td><a href="/pnaes/aluno/alterar.jsp?id=<%=a.getId()%>"><img src="/pnaes/img/editar.png"/></a></td>
                                                            <td><a href="/pnaes/aluno/visualizar.jsp?id=<%=a.getId()%>"><img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=a.getCpf()%>/<%=a.getCpf()%>.jpg" width="30" height="40"/></a></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                        <tfoot>
                                                            <tr>
                                                            <th>ID</th>
                                                            <th>Nome</th>
                                                            <th>CPF</th>
                                                            <th>Telefone</th>
                                                            <th>Email</th>
                                                            <th>Matricula</th>
                                                            <th>Editar</th>
                                                            <th>Vizualizar</th>
                                                        </tr>
                                                        </tfoot>
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