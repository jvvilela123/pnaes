<%@page import="modelo.Bolsa"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../imports.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Aluno</title>

        <script type="text/javascript" >
            $(document).ready(function () {
                $('#cat').change(function () {
                    //$('#divcurso')[0].style.display="block";
                    //$('#divcurso').style.display = 'block';
                    $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val());
                });

            });
            $(document).ready(function () {
                $('#curso').change(function () {
                   // $('#divperiodo')[0].style.display="block";
                    $('#periodo').load('/pnaes/periodoajax.jsp?curso=' + $('#curso').val());
                });

            });
            
            $(document).ready(function () {
                $('#periodo').change(function () {
                   // $('#divperiodo')[0].style.display="block";
                    if($('#periodo').val()==='1'){
                     document.getElementById('div_1_periodo').style.display = 'none';
                     $("#naoReprovou").prop("checked", true);
                    }else
                     document.getElementById('div_1_periodo').style.display = 'block';
                });

            });
            
             function sReprovou() {
                document.getElementById('div_reprovou').style.display = 'block';
            }
            function nReprovou() {
                document.getElementById('div_reprovou').style.display = 'none';
                document.getElementById('reprovou').value = "";
            }
            function verificaCampos(){
               if ($('#div_reprovou').is(':visible')){
                    if(document.getElementById('simReprovou').checked && document.getElementById('reprovou').value === ""){
                    document.getElementById('reprovou').focus();
                    alertify.errorAlert("<h6 class='card-title'>Qual / quais a(s) disciplinas você reprovou?</h6>");
                 } 
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Informações do Estudante</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Preencha corretamente todos os campos
                                                    </div>

                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=preencher&id=<%=session.getAttribute("aluno_id")%>" id="formAluno">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cat">Modalidade do Curso*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="cat" name="cat" class="form-control" required>
                                                                        <option selected="" disabled="" value="">Selecione Modalidade do Curso</option>
                                                                        <%
                                                                            List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                            for (Categoria categoria : categorias) {
                                                                                out.print("<option value=" + categoria.getId() + ">" + categoria.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                               
                                                                    <div class="form-group row" >
                                                                        <label class="col-md-3 label-control" for="curso">Curso*:</label>
                                                                        <div class="col-md-9">
                                                                            <select id="curso" name="curso" class="form-control" required>
                                                                                <option selected="" disabled="" value="">Selecione primeiro a Modalidade do Curso ↑</option>
                                                                            </select>
                                                                        </div>
                                                                  </div>   
                                                                 
                                                               
                                                                    <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="periodo">Período*:</label>
                                                                    <div class="col-md-9">
                                                                        <select id="periodo" name="periodo" class="form-control" required>
                                                                           <option selected="" disabled="" value="">Selecione primeiro o Curso ↑</option>
                                                                            <!--<option value="1 Ano/Modulo/Periodo">1 Ano/Modulo/Periodo</option>
                                                                            <option value="2 Ano/Modulo/Periodo">2 Ano/Modulo/Periodo</option>
                                                                            <option value="3 Ano/Modulo/Periodo">3 Ano/Modulo/Periodo</option>
                                                                            <option value="4 Periodo">4 Periodo</option>
                                                                            <option value="5 Periodo">5 Periodo</option>
                                                                            <option value="6 Periodo">6 Periodo</option>
                                                                            <option value="7 Periodo">7 Periodo</option>
                                                                            <option value="8 Periodo">8 Periodo</option>-->

                                                                        </select>
                                                                        </div>
                                                                   </div>
                                                           
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte para chegar até o IFTO*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="onibusgratuito" value="OnibusGratuito" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="onibusgratuito">Ônibus (Gratuito)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div> 
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="onibusPago" value="OnibusPago" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="onibusPago">Ônibus (Pago)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="carro" value="Carro" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="carro">Carro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="moto" value="Moto" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="moto">Moto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="bicicleta" value="Bicicleta" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="bicicleta">Bicicleta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="ape" value="A pé" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ape">A pé&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="transporte" id="carona" value="Carona" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="carona">Carona</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Escola*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPu" value="Publico" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPa" value="Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoFundamental" id="ensinoFundamentalPp" value="Publica/Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPp">Pública e Particular</label>
                                                                        </div>
                                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou ou está cursando o Ensino Médio em Escola*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPu" value="Publico" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoMedioPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPa" value="Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoMedioPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="ensinoMedio" id="ensinoMedioPp" value="Publica/Particular" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="ensinoMedioPp">Pública e Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                       
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="entrada">Como você ingressou no IFTO*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada1" value="Ampla concorrencia" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada1">Vestibular por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada2" value="Cota" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada2">Vestibular por cotas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada3" value="Sisu" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada3">Sisu por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="entrada" id="entrada4" value="SisuCota" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="entrada4">Sisu por cotas</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div id="div_1_periodo" class="hide">
                                                            <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="reprovousimounao">Você reprovou em alguma disciplina no IFTO?*:</label>
                                                            <div class="col-md-9">
                                                                <div class="input-group">
                                                                       <div class="custom-control custom-radio">
                                                                           <input type="radio" name="reprovousimounao" id="naoReprovou" value="Nao" class="custom-control-input" onclick="nReprovou()" required>
                                                                           <label class="custom-control-label" for="naoReprovou">Não&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="reprovousimounao" id="simReprovou" value="Sim" class="custom-control-input" onclick="sReprovou()" required>
                                                                            <label class="custom-control-label" for="simReprovou">Sim</label>
                                                                        </div>
                                                                   
                                                                     <div id='div_reprovou' class='hide col-md-9'>
                                                                          <div class="col-md-9">
                                                                            <div class="position-relative has-icon-left">
                                                                                  <div class="form-control-position">
                                                                                    <i class="fa fa-briefcase">Em Quantas Disciplinas Você Reprovou?</i>
                                                                                </div>
                                                                                <input type="range" name="reprovou" id="reprovou" value="0" min="1" max="20" oninput="ageOutputId.value = reprovou.value">
                                                                                  <output name="ageOutputName" id="ageOutputId">0</output>
                                                                             </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                               </div>
                                                            </div>
                                                            </div>
                                                           <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="visita">Qual o melhor horário para uma visita, se necessário*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio" >
                                                                            <input type="radio" name="visita" id="visita1" value="Manha" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="visita1">Manhã&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="visita" id="visita2" value="Tarde" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="visita2">Tarde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <input type="radio" name="visita" id="visita3" value="Noite" class="custom-control-input" required>
                                                                            <label class="custom-control-label" for="visita3">Noite</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                             <!--<div class="form-group row">
                                                                <label class="col-md-3 label-control" for="residencia">Residência*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="residencia" name="residencia" class="form-control"  onchange="verificaCampos()" required>
                                                                        <option selected="" disabled="">Selecione o Tipo de Dependencia da Familia</option>
                                                                        <option value="Própria">Própria</option>
                                                                        <option value="Alugada">Alugada</option>
                                                                        <option value="Financiada">Financiada</option>
                                                                        <option value="Cedida">Cedida</option>
                                                                        <option value="Casa do Estudante">Casa do Estudante</option>   
                                                                        <option value="Outro">Outro</option>
                                                                    </select>
                                                                </div>
                                                            </div> 
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dependenciaFamiliar">Relação de dependência familiar*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="estadoCivil" name="dependenciaFamiliar" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione o Tipo de Dependencia da Familia</option>
                                                                        <option value="Moro com Familiares">Moro com Familiares</option>
                                                                        <option value="Moro Sozinho e independente">Moro Sozinho(a) e Independente</option>
                                                                        <option value="Moro Sozinho mas dependo de familiares">Moro Sozinho(a) mas Dependo de Familiares</option>
                                                                        <option value="Moro com Amigos e independente">Moro com Amigos(as) e Independente</option>
                                                                        <option value="Moro com Amigos mas dependo de Familiares">Moro com Amigos(as) mas Dependo de Familiares</option> 

                                                                    </select>
                                                                </div>
                                                            </div>   -->     

                                                            <div class="form-actions right">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i> Avançar
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
