<%-- 
    Document   : index
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema PNAES</title>

       
        <%@include file="imports.jsp" %>
        <script>
            $(function(){
                //Não Permite digitar letras
                  $('#login').keyup(function() {
                       $(this).val(this.value.replace(/\D/g, ''));
                    });
                });
                // Check javascript has loaded
$(document).ready(function(){
 
  // Click event of the showPassword button
  $('#showPassword').on('click', function(){
     
    // Get the password field
    var passwordField = $('#senha');
 
    // Get the current type of the password field will be password or text
    var passwordFieldType = passwordField.attr('type');
 
    // Check to see if the type is a password field
    if(passwordFieldType === 'password')
    {
        // Change the password field to text
        passwordField.attr('type', 'text');
 
        // Change the Text on the show password button to Hide
        $(this).removeClass("os-icon-eye").addClass("os-icon-eye-off");
        $("#showPassword span").text(" Ocultar Senha");
    } else {
        // If the password field type is not a password field then set it to password
        passwordField.attr('type', 'password');
 
        // Change the value of the show password button to Show
        $("#showPassword span").text(" Mostrar Senha");
        $(this).removeClass("os-icon-eye-off").addClass("os-icon-eye");
        
    }
  });
});
        </script>
    </head>
    <body class="auth-wrapper">
    <center>
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div class="all-wrapper with-side-panel solid-bg-all">
                <div class="row">
                    <div class="content-w">
                        <%
                if(request.getParameter("sair")!= null && !request.getParameter("sair").equals('1')){
                session.setAttribute("sair", '1');    
                } %>
                       <%@include file="cabecalho_login.jsp" %>
                        <%                            session.invalidate();
                        %>
                        

                        <div class="element-box">
                            <h4 class="form-header">Sistema PNAES</h4>
                            <div class="form-desc" align="justify">
                                O Programa Nacional de Assistência Estudantil – PNAES no Instituto Federal de Educação, Ciência e Tecnologia (IFTO) 
                                consiste no conjunto de ações voltadas ao atendimento ao estudante regularmente matriculado no curso presencial, visando o acesso, a permanência e o 
                                êxito na perspectiva de inclusão social, produção de conhecimento, melhoria do desempenho escolar e qualidade de vida. Destina-se, prioritariamente,
                                aos estudantes oriundos de escola pública, em situação de vulnerabilidade social e econômica, com renda per capita de até um salário mínimo e meio, 
                                que se enquadram nos critérios definidos em Edital, em conformidade com o Regulamento PNAES do IFTO e o Decreto 7234/2010.            
                            </div>            
                            <div style="width: 80%" >
                                <div class="card">
                                    <div class="card-header">
                                        <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                        <div class="heading-elements"></div>
                                    </div>
                                    <div class="card-content collpase show">
                                        <div class="card-body">
                                            <h5 class="auth-header">Entre com o Usuario e Senha do SIGA</h5>
                                            <%
                                                if (request.getParameter("msg") != null) {
                                            %>
                                            <center>
                                                <div class="alert alert-danger" role="alert">
                                                    <strong><%=request.getParameter("msg")%></strong>
                                                </div>
                                            </center>
                                            <%
                                                }
                                            %>
                                            <form method="POST" action="ServletLogin">
                                                <div class="form-body">
                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="login">Usuário</label>
                                                        <div class="col-md-6">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="login" id="login" class="form-control" placeholder="Usuário (mesmo do SIGA)" maxlength="11" required>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-md-3 label-control" for="senha">Senha</label>
                                                        <div class="col-md-6">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="password" name="senha" id="senha" class="form-control" placeholder="Senha (mesma do SIGA)" required>
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <button type="button" id="showPassword" title="teste" class="btn btn-warning btn-sm os-icon os-icon os-icon-eye" /><span> Mostrar Senha</span></button>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="buttons-w">
                                                        <button type="submit" value="Entrar" class="btn btn-primary btn-lg os-icon os-icon-log-in"> Entrar</button>
                                                    </div>
                                                    <!--Não é cadastrado <a href="/pnaes/pessoa/cadastrar.jsp">Cadastre-se</a>-->
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
        <div class="col-md-3"></div>
    </center>
</body>
</html>