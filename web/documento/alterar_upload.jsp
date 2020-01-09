<%-- 
    Document   : cadastrarPessoa
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

<%@page import="java.io.File"%>
<%@page import="modelo.Edital"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Envio de Documentos</title>        
        <link href="/pnaes/css/main.css?version=4.4.0" rel="stylesheet">
       <%@include file="../imports.jsp" %>
        <script>
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            function uploadFile() {
                var target = document.querySelector("img");
                var file = document.querySelector("input[type=file]").files[0];
                var reader = new FileReader();
                reader.onloadend = function () {
                    target.src = reader.result;
                    /* upload com ajax
                     $.ajax({
                     method: "POST", url: "ServletAluno",data: {fileUpload: reader.result}
                     }).done(function(response){
                     alert("Sucesso: "+response);
                     
                     }).fail(function(xhr, status, errorThrown){
                     alert("Error: "+xhr.responseText);
                     });
                     fim do ajax */
                };
                if (file) {
                    reader.readAsDataURL(file);

                } else {
                    file.src = "";
                }
            }
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)

                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }

            }
            
            function verificaUrl(url) {
                var http = new XMLHttpRequest();
                http.open('HEAD', url, false);
                http.send();
                return http.status !== 404;
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
                <!-- Basic form layout section start -->
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
                                    <%
                                       
                                        
                                        
                                        /*String caminhoAtual = new File("").getAbsolutePath();
                                        String novoArquivo = caminhoAtual + File.separator  + "arquivo.txt";
                                         new File(novoArquivo).createNewFile();*/
                                       // DaoFactory daoFactory = new DaoFactory();
                                        int tam = daoFactory.getEditalDao().listar().size();
                                       // Edital edital = new Edital();
                                        if (tam > 0) {
                                            edital = daoFactory.getEditalDao().listar().get(tam - 1);
                                        }
                                    %>
                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <%  
                                                        msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
                                                        if (msg.isEmpty() == false) {

                                                    %>

                                                    <div class="row align-items-center">
                                                        <div class="col-md-12">
                                                            <div class="alert alert-danger" role="alert">
                                                                <strong><%=msg%></strong>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <%
                            }%>
                                    <form action="../ServletUpload?aluno_id=<%=aluno.getId()%>&cpf=<%=session.getAttribute("cpf")%>&nedital=<%=edital.getNumero()%>&alterar=1" method="post" class="form form-horizontal" enctype="multipart/form-data">
                                        <!-- Modal documentosAluno -->
                                        <div class="modal fade" id="documentosAluno" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 class="modal-title" id="myModalLabel">Documentos do Aluno</h4> 
                                              </div>
                                              <div class="modal-body">
                                                <div style="text-align: center;">
                                        <iframe src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/da.pdf" 
                                        style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                                                
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        
                                        <!-- Modal documentosDependentes -->
                                        <div class="modal fade" id="documentosDependentes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 class="modal-title" id="myModalLabel">Documentos dos Dependentes</h4> 
                                              </div>
                                              <div class="modal-body">
                                                <div style="text-align: center;">
                                        <iframe src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/dp.pdf" 
                                        style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                                                
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        
                                        <!-- Modal documentosRenda -->
                                        <div class="modal fade" id="documentosRenda" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 class="modal-title" id="myModalLabel">Documentos que Comprovam a Renda</h4> 
                                              </div>
                                              <div class="modal-body">
                                                <div style="text-align: center;">
                                        <iframe src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/dr.pdf" 
                                        style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                                                
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        
                                        <!-- Modal documentosDespesas -->
                                        <div class="modal fade" id="documentosDespesas" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 class="modal-title" id="myModalLabel">Documentos que Comprovam as Despesas</h4> 
                                              </div>
                                              <div class="modal-body">
                                                <div style="text-align: center;">
                                        <iframe src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/dp.pdf" 
                                        style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                                                
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        
                                        <!-- Modal documentosOutros -->
                                        <div class="modal fade" id="documentosOutros" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                          <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                <h4 class="modal-title" id="myModalLabel">Outros Documentos</h4> 
                                              </div>
                                              <div class="modal-body">
                                                <div style="text-align: center;">
                                        <iframe src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/od.pdf" 
                                        style="width:500px; height:500px;" frameborder="0"></iframe>
                                        </div>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Sair</button>
                                                
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                       
                                        
                                       <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Envio de Documentos</h4>
                                            <div class="form-group row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-3">
                                                    <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg" width="150" height="200" class="img_aluno">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="foto">Alterar Foto:</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="target"></label>
                                                    <input type="file" name="foto" required id="target" class="custom-file-input" onchange="uploadFile();">
                                                    
                                                </div>
                                            </div>
                                          <div class="form-group row">
                                                <label class="col-md-3 label-control" for="da">Alterar Documentos do Aluno:
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosAluno">Visualizar Documentos do Aluno</button>
                                               </label>
                                                <div class="col-md-9">
                                                    
                                                    <label class="col-md-6 custom-file-label" for="da"></label>
                                                    <input type="file" name="da" required id="da" class="custom-file-input">
                                                    
                                                </div>
                                            </div>
                                            <%if(dependentes.size() > 0){%>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dp">Alterar Documentos dos Dependentes:
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosDependentes">Visualizar Documentos dos Dependentes</button>
                                                </label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dp"></label>
                                                    <input type="file" name="dp" id="dp" class="custom-file-input">                                                  
                                                </div>
                                            </div>
                                            <%}%>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dr">Alterar Documentos que Comprovam a Renda:
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosRenda">Visualizar Documentos que Comprovam a Renda</button>
                                                </label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dr"></label>
                                                    <input type="file" name="dr" required id="dr" class="custom-file-input">                                                  
                                                </div>
                                            </div>   
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dd">Alterar Documentos que Comprovam as Despesas:
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosDespesas">Visualizar Documentos que Comprovam as Despesas</button>
                                                </label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dd"></label>
                                                    <input type="file" name="dd required" id="dd" class="custom-file-input">                                                  
                                                </div>
                                            </div>  
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="od">Alterar Outros Documentos:
                                                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#documentosOutros">Visualizar Outros Documentos</button>
                                                </label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="od"></label>
                                                    <input type="file" name="od" id="od" class="custom-file-input">                                                  
                                                </div>
                                            </div>   
                                            <div class="form-group row">
                                                
                                          
                                                <div class="col-md-9">  
                                                    <p>
                                                        <input type="checkbox" name="aceito" id="cbaceito" value="aceito" required>
                                                    
                                                        Declaro que as informações prestadas no formulário online são verdadeiras e de minha inteira
                                                        responsabilidade. Declarações falsas e/ou omissões implicam no cancelamento da inscrição ou
                                                        perda automática do benefício concedido.
                                                    </p>                                                  
                                                </div>
                                            </div>   
                                            <div class="form-actions">
                                               
                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger" type="button" >Voltar</button></a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary" name="cadastrar" value="Cadastrar">
                                                    <i class="la la-check-square-o"></i> Salvar
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
        </div>                            
    </body>
</html>