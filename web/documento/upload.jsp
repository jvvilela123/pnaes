<%-- 
    Document   : cadastrarPessoa
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

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
          uploadFile();
            });
            function uploadFile() {
                var foto = document.getElementById('target');
                var pdf = document.getElementById('da');
                var pdf1 = document.getElementById('dp');
                var pdf2 = document.getElementById('dr');
                var pdf3 = document.getElementById('dd');
                var pdf4 = document.getElementById('od');
                var tamanhoMaximo = 5000000; //5Mb

                   foto.onchange = function(e) {
                      var ext = this.value.match(/\.([^\.]+)$/)[1];
                      switch (ext) {
                        case 'jpg':
                        case 'png':
                        case 'jpeg':
                        break;
                        default:
                         alertify.errorAlert("<h6 class='card-title'>Selecione somente arquivo com a extenção (png, jpg ou jpeg)!</h6>");
                          this.value = '';
                      }
                      if(this.files[0].size > tamanhoMaximo ) { //5MB         
                        alertify.errorAlert("<h6 class='card-title'>Tamanho MÁXIMO de cada arquivo é de 5MB!</h6>");; //Acima do limite
                        this.value = ""; //Limpa o campo 
                      };
                    };
                    
                    pdf.onchange = function(e) {
                    
                      var ext = this.value.match(/\.([^\.]+)$/)[1];
                      switch (ext) {
                        case 'pdf':
                       break;
                        default:
                         alertify.errorAlert("<h6 class='card-title'>Selecione somente arquivo com a extenção (pdf)!</h6>");
                          this.value = '';
                      }
                      if(this.files[0].size > tamanhoMaximo ) { //5MB         
                        alertify.errorAlert("<h6 class='card-title'>Tamanho MÁXIMO de cada arquivo é de 5MB!</h6>");; //Acima do limite
                        this.value = ""; //Limpa o campo 
                      };
                      };
                    pdf1.onchange = function(e) {
                      var ext = this.value.match(/\.([^\.]+)$/)[1];
                      switch (ext) {
                        case 'pdf':
                       break;
                        default:
                         alertify.errorAlert("<h6 class='card-title'>Selecione somente arquivo com a extenção (pdf)!</h6>");
                          this.value = '';
                      }
                      if(this.files[0].size > tamanhoMaximo ) { //5MB         
                        alertify.errorAlert("<h6 class='card-title'>Tamanho MÁXIMO de cada arquivo é de 5MB!</h6>");; //Acima do limite
                        this.value = ""; //Limpa o campo 
                      };
                    };
                    pdf2.onchange = function(e) {
                      var ext = this.value.match(/\.([^\.]+)$/)[1];
                      switch (ext) {
                        case 'pdf':
                       break;
                        default:
                         alertify.errorAlert("<h6 class='card-title'>Selecione somente arquivo com a extenção (pdf)!</h6>");
                          this.value = '';
                      }
                      if(this.files[0].size > tamanhoMaximo ) { //5MB         
                        alertify.errorAlert("<h6 class='card-title'>Tamanho MÁXIMO de cada arquivo é de 5MB!</h6>");; //Acima do limite
                        this.value = ""; //Limpa o campo 
                      };
                    };
                    pdf3.onchange = function(e) {
                      var ext = this.value.match(/\.([^\.]+)$/)[1];
                      switch (ext) {
                        case 'pdf':
                       break;
                        default:
                         alertify.errorAlert("<h6 class='card-title'>Selecione somente arquivo com a extenção (pdf)!</h6>");
                          this.value = '';
                      }
                      if(this.files[0].size > tamanhoMaximo ) { //5MB         
                        alertify.errorAlert("<h6 class='card-title'>Tamanho MÁXIMO de cada arquivo é de 5MB!</h6>");; //Acima do limite
                        this.value = ""; //Limpa o campo 
                      };
                    };
                    pdf4.onchange = function(e) {
                      var ext = this.value.match(/\.([^\.]+)$/)[1];
                      switch (ext) {
                        case 'pdf':
                       break;
                        default:
                         alertify.errorAlert("<h6 class='card-title'>Selecione somente arquivo com a extenção (pdf)!</h6>");
                          this.value = '';
                      }
                      if(this.files[0].size > tamanhoMaximo ) { //5MB         
                        alertify.errorAlert("<h6 class='card-title'>Tamanho MÁXIMO de cada arquivo é de 5MB!</h6>");; //Acima do limite
                        this.value = ""; //Limpa o campo 
                      };
                    };
                /*
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
                     fim do ajax 
                };
                if (file) {
                    reader.readAsDataURL(file);

                } else {
                    file.src = "";
                }
                 */       
            }
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)

                if (texto.substring(0, 1) !== saida) {
                    documento.value += texto.substring(0, 1);
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
                <!-- Basic form layout section start -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                            <h4 class="card-title" id="striped-row-layout-icons">Envio dos Documentos</h4>
                            <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                            <div class="heading-elements">
                            </div>
                         </div>
                            <div class="card-content collpase show">
                                <div class="card-body">
                                    <%
                                       
                                       
                                       // DaoFactory daoFactory = new DaoFactory();
                                        int tam = daoFactory.getEditalDao().listar().size();
                                       // Edital edital = new Edital();
                                        if (tam > 0) {
                                            edital = daoFactory.getEditalDao().listar().get(tam - 1);
                                        }
                                    %>
                                    <div class="card-text">
                                                      Preencha corretamente todos os campos *Obrigatórios
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
                            <form action="../ServletUpload?aluno_id=<%=aluno.getId()%>&cpf=<%=session.getAttribute("cpf")%>&nedital=<%=edital.getNumero()%>" method="post" class="form form-horizontal" enctype="multipart/form-data" >
                                        <div class="form-body">
                                          
                                            <div class="form-group row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-3">
                                                    <!--<img src="" width="150" height="200">-->
                                                </div>
                                            </div>
                                         
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="foto">Foto* (png, jpg ou jpeg):</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="target"></label>
                                                    <input type="file" name="foto" required id="target" accept=".png,.jpg, .jpeg" class="custom-file-input " title="Foto">                                    
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="da">Documentos do Aluno* (pdf):</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="da"></label>
                                                    <input type="file" name="da" required id="da" class="custom-file-input" accept=".pdf" >                                                  
                                                </div>
                                            </div>
                                            <%if(dependentes.size() > 0){%>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dp">Documentos dos Membros Familiares* (pdf):</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dp"></label>
                                                    <input type="file" name="dp" id="dp" required class="custom-file-input" accept=".pdf">                                                  
                                                </div>
                                            </div>
                                             <%}%>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dr">Documentos que Comprovam a Renda* (pdf):</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dr"></label>
                                                    <input type="file" name="dr" required id="dr" class="custom-file-input" accept=".pdf" placeholder="Upload versão L">                                                  
                                                </div>
                                            </div>   
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dd">Documentos que Comprovam as Despesas* (pdf):</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dd"></label>
                                                    <input type="file" name="dd" required id="dd" class="custom-file-input" accept=".pdf">                                                  
                                                </div>
                                            </div>  
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="od">Outros Documentos (pdf):</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="od"></label>
                                                    <input type="file" name="od" id="od" class="custom-file-input" accept=".pdf">                                                  
                                                </div>
                                            </div>   
                                            <div class="form-group row">
                                                
                                          
                                                <div class="col-md-9">  
                                                    <p align="justify">
                                                        <input type="checkbox" name="aceito" id="cbaceito" value="aceito" required>
                                                    
                                                        Declaro que as informações prestadas no formulário online são verdadeiras e de minha inteira
                                                        responsabilidade. 
                                                        Declarações falsas e/ou omissões implicam no cancelamento da inscrição ou
                                                        perda automática do benefício concedido.
                                                    </p>                                                  
                                                </div>
                                            </div>   
                                            <div class="form-actions">
                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                 <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                <button type="submit" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar">
                                                    <i class="la la-check-square-o"></i> Enviar
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