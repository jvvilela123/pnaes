<%@page import="modelo.Curso"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.Aluno"%>
<%@page import="util.DataFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Aluno</title>
        <%@include file="../imports.jsp" %>
        

    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <div class="content-header-right col-md-6 col-12" >
                            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">

                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="card-bootstrap.html">Cards</a>
                                    <a class="dropdown-item" href="component-buttons-extended.html">Buttons</a>
                                </div>
                            </div>
                        </div>
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
                                                        Alteração de Permissão
                                                    </div>
                                                    <center><h1>Alterar Permissão do Usuário</h1></center>
                                                        <%                                                            
                                                            Integer id = Integer.parseInt(request.getParameter("id"));
                                                            aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(id);
                                                        %>
                                                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletAluno?opcao=alterar_permissao&id=<%=aluno.getId()%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nivel">Permissão</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if (aluno.getNivel().equals(1)) {
                                                                                    out.println("<input checked type='radio' name='nivel' value='1' class='custom-control-input' id='nivela'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='nivel' value='1' class='custom-control-input' id='nivela'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nivela">Aluno</label>
                                                                        </div>
                                                                       
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getNivel().equals(3)) {
                                                                                    out.println("<input checked type='radio' name='nivel' value='3' class='custom-control-input' id='nivelad'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='nivel' value='3' class='custom-control-input' id='nivelad'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nivelad">Adminstrador</label>
                                                                        </div>    
                                                                    </div>
                                                                </div>
                                                            </div>    
                                                                                                                                
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/usuario/listar.jsp"><button  class="btn btn-primary" type="button" >Voltar</button></a>&nbsp;
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                    <i class="fa fa-check-square-o"></i>Alterar Permissão
                                                                </button>
                                                            </div>
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
