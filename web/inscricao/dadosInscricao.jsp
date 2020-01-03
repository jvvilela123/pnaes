<%-- 
    Document   : dadosInscricao
    Created on : 20/12/2019, 12:03:58
    Author     : João Vitor
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Dependente"%>
<%@page import="modelo.Entrevista"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Inscricao"%>
<%@page import="util.DataFormat"%>
<%@page import="dao.DaoFactory"%>
<%@page import="modelo.Empresa"%>


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
                                        <div class="col-md-3">
                                            <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/<%=inscricao.getAluno().getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" class="img_aluno">

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
                                            <%if (dependentes.size() == 0) { %>    
                                           <h3 class="ui-state-disabled">Estudante NÃO possui Dependentes</h3>
                                           <%}else{%>
                                           <h3>Dado(s) do(s) Dependente(s)</h3>
                                           <%}%>
                                           <div>
                                               <div id="accordion3">
                                                   <%for (Dependente d : dependentes) { %>
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
                                                            for (Dependente d : dependentes) {
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
                                                        <%if(entrevistas == null){%>
                                                            <h3 class="ui-state-disabled">NÃO possui Bolsas Anteriores</h3><div></div>
                                            <%}else{%>
                                            <h3>Bolsas Anteriores</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <tr>    
                                                        <th>Edital</th>
                                                        <th>Bolsa 1</th>
                                                        <th>Resultado Bolsa 1</th>
                                                        <th>Bolsa 2</th>
                                                        <th>Resultado Bolsa 2</th>
                                                        
                                                    </tr>
                                                    <%  
                                                       
                                                        
                                                        for (Entrevista e : entrevistas) { %>
                                                    <tr>
                                                        <td><%=e.getInscricao().getEdital().getNumero()%></td>
                                                        <td><%=e.getInscricao().getBolsa1().getNome()%></td>
                                                        <td><%=e.getResultadoBolsa1().toUpperCase()%>></td>
                                                        <td><%=e.getInscricao().getBolsa2().getNome()%></td>
                                                        <td><%=e.getResultadoBolsa2().toUpperCase()%>></td>
                                                    </tr>
                                                   <%}%>
                                            </table>
                                            </div>
                                           <%}%>
                                         </div>
