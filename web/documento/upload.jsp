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
        <title> Upload</title>        
        <link href="/pnaes/css/main.css?version=4.4.0" rel="stylesheet">

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


        </script>

    </head>
    <body>
        <div class="element-box">
            <h5 class="form-header">Enviar Documentos</h5>
            <div class="form-desc">
                Discharge best employed your phase each the of shine. Be met even reason consider logbook redesigns. Never a turned interfaces among asking
            </div>
            <div style="width: 80%" >
                <!-- Basic form layout section start -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements"></div>
                            </div>
                            <div class="card-content collpase show">
                                <div class="card-body">
                                    <%
                                        DaoFactory daoFactory = new DaoFactory();
                                        int tam = daoFactory.getEditalDao().listar().size();
                                        Edital edital = new Edital();
                                        if (tam > 0) {
                                            edital = daoFactory.getEditalDao().listar().get(tam - 1);
                                        }
                                    %>
                                    <form action="../ServletUpload?cpf=<%=session.getAttribute("cpf")%>&nedital=<%=edital.getNumero()%>" method="post" class="form form-horizontal" enctype="multipart/form-data">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Documentos</h4>
                                            <div class="form-group row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-3">
                                                    <img src="" width="150" height="200">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="foto">* Foto</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="target"></label>
                                                    <input type="file" name="foto" required id="target" class="custom-file-input" onchange="uploadFile();">                                    
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="da">* Documentos do Aluno</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="da"></label>
                                                    <input type="file" name="da" required id="da" class="custom-file-input">                                                  
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dp">Documentos dos Dependentes</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dp"></label>
                                                    <input type="file" name="dp" id="dp" class="custom-file-input">                                                  
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dr">* Documentos que Comprovam a Renda</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dr"></label>
                                                    <input type="file" name="dr" required id="dr" class="custom-file-input">                                                  
                                                </div>
                                            </div>   
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dd">* Documentos que Comprovam as Despesas</label>
                                                <div class="col-md-9">                                                    
                                                    <label class="col-md-6 custom-file-label" for="dd"></label>
                                                    <input type="file" name="dd required" id="dd" class="custom-file-input">                                                  
                                                </div>
                                            </div>  
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="od">Outros Documentos</label>
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
                                                <button type="submit" class="btn btn-primary" name="cadastrar" value="Cadastrar">
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