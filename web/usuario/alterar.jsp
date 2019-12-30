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
        <script>
            function enviarForm(){
                usuario = document.getElementById('nome').value;
               if(document.getElementById('nivelad').checked){
                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ALERTA!</h5>', '<h6>Alterar Permissão de '+usuario+' para <u>Administrador</u>?</h6>', 
                function(){ 
                 document.getElementById("formUsuario").submit(); }
                , function(){ alertify.error('Permisão NÃO Foi Alterada!');});
               }else if(document.getElementById('nivelcord').checked){
                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ALERTA!</h5>', '<h6>Alterar Permissão de '+usuario+' para <u>Coordenador</u>?</h6>', 
                function(){ 
                 document.getElementById("formUsuario").submit(); }
                , function(){ alertify.error('Permisão NÃO Foi Alterada!');});
            }else{
                   document.getElementById("formUsuario").submit();
                   
               }
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
                                                    <form  class="form form-horizontal striped-rows form-bordered" id="formUsuario" method="Post" action="../ServletAluno?opcao=alterar_permissao&id=<%=aluno.getId()%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="usuario">Usuário:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="usuario" id="nome" class="form-control" value="<%=aluno.getNome()%>" disabled>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nivel">Permissão:</label>
                                                                <div class="col-md-9">
                                                                    
                                                                    
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getNivel().equals(3)) {
                                                                                    out.println("<input checked type='radio' name='nivel' value='3' class='custom-control-input' id='nivelad'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='nivel' value='3' class='custom-control-input' id='nivelad'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nivelad">Adminstrador&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                            
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if (aluno.getNivel().equals(2)) {
                                                                                    out.println("<input checked type='radio' name='nivel' value='2' class='custom-control-input' id='nivelcord'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='nivel' value='2' class='custom-control-input' id='nivelcord'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nivelcord">Coordenador(a)&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           
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
                                                                       
                                                                           
                                                                    </div>
                                                                </div>
                                                            </div>    
                                                                                                                                
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/usuario/listar.jsp"><button  class="btn btn-danger" type="button" >Voltar</button></a>&nbsp;
                                                                <button type="button" class="btn btn-primary" name="cadastrar" value="Cadastrar" onclick="enviarForm()">
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
