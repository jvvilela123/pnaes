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
                                           
                                            <img src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg" width="150" height="200" alt="Clique para abrir" class="img_aluno">

                                        </div>
                                            <br>
                                      <div id="accordion">
                                            <h3>Dados do Estudante</h3>
                                            <div>
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
                                                                <th>Idade:</th>
                                                                <td><%=aluno.getIdade()%></td>
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

                                                            <%if (aluno.getReprovou()) {%>
                                                            <tr>    
                                                                <th>Disciplina(s) que Reprovou:</th>
                                                                <td><%=aluno.getReprovouQuantas()%></td>
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
                                                            
                                                            <h3>Ocupação/Renda do Estudante</h3>
                                                    <div id="acordion_ocupacao">
                                                        <form method="Post" action="../ServletEmpresa?opcao=alterar_dados_ocupacao&aluno_id=<%=aluno.getId()%>">
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Tem carteira de Trabalho?</th>
                                                                <td class="visualizacaoDadosOcupacao"><%if(empresa.getTemCarteira())
                                                                    out.print("SIM");
                                                                    else
                                                                    out.print("NÃO");%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                    <select id="carteira" name="carteira" class="form-control" required >
                                                                        <option selected="" disabled="" value="">Selecione uma das Opçoes</option>
                                                                    <%
                                                                        if (empresa.getTemCarteira())
                                                                        out.print("<option selected value='sim'>SIM</option>"
                                                                                + "<option value='nao'>NÃO</option>");
                                                                        else
                                                                        out.print("<option selected value='nao'>NÃO</option>"
                                                                                + "<option value='sim'>SIM</option>");%>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>    
                                                                <th>Situação Profissional:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getAtividade()%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                     <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();" >
                                                                        <option selected="" disabled="" value="">Selecione a Ocupação</option>
                                                                        <%
                                                                        if(empresa.getAtividade().equals("Desempregado"))
                                                                        out.print("<option selected value='Desempregado'>Desempregado</option>");
                                                                        else
                                                                        out.print("<option value='Desempregado'>Desempregado</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Empregado CLT"))
                                                                        out.print("<option selected value='Empregado CLT'>Empregado de Carteira Assinada</option>");
                                                                        else
                                                                        out.print("<option value='Empregado CLT'>Empregado de Carteira Assinada</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Trabalho sem carteira"))
                                                                        out.print("<option selected value='Trabalho sem carteira'>Trabalho sem Carteira Assinada</option>");
                                                                        else
                                                                        out.print("<option value='Trabalho sem carteira'>Trabalho sem Carteira Assinada</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Autonomo"))
                                                                        out.print("<option selected value='Autonomo'>Autônomo (Formal)</option>");
                                                                        else
                                                                        out.print("<option value='Autonomo'>Autônomo (Formal)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Autonomoi"))
                                                                        out.print("<option selected value='Autonomoi'>Autônomo (Informal)</option>");
                                                                        else
                                                                        out.print("<option value='Autonomoi'>Autônomo (Informal)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Funcionanio Publico"))
                                                                        out.print("<option selected value='Funcionanio Publico'>Funcionário Público (Contratado)</option>");
                                                                        else
                                                                        out.print("<option value='Funcionanio Publico'>Funcionário Público (Contratado)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Servidor Publico"))
                                                                        out.print("<option selected value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                                                        else
                                                                        out.print("<option value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Estagiario"))
                                                                        out.print("<option selected value='Estagiario'>Estagiário</option>");
                                                                        else
                                                                        out.print("<option value='Estagiario'>Estagiário</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Aposentado"))
                                                                        out.print("<option selected value='Aposentado'>Aposentado</option>");
                                                                        else
                                                                        out.print("<option value='Aposentado'>Aposentado</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Pensionista"))
                                                                        out.print("<option selected value='Pensionista'>Pensionista</option>");
                                                                        else
                                                                        out.print("<option value='Pensionista'>Pensionista</option>");
                                                                        %>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            
                                                            <%if(empresa.getAtividade().equals("Empregado CLT") || 
                                                                    empresa.getAtividade().equals("Funcionanio Publico") || 
                                                                    empresa.getAtividade().equals("Servidor Publico") || 
                                                                   empresa.getAtividade().equals("Estagiario")){%>
                                                           <tr class="DadosOcupacaoEmpregado">
                                                               <% } else {%>
                                                            <tr class="DadosOcupacaoEmpregado" style="display: none;"> 
                                                            <%}%>
                                                                <th>Nome da Empresa que Trabalha:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getNome()%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                            <input type="text" name="nome" id="nome_empresa" class="form-control" placeholder="Nome do Local de Trabalho" value="<%=empresa.getNome()!=null?empresa.getNome():""%>" 
                                                                    <%
                                                                            if(empresa.getNome()!=null && !empresa.getNome().equals(""))
                                                                                out.print("required");%>>
                                                            </td>
                                                            </tr>
                                                            <%if(empresa.getAtividade().equals("Empregado CLT") || 
                                                                    empresa.getAtividade().equals("Funcionanio Publico") || 
                                                                    empresa.getAtividade().equals("Servidor Publico") || 
                                                                   empresa.getAtividade().equals("Estagiario")){%>
                                                             <tr class="DadosOcupacaoEmpregado">
                                                               <% } else {%>
                                                            <tr class="DadosOcupacaoEmpregado" style="display: none;"> 
                                                            <%}%>   
                                                                <th>Telefone da Empresa:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getTelefone()%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                    <input type="text" name="telefone" id="telefone_empresa"  class="form-control" pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$"  placeholder="Telefone do Local de Trabalho DD 999999999" maxlength="12" OnKeyPress="formatar('## #########', this)" value="<%=empresa.getTelefone()!=null?empresa.getTelefone():""%>"
                                                                           <%
                                                                            if(empresa.getTelefone()!=null && !empresa.getTelefone().equals(""))
                                                                                out.print("required");%>>
                                                                </td>
                                                            </tr>
                                                            <%
                                                                if (!empresa.getAtividade().equals("Desempregado")) {%>
                                                                <tr class="DadosOcupacaoEmpregado">    
                                                              <%}else{%>
                                                              <tr class="DadosOcupacaoEmpregado" style="display: none;">
                                                              <%}%>
                                                                <th>Remuneração Bruta:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getRenda()!=null?"R$ "+decimal.format(empresa.getRenda()):""%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                    <input type="text" name="renda" id="renda"  class="form-control" value="<%="R$ "+decimal.format(empresa.getRenda())%>" required placeholder="Valor da Remuneração Bruta do Aluno (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>    
                                                                <th>Outra Renda:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getOrenda()!=null?"R$ "+decimal.format(empresa.getOrenda()):""%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                    <input type="text" name="orenda" id="orenda"  class="form-control" value="<%="R$ "+decimal.format(empresa.getOrenda())%>" required placeholder="Valor da Outra Renda do Aluno (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </td>
                                                            </tr>
                                                            
                                                                
                                                             <%if(request.getParameter("editar")!=null){%>
                                                            <tr>
                                                                <th colspan="2" style="text-align:center;" class="visualizacaoDadosOcupacao"><button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDadosOcupacao();"> Clique para Editar</th>
                                                                <th colspan="2" style="text-align:center; display: none;" class="edicaoDadosOcupacao">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDadosOcupacao(<%=aluno.getId()%>);"> Cancelar Edição</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDadosOcupacao();"> Salvar</button>
                                                                </th>
                                                            </tr>
                                                            <%}%>
                                                        </table>
                                                        </form>
                                                    </div>
                                                        <h3>Despesa do Estudante</h3>
                                                    <div>
                                                        <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDespesa?opcao=alterar_dados_despesa&aluno_id=<%=aluno.getId()%>">
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Moradia (Aluguel, Parcela de Financiamento, etc..):</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getMoradia())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="moradia" id="moradia"  class="form-control" value="<%="R$ "+decimal.format(despesa.getMoradia())%>" required placeholder="Valor da despensa com Moradia do Aluno (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Alimentação:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getAlimentacao())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="alimentacao" id="alimentacao" value="<%=despesa.getAlimentacao()!=null?"R$ "+decimal.format(despesa.getAlimentacao()):""%>" class="form-control" placeholder="Valor Gasto com Alimentação" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Àgua:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getAgua())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="agua" id="agua" value="<%=despesa.getAgua()!=null?"R$ "+decimal.format(despesa.getAgua()):""%>" class="form-control" placeholder="Valor Gasto com Àgua" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Energia:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getEnergia())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="energia" value="<%=despesa.getEnergia()!=null?"R$ "+decimal.format(despesa.getEnergia()):""%>" id="energia" class="form-control" placeholder="Valor Gasto com Energia" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Telefone:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getTelefone())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="telefone"  value="<%=despesa.getTelefone()!=null?"R$ "+decimal.format(despesa.getTelefone()):""%>" id="telefone" class="form-control" placeholder="valor gasto com Telefone" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Transporte:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getTransporte())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="transporte" id="transporte" value="<%=despesa.getTransporte()!=null?"R$ "+decimal.format(despesa.getTransporte()):""%>" class="form-control" placeholder="valor gasto com Transporte" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Farmácia:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getFarmacia())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="farmacia" id="farmacia" value="<%=despesa.getFarmacia()!=null?"R$ "+decimal.format(despesa.getFarmacia()):""%>" class="form-control" placeholder="valor gasto com Farmacia" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Tem Outras Despesas?:</th>
                                                                <td class="visualizacaoDadosDespesa"><%if(despesa.getOutrasDespesas()>0)
                                                                    out.print("SIM");
                                                                    else
                                                                    out.print("NÃO");%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                     <select id="temOutrasDespesas" name="temOutrasDespesas" class="form-control" required onchange="temOutra();">
                                                                        <option selected="" disabled="" value="">Selecione uma das Opçoes</option>
                                                                    <%
                                                                        if (despesa.getOutrasDespesas()>0)
                                                                        out.print("<option selected value='sim'>SIM</option>"
                                                                                + "<option value='nao'>NÃO</option>");
                                                                        else
                                                                        out.print("<option selected value='nao'>NÃO</option>"
                                                                                + "<option value='sim'>SIM</option>");%>
                                                                </td>
                                                            </tr>
                                                            <% if(despesa.getOutrasDespesas()!=null && despesa.getOutrasDespesas()<=0){%>
                                                            <tr class="DadosDespesaOutra" style="display: none;"> 
                                                                <%}else{%>
                                                           <tr class="DadosDespesaOutra">  
                                                                <%}%>
                                                               
                                                                <th>Valor Total das Outras Despesas:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getOutrasDespesas())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                 <input type="text" name="outrasDespesas" value="<%=despesa.getOutrasDespesas()!=null?"R$ "+decimal.format(despesa.getOutrasDespesas()):""%>" id="outrasDespesas" class="form-control" placeholder="Valor Gasto com Outras Despesas" onKeyPress="return(moeda(this,'.',',',event))"
                                                                        <%
                                                                            if(despesa.getOutrasDespesas() > 0)
                                                                                out.print("required");%>>
                                                                </td>
                                                            </tr>
                                                            <% if(despesa.getOutrasDespesas()!=null && despesa.getOutrasDespesas()<=0){%>
                                                            <tr class="DadosDespesaOutra" style="display: none;"> 
                                                                <%}else{%>
                                                           <tr class="DadosDespesaOutra">  
                                                                <%}%>
                                                               
                                                                <th class="visualizacaoDadosDespesa">Especificação das Outras Despesas:</th>
                                                                <th class="edicaoDadosDespesa" style="display: none;">Especifique Quais são as Outras Despesas:</th>
                                                                <td class="visualizacaoDadosDespesa"><textarea name="qualOutrasDespesas2" rows="4" cols="50" placeholder="Especifique Quais são as Outras Despesas" id="qualOutrasDespesas2" disabled><%=despesa.getQualOutrasDespesas()!=null||despesa.getQualOutrasDespesas().equals("")?despesa.getQualOutrasDespesas():""%></textarea></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                   <textarea name="qualOutrasDespesas" rows="4" cols="50" placeholder="Especifique Quais são as Outras Despesas" id="qualOutrasDespesas"<%
                                                                            if(despesa.getOutrasDespesas() > 0)
                                                                                out.print("required");%>><%=despesa.getQualOutrasDespesas()!=null||despesa.getQualOutrasDespesas().equals("")?despesa.getQualOutrasDespesas():""%></textarea>
                                                                </td>
                                                            </tr>
                                                             <%if(request.getParameter("editar")!=null){%>
                                                            <tr>
                                                                <th colspan="2" style="text-align:center;" class="visualizacaoDadosDespesa"><button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDadosDespesa();"> Clique para Editar</th>
                                                                <th colspan="2" style="text-align:center; display: none;" class="edicaoDadosDespesa">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDadosDespesa(<%=aluno.getId()%>);"> Cancelar Edição</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDadosDespesa();"> Salvar</button>
                                                                </th>
                                                            </tr>
                                                            <%}%>
                                                        </table>
                                                        </form>
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
                                           <h3>Estudante NÃO possui Membro Familiar cadastrado</h3>
                                           <%}else if(dependentes.size() == 1){%>
                                           <h3>Dados do Membro Familiar</h3>
                                           <%}else{%>
                                           <h3>Dados dos <%=dependentes.size()>1?dependentes.size():""%> Membros Familiares</h3>
                                             <%}%>
                                             
                                           <div>
                                               <%if(request.getParameter("editar")!=null){%>
                                               <button type="button" class="btn btn-primary btn-sm os-icon os-icon-plus" onclick='window.location.href="/pnaes/dependente/cadastrar.jsp?idAluno=<%=aluno.getId()%>&nomeAluno=<%=aluno.getNome()%>"'>Incluir Membro Familiar</button>
                                               <%}%>
                                               <div id="accordion3">
                                                   
                                                   <%for (Dependente d : dependentes) { %>
                                                    <h3><%=d.getNome()%></h3>
                                                    <div>
                                                    <table class="table table-striped table-responsive-md">
                                                        <%if(d.getCpfd()!=null){%>
                                                       <tr>    
                                                        <th>CPF:</th>
                                                        <td><%=d.getCpfd()%></td>
                                                       </tr>
                                                        <%}%>
                                                       <%if(d.getRg()!=null && d.getRg().trim()!=""){%>
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
                                                        <td><%
                                                                if(d.getGrauParentesco().equals("mae"))
                                                                        out.print("Mãe");
                                                                else if(d.getGrauParentesco().equals("pai"))
                                                                        out.print("Pai");
                                                                else if(d.getGrauParentesco().equals("madrasta"))
                                                                        out.print("Madrasta");
                                                                else if(d.getGrauParentesco().equals("padastro"))
                                                                        out.print("Padastro");
                                                                else if(d.getGrauParentesco().equals("filho"))
                                                                        out.print("Filho(a)");
                                                                else if(d.getGrauParentesco().equals("esposo"))
                                                                        out.print("Esposo(a)");
                                                                else if(d.getGrauParentesco().equals("avo"))
                                                                        out.print("Avó ou Avô");
                                                                else if(d.getGrauParentesco().equals("primo"))
                                                                        out.print("Primo(a)");
                                                                else if(d.getGrauParentesco().equals("tio"))
                                                                        out.print("Tio(a)");
                                                                else if(d.getGrauParentesco().equals("outro"))
                                                                        out.print("Outro(Bisavós, Padrinhos, Amigos, ect...)");
                                                                else
                                                                out.print(d.getGrauParentesco());%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Atividade Ocupacional:</th>
                                                        <td><%=d.getAtividadeProf()%></td>
                                                       </tr>
                                                       <tr>    
                                                        <th>Renda Mensal:</th>
                                                        <td><script>document.write(formatarMoeda(<%=d.getRenda()%>));</script></td>
                                                       </tr>
                                                       <%if(request.getParameter("editar")!=null){%>
                                                            <tr>
                                                                <th colspan="2" style="text-align:center;" class="visualizacaoDependente">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="excluirDependente('<%=d.getId()%>','<%=d.getNome().toUpperCase()%>','<%=aluno.getId()%>');"> Excluir Membro Familiar</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 <!--   <button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDependente();"> Clique para Editar</button>-->
                                                                    </th>
                                                               <!-- <th colspan="2" style="text-align:center; display: none;" class="edicaoDependente">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDependente();"> Cancelar Edição</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDependente();"> Salvar</button>
                                                                </th>-->
                                                            </tr>
                                                            <%}%>
                                                    </table>
                                                  </div>
                                                  <%}%>
                                               
                                               </div>
                                            </div>
                                            
                                           <h3>Demonstrativos Financeiros Renda/Despesa</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md table-success h6">
                                                    <tr>    
                                                        <th>Remuneração Bruta do Estudante</th>
                                                        <td><script>document.write(formatarMoeda(<%=empresa.getRenda()%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Outra Renda do Estudante</th>
                                                        <td><script>document.write(formatarMoeda(<%=empresa.getOrenda()%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Renda Total do Estudante(Remuneração Bruta + Outra)</th>
                                                        <%
                                                            Double rendaTotal = new Double(0);
                                                            rendaTotal = empresa.getRenda() + empresa.getOrenda();
                                                        %>
                                                        <td><script>document.write(formatarMoeda(<%=rendaTotal%>));</script></td>
                                                    </tr>
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
                                                            
                                                        if(dependentes.size() > 0) {
                                                        %>
                                                     
                                                    <tr>
                                                        <%if(dependentes.size() > 1){%>
                                                        <th>Renda Total dos <%=i%> Membros Familiares:</th>
                                                        <%}else if(dependentes.size() == 1){%>
                                                        <th>Renda do Membro Familiar:</th>
                                                        <%}%>
                                                        <td><script>document.write(formatarMoeda(<%=td%>));</script></td>
                                                    </tr>
                                                    <%}%>
                                                    <tr> 
                                                        <th>Renda Familiar Total:</th>
                                                        <td><script>document.write(formatarMoeda(<%=total1%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Renda per capita (<script>document.write(formatarMoeda(<%=total1%>));</script> / <%=(i + 1)%>) = </th>
                                                        <td><script>document.write(formatarMoeda(<%=perCapita%>));</script></td>
                                                    </tr>
                                                <!--</table>
                                                 <table class="table table-striped table-responsive-md table-danger">-->
                                                <tr class="table-danger">    
                                                        <th>Despesa Familiar Total:</th>
                                                            <%
                                                                Double total = despesa.getAgua() + despesa.getEnergia()
                                                                        + despesa.getFarmacia() + despesa.getMoradia() + despesa.getOutrasDespesas() + despesa.getTelefone();
                                                            %>
                                                        <td><script>document.write(formatarMoeda(<%=total%>));</script></td>
                                                    </tr>

                                                </table>
                                            </div>
                                                    
                                                            
                                            </div>
                                          
                                       
