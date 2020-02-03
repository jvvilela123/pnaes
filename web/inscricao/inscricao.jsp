<%-- 
    Document   : inscricao
    Created on : 05/03/2018, 20:32:36
    Author     : euzebio
--%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro da Inscrição</title>
        <%@include file="../imports.jsp" %>
        <script>
            function inscrever() {
                if(document.getElementById('bolsa1').value === ""){
                document.getElementById('bolsa1').focus();
                alertify.errorAlert("<h6 class='card-title'>Selecione a 1ª opção de Auxílio</h6>");
               }else if(document.getElementById('bolsa2').value === ""){
                document.getElementById('bolsa2').focus();
                alertify.errorAlert("<h6 class='card-title'>Selecione a 2ª opção de Auxílio</h6>");
               } else if(document.getElementById('justificativa').value === ""){
                document.getElementById('justificativa').focus();
                alertify.errorAlert("<h6 class='card-title'>Justifique por que você necessita dos auxílios</h6>");
               }else{
                
                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ATENÇÃO!</h5>', 'Após a confirmação não será possível alterar os dados cadastrados, deseja continuar?</h5>', 
                function(){ 
                    //var url = "../ServletDependente?opcao=excluir&id=" + id;
                   //window.location = url; 
                   document.getElementById("formInscricao").submit();
                }
                , function(){ alertify.error('Inscrição Não Efetuada');}).set('labels', {ok:'Confirmar Inscrição', cancel:'Cancelar'});;
                
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
                          <script>
                                   $(document).ready(function () {
                                $('#bolsa1').change(function () {
                                   // $('#divperiodo')[0].style.display="block";
                                    $('#bolsa2').load('/pnaes/bolsasajax.jsp?bolsa=' + $('#bolsa1').val()+'&edital=<%=edital.getId()%>');
                                });

                            });
                        </script>
                            </div>
                        </div>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Dados da Inscrição</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Preencha as opções de Auxílios
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" id="formInscricao" method="POST" action="../ServletInscricao?opcao=inscricao&aluno_id=<%=session.getAttribute("aluno_id")%>&edital_id=<%=edital.getId()%>">
                                                        <div class="form-body">
                              
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="bolsa1">1ª opção de Auxílio*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="bolsa1" name="bolsa1" class="form-control" required>
                                                                        <option value="">Selecione a 1ª Opção de Auxílio</option>
                                                                        <%
                                                                            List<Bolsa> bolsas = edital.getBolsas();
                                                                            for (Bolsa b : bolsas) {
                                                                                out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="bolsa2">2ª opção de Auxílio*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="bolsa2" name="bolsa2" class="form-control" required>
                                                                       <option selected="" disabled="" value="">Selecione a 1ª Opção de Auxílio ↑</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                                    <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="nome">Justifique por que você necessita dos auxílios*:</label>
                                                                    <div class="col-md-9">
                                                                        <textarea  class="form-control" rows="4" name="justificativa" required id="justificativa" placeholder="Escreva aqui a sua Justificativa"></textarea>
                                                                    </div>
                                                                </div>
                                                            <div class="form-actions right">
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="button" value="Cadastrar" class="btn btn-primary os-icon os-icon-save" onclick="inscrever()">
                                                                    <i class="fa fa-check-square-o"></i> Efetuar Inscrição
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