<%-- 
    Document   : entrevistar
    Created on : 17/05/2018, 08:17:06
    Author     : ronan
--%>

<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Dependente"%>
<%@page import="modelo.Bolsa"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Entrevista"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Entrevista</title>
        <%@include file="../imports.jsp" %>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Entrevistar</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <%
                                                                Entrevista entrevista = (Entrevista) daoFactory.getEntrevistaDao().pesquisarPorId(Integer.parseInt(request.getParameter("e_id")));
                                                                Empresa empresa = new Empresa();

                                                                DataFormat dataFormat = new DataFormat();

                                                                List<Bolsa> bolsas = daoFactory.getBolsaDao().perquisarPorAluno(entrevista.getInscricao().getAluno().getId());

                                                                List<Dependente> deps = daoFactory.getDependenteDao().perquisarPorAluno(entrevista.getInscricao().getAluno().getId());
                                                                List<Empresa> empresas = new DaoFactory().getEmpresaDao().perquisarPorAluno(entrevista.getInscricao().getAluno().getId());
                                                                Despesa despesa = new DaoFactory().getDespesaDao().perquisarPorAluno(entrevista.getInscricao().getAluno().getId()).get(0);
                                                                FichaMedica fichaMedica = new DaoFactory().getFichaMedicaDao().perquisarPorAluno(entrevista.getInscricao().getAluno().getId()).get(0);
                                                                if (empresas.size() != 0) {
                                                                    empresa = empresas.get(0);
                                                                }
                                                            %>
                                                            <div class="col-md-3">
                                                                <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=entrevista.getInscricao().getAluno().getCpf()%>/<%=entrevista.getInscricao().getAluno().getCpf()%>.jpg" width="150" height="200">
                                                            </div>

                                                            <table class="table table-striped table-responsive-md">
                                                                <tr>
                                                                    <th>Nome:</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getNome()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>CPF:</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getCpf()%></td>
                                                                </tr> 
                                                                <tr>
                                                                    <th>RG</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getRg()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>UF de Expedição</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getUfExpedicao().getNome()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Sexo</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getSexo()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Data Nascimento</th>
                                                                    <td><%=dataFormat.formatarData(entrevista.getInscricao().getAluno().getDtn())%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Telefone</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getTelefone()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Email</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEmail()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Lougradouro</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEndereco().getLogradouro()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Complemento</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEndereco().getComplemento()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Numero</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEndereco().getNumero()%></td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Bairro</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEndereco().getBairro()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Cidade</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEndereco().getCidade().getNome()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Estado</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getEndereco().getCidade().getUf().getNome()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Matricula</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getMatricula()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Curso</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getCurso().getNome()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Periodo </th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getPeriodo()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Já reprovou, qual materia</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getDisciplina()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Bolsas Anteriores</th>
                                                                        <% /*
                                                                            for(Bolsa b: bolsas){
                                               
                                                                                out.println("<td>"+b.getNome()+"</td>");
                                                                                //out.println("<td>"+b+"</td>");
                                                                            } */
                                                                        %>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Qual ano</th>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Qual meio de Transporte</th>
                                                                    <td><%=entrevista.getInscricao().getAluno().getMeioTransporte()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Nome da empresa que trabalha</th>
                                                                    <td><%=empresa.getNome()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Telefone da Empresa</th>
                                                                    <td><%=empresa.getTelefone()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Renda do aluno</th>
                                                                    <td><%=empresa.getRenda()%></td>
                                                                </tr>
                                                                <tr> 
                                                                    <%
                                                                        Double total1 = new Double(0);
                                                                        Double td = new Double(0);
                                                                        for (Dependente d : deps) {
                                                                            td = td + d.getRenda();
                                                                        }
                                                                        total1 = empresa.getRenda() + td + empresa.getOrenda();
                                                                    %>
                                                                    <th>Renda familiar</th>
                                                                    <td><%=total1%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Despesas da familia</th>
                                                                        <%
                                                                            Double total = despesa.getAgua() + despesa.getEnergia()
                                                                                    + despesa.getFarmacia() + despesa.getMoradia() + despesa.getOutrasDespesas() + despesa.getTelefone();
                                                                        %>
                                                                    <td><%=total%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Você tem alguma doença crônica,qual?</th>
                                                                    <td><%=fichaMedica.getDoencaCronica()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Você faz uso de medicamento controlado?</th>
                                                                    <td><%=fichaMedica.getMedicamento()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Você tem alguma deficiência,qual?</th>
                                                                    <td><%=fichaMedica.getDeficiencia()%></td>
                                                                </tr>
                                                                <tr>    
                                                                    <th>Há pessoa(s) na familia com deficiência,qual?</th>
                                                                    <td><%=fichaMedica.getDeficienciaDep()%></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="col-md-3">
                                                                <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=entrevista.getInscricao().getAluno().getCpf()%>/<%=entrevista.getInscricao().getAluno().getCpf()%>.jpg" width="150" height="200">
                                                            </div>
                                                            <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEntrevista?opcao=entrevistar&e_id=<%=entrevista.getId()%>">
                                                                <div class="form-body">
                                                                    <table class="table table-striped table-responsive-md">
                                                                        <tr>
                                                                            <th>Numero da Inscrição:</th>
                                                                            <td><%=entrevista.getInscricao().getId()%></td>
                                                                        </tr> 
                                                                        <tr>
                                                                            <th>Nome:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getNome()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>CPF:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getCpf()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="concorrencia">Motivo que levou a concorrer à vaga de bolsista:</label></td>
                                                                            <td><textarea  cols="40" rows="4" name="concorrencia" required=""></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="dimensaoSocial">Dimensão Social</label></td>
                                                                            <td><textarea  class="form-control" rows="4" name="dimensaoSocial" required=""></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="dimensaoEconomica">Dimensão Econômica</label></td>
                                                                            <td><textarea  class="form-control" rows="4" name="dimensaoEconomica" required=""></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="dimensaoAmbiental">Dimensão Ambiental</label></td>
                                                                            <td><textarea  class="form-control" rows="4" name="dimensaoAmbiental" required=""></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="dimensaoCultural">Dimensão Cultural</label></td>
                                                                            <td><textarea  class="form-control" rows="4" name="dimensaoCultural" required=""></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Você Estudou o Ensino Fundamental:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getEnsinoFundamental()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>Você Estudou o Ensino Médio:</th>
                                                                            <td><%=entrevista.getInscricao().getAluno().getEnsinoMedio()%></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="participaProjetos">Participa Projetos no IFTO:</label></td>
                                                                            <td><select id="resultado" name="participaProjetos" class="form-control" required>
                                                                                    <option value="Nenhum">Nenhum</option>
                                                                                    <option value="Pibid">PIBID</option>
                                                                                    <option value="Extensao">Extensão</option>
                                                                                    <option value="Residencia">Residência Pedagógica</option>
                                                                                    <option value="Monitoria">Monitoria</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="bolsaPermanente">Recebe Bolsa Permanência PBP/MEC </label></td>
                                                                            <td><select id="resultado" name="bolsaPermanente" class="form-control" required>
                                                                                    <option value="Sim">Sim</option>
                                                                                    <option value="Nao">Não</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="outraBolsa">Recebe outro tipo de auxílio PNAES </label></td>

                                                                            <td><select id="resultado" name="outraBolsa" class="form-control" required>
                                                                                    <option value="Sim">Sim</option>
                                                                                    <option value="Nao">Não</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="almocoIfto">Almoça no IFTO:  </label></td>
                                                                            <td><select id="resultado" name="almocoIfto" class="form-control" required>
                                                                                    <option value="Todos dias"> Todos Dias</option>
                                                                                    <option value="Quatro vez por semana">Quatro Vezes por Semana</option>
                                                                                    <option value="Tres vez por semana">Três Vezes por Semana</option>
                                                                                    <option value="Duas vez por semana">Duas Vezes por Semana</option>
                                                                                    <option value="Uma vez por semana">Uma Vezes por Semana</option>
                                                                                    <option value="Prefere almocar em casa">Prefere Almoçar em Casa</option>
                                                                                </select></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="observacao">Considerações do Entrevistador</label></td>
                                                                            <td><textarea  class="form-control" rows="4" name="observacao"></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="df">Documentos Faltantes</label></td>
                                                                            <td><textarea  class="form-control" rows="4" name="df"><%=entrevista.getInscricao().getDocumentosFaltantes()%></textarea></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td><label class="col-md-6 label-control" for="vulnerabilidade">Vulnerabilidade Social</label></td>
                                                                            <td><select id="resultado" name="vulnerabilidade" class="form-control" required>
                                                                                    <option value="Alta">Alta</option>                                                                           
                                                                                    <option value="Media">Media</option>
                                                                                    <option value="Baixa">Baixa</option>
                                                                                    <option value="Fora de Vulnerabilidade ">Fora de Vulnerabilidade </option>
                                                                                </select></td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td><button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                                    <i class="ft-x"></i> Limpar
                                                                                </button>
                                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                                    <i class="fa fa-check-square-o"></i>Enviar
                                                                                </button></td>
                                                                        </tr>
                                                                    </table>
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
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>