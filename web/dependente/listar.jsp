<%-- 
    Document   : listar
    Created on : 17/08/2018, 00:06:08
    Author     : euzebio
--%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Membro Familiar</title>
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
            function apagar(id,nome) {
                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ATENÇÃO!</h5>', 'Deseja realmente excluir o membro familiar <h5 class="card-title">'+nome+'?</h5>', 
                function(){ 
                    var url = "../ServletDependente?opcao=excluir&id=" + id;
                    window.location = url; 
                }
                , function(){ alertify.error('Exclusão Cancelada')}).set('labels', {ok:'Excluir', cancel:'Cancelar'});;
                
                }
            
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Membros familiares</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Lista de membros familiares
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/dependente/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary " type="button"><span class="os-icon os-icon-plus"></span>Incluir Membro Familiar</button></a>
                                                        </div>
                                                        
                                                    </div>                                                    
                                                    <%                                                        
                                                        DataFormat dataFormat = new DataFormat();
                                                        
                                                    %>
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Nome</th>
                                                            <th>CPF</th>
                                                            <th>RG</th>
                                                            <th>Data de Nascimento</th>
                                                            <th>Sexo</th>
                                                            <th>Telefone</th>
                                                            <th>Email</th>
                                                            <th>Grau Parentesco</th>
                                                            <th>Aluno</th>
                                                            <th>Alterar</th>
                                                            <th>Excluir</th>
                                                        </tr>
                                                        <%                    for (Dependente d : dependentes) {
                                                        %>
                                                        <tr>
                                                            <td><%=d.getNome()%></td>
                                                            <td><%=d.getCpf()%></td>
                                                            <td><%=d.getRg()%></td>
                                                            <td><%=dataFormat.formatarData(d.getDtn())%></td>
                                                            <td><%=d.getSexo()%></td>
                                                            <td><%=d.getTelefone()%></td>
                                                            <td><%=d.getEmail()%></td>                    
                                                            <td><%=d.getGrauParentesco()%></td>
                                                            <td><%=d.getAluno().getNome()%></td>
                                                            <td><a href="alterar.jsp?id=<%=d.getId()%>" title="Editar" class="text-info"><div class="os-icon os-icon-edit"></div><span>Editar</span></a></td>
                                                            <td><a href="#" onclick="apagar(<%=d.getId()%>,'<%=d.getNome()%>')" title="Excluir" class="text-danger"><div class="os-icon os-icon-x"></div><span>Excluir</span></a></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                    </table>  
                                                    <div class="form-group row">

                                                       <% if (aluno.getStatusCadastro().equals("3") || aluno.getStatusCadastro().equals("6")) { %>
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;

                                                        </div>
                                                        <% } else {%>
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                            <a href="/pnaes/despesa/cadastrar.jsp?status=3">
                                                            <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                <i class="fa fa-check-square-o"></i> Avançar
                                                            </button>
                                                            </a>
                                                        </div
                                                        
                                                        <%}%>
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