<%-- 
    Document   : dadosInscricao
    Created on : 20/12/2019, 12:03:58
    Author     : João Vitor
--%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.Uf"%>
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
            
            $(function(){
                //Não Permite digitar letras
                  $('#cpf').keyup(function() {
                       $(this).val(this.value.replace(/\D/g, ''));
                    });
                    $('#rg').keyup(function() {
                       $(this).val(this.value.replace(/\D/g, ''));
                    });
                });
            
            function edicaoDadosPessoais() {
                 $('.visualizacaoDadosPessoais').hide();
                 $('.edicaoDadosPessoais').show();
                
            }
            function cancelaEdicaoDadosPessoais() {
                 $('.visualizacaoDadosPessoais').show();
                 $('.edicaoDadosPessoais').hide();
                
            }
            
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            

        </script>
        <%
             SimpleDateFormat formatador2 = new SimpleDateFormat("yyyy-MM-dd");
             
        %>
                                        <div class="col-md-3">
                                            <img src="/pnaes/alunos/<%=inscricao.getAluno().getCpf()%>/<%=inscricao.getAluno().getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" class="img_aluno">

                                        </div>
                                            <br>
                                        <div id="accordion">
                                            <h3>Dados do Estudante</h3>
                                            <div>
                                                <div id="accordion2">
                                                    <h3>Dados Pessoais (Documentos e Endereço)</h3>
                                                    <div>
                                                      
                                                        <form method="Post" action="../ServletAluno?opcao=alterar_dados_pessoais&id=<%=inscricao.getAluno().getId()%>&i_id=<%=inscricao.getId()%>"> 
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>
                                                                <th>Nome:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getNome()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                 <input type="text" name="nome" id="nome"  value="<%=inscricao.getAluno().getNome()%>" class="form-control" placeholder="Nome" required>
                                                                <td>
                                                            </tr>
                                                            <tr>
                                                                <th>CPF:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getCpf()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                 <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" maxlength="11" value="<%=inscricao.getAluno().getCpf()%>" required >
                                                                <td>
                                                            </tr> 
                                                            <tr>
                                                                <th>RG:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getRg()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG" value="<%=inscricao.getAluno().getRg()%>" required>
                                                                <td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Uf de Expedção do RG:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getUfExpedicao().getNome()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;"> 
                                                                    <select id="ufe" name="ufe" class="form-control" required>
                                                                       <option selected="" disabled="" value="">Selecione o Estado(UF) de Expedição do RG</option>
                                                                        <%

                                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                                            out.print("<option selected value=" + inscricao.getAluno().getUfExpedicao().getId()+ ">" + inscricao.getAluno().getUfExpedicao().getNome() + "</option>");
                                                                            for (Uf ufe : ufes) {
                                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                   </select>
                                                               </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Sexo:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getSexo()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                    <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if(inscricao.getAluno().getSexo().equals("Masculino")){
                                                                                    out.println("<input checked type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom' required>");                                         
                                                                                }else{
                                                                                    out.println("<input type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sexom">Masculino&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if(inscricao.getAluno().getSexo().equals("Feminino")){
                                                                                    out.println("<input checked type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof' required>");                                         
                                                                                }else{
                                                                                    out.println("<input type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Data de Nascimento:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=dataFormat.formatarData(inscricao.getAluno().getDtn())%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                   <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" value="<%=formatador2.format(inscricao.getAluno().getDtn().getTime())%>" maxlength="10" OnKeyPress="formatar('##/##/####', this)" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Idade:</th>
                                                                <td><%=inscricao.getAluno().getIdade()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Auto Declaração Cor/Raça:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getAutoDeclaracao()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                    <select id="autoDeclaracao" name="autoDeclaracao" class="form-control" required>
                                                                        <option selected="" disabled="" value="">Selecione a sua Cor/Raça</option>
                                                                        <%
                                                                        if(inscricao.getAluno().getAutoDeclaracao().equals("Branco"))
                                                                        out.print("<option selected value='Branco'>Branco</option>");
                                                                        else
                                                                        out.print("<option value='Branco'>Branco</option>");
                                                                        
                                                                        if(inscricao.getAluno().getAutoDeclaracao().equals("Pardo"))
                                                                        out.print("<option selected value='Pardo'>Pardo</option>");
                                                                        else
                                                                        out.print("<option value='Pardo'>Pardo</option>");
                                                                        
                                                                        if(inscricao.getAluno().getAutoDeclaracao().equals("Preto"))
                                                                        out.print("<option selected value='Preto'>Preto</option>");
                                                                        else
                                                                        out.print("<option value='Preto'>Preto</option>");
                                                                        
                                                                        if(inscricao.getAluno().getAutoDeclaracao().equals("Indígena"))
                                                                        out.print("<option selected value='Indígena'>Indígena</option>");
                                                                        else
                                                                        out.print("<option value='Indígena'>Indígena</option>");
                                                                        
                                                                        if(inscricao.getAluno().getAutoDeclaracao().equals("Outra"))
                                                                        out.print("<option selected value='Outra'>Outra</option>");
                                                                        else
                                                                        out.print("<option value='Outra'>Outra</option>");
                                                                        %>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Telefone:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getTelefone()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                    <input type="text" name="telefone" id="telefone"  class="form-control" value="<%=inscricao.getAluno().getTelefone()%>" OnKeyPress="formatar('## #####-####', this)" placeholder="Telefone" required>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>    
                                                                <th>E-mail:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEmail()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="email" id="email"  class="form-control" placeholder="E-mail" value="<%=inscricao.getAluno().getEmail()%>" required>
                                                                <td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Lougradouro:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getLogradouro()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="logradouro" id="logradouro"  class="form-control" placeholder="Logradouro" value="<%=inscricao.getAluno().getEndereco().getLogradouro()%>" required>
                                                                <td>
                                                            </tr>
                                                            <%if(!inscricao.getAluno().getEndereco().getComplemento().equals("") && inscricao.getAluno().getEndereco().getComplemento()!= null){%>
                                                            <tr>    
                                                                <th>Complemento:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getComplemento()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="complemento" id="complemento"  class="form-control" placeholder="Complemento" value="<%=inscricao.getAluno().getEndereco().getComplemento()%>" required>
                                                                <td>
                                                            </tr>
                                                            <%}%>
                                                            <tr>    
                                                                <th>Número:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getNumero()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="numero" id="numero"  class="form-control" placeholder="Número" value="<%=inscricao.getAluno().getEndereco().getNumero()%>" required>
                                                                <td>
                                                            </tr>
                                                            <tr>
                                                                <th>Bairro:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getBairro()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="bairro" id="bairro"  class="form-control" placeholder="Bairro" value="<%=inscricao.getAluno().getEndereco().getBairro()%>" required>
                                                                <td>
                                                            </tr>
                                                             <tr>
                                                                <th>CEP:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getCep()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="cep" id="cep"  class="form-control" placeholder="CEP" value="<%=inscricao.getAluno().getEndereco().getCep()%>" required>
                                                                <td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Estado:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getCidade().getUf().getNome()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;"> 
                                                                    <select id="uf" name="uf" class="form-control" required>
                                                                       <option selected="" disabled="" value="">Selecione o Estado(UF)</option>
                                                                        <%
                                                                            out.print("<option selected value=" + inscricao.getAluno().getEndereco().getCidade().getUf().getId()+ ">" + inscricao.getAluno().getEndereco().getCidade().getUf().getNome() + "</option>");
                                                                            for (Uf ufe : ufes) {
                                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                   </select>
                                                               </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cidade:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getCidade().getNome()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;"> 
                                                                    <select id="cidade" name="cidade" class="form-control" required>
                                                                       <option selected="" disabled="" value="">Selecione primeiro o estado (UF) ?</option>
                                                                        <%
                                                                             List<Cidade> cidades = daoFactory.getCidadeDao().buscarCidadePorUf(inscricao.getAluno().getEndereco().getCidade().getUf().getId());
                                                                             out.print("<option selected value=" + inscricao.getAluno().getEndereco().getCidade().getId()+ ">" + inscricao.getAluno().getEndereco().getCidade().getNome() + "</option>");
                                                                            for (Cidade cidade : cidades) {
                                                                                out.print("<option value=" + cidade.getId() + ">" + cidade.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                   </select>
                                                               </td>
                                                            </tr>
                                                            <tr>
                                                                <th colspan="2" style="text-align:center;" class="visualizacaoDadosPessoais"><button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDadosPessoais();"> Clique para Editar</th>
                                                                <th colspan="2" style="text-align:center; display: none;" class="edicaoDadosPessoais">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDadosPessoais();"> Cancelar Edição</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDadosPessoais();"> Salvar</button>
                                                                </th>
                                                                
                                                              </tr>
                                                        </table>
                                                        </form>
                                                           
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

                                                            <%if (inscricao.getAluno().getReprovou() != null && inscricao.getAluno().getReprovou()) {%>
                                                            <tr>    
                                                                <th>Quantidade de Disciplina(s) que Reprovou:</th>
                                                                <td><%=inscricao.getAluno().getReprovouQuantas()%> Disciplina(s)</td>
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
                                                                <td><%if(empresa.getTemCarteira())
                                                                    out.print("SIM");
                                                                    else
                                                                    out.print("NÃO");%></td>
                                                            </tr>
                                                            
                                                            <tr>    
                                                                <th>Situação Profissional:</th>
                                                                <td><%=empresa.getAtividade()%></td>
                                                            </tr>
                                                            
                                                            <%if(empresa.getAtividade().equals("Empregado CLT") || empresa.getAtividade().equals("Funcionanio Publico") || empresa.getAtividade().equals("Servidor Publico")){%>
                                                            <tr>    
                                                                <th>Nome da Empresa que Trabalha:</th>
                                                                <td><%=empresa.getNome()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Telefone da Empresa:</th>
                                                                <td><%=empresa.getTelefone()%></td>
                                                            </tr>
                                                            
                                                            <%}%>
                                                        </table>
                                                    </div>
                                                            <%if(!fichaMedica.getTemDoenca() &&
                                                                 !fichaMedica.getTemDoencaDep() &&
                                                                 !fichaMedica.getTemMedicamento() &&
                                                                 !fichaMedica.getTemMedicamentoDep() &&
                                                                 !fichaMedica.getTemDeficiencia() &&
                                                                 !fichaMedica.getTemDeficienciaDep()){%>
                                                        <h3 class="ui-state-disabled">Estudante e Família NÂO Possui Doenças, Deficiências e Medicamentos</h3>
                                                        <%}else{%>
                                                        <h3>Saúde do Estudante/Família</h3>
                                                        <%}%>
                                                <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <%if(fichaMedica.getTemDoenca()){%>
                                                    <tr>    
                                                        <th>Estudante tem alguma doença crônica, qual?</th>
                                                        <td><%=fichaMedica.getQualDoenca()%></td>
                                                    </tr>
                                                   <%}if(fichaMedica.getTemDoencaDep()){%>
                                                    <tr>    
                                                        <th>Há pessoa(s) na família com alguma doença crônica, qual?</th>
                                                        <td><%=fichaMedica.getQualDoencaDep()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemMedicamento()){%>
                                                    <tr>    
                                                        <th>Estudante faz uso de medicamento controlado, qual?</th>
                                                        <td><%=fichaMedica.getQualMedicamento()%></td>
                                                    </tr>
                                                    <%}if(fichaMedica.getTemMedicamentoDep()){%>
                                                    <tr>    
                                                        <th>Há pessoa(s) na família que faz uso de medicamento controlado, Quem?</th>
                                                        <td><%=fichaMedica.getQuemMedicamentoDep()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemDeficiencia()){%>
                                                    <tr>    
                                                        <th>Estudante tem alguma deficiência, qual?</th>
                                                        <td><%=fichaMedica.getQualDeficiencia()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemDeficienciaDep()){%>
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
                                           <h3 class="ui-state-disabled">Estudante NÃO possui Membro Familiar cadastrado</h3>
                                           <%}else if(dependentes.size() == 1){%>
                                           <h3>Dado do Membro Familiar</h3>
                                           <%}else{%>
                                           <h3>Dados dos <%=dependentes.size()>1?dependentes.size():""%> Membros Familiares</h3>
                                             <%}%>
                                           <div>
                                               <div id="accordion3">
                                                   <%for (Dependente d : dependentes) { %>
                                                    <h3><%=d.getNome().toUpperCase()%></h3>
                                                    <div>
                                                    <table class="table table-striped table-responsive-md">
                                                        <%if(d.getCpfd()!=null){%>
                                                       <tr>    
                                                        <th>CPF:</th>
                                                        <td><%=d.getCpfd()%></td>
                                                       </tr>
                                                        <%}%>
                                                       <%if(d.getRg()!=null){%>
                                                       <tr>    
                                                        <th>RG:</th>
                                                        <td><%=d.getRg()%></td>
                                                       </tr>
                                                       <%}%>
                                                        <%if(d.getUfExpedicao()!=null){%>
                                                       <tr>    
                                                        <th>UF de Expedição:</th>
                                                        <td><%=d.getUfExpedicao().getNome()%></td>
                                                       </tr>
                                                       <%}%>
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
                                                       <%if(d.getEmail()!=null){%>
                                                       <tr>    
                                                        <th>E-mail:</th>
                                                        <td><%=d.getEmail()%></td>
                                                       </tr>
                                                       <%}%>
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
                                                        <%
                                                            Double rendaTotal = new Double(0);
                                                            rendaTotal = empresa.getRenda() + empresa.getOrenda();
                                                        %>
                                                        <td><script>document.write(formatarMoeda(<%=rendaTotal%>));</script></td>
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
                                                        <th>Despesa Familiar Total:</th>
                                                            <%
                                                                Double total = despesa.getAgua() + despesa.getEnergia()
                                                                        + despesa.getFarmacia() + despesa.getMoradia() + despesa.getOutrasDespesas() + despesa.getTelefone();
                                                            %>
                                                        <td><script>document.write(formatarMoeda(<%=total%>));</script></td>
                                                    </tr>

                                                </table>
                                            </div>
                                                        <%if(entrevistas == null){%>
                                                            <h3 class="ui-state-disabled">NÃO possui Auxílios Anteriores</h3><div></div>
                                            <%}else{%>
                                            <h3>Auxílios Anteriores</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <tr>    
                                                        <th>Edital</th>
                                                        <th>Auxílio 1</th>
                                                        <th>Resultado Auxílio 1</th>
                                                        <th>Auxílio 2</th>
                                                        <th>Resultado Auxílio 2</th>
                                                        
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
