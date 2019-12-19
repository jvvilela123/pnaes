<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Entrevista"%>
<%@page import="modelo.Bolsa"%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Análise de Documentos</title>
        <%@include file="../imports.jsp" %>
        <script>
            $(function () {
                var icons = {
                    header: "ui-icon-circle-arrow-e",
                    activeHeader: "ui-icon-circle-arrow-s"
                };
                $("#accordion").accordion({
                    collapsible: true,
                    icons: icons,
                    active: false,
                    heightStyle: "content"

                });

                $("#accordion2").accordion({
                    collapsible: true,
                    icons: icons,
                    active: false,
                    heightStyle: "content"

                });
                $("#accordion3").accordion({
                    collapsible: true,
                    icons: icons,
                    active: false,
                    heightStyle: "content"

                });
            });

        </script>

    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menuPdf.jsp" %>
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
                            <div style="width: 95%">
                                <br>
                                <div class="row">
                                    <div class="col-md-6" id="pdf">

                                        <script>
                                           
                                            function abrir(ele) {
                                                var elem = document.getElementById('dinamic_iframe');
                                                if (elem !== null) { // remover caso exista
                                                    elem.remove();
                                                }
                                                var iframe = document.createElement('iframe');
                                                iframe.src = ele.href;
                                                iframe.id = 'dinamic_iframe';
                                                iframe.width = "100%";
                                                iframe.height = 1800;
                                                document.getElementById("pdf").appendChild(iframe);
                                                return false;
                                            }
                                            function soma() {
                                                ta = document.getElementById("docf")
                                                var cb = []
                                                cb[0] = document.getElementById("cbdfrg")
                                                cb[1] = document.getElementById("cbdfcpf")
                                                cb[2] = document.getElementById("cbdfce")
                                                //console.log(cb)
                                                ta.value = ''
                                                for (i = 0; i < cb.length; i++) {
                                                    //console.log(i+" "+cb[i])
                                                    if (cb[i].checked) {
                                                        console.log(i + " " + cb[i].value)
                                                        ta.value = ta.value + cb[i].value + "\n"
                                                    }
                                                }
                                            }


                                        </script>
                                    </div>
                                    <div class="col-md-6">
                                        <%                                            Empresa empresa = new Empresa();
                                            DaoFactory daoFactory = new DaoFactory();
                                            DataFormat dataFormat = new DataFormat();

                                            Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                                            List<Bolsa> bolsas = daoFactory.getBolsaDao().perquisarPorAluno(inscricao.getAluno().getId());

                                            List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarPorAluno(inscricao.getAluno().getId());
                                            List<Dependente> deps = daoFactory.getDependenteDao().perquisarPorAluno(inscricao.getAluno().getId());
                                            List<Empresa> empresas = new DaoFactory().getEmpresaDao().perquisarPorAluno(inscricao.getAluno().getId());
                                            Despesa despesa = new DaoFactory().getDespesaDao().perquisarPorAluno(inscricao.getAluno().getId()).get(0);

                                            FichaMedica fichaMedica = new DaoFactory().getFichaMedicaDao().perquisarPorAluno(inscricao.getAluno().getId()).get(0);
                                            if (empresas.size() != 0) {
                                                empresa = empresas.get(0);
                                            }
                                            Integer alunoId = Integer.parseInt(session.getAttribute("aluno_id").toString());

                                            Edital edital = daoFactory.getEditalDao().listar().get(0);
                                        %>
                                        <div class="col-md-3">
                                            <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/<%=inscricao.getAluno().getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" id="img_aluno">

                                        </div>
                                        <div id="accordion">
                                            <h3>Dados do Estudante</h3>
                                            <div>
                                                <div id="accordion2">
                                                    <h3>Dados Pessoais (Documentos e Endereço)</h3>
                                                    <div>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>
                                                                <th>Nome:</th>
                                                                <td><%=inscricao.getAluno().getNome()%></td>
                                                            </tr>
                                                            <tr>
                                                                <th>CPF:</th>
                                                                <td><%=inscricao.getAluno().getCpf()%></td>
                                                            </tr> 
                                                            <tr>
                                                                <th>RG:</th>
                                                                <td><%=inscricao.getAluno().getRg()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>UF de Expedição:</th>
                                                                <td><%=inscricao.getAluno().getUfExpedicao().getNome()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Sexo:</th>
                                                                <td><%=inscricao.getAluno().getSexo()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Data Nascimento:</th>
                                                                <td><%=dataFormat.formatarData(inscricao.getAluno().getDtn())%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Telefone:</th>
                                                                <td><%=inscricao.getAluno().getTelefone()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Email:</th>
                                                                <td><%=inscricao.getAluno().getEmail()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Lougradouro:</th>
                                                                <td><%=inscricao.getAluno().getEndereco().getLogradouro()%></td>
                                                            </tr>
                                                            <%if(!inscricao.getAluno().getEndereco().getComplemento().equals("") && inscricao.getAluno().getEndereco().getComplemento()!= null){%>
                                                            <tr>    
                                                                <th>Complemento:</th>
                                                                <td><%=inscricao.getAluno().getEndereco().getComplemento()%></td>
                                                            </tr>
                                                            <%}%>
                                                            <tr>    
                                                                <th>Numero:</th>
                                                                <td><%=inscricao.getAluno().getEndereco().getNumero()%></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Bairro:</th>
                                                                <td><%=inscricao.getAluno().getEndereco().getBairro()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cidade:</th>
                                                                <td><%=inscricao.getAluno().getEndereco().getCidade().getNome()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Estado:</th>
                                                                <td><%=inscricao.getAluno().getEndereco().getCidade().getUf().getNome()%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <h3>Informações do Estudante</h3>
                                                    <div>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Número da Matrícula:</th>
                                                                <td><%=inscricao.getAluno().getMatricula()%></td>
                                                            </tr>

                                                            <tr>    
                                                                <th>Curso:</th>
                                                                <td><%=inscricao.getAluno().getCurso().getCategoria().getNome()%> - <%=inscricao.getAluno().getCurso().getNome()%></td>
                                                            </tr>

                                                            <tr>    
                                                                <th>Período:</th>
                                                                <td><%=inscricao.getAluno().getCurso().getqPeriodo()%>º <%=inscricao.getAluno().getCurso().getTipoPeriodo()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cursou Ensino Fundamental em Ensino:</th>
                                                                <td><%=inscricao.getAluno().getEnsinoFundamental()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cursou Ensino Médio em Ensino:</th>
                                                                <td><%=inscricao.getAluno().getEnsinoMedio()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Ingressou no IFTO via:</th>
                                                                <td><%=inscricao.getAluno().getEntradaIfto()%></td>
                                                            </tr>

                                                            <%if (inscricao.getAluno().getReprovou() != null && !inscricao.getAluno().getReprovou().equals("")) {%>
                                                            <tr>    
                                                                <th>Disciplina(s) que Reprovou:</th>
                                                                <td><%=inscricao.getAluno().getReprovou()%></td>
                                                            </tr>
                                                            <%}%>
                                                            <tr>    
                                                                <th>Meio de Transporte:</th>
                                                                <td><%=inscricao.getAluno().getMeioTransporte()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Melhor Horário para uma Visita:</th>
                                                                <td><%=inscricao.getAluno().getPeriodoVisita()%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <h3>Ocupação do Estudante</h3>
                                                    <div>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Tem carteira de Trabalho?</th>
                                                                <td><%=empresa.getCarteira().toUpperCase()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Trabalha Atualmente?</th>
                                                                <td><%=empresa.getTrabalha().toUpperCase()%></td>
                                                            </tr>
                                                            
                                                            <tr>    
                                                                <th>Situação Profissional:</th>
                                                                <td><%=empresa.getAtividade()%></td>
                                                            </tr>
                                                            
                                                            <%if(empresa.getAtividade().equals("Empregado CLT") || empresa.getAtividade().equals("Funcionanio Publico")){%>
                                                            <tr>    
                                                                <th>Nome da Empresa que Trabalha:</th>
                                                                <td><%=empresa.getNome()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Telefone da Empresa:</th>
                                                                <td><%=empresa.getTelefone()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Nome do Responsável da Empresa:</th>
                                                                <td><%=empresa.getResponsavel()%></td>
                                                            </tr>
                                                            <%}%>
                                                        </table>
                                                    </div>
                                                            <%if(fichaMedica.getTemDoenca().equals("Não") &&
                                                                 fichaMedica.getTemDoencaDep().equals("Não") &&
                                                                 fichaMedica.getTemMedicamento().equals("Não") &&
                                                                 fichaMedica.getTemMedicamentoDep().equals("Não") &&
                                                                 fichaMedica.getTemDeficiencia().equals("Não") &&
                                                                 fichaMedica.getTemDeficienciaDep().equals("Não")){%>
                                                        <h3 class="ui-state-disabled">Estudante e Família NÃO Possui Doenças, Deficiências e Medicamentos</h3>
                                                        <%}else{%>
                                                        <h3>Saúde do Estudante/Família</h3>
                                                        <%}%>
                                                <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <%if(fichaMedica.getTemDoenca().equals("Sim")){%>
                                                    <tr>    
                                                        <th>Estudante tem alguma doença crônica, qual?</th>
                                                        <td><%=fichaMedica.getQualDoenca()%></td>
                                                    </tr>
                                                   <%}if(fichaMedica.getTemDoencaDep().equals("Sim")){%>
                                                    <tr>    
                                                        <th>Há pessoa(s) na família com alguma doença crônica, qual?</th>
                                                        <td><%=fichaMedica.getQualDoenca()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemMedicamento().equals("Sim")){%>
                                                    <tr>    
                                                        <th>Estudante faz uso de medicamento controlado, qual?</th>
                                                        <td><%=fichaMedica.getQualMedicamento()%></td>
                                                    </tr>
                                                    <%}if(fichaMedica.getTemMedicamentoDep().equals("Sim")){%>
                                                    <tr>    
                                                        <th>Há pessoa(s) na família que faz uso de medicamento controlado, qual?</th>
                                                        <td><%=fichaMedica.getQualMedicamentoDep()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemDeficiencia().equals("Sim")){%>
                                                    <tr>    
                                                        <th>Estudante tem alguma deficiência, qual?</th>
                                                        <td><%=fichaMedica.getQualDeficiencia()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemDeficienciaDep().equals("Sim")){%>
                                                    <tr>    
                                                        <th>Há pessoa(s) na família com deficiência, qual?</th>
                                                        <td><%=fichaMedica.getQualDeficienciaDep()%></td>
                                                    </tr>
                                                    <%}%>
                                                    
                                                </table>
                                            </div>
                                           </div>
                                          </div>
                                            <%if (deps.size() == 0) { %>    
                                           <h3 class="ui-state-disabled">Estudante NÃO possui Dependentes</h3>
                                           <%}else{%>
                                           <h3>Dado(s) do(s) Dependente(s)</h3>
                                           <%}%>
                                           <div>
                                               <div id="accordion3">
                                                   <%for (Dependente d : deps) { %>
                                                    <h3><%=d.getNome().toUpperCase()%></h3>
                                                    <div>
                                                    <table class="table table-striped table-responsive-md">
                                                       <tr>    
                                                        <th>CPF:</th>
                                                        <td><%=d.getCpf()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>RG:</th>
                                                        <td><%=d.getRg()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>UF de Expedição:</th>
                                                        <td><%=d.getUfExpedicao().getNome()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Sexo:</th>
                                                        <td><%=d.getSexo()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Data de Nascimento:</th>
                                                        <%
                                                            SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
                                                        %>
                                                        <td><%=formatador.format(d.getDtn().getTime())%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>E-mail:</th>
                                                        <td><%=d.getEmail()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Telefone:</th>
                                                        <td><%=d.getTelefone()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Grau de Parentesco:</th>
                                                        <td><%=d.getGrauParentesco()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Atividade Ocupacional:</th>
                                                        <td><%=d.getAtividadeProf()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Renda Mensal:</th>
                                                        <td><script>document.write(formatarMoeda(<%=d.getRenda()%>));</script></td>
                                                       </tr>
                                                  </table>
                                                  </div>
                                                  <%}%>
                                               </div>
                                            </div>
                                            
                                           <h3>Dados Financeiros Renda/Despesa</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <tr>    
                                                        <th>Renda do Estudante</th>
                                                        <td><script>document.write(formatarMoeda(<%=empresa.getRenda()%>));</script></td>
                                                    </tr>

                                                    <tr> 
                                                        <%
                                                            Double total1 = new Double(0);
                                                            Double td = new Double(0);
                                                            Double perCapita = new Double(0);
                                                            int i = 0;
                                                            for (Dependente d : deps) {
                                                                i++;
                                                                td = td + d.getRenda();
                                                            }
                                                            total1 = empresa.getRenda() + td + empresa.getOrenda();
                                                            perCapita = total1 / (i + 1);
                                                        %>
                                                        <th>Renda Familiar Total:</th>
                                                        <td><script>document.write(formatarMoeda(<%=total1%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Renda per capita</th>
                                                        <td><script>document.write(formatarMoeda(<%=perCapita%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Despesas Familiar Total:</th>
                                                            <%
                                                                Double total = despesa.getAgua() + despesa.getEnergia()
                                                                        + despesa.getFarmacia() + despesa.getMoradia() + despesa.getOutrasDespesas() + despesa.getTelefone();
                                                            %>
                                                        <td><script>document.write(formatarMoeda(<%=total%>));</script></td>
                                                    </tr>

                                                </table>
                                            </div>
                                            <h3 class="ui-state-disabled">NÃO possui Bolsas Anteriores</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <tr>    
                                                        <th>Bolsa</th>
                                                        <th>Edital</th>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>teste</td>
                                                        <td>001 / 2040</td>
                                                    </tr>
                                                </table>
                                            </div>
                                         </div>

                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Documentos faltantes</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                                                        <div class="form-body">

                                                            <div class="form-group row">
                                                                <div class="col-md-3">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="cbdfrg" value="RG" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="cbdfrg">RG</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="cbdfcpf" value="CPF" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="cbdfcpf">CPF</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="cbdfce" value="Comprovante de endereço" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="cbdfce">Comprovante de Endereço</label>
                                                                        </div>                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <textarea  cols="40" rows="4" name="docf" id="docf"></textarea>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <label class="col-md-3 label-control" for="resultado">Resultado</label>
                                                                        <div class="col-md-9">
                                                                            <select id="resultado" name="resultado" class="form-control" required>
                                                                                <option selected="" disabled="">Selecione o Resultado</option>
                                                                                <option value="Classificado">Classificado</option>
                                                                                <option value="Classificado com falta de documentos">Classificado com falta de documentos</option>
                                                                                <option value="Eliminado">Eliminado</option>
                                                                            </select>
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