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
        <script type="text/javascript" >
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
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
                                                    <center><h1>Sistema PNAES</h1></center>
                                                        <%                                                            
                                                            DataFormat dataFormat = new DataFormat();
                                                            Integer id = Integer.parseInt(request.getParameter("id"));
                                                            aluno = daoFactory.getAlunoDao().pesquisarPorId(id);
                                                        %>
                                                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletAluno?opcao=alterar&id=<%=aluno.getId()%>">
                                                        <div class="form-body">
                                                             
                                                            <h4 class="form-section"><i class="ft-user"></i>Dados Estudantis</h4>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="matricula">Matricula</label>
                                                                <div class="col-md-9">
                                                                    <div class="position-relative has-icon-left">
                                                                        <input type="text" name="matricula" id="matricula" class="form-control" value="<%=aluno.getMatricula()%>">
                                                                        <div class="form-control-position">
                                                                            <i class="ft-user"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="curso">Curso</label>
                                                                <div class="col-md-9">
                                                                    <div class="position-relative has-icon-left">
                                                                        <input type="text" name="curso" id="curso" class="form-control" value="<%=aluno.getCurso().getNome()%>">
                                                                        <div class="form-control-position">
                                                                            <i class="fa fa-briefcase"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="periodo">Periodo</label>
                                                                <div class="col-md-9">
                                                                    <div class="position-relative has-icon-left">
                                                                        <input type="text" name="periodo" id="periodo" class="form-control" value="<%=aluno.getPeriodo()%>">
                                                                        <div class="form-control-position">
                                                                            <i class="fa fa-briefcase"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>                                   
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte:</label>
                                                                <div class="col-md-9">
                                                                    <div class="position-relative has-icon-left">
                                                                        <input type="text" name="transporte" id="transporte" class="form-control" value="<%=aluno.getMeioTransporte()%>">
                                                                        <div class="form-control-position">
                                                                            <i class="fa fa-briefcase"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou o Ensino Medio em Colegio:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoMedio().equals("Publico")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' value='Publico' class='custom-control-input' id='ensinoMedioPu'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' value='Publico' class='custom-control-input' id='ensinoMedioPu'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPu">Publico</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoMedio().equals("Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' value='Particular' class='custom-control-input' id='ensinoMedioPa'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' value='ensinoMedio' class='custom-control-input' id='ensinoMedioPa'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPa">Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Colegio:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoFundamental().equals("Publico")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' value='Publico' class='custom-control-input' id='ensinoFundamentalPu'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' value='Publico' class='custom-control-input' id='ensinoFundamentalPu'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPu">Publico</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoFundamental().equals("Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' value='Particular' class='custom-control-input' id='ensinoFundamentalPa'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' value='Particular' class='custom-control-input' id='ensinoFundamentalPa'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ifto">Como você ingressou no IFTO:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Ampla concorrencia")) {
                                                                                    out.println("<input checked type='radio' name='ifto' value='Ampla concorrencia' class='custom-control-input' id='ifto1'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ifto' value='Masculino' class='custom-control-input' id='ifto1'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ifto1">Ampla concorrência</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Cota")) {
                                                                                    out.println("<input checked type='radio' name='ifto' value='Cota' class='custom-control-input' id='ifto2'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ifto' value='Cota' class='custom-control-input' id='ifto2'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ifto2">Cota</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Sisu")) {
                                                                                    out.println("<input checked type='radio' name='ifto' value='Sisu' class='custom-control-input' id='ifto3'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ifto' value='Sisu' class='custom-control-input' id='ifto3'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ifto3">Sisu</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="periodoVisita">Qual o melhor horario para uma visita:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Manha")) {
                                                                                    out.println("<input checked type='radio' name='periodoVisita' value='Manha' class='custom-control-input' id='periodoVisita1'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='periodoVisita' value='Manha' class='custom-control-input' id='periodoVisita1'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="periodoVisita1">Manhã</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Tarde")) {
                                                                                    out.println("<input checked type='radio' name='periodoVisita' value='Masculino' class='custom-control-input' id='periodoVisita2'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='periodoVisita' value='Tarde' class='custom-control-input' id='periodoVisita2'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="periodoVisita2">Tarde</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Noite")) {
                                                                                    out.println("<input checked type='radio' name='periodoVisita' value='Noite' class='custom-control-input' id='periodoVisita3'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='periodoVisita' value='Noite' class='custom-control-input' id='periodoVisita3'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="periodoVisita3">Noite</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>                                                                    
                                                            <div class="form-actions right">
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                    <i class="fa fa-check-square-o"></i>Enviar
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
