<%-- 
    Document   : cadastrarPessoa
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
        <title>Cadastro de Ficha Medica</title>
        <%@include file="../imports.jsp" %>
        <script>
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)

                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }

            }
            
            function naoTemDoenca() {
                document.getElementById('div_doenca').style.display = 'none';
                document.getElementById('div_outra_doenca').style.display = 'none';
                document.getElementById('hipertencao').checked = false;
                document.getElementById('diabetes').checked = false;
                document.getElementById('epilepsia').checked = false;
                document.getElementById('asma').checked = false;
                document.getElementById('hepatiteb').checked = false;
                document.getElementById('osteoporose').checked = false;
                document.getElementById('enxaqueca').checked = false;
                document.getElementById('dependenciaQuimica').checked = false;
                document.getElementById('doencaMental').checked = false;
                document.getElementById('outros').checked = false;
                document.getElementById('outrosqual').value="";
                //$('input[name ="tipoDoenca"]').checked = false;
               // $("input[name=tipoDoenca]").checked = false;
             }
            function temDoenca() {
                document.getElementById('div_doenca').style.display = 'block';
                document.getElementById('div_outra_doenca').style.display = 'none';
                document.getElementById('hipertencao').checked = false;
                document.getElementById('diabetes').checked = false;
                document.getElementById('epilepsia').checked = false;
                document.getElementById('asma').checked = false;
                document.getElementById('hepatiteb').checked = false;
                document.getElementById('osteoporose').checked = false;
                document.getElementById('enxaqueca').checked = false;
                document.getElementById('dependenciaQuimica').checked = false;
                document.getElementById('doencaMental').checked = false;
                document.getElementById('outros').checked = false;
                document.getElementById('outrosqual').value="";
            }
            function temOutraDoenca() {
                document.getElementById('div_outra_doenca').style.display = 'block';
            }
            function naoTemOutraDoenca() {
                document.getElementById('div_outra_doenca').style.display = 'none';
            }
            function temDoencaFamilia() {
                document.getElementById('div_doenca_familia').style.display = 'block';
                document.getElementById('hipertencaofamilia').checked = false;
                document.getElementById('diabetesfamilia').checked = false;
                document.getElementById('epilepsiafamilia').checked = false;
                document.getElementById('asmafamilia').checked = false;
                document.getElementById('hepatitebfamilia').checked = false;
                document.getElementById('osteoporosefamilia').checked = false;
                document.getElementById('enxaquecafamilia').checked = false;
                document.getElementById('dependenciaQuimicafamilia').checked = false;
                document.getElementById('doencaMentalfamilia').checked = false;
                document.getElementById('outrosfamilia').checked = false;
                document.getElementById('outrosqualfamilia').value="";
            }
            
            function naoTemDoencaFamilia() {
                document.getElementById('div_doenca_familia').style.display = 'none';
                document.getElementById('div_outra_doenca_familia').style.display = 'none';
                document.getElementById('hipertencaofamilia').checked = false;
                document.getElementById('diabetesfamilia').checked = false;
                document.getElementById('epilepsiafamilia').checked = false;
                document.getElementById('asmafamilia').checked = false;
                document.getElementById('hepatitebfamilia').checked = false;
                document.getElementById('osteoporosefamilia').checked = false;
                document.getElementById('enxaquecafamilia').checked = false;
                document.getElementById('dependenciaQuimicafamilia').checked = false;
                document.getElementById('doencaMentalfamilia').checked = false;
                document.getElementById('outrosfamilia').checked = false;
                document.getElementById('outrosqualfamilia').value="";
            }
            function temOutraDoencaFamilia() {
                document.getElementById('div_outra_doenca_familia').style.display = 'block';
            }
            function naoTemOutraDoencaFamilia() {
                document.getElementById('div_outra_doenca_familia').style.display = 'none';
            }
            function temMedicamento() {
                document.getElementById('div_medicamento').style.display = 'block';
            }
            function naoTemMedicamento() {
                document.getElementById('div_medicamento').style.display = 'none';
                document.getElementById('qualM').value="";
            }
            function temMedicamentoFamilia() {
                document.getElementById('div_medicamento_familia').style.display = 'block';
            }
            function naoTemMedicamentoFamilia() {
                document.getElementById('div_medicamento_familia').style.display = 'none';
                document.getElementById('qualMd').value="";
            }
            function temDeficiencia() {
                document.getElementById('div_deficiencia').style.display = 'block';
                document.getElementById('auditiva').checked = false;
                document.getElementById('fisica').checked = false;
                document.getElementById('visual').checked = false;
                document.getElementById('mental').checked = false;
                document.getElementById('multiplas').checked = false;
            }
            function naoTemDeficiencia() {
               document.getElementById('div_deficiencia').style.display = 'none';
               document.getElementById('auditiva').checked = false;
               document.getElementById('fisica').checked = false;
               document.getElementById('visual').checked = false;
               document.getElementById('mental').checked = false;
               document.getElementById('multiplas').checked = false;
            }
            function temDeficienciaFamilia() {
                document.getElementById('div_deficiencia_familia').style.display = 'block';
                document.getElementById('auditiva_familia').checked = false;
                document.getElementById('fisica_familia').checked = false;
                document.getElementById('visual_familia').checked = false;
                document.getElementById('mental_familia').checked = false;
                document.getElementById('multiplas_familia').checked = false;
            }
            function naoTemDeficienciaFamilia() {
               document.getElementById('div_deficiencia_familia').style.display = 'none';
               document.getElementById('auditiva_familia').checked = false;
               document.getElementById('fisica_familia').checked = false;
               document.getElementById('visual_familia').checked = false;
               document.getElementById('mental_familia').checked = false;
               document.getElementById('multiplas_familia').checked = false;
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
                                                        Texto info
                                                    </div>
                                    <form method="Post" action="../ServletFichaMedica?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>" class="form form-horizontal">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                                             <div class="form-group row">
                                                <label class="col-md-3 label-control" for="doencaCronica">Você tem alguma doença crônica?:</label>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="doencaCronica1" id="doencaCronica1nao" value="Não" class="custom-control-input" onclick="naoTemDoenca();">
                                                                <label class="custom-control-label" for="doencaCronica1nao">Não</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="doencaCronica1" id="doencaCronica1sim" value="Sim" class="custom-control-input" onclick="temDoenca();">
                                                                <label class="custom-control-label" for="doencaCronica1sim">Sim</label>
                                                            </div> 
                                                        </div>
                                                     </div>
                                                </div>
                                            </div>
                                            <div id="div_doenca" class="hide">
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="tipoDoenca">Qual doença crônica?:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="hipertencao" value="Hipertenção" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="hipertencao">Hipertensão Arterial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="diabetes" value="Diabetes" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="diabetes">Diabetes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="epilepsia" value="Epilepsia" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="epilepsia">Epilepsia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="asma" value="Asma" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="asma">Asma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="hepatiteb" value="Hepatite B" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="hepatiteb">Hepatite B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="osteoporose" value="Osteoporose" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="osteoporose">Osteoporose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="enxaqueca" value="Enxaqueca" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="enxaqueca">Enxaqueca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="dependenciaQuimica" value="Dependencia Quimica" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="dependenciaQuimica">Dependência Quimica&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="doencaMental" value="Doença Mental" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                            <label class="custom-control-label" for="doencaMental">Doenca Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="outros" value="Outros" class="custom-control-input" onclick="temOutraDoenca();">
                                                            <label class="custom-control-label" for="outros">Outros</label>
                                                        </div>
                                                        <div id="div_outra_doenca" class="hide">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="tipoDoencaqual" id="outrosqual" class="form-control" placeholder="Qual Doença?">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                          <div class="form-group row">
                                                <label class="col-md-3 label-control" for="doencaCronica">Há alguem com doença cronica na família?:</label>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="doencaCronicafamilia" id="doencaCronicafamilianao" value="Não" class="custom-control-input" onclick="naoTemDoencaFamilia();">
                                                                <label class="custom-control-label" for="doencaCronicafamilianao">Não</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="doencaCronicafamilia" id="doencaCronicafamiliasim" value="Sim" class="custom-control-input" onclick="temDoencaFamilia();">
                                                                <label class="custom-control-label" for="doencaCronicafamiliasim">Sim</label>
                                                            </div>
                                                            </div>
                                                        </div>
                                                </div>
                                            </div>
                                         <div id="div_doenca_familia" class="hide">
                                                <div class="form-group row">
                                                <label class="col-md-3 label-control" for="tipoDoencafamilia">Qual doença crônica na família?:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                       <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="hipertencaofamilia" value="Hipertenção" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="hipertencaofamilia">Hipertensão Arterial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="diabetesfamilia" value="Diabetes" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="diabetesfamilia">Diabetes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="epilepsiafamilia" value="Epilepsia" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="epilepsiafamilia">Epilepsia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="asmafamilia" value="Asma" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="asmafamilia">Asma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="hepatitebfamilia" value="Hepatite B" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="hepatitebfamilia">Hepatite B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="osteoporosefamilia" value="Osteoporose" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="osteoporosefamilia">Osteoporose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="enxaquecafamilia" value="Enxaqueca" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="enxaquecafamilia">Enxaqueca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="dependenciaQuimicafamilia" value="Dependencia Quimica" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="dependenciaQuimicafamilia">Dependência Quimica&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="doencaMentalfamilia" value="Doença Mental" class="custom-control-input" onclick="naoTemOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="doencaMentalfamilia">Doenca Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoencafamilia" id="outrosfamilia" value="Outros" class="custom-control-input" onclick="temOutraDoencaFamilia();">
                                                            <label class="custom-control-label" for="outrosfamilia">Outros</label>
                                                        </div>
                                                         <div id="div_outra_doenca_familia" class="hide">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="tipoDoencafamiliaqual" id="outrosqualfamilia" class="form-control" placeholder="Qual Doença?">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                         </div>
                                                        </div>
                                                    </div>
                                                </div>
                                         </div>
                                            

                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="medicamento">Você faz uso de medicamento controlado?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamento" id="naom" value="Não" class="custom-control-input" onclick="naoTemMedicamento();">
                                                                <label class="custom-control-label" for="naom">Não</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamento" id="simm" value="Sim" class="custom-control-input" onclick="temMedicamento();">
                                                                <label class="custom-control-label" for="simm">Sim</label>
                                                            </div>
                                                           </div>
                                                        <div id="div_medicamento" class="hide col-md-9">
                                                        <div class="col-md-9">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualMedicamento" id="qualM" class="form-control" placeholder="Qual Medicamento?">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                       </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="form-group row">
                                                <label class="col-md-3 label-control" for="medicamento">Há alguem que faz uso de medicamento controlado na família?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="col-md-2">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamentoDep" id="naomd" value="Não" class="custom-control-input" onclick="naoTemMedicamentoFamilia();">
                                                                <label class="custom-control-label" for="naomd">Não</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamentoDep" id="simmd" value="Sim" class="custom-control-input" onclick="temMedicamentoFamilia();">
                                                                <label class="custom-control-label" for="simmd">Sim</label>
                                                            </div>
                                                       </div>
                                                        <div id="div_medicamento_familia" class="hide col-md-9">
                                                        <div class="col-md-9">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualMedicamentoDep" id="qualMd" class="form-control" placeholder="Qual Medicamento na família?">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                       </div>
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="form-group row">
                                                <label class="col-md-3 label-control" for="deficiencia">Você tem alguma deficiência?:</label>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="deficiencia" id="deficiencianao" value="Não" class="custom-control-input" onclick="naoTemDeficiencia();">
                                                                <label class="custom-control-label" for="deficiencianao">Não</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="deficiencia" id="deficienciasim" value="Sim" class="custom-control-input" onclick="temDeficiencia();">
                                                                <label class="custom-control-label" for="deficienciasim">Sim</label>
                                                            </div> 
                                                        </div>
                                                     </div>
                                                </div>
                                            </div>
                                           <div id="div_deficiencia" class="hide">
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="deficiencia">Qual deficiência?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipodeficiencia" id="auditiva" value="Auditiva" class="custom-control-input">
                                                            <label class="custom-control-label" for="auditiva">Auditiva&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipodeficiencia" id="fisica" value="Fisica" class="custom-control-input">
                                                            <label class="custom-control-label" for="fisica">Física&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipodeficiencia" id="visual" value="Visual" class="custom-control-input">
                                                            <label class="custom-control-label" for="visual">Visual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipodeficiencia" id="mental" value="Intelectual" class="custom-control-input">
                                                            <label class="custom-control-label" for="mental">Intelectual/Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio" >
                                                            <input type="radio" name="tipodeficiencia" id="multiplas" value="Multiplas" class="custom-control-input">
                                                            <label class="custom-control-label" for="multiplas">Deficiência Múltiplas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="deficienciaDep">Há pessoa(s) na família com deficiência,qual?</label>
                                                <div class="col-md-3">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="deficienciaDep" id="naod" value="Não" class="custom-control-input" onclick="naoTemDeficienciaFamilia();">
                                                                <label class="custom-control-label" for="naod">Não</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="deficienciaDep" id="simd" value="Sim" class="custom-control-input" onclick="temDeficienciaFamilia();">
                                                                <label class="custom-control-label" for="simd">Sim</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                              <div id="div_deficiencia_familia" class="hide">
                                              <div class="form-group row">
                                                <label class="col-md-3 label-control" for="qualdeficienciaDep">Qual deficiência?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="qualdeficienciaDep" id="auditiva_familia" value="Auditiva" class="custom-control-input">
                                                            <label class="custom-control-label" for="auditiva_familia">Auditiva&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="qualdeficienciaDep" id="fisica_familia" value="Fisica" class="custom-control-input">
                                                            <label class="custom-control-label" for="fisica_familia">Física&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="qualdeficienciaDep" id="visual_familia" value="Visual" class="custom-control-input">
                                                            <label class="custom-control-label" for="visual_familia">Visual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="qualdeficienciaDep" id="mental_familia" value="Intelectual" class="custom-control-input">
                                                            <label class="custom-control-label" for="mental_familia">Intelectual/Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="custom-control custom-radio" >
                                                            <input type="radio" name="qualdeficienciaDep" id="multiplas_familia" value="Multiplas" class="custom-control-input">
                                                            <label class="custom-control-label" for="multiplas_familia">Deficiência Múltiplas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                    </div>
                                                       </div>
                                                    </div>
                                               </div>
                                            <div class="form-actions">
                                                <button type="reset" value="Limpar"  class="btn btn-warning mr-1">
                                                    <i class="ft-x"></i> Limpar
                                                </button>
                                                <button type="submit" class="btn btn-primary" name="cadastrar" value="Cadastrar">
                                                    <i class="la la-check-square-o"></i> Avançar
                                                </button>
                                            </div>
                                        </form>
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
