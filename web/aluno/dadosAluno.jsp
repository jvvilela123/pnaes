<%-- 
    Document   : dadosAluno
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
                                            <img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" class="img_aluno">

                                        </div>
                                      
                                          <div id="accordion2">
                                                    <h3>Dados Pessoais (Documentos e Endereço)</h3>
                                                    <div>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>
                                                                <th>Nome:</th>
                                                                <td><%=aluno.getNome()%></td>
                                                            </tr>
                                                            <tr>
                                                                <th>CPF:</th>
                                                                <td><%=aluno.getCpf()%></td>
                                                            </tr> 
                                                            <tr>
                                                                <th>RG:</th>
                                                                <td><%=aluno.getRg()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>UF de Expedição:</th>
                                                                <td><%=aluno.getUfExpedicao().getNome()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Sexo:</th>
                                                                <td><%=aluno.getSexo()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Data Nascimento:</th>
                                                                <td><%=dataFormat.formatarData(aluno.getDtn())%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Telefone:</th>
                                                                <td><%=aluno.getTelefone()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Email:</th>
                                                                <td><%=aluno.getEmail()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Lougradouro:</th>
                                                                <td><%=aluno.getEndereco().getLogradouro()%></td>
                                                            </tr>
                                                            <%if(!aluno.getEndereco().getComplemento().equals("") && aluno.getEndereco().getComplemento()!= null){%>
                                                            <tr>    
                                                                <th>Complemento:</th>
                                                                <td><%=aluno.getEndereco().getComplemento()%></td>
                                                            </tr>
                                                            <%}%>
                                                            <tr>    
                                                                <th>Numero:</th>
                                                                <td><%=aluno.getEndereco().getNumero()%></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Bairro:</th>
                                                                <td><%=aluno.getEndereco().getBairro()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cidade:</th>
                                                                <td><%=aluno.getEndereco().getCidade().getNome()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Estado:</th>
                                                                <td><%=aluno.getEndereco().getCidade().getUf().getNome()%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <h3>Informações do Estudante</h3>
                                                    <div>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Número da Matrícula:</th>
                                                                <td><%=aluno.getMatricula()%></td>
                                                            </tr>

                                                            <tr>    
                                                                <th>Curso:</th>
                                                                <td><%=aluno.getCurso().getCategoria().getNome()%> - <%=aluno.getCurso().getNome()%></td>
                                                            </tr>

                                                            <tr>    
                                                                <th>Período:</th>
                                                                <td><%=aluno.getCurso().getqPeriodo()%>º <%=aluno.getCurso().getTipoPeriodo()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cursou Ensino Fundamental em Ensino:</th>
                                                                <td><%=aluno.getEnsinoFundamental()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cursou Ensino Médio em Ensino:</th>
                                                                <td><%=aluno.getEnsinoMedio()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Ingressou no IFTO via:</th>
                                                                <td><%=aluno.getEntradaIfto()%></td>
                                                            </tr>

                                                            <%if (aluno.getReprovou() != null && !aluno.getReprovou().equals("")) {%>
                                                            <tr>    
                                                                <th>Disciplina(s) que Reprovou:</th>
                                                                <td><%=aluno.getReprovou()%></td>
                                                            </tr>
                                                            <%}%>
                                                            <tr>    
                                                                <th>Meio de Transporte:</th>
                                                                <td><%=aluno.getMeioTransporte()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Melhor Horário para uma Visita:</th>
                                                                <td><%=aluno.getPeriodoVisita()%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    
                                                            
                                            </div>
                                          
                                       
