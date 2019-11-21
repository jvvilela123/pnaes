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
        </script>

    </head>
    <body>
        <div class="element-box">
            <%@include file="../cabecalho.jsp"%>
            <h5 class="form-header">Cadastro da Ficha Medica</h5>
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
                                    <form method="Post" action="../ServletFichaMedica?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>" class="form form-horizontal">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="tipoDoenca">Você tem alguma doença crônica,qual?:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="nenhuma" value="Nenhuma" class="custom-control-input">
                                                            <label class="custom-control-label" for="nenhuma">Nenhuma</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="hipertencao" value="Hipertenção" class="custom-control-input">
                                                            <label class="custom-control-label" for="hipertencao">Hipertensão Arterial</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="diabetes" value="Diabetes" class="custom-control-input">
                                                            <label class="custom-control-label" for="diabetes">Diabetes</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="epilepsia" value="Epilepsia" class="custom-control-input">
                                                            <label class="custom-control-label" for="epilepsia">Epilepsia</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="asma" value="Asma" class="custom-control-input">
                                                            <label class="custom-control-label" for="asma">Asma</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="hepatiteb" value="Hepatite B" class="custom-control-input">
                                                            <label class="custom-control-label" for="hepatiteb">Hepatite B</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="osteoporose" value="Osteoporose" class="custom-control-input">
                                                            <label class="custom-control-label" for="osteoporose">Osteoporose</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="enxaqueca" value="Enxaqueca" class="custom-control-input">
                                                            <label class="custom-control-label" for="enxaqueca">Enxaqueca</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="dependenciaQuimica" value="Dependencia Quimica" class="custom-control-input">
                                                            <label class="custom-control-label" for="dependenciaQuimica">Dependência Quimica</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="doencaMental" value="Doença Mental" class="custom-control-input">
                                                            <label class="custom-control-label" for="doencaMental">Doenca Mental</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="tipoDoenca" id="outros" value="Outros" class="custom-control-input">
                                                            <label class="custom-control-label" for="outros">Outros</label>
                                                        </div>
                                                        
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="tipoDoenca" id="outros" class="form-control" placeholder="Qual Doença">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                          <div class="form-group row">
                                                <label class="col-md-3 label-control" for="doencaCronica">Há alguem com doença cronica na familia,qual?:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="doencaCronica" id="sim" value="Sim" class="custom-control-input">
                                                                <label class="custom-control-label" for="sim">Sim</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="doencaCronica" id="nao" value="Não" class="custom-control-input">
                                                                <label class="custom-control-label" for="nao">Não</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualDoenca" id="qualDo" class="form-control" placeholder="Qual Doença">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="medicamento">Você faz uso de medicamento controlado?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamento" id="simm" value="Sim" class="custom-control-input">
                                                                <label class="custom-control-label" for="simm">Sim</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamento" id="naom" value="Não" class="custom-control-input">
                                                                <label class="custom-control-label" for="naom">Não</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualMedicamento" id="qualM" class="form-control" placeholder="Qual Medicamento">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="form-group row">
                                                <label class="col-md-3 label-control" for="medicamento">Há alguem que faz uso de medicamento controlado na familia?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamentoDep" id="simmd" value="Sim" class="custom-control-input">
                                                                <label class="custom-control-label" for="simmd">Sim</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="medicamentoDep" id="naomd" value="Não" class="custom-control-input">
                                                                <label class="custom-control-label" for="naomd">Não</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualMedicamentoDep" id="qualMd" class="form-control" placeholder="Qual Medicamento Dependente">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                          
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="deficiencia">Você tem alguma deficiência,qual?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="deficiencia" id="nenhumad" value="Nenhuma" class="custom-control-input">
                                                            <label class="custom-control-label" for="nenhumad">Nenhuma</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="deficiencia" id="auditiva" value="Auditiva" class="custom-control-input">
                                                            <label class="custom-control-label" for="auditiva">Auditiva</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="deficiencia" id="fisica" value="Fisica" class="custom-control-input">
                                                            <label class="custom-control-label" for="fisica">Física</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="deficiencia" id="visual" value="Visual" class="custom-control-input">
                                                            <label class="custom-control-label" for="visual">Visual</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="deficiencia" id="mental" value="Intelectual" class="custom-control-input">
                                                            <label class="custom-control-label" for="mental">Intelectual/Mental</label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" name="deficiencia" id="multiplas" value="Multiplas" class="custom-control-input">
                                                            <label class="custom-control-label" for="multiplas">Deficiência Múltiplas</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="deficienciaDep">Há pessoa(s) na familia com deficiência,qual?</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="col-md-3">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="deficienciaDep" id="simd" value="Sim" class="custom-control-input">
                                                                <label class="custom-control-label" for="simd">Sim</label>
                                                            </div>
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" name="deficienciaDep" id="naod" value="Não" class="custom-control-input">
                                                                <label class="custom-control-label" for="naod">Não</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualdeficienciaDep" id="qualD" class="form-control" placeholder="Qual Deficiência">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
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
