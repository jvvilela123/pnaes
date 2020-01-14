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
        <title>Refazer 1º Passo</title>
        <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
           $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            $(document).ready(function () {
                $('#cat').change(function () {
                $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val());
                });

            });
            $(document).ready(function () {
                $('#curso').change(function () {
                    $('#periodo').load('/pnaes/periodoajax.jsp?curso=' + $('#curso').val());
                });

            });
            
            function sReprovou() {
                document.getElementById('div_reprovou').style.display = 'block';
                if(document.getElementById('simReprovou').checked && document.getElementById('reprovou').value === ""){
                    document.getElementById('reprovou').focus();
                    alertify.errorAlert("<h6 class='card-title'>Qual / quais a(s) disciplinas você reprovou?</h6>");
                }
            }
            function nReprovou() {
                document.getElementById('div_reprovou').style.display = 'none';
                document.getElementById('reprovou').value = "";
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
                                                        Preencha corretamente todos os campos
                                                    </div>
                                                    <!--<center><h1>Alteração do 1º Passo</h1></center>-->
                                                        <%                                                            
                                                            DataFormat dataFormat = new DataFormat();
                                                            Integer id = Integer.parseInt(request.getParameter("id"));
                                                            aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(id);
                                                        %>
                                                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletAluno?opcao=alterar_1_passo&id=<%=aluno.getId()%>" id="formAluno">
                                                        <div class="form-body">
                                                            <h4 class="form-section"><i class="ft-user"></i>Alteração do 1º Passo</h4>
                                                             <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cat">Modalidade do Curso:*</label>
                                                                <div class="col-md-9">
                                                                    <select id="cat" name="cat" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione Modalidade do Curso</option>
                                                                        <%
                                                                          List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                          out.print("<option selected value=" + aluno.getCurso().getCategoria().getId() + ">" + aluno.getCurso().getCategoria().getNome() + "</option>");
                                                                            for (Categoria categoria : categorias) {
                                                                              if(categoria.getId()!=aluno.getCurso().getCategoria().getId())
                                                                              out.print("<option value=" + categoria.getId() + ">" + categoria.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                              <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="curso">Curso:*</label>
                                                                <div class="col-md-9">
                                                                    <select id="curso" name="curso" class="form-control" required>
                                                                        <%
                                                                            List<Curso> cursos = daoFactory.getCursoDao().buscarCursoPorCategoria(aluno.getCurso().getCategoria().getId());
                                                                            out.print("<option selected value=" + aluno.getCurso().getId() + ">" + aluno.getCurso().getNome() + "</option>");
                                                                            for (Curso curso : cursos) {
                                                                                if(curso.getId()!=aluno.getCurso().getId()) 
                                                                                out.print("<option value=" + curso.getId() + ">" + curso.getNome() + "</option>");
                                                                            }
                                                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                                                        %>  
                                                                    </select>
                                                                </div>
                                                            </div>        
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="periodo">Periodo:*</label>
                                                                <div class="col-md-9">
                                                                    <select id="periodo" name="periodo" class="form-control" required>
                                                                        
                                                                        <%
                                                                          List<Curso> cursos2 = daoFactory.getCursoDao().buscarCursoPorCategoria(aluno.getCurso().getCategoria().getId());
                                                                          Curso curso = (Curso) daoFactory.getCursoDao().pesquisarPorId(aluno.getCurso().getId());
                                                                           out.print("<option selected value=" + aluno.getPeriodo() + ">" + aluno.getPeriodo() + "º " + curso.getTipoPeriodo() +  "</option>");
                                                                            for (int i = 1; i <= curso.getqPeriodo(); i++) {
                                                                                if(i!=aluno.getPeriodo())
                                                                                out.println("<option value=" + i + ">" + i + "º " + curso.getTipoPeriodo() + "</option>");
                                                                                //out.println("<option value="+curso.getId()+">"+curso.getTipoPeriodo()+"</option>");
                                                                                //curso.setTipoPeriodo(curso.getTipoPeriodo());
                                                                            }
                                                                            
                                                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                                                        %>  
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
                                                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte para chegar até o IFTO:*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <!--<input type="radio" name="transporte" id="onibus" value="Onibus" class="custom-control-input" required>-->
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Onibus")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='onibus' value='Onibus' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='onibus' value='Onibus' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="onibus">Onibus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                           <%
                                                                                if (aluno.getMeioTransporte().equals("Carro")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='carro' value='Carro' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='carro' value='Carro' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="carro">Carro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Moto")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='moto' value='Moto' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='moto' value='Moto' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="moto">Moto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Bicicleta")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='bicicleta' value='Bicicleta' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='bicicleta' value='Bicicleta' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="bicicleta">Bicicleta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("A pé")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='ape' value='A pé' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='ape' value='A pé' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ape">A pé&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Carona")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='carona' value='Carona' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='carona' value='Carona' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                           
                                                                            <label class="custom-control-label" for="carona">Carona</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Escola:*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                           <%
                                                                                if (aluno.getEnsinoFundamental().equals("Publico")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' id='ensinoFundamentalPu' value='Publico' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' id='ensinoFundamentalPu' value='Publico' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoFundamental().equals("Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' id='ensinoFundamentalPa' value='Particular' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' id='ensinoFundamentalPa' value='Particular' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoFundamental().equals("Publica/Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' id='ensinoFundamentalPp' value='Publica/Particular' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' id='ensinoFundamentalPp' value='Publica/Particular' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPp">Pública e Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou ou está cursando o Ensino Medio em Escola:*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoMedio().equals("Publico")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioPu' value='Publico' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioPu' value='Publico' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPu">Pública&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                          <%
                                                                                if (aluno.getEnsinoMedio().equals("Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioPa' value='Particular' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioPa' value='Particular' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPa">Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                           <%
                                                                                if (aluno.getEnsinoMedio().equals("Publica/Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioPp' value='Publica/Particular' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioPp' value='Publica/Particular' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPp">Pública e Particular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                            
                                                                            <div class="custom-control custom-radio">
                                                                                 <%
                                                                                if (aluno.getEnsinoMedio().equals("IFTO")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' id='ensinoMedioIf' value='IFTO' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' id='ensinoMedioIf' value='IFTO' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioIf">Cursando o Ensino Médio no IFTO</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                              <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="entrada">Como você ingressou no IFTO:*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                           <%
                                                                                if (aluno.getEntradaIfto().equals("Ampla concorrencia")) {
                                                                                    out.println("<input checked type='radio' name='entrada' id='entrada1' value='Ampla concorrencia' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='entrada' id='entrada1' value='Ampla concorrencia' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="entrada1">Vestibular por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Cota")) {
                                                                                    out.println("<input checked type='radio' name='entrada' id='entrada2' value='Cota' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='entrada' id='entrada2' value='Cota' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="entrada2">Vestibular por cotas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Sisu")) {
                                                                                    out.println("<input checked type='radio' name='entrada' id='entrada3' value='Sisu' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='entrada' id='entrada3' value='Sisu' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="entrada3">Sisu por ampla concorrência&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("SisuCota")) {
                                                                                    out.println("<input checked type='radio' name='entrada' id='entrada4' value='SisuCota' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='entrada' id='entrada4' value='SisuCota' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="entrada4">Sisu por cotas</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="visita">Qual o melhor horário para uma visita, se necessário:*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                           <%
                                                                                if (aluno.getPeriodoVisita().equals("Manha")) {
                                                                                    out.println("<input checked type='radio' name='visita' id='visita1' value='Manha' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='visita' id='visita1' value='Manha' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="visita1">Manhã&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Tarde")) {
                                                                                    out.println("<input checked type='radio' name='visita' id='visita2' value='Tarde' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='visita' id='visita2' value='Tarde' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="visita2">Tarde&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getPeriodoVisita().equals("Noite")) {
                                                                                    out.println("<input checked type='radio' name='visita' id='visita3' value='Noite' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='visita' id='visita3' value='Noite' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="visita3">Noite</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="reprovousimounao">Você reprovou em alguma(s) disciplina(s) no ultimo semestre?*</label>
                                                            <div class="col-md-9">
                                                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                    <div class="col-md-2">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (aluno.getReprovou()==null) {
                                                                                        out.println("<input checked type='radio' name='reprovousimounao' id='naoReprovou' value='Nao' class='custom-control-input' onclick='nReprovou();' required>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='reprovousimounao' id='naoReprovou' value='Nao' class='custom-control-input' onclick='nReprovou();' required>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="naoReprovou">Não</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (aluno.getReprovou()!=null) {
                                                                                        out.println("<input checked type='radio' name='reprovousimounao' id='simReprovou' value='Sim' class='custom-control-input' onclick='sReprovou();' required>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='reprovousimounao' id='simReprovou' value='Sim' class='custom-control-input' onclick='sReprovou();' required>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="simReprovou">Sim</label>
                                                                        </div>
                                                                    </div>
                                                                            <%
                                                                                    if (aluno.getReprovou()==null) {
                                                                                        out.println("<div id='div_reprovou' class='hide col-md-9'>");
                                                                                    } else {
                                                                                        out.println("<div id='div_reprovou' class='col-md-9'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                          <div class="col-md-9">
                                                                            <div class="position-relative has-icon-left">
                                                                                <%
                                                                                if(aluno.getReprovou()!=null){%>
                                                                                   <textarea  class="form-control" id="reprovou" cols="40" rows="4" name="reprovou" wrap="hard"><%out.print(aluno.getReprovou().toString());%></textarea>
                                                                                <%} else { %>
                                                                                   <textarea  class="form-control" id="reprovou" cols="40" rows="4" name="reprovou" placeholder='Qual / Quais disciplina(s)?'></textarea>
                                                                              <% } %>
                                                                                <div class="form-control-position">
                                                                                    <i class="fa fa-briefcase"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger" type="button" >Voltar</button></a>&nbsp;
                                                                
                                                                 <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary" >
                                                                    <i class="fa fa-check-square-o"></i>Salvar
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
