<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Aluno"%>
<%@page import="util.DataFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DataFormat dataFormat = new DataFormat();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Aluno</title>
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
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <div class="card">

                                    <div class="card-header">
                                        <h4 class="card-title" id="striped-row-layout-icons">Sistema PNAES</h4>
                                        <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <%
                                            alunoId = Integer.parseInt(request.getParameter("id"));
                                            aluno = daoFactory.getAlunoDao().pesquisarPorId(alunoId);
                                        %>
                                            
                                        <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg" width="150" height="200">
                                    </div>
                                    <table class="table table-striped table-responsive-md">
                                        <tr>
                                            <th>Nome:</th>
                                            <td><%=aluno.getNome()%></td>
                                        </tr>
                                        <tr>
                                            <th>CPF:</th>
                                            <td><%=aluno.getCpf()%></td>
                                        </tr> 
                                        <tr>
                                            <th>RG</th>
                                            <td><%=aluno.getRg()%></td>
                                        </tr>
                                        <tr>    
                                            <th>UF de Expedição</th>
                                            <td><%=aluno.getUfExpedicao().getNome()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Sexo</th>
                                            <td><%=aluno.getSexo()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Data Nascimento</th>
                                            <td><%=dataFormat.formatarData(aluno.getDtn())%></td>
                                        </tr>
                                        <tr>    
                                            <th>Telefone</th>
                                            <td><%=aluno.getTelefone()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Email</th>
                                            <td><%=aluno.getEmail()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Lougradouro</th>
                                            <td><%=aluno.getEndereco().getLogradouro()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Complemento</th>
                                            <td><%=aluno.getEndereco().getComplemento()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Numero</th>
                                            <td><%=aluno.getEndereco().getNumero()%></td>
                                        </tr>
                                        <tr>
                                            <th>Bairro</th>
                                            <td><%=aluno.getEndereco().getBairro()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Cidade</th>
                                            <td><%=aluno.getEndereco().getCidade().getNome()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Estado</th>
                                            <td><%=aluno.getEndereco().getCidade().getUf().getNome()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Matricula</th>
                                            <td><%=aluno.getMatricula()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Curso</th>
                                            <td><%=aluno.getCurso()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Periodo </th>
                                            <td><%=aluno.getPeriodo()%></td>
                                        </tr>
                                        <tr>    
                                            <th>Já reprovou em</th>
                                            <td><%=aluno.getDisciplina()%></td>
                                        </tr>
                                    </table>

                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>