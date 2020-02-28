<%-- 
    Document   : dadosInscricao
    Created on : 20/12/2019, 12:03:58
    Author     : Jo�o Vitor
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
                //N�o Permite digitar letras
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
            
            function edicaoDadosOcupacao() {
                 $('.visualizacaoDadosOcupacao').hide();
                 $('.edicaoDadosOcupacao').show();
                
            }
            function cancelaEdicaoDadosOcupacao(id_inscricao) {
               //  $('.visualizacaoDadosOcupacao').show();
                // $('.edicaoDadosOcupacao').hide();
                 //var url_atual = window.location.href;
                  var url = "/pnaes/documento/cadastrar.jsp?i_id="+id_inscricao+"&editar=1";
                 window.location = url; 
                
            }
            
            function edicaoDadosDespesa() {
                 $('.visualizacaoDadosDespesa').hide();
                 $('.edicaoDadosDespesa').show();
                
            }
            function cancelaEdicaoDadosDespesa(id_inscricao) {
               //  $('.visualizacaoDadosOcupacao').show();
                // $('.edicaoDadosOcupacao').hide();
                 //var url_atual = window.location.href;
                  var url = "/pnaes/documento/cadastrar.jsp?i_id="+id_inscricao+"&editar=1";
                 window.location = url; 
                
            }
          
            function excluirDependente(id,nome,id_inscricao) {
                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ATEN��O!</h5>', 'Deseja realmente excluir o membro familiar <h5 class="card-title">'+nome+'?</h5>', 
                function(){ 
                    var url = "/pnaes/ServletDependente?opcao=excluir&id=" + id+"&i_id="+id_inscricao;
                    window.location = url; 
                }
                , function(){ alertify.error('Exclus�o Cancelada');}).set('labels', {ok:'Excluir', cancel:'Cancelar'});;
                
                }
                
                function mostraCampos() {
                 if(document.getElementById('atividade').value === "Estagiario" ||
                    document.getElementById('atividade').value === "Empregado CLT" || 
                    document.getElementById('atividade').value === "Funcionanio Publico" || 
                    document.getElementById('atividade').value === "Servidor Publico"){ 
                    $('.DadosOcupacaoEmpregado').show();
                    $("#nome_empresa").prop('required',true);
                       $("#telefone_empresa").prop('required',true);
                 }else{
                    document.getElementById('nome_empresa').value = "";
                    document.getElementById('telefone_empresa').value = "";
                    document.getElementById('renda').value = "";
                    $("#nome_empresa").prop('required',false);
                    $("#telefone_empresa").prop('required',false);
                    $('.DadosOcupacaoEmpregado').hide();
                 }
                 if(document.getElementById('atividade').value === "Desempregado"){ 
                      // document.getElementById('div4').style.display = 'none';
                       document.getElementById('renda').value = "";
                       $("#renda").prop('required',false);
                 }else{
                       //document.getElementById('div4').style.display = 'block';
                       $("#renda").prop('required',true);
                 }
            }
            
            function temOutra() {
                if(document.getElementById('temOutrasDespesas').value === "sim"){
                    $('.DadosDespesaOutra').show();
                    $("#outrasDespesas").prop('required',true);
                    $("#qualOutrasDespesas").prop('required',true);
                    document.getElementById('outrasDespesas').value ='';
                }else{
                    $('.DadosDespesaOutra').hide();
                    document.getElementById('outrasDespesas').value ='R$ 0,00';
                    $("#outrasDespesas").removeAttr("required");
                    $("#qualOutrasDespesas").removeAttr("required");
                    }
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
                                                    <h3>Dados Pessoais (Documentos e Endere�o)</h3>
                                                    <div>
                                                      
                                                        <form method="Post" action="../ServletAluno?opcao=alterar_dados_pessoais&id=<%=inscricao.getAluno().getId()%>&i_id=<%=inscricao.getId()%>"> 
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>
                                                                <th>Nome:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getNome()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                 <input type="text" name="nome" id="nome"  value="<%=inscricao.getAluno().getNome()%>" class="form-control" placeholder="Nome" required>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>CPF:</th>
                                                                <td><%=inscricao.getAluno().getCpf()%></td>
                                                                <!--<td class="edicaoDadosPessoais" style="display: none;">
                                                                 <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" maxlength="11" value="<%=inscricao.getAluno().getCpf()%>" required >
                                                                <td>-->
                                                            </tr> 
                                                            <tr>
                                                                <th>RG:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getRg()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG" value="<%=inscricao.getAluno().getRg()%>" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Uf de Exped��o do RG:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getUfExpedicao().getNome()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;"> 
                                                                    <select id="ufe" name="ufe" class="form-control" required>
                                                                       <option selected="" disabled="" value="">Selecione o Estado(UF) de Expedi��o do RG</option>
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
                                                                <th>Auto Declara��o Cor/Ra�a:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getAutoDeclaracao()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                    <select id="autoDeclaracao" name="autoDeclaracao" class="form-control" required>
                                                                        <option selected="" disabled="" value="">Selecione a sua Cor/Ra�a</option>
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
                                                                        
                                                                        if(inscricao.getAluno().getAutoDeclaracao().equals("Ind�gena"))
                                                                        out.print("<option selected value='Ind�gena'>Ind�gena</option>");
                                                                        else
                                                                        out.print("<option value='Ind�gena'>Ind�gena</option>");
                                                                        
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
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Lougradouro:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getLogradouro()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="logradouro" id="logradouro"  class="form-control" placeholder="Logradouro" value="<%=inscricao.getAluno().getEndereco().getLogradouro()%>" required>
                                                                </td>
                                                            </tr>
                                                            <%if(!inscricao.getAluno().getEndereco().getComplemento().equals("") && inscricao.getAluno().getEndereco().getComplemento()!= null){%>
                                                            <tr>    
                                                                <th>Complemento:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getComplemento()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="complemento" id="complemento"  class="form-control" placeholder="Complemento" value="<%=inscricao.getAluno().getEndereco().getComplemento()%>" required>
                                                                </td>
                                                            </tr>
                                                            <%}%>
                                                            <tr>    
                                                                <th>N�mero:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getNumero()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="numero" id="numero"  class="form-control" placeholder="N�mero" value="<%=inscricao.getAluno().getEndereco().getNumero()%>" required>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Bairro:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getBairro()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="bairro" id="bairro"  class="form-control" placeholder="Bairro" value="<%=inscricao.getAluno().getEndereco().getBairro()%>" required>
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <th>CEP:</th>
                                                                <td class="visualizacaoDadosPessoais"><%=inscricao.getAluno().getEndereco().getCep()%></td>
                                                                <td class="edicaoDadosPessoais" style="display: none;">
                                                                  <input type="text" name="cep" id="cep"  class="form-control" placeholder="CEP" value="<%=inscricao.getAluno().getEndereco().getCep()%>" required>
                                                                </td>
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
                                                            <%if(request.getParameter("editar")!=null){%>
                                                            <tr>
                                                                <th colspan="2" style="text-align:center;" class="visualizacaoDadosPessoais"><button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDadosPessoais();"> Clique para Editar</th>
                                                                <th colspan="2" style="text-align:center; display: none;" class="edicaoDadosPessoais">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDadosPessoais();"> Cancelar Edi��o</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDadosPessoais();"> Salvar</button>
                                                                </th>
                                                            </tr>
                                                            <%}%>
                                                        </table>
                                                        </form>
                                                           
                                                    </div>
                                                    <h3>Informa��es do Estudante</h3>
                                                    <div>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>N�mero da Matr�cula:</th>
                                                                <td><%=inscricao.getAluno().getMatricula()%></td>
                                                            </tr>

                                                            <tr>    
                                                                <th>Curso:</th>
                                                                <td><%=inscricao.getAluno().getCurso().getCategoria().getNome()%> - <%=inscricao.getAluno().getCurso().getNome()%></td>
                                                            </tr>

                                                            <tr>    
                                                                <th>Per�odo:</th>
                                                                <td><%=inscricao.getAluno().getCurso().getqPeriodo()%>� <%=inscricao.getAluno().getCurso().getTipoPeriodo()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cursou Ensino Fundamental em Ensino:</th>
                                                                <td><%=inscricao.getAluno().getEnsinoFundamental()%></td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Cursou Ensino M�dio em Ensino:</th>
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
                                                                <th>Melhor Hor�rio para uma Visita:</th>
                                                                <td><%=inscricao.getAluno().getPeriodoVisita()%></td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <h3>Ocupa��o/Renda do Estudante</h3>
                                                    <div id="acordion_ocupacao">
                                                        <form method="Post" action="../ServletEmpresa?opcao=alterar_dados_ocupacao&aluno_id=<%=inscricao.getAluno().getId()%>&i_id=<%=inscricao.getId()%>">
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Tem carteira de Trabalho?</th>
                                                                <td class="visualizacaoDadosOcupacao"><%if(empresa.getTemCarteira())
                                                                    out.print("SIM");
                                                                    else
                                                                    out.print("N�O");%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                    <select id="carteira" name="carteira" class="form-control" required >
                                                                        <option selected="" disabled="" value="">Selecione uma das Op�oes</option>
                                                                    <%
                                                                        if (empresa.getTemCarteira())
                                                                        out.print("<option selected value='sim'>SIM</option>"
                                                                                + "<option value='nao'>N�O</option>");
                                                                        else
                                                                        out.print("<option selected value='nao'>N�O</option>"
                                                                                + "<option value='sim'>SIM</option>");%>
                                                                </td>
                                                            </tr>
                                                            
                                                            <tr>    
                                                                <th>Situa��o Profissional:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getAtividade()%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                     <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();" >
                                                                        <option selected="" disabled="" value="">Selecione a Ocupa��o</option>
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
                                                                        out.print("<option selected value='Autonomo'>Aut�nomo (Formal)</option>");
                                                                        else
                                                                        out.print("<option value='Autonomo'>Aut�nomo (Formal)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Autonomoi"))
                                                                        out.print("<option selected value='Autonomoi'>Aut�nomo (Informal)</option>");
                                                                        else
                                                                        out.print("<option value='Autonomoi'>Aut�nomo (Informal)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Funcionanio Publico"))
                                                                        out.print("<option selected value='Funcionanio Publico'>Funcion�rio P�blico (Contratado)</option>");
                                                                        else
                                                                        out.print("<option value='Funcionanio Publico'>Funcion�rio P�blico (Contratado)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Servidor Publico"))
                                                                        out.print("<option selected value='Servidor Publico'>Servidor P�blico (Concursado)</option>");
                                                                        else
                                                                        out.print("<option value='Servidor Publico'>Servidor P�blico (Concursado)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Estagiario"))
                                                                        out.print("<option selected value='Estagiario'>Estagi�rio</option>");
                                                                        else
                                                                        out.print("<option value='Estagiario'>Estagi�rio</option>");
                                                                        
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
                                                                <th>Remunera��o Bruta:</th>
                                                                <td class="visualizacaoDadosOcupacao"><%=empresa.getRenda()!=null?"R$ "+decimal.format(empresa.getRenda()):""%></td>
                                                                <td class="edicaoDadosOcupacao" style="display: none;">
                                                                    <input type="text" name="renda" id="renda"  class="form-control" value="<%="R$ "+decimal.format(empresa.getRenda())%>" required placeholder="Valor da Remunera��o Bruta do Aluno (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))">
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
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDadosOcupacao(<%=inscricao.getId()%>);"> Cancelar Edi��o</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDadosOcupacao();"> Salvar</button>
                                                                </th>
                                                            </tr>
                                                            <%}%>
                                                        </table>
                                                        </form>
                                                    </div>
                                                        <h3>Despesa do Estudante</h3>
                                                    <div>
                                                        <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDespesa?opcao=alterar_dados_despesa&aluno_id=<%=inscricao.getAluno().getId()%>&i_id=<%=inscricao.getId()%>&voltar="<%=request.getParameter("editar")%>>
                                                        <table class="table table-striped table-responsive-md">
                                                            <tr>    
                                                                <th>Moradia (Aluguel, Parcela de Financiamento, etc..):</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getMoradia())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="moradia" id="moradia"  class="form-control" value="<%="R$ "+decimal.format(despesa.getMoradia())%>" required placeholder="Valor da despensa com Moradia do Aluno (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>Alimenta��o:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getAlimentacao())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="alimentacao" id="alimentacao" value="<%=despesa.getAlimentacao()!=null?"R$ "+decimal.format(despesa.getAlimentacao()):""%>" class="form-control" placeholder="Valor Gasto com Alimenta��o" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </td>
                                                            </tr>
                                                            <tr>    
                                                                <th>�gua:</th>
                                                                <td class="visualizacaoDadosDespesa"><%="R$ "+decimal.format(despesa.getAgua())%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                    <input type="text" name="agua" id="agua" value="<%=despesa.getAgua()!=null?"R$ "+decimal.format(despesa.getAgua()):""%>" class="form-control" placeholder="Valor Gasto com �gua" onKeyPress="return(moeda(this,'.',',',event))" required>
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
                                                                <th>Farm�cia:</th>
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
                                                                    out.print("N�O");%></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                     <select id="temOutrasDespesas" name="temOutrasDespesas" class="form-control" required onchange="temOutra();">
                                                                        <option selected="" disabled="" value="">Selecione uma das Op�oes</option>
                                                                    <%
                                                                        if (despesa.getOutrasDespesas()>0)
                                                                        out.print("<option selected value='sim'>SIM</option>"
                                                                                + "<option value='nao'>N�O</option>");
                                                                        else
                                                                        out.print("<option selected value='nao'>N�O</option>"
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
                                                               
                                                                <th class="visualizacaoDadosDespesa">Especifica��o das Outras Despesas:</th>
                                                                <th class="edicaoDadosDespesa" style="display: none;">Especifique Quais s�o as Outras Despesas:</th>
                                                                <td class="visualizacaoDadosDespesa"><textarea name="qualOutrasDespesas2" rows="4" cols="50" placeholder="Especifique Quais s�o as Outras Despesas" id="qualOutrasDespesas2" disabled><%=despesa.getQualOutrasDespesas()!=null||despesa.getQualOutrasDespesas().equals("")?despesa.getQualOutrasDespesas():""%></textarea></td>
                                                                <td class="edicaoDadosDespesa" style="display: none;">
                                                                   <textarea name="qualOutrasDespesas" rows="4" cols="50" placeholder="Especifique Quais s�o as Outras Despesas" id="qualOutrasDespesas"<%
                                                                            if(despesa.getOutrasDespesas() > 0)
                                                                                out.print("required");%>><%=despesa.getQualOutrasDespesas()!=null||despesa.getQualOutrasDespesas().equals("")?despesa.getQualOutrasDespesas():""%></textarea>
                                                                </td>
                                                            </tr>
                                                             <%if(request.getParameter("editar")!=null){%>
                                                            <tr>
                                                                <th colspan="2" style="text-align:center;" class="visualizacaoDadosDespesa"><button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDadosDespesa();"> Clique para Editar</th>
                                                                <th colspan="2" style="text-align:center; display: none;" class="edicaoDadosDespesa">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDadosDespesa(<%=inscricao.getId()%>);"> Cancelar Edi��o</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <button type="submit" class="btn btn-success os-icon os-icon-save" onclick="salvarDadosDespesa();"> Salvar</button>
                                                                </th>
                                                            </tr>
                                                            <%}%>
                                                        </table>
                                                        </form>
                                                    </div>
                                                        <h3>Moradia do Estudante</h3>
                                                        <div>
                                                            <table class="table table-striped table-responsive-md">
                                                                <tr>    
                                                        <th>Onde Reside:</th>
                                                        <td>
                                                         <% if(inscricao.getAluno().getOndeReside().equals("rural"))
                                                                out.print("Zona Rural (Ind�gena, Quilombola, Assentamento)");
                                                        else if(inscricao.getAluno().getOndeReside().equals("rural2"))
                                                                out.print("Zona Rural (Fazenda, Ch�cara, S�tio )");
                                                        else if(inscricao.getAluno().getOndeReside().equals("urbana"))
                                                                out.print("Zona Urbana");%></td>
                                                              </tr>
                                                              <tr>    
                                                        <th>Tipo de Moradia:</th>
                                                        <td>
                                                         <% if(inscricao.getAluno().getTipoMoradia().equals("propriaQuitada"))
                                                                out.print("Pr�pria da Fam�lia (Quitada)");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("propriaFinan"))
                                                                out.print("Pr�pria da Fam�lia (Financiada)");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("propriaParc"))
                                                                out.print("Pr�pria da Fam�lia, adquirida por meio de projeto social de habita��o com pagamento de parcelas");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("propriaSocialQuitada"))
                                                                out.print("Pr�pria da Fam�lia, adquirida por meio de projeto social de habita��o quitado");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("heranca"))
                                                                out.print("Heran�a");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("cedida"))
                                                                out.print("Cedida (Gratuita)");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("alugada"))
                                                                out.print("Alugada");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("terceirosSem"))
                                                                out.print("Casa de Terceiros (Sem Contribui��o)");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("terceirosCom"))
                                                                out.print("Casa de Terceiros (Com Contribui��o)");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("casaEstudante"))
                                                                out.print("Casa de Estudante");
                                                        else if(inscricao.getAluno().getTipoMoradia().equals("ocupacao"))
                                                                out.print("Ocupa��o");%></td>
                                                              </tr>
                                                            </table>
                                                            
                                                        </div>
                                                            <%if(!fichaMedica.getTemDoenca() &&
                                                                 !fichaMedica.getTemDoencaDep() &&
                                                                 !fichaMedica.getTemMedicamento() &&
                                                                 !fichaMedica.getTemMedicamentoDep() &&
                                                                 !fichaMedica.getTemDeficiencia() &&
                                                                 !fichaMedica.getTemDeficienciaDep()){%>
                                                        <h3 class="ui-state-disabled">Estudante e Fam�lia N�O Possui Doen�as, Defici�ncias e Medicamentos</h3>
                                                        <%}else{%>
                                                        <h3>Sa�de do Estudante/Fam�lia</h3>
                                                        <%}%>
                                                <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <%if(fichaMedica.getTemDoenca()){%>
                                                    <tr>    
                                                        <th>Estudante tem alguma doen�a cr�nica, qual?</th>
                                                        <td><%=fichaMedica.getQualDoenca()%></td>
                                                    </tr>
                                                   <%}if(fichaMedica.getTemDoencaDep()){%>
                                                    <tr>    
                                                        <th>H� pessoa(s) na fam�lia com alguma doen�a cr�nica, qual?</th>
                                                        <td><%=fichaMedica.getQualDoencaDep()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemMedicamento()){%>
                                                    <tr>    
                                                        <th>Estudante faz uso de medicamento controlado, qual?</th>
                                                        <td><%=fichaMedica.getQualMedicamento()%></td>
                                                    </tr>
                                                    <%}if(fichaMedica.getTemMedicamentoDep()){%>
                                                    <tr>    
                                                        <th>H� pessoa(s) na fam�lia que faz uso de medicamento controlado, Quem?</th>
                                                        <td><%=fichaMedica.getQuemMedicamentoDep()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemDeficiencia()){%>
                                                    <tr>    
                                                        <th>Estudante tem alguma defici�ncia, qual?</th>
                                                        <td><%=fichaMedica.getQualDeficiencia()%></td>
                                                    </tr>
                                                     <%}if(fichaMedica.getTemDeficienciaDep()){%>
                                                    <tr>    
                                                        <th>H� pessoa(s) na fam�lia com defici�ncia, qual?</th>
                                                        <td><%=fichaMedica.getQualDeficienciaDep()%></td>
                                                    </tr>
                                                    <%}%>
                                                    
                                                </table>
                                            </div>
                                                    <h3>Depend�ncia Familiar</h3>
                                                        <div>
                                                            <table class="table table-striped table-responsive-md">
                                                                <tr>    
                                                        <th>Como o Estudante Mora:</th>
                                                        <td>
                                                         <% if(inscricao.getAluno().getMoradia().equals("sozinho"))
                                                                out.print("Sozinho");
                                                        else if(inscricao.getAluno().getMoradia().equals("comFamilia"))
                                                                out.print("Com a Fam�lia");
                                                        else if(inscricao.getAluno().getMoradia().equals("comTerceiros"))
                                                                out.print("Com Terceiros (Amigos, Conhecidos, etc...)");%></td>
                                                              </tr>
                                                              <tr>    
                                                        <th>Como se Configura a Rela��o de Depend�ncia Financeira:</th>
                                                        <td>
                                                         <% if(inscricao.getAluno().getDependeciaFamiliar().equals("indepTodas"))
                                                                out.print("� INDEPENDENTE financeiramente e respons�vel por todas as despesas dom�sticas");
                                                        else if(inscricao.getAluno().getDependeciaFamiliar().equals("indepParte"))
                                                                out.print("� INDEPENDENTE financeiramente e respons�vel por parte das despesas dom�stica");
                                                        else if(inscricao.getAluno().getDependeciaFamiliar().equals("depFamilia"))
                                                                out.print("DEPENDENTE financeiramente da renda dos pais");
                                                        else if(inscricao.getAluno().getDependeciaFamiliar().equals("depParentes"))
                                                                out.print("DEPENDENTE financeiramente de outros parentes");
                                                        else if(inscricao.getAluno().getDependeciaFamiliar().equals("depTerceiros"))
                                                                out.print("DEPENDENTE financeiramente de terceiros (Amigos, Conhecidos, etc...)");%>
                                                        </td>
                                                              </tr>
                                                            </table>
                                                            
                                                        </div>
                                                     
                                          </div>
                                           </div>
                                              
                                            <%if (dependentes.size() == 0) { %>    
                                           <h3>Estudante N�O possui Membro Familiar cadastrado</h3>
                                           <%}else if(dependentes.size() == 1){%>
                                           <h3>Dados do Membro Familiar</h3>
                                           <%}else{%>
                                           <h3>Dados dos <%=dependentes.size()>1?dependentes.size():""%> Membros Familiares</h3>
                                             <%}%>
                                             
                                           <div>
                                               <%if(request.getParameter("editar")!=null){%>
                                               <button type="button" class="btn btn-primary btn-sm os-icon os-icon-plus" onclick='window.location.href="/pnaes/dependente/cadastrar.jsp?idAluno=<%=inscricao.getAluno().getId()%>&nomeAluno=<%=inscricao.getAluno().getNome()%>&i_id=<%=inscricao.getId()%>"'>Incluir Membro Familiar</button>
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
                                                        <th>UF de Expedi��o:</th>
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
                                                        <td><%if(d.getGrauParentesco().equals("mae"))
                                                                        out.print("M�e");
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
                                                                        out.print("Av� ou Av�");
                                                                else if(d.getGrauParentesco().equals("primo"))
                                                                        out.print("Primo(a)");
                                                                else if(d.getGrauParentesco().equals("tio"))
                                                                        out.print("Tio(a)");
                                                                else if(d.getGrauParentesco().equals("outro"))
                                                                        out.print("Outro(Bisav�s, Padrinhos, Amigos, ect...)");
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
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="excluirDependente('<%=d.getId()%>','<%=d.getNome().toUpperCase()%>','<%=inscricao.getId()%>');"> Excluir Membro Familiar</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 <!--   <button type="button" class="btn btn-warning os-icon os-icon-edit" onclick="edicaoDependente();"> Clique para Editar</button>-->
                                                                    </th>
                                                               <!-- <th colspan="2" style="text-align:center; display: none;" class="edicaoDependente">
                                                                    <button type="button" class="btn btn-danger os-icon os-icon-delete" onclick="cancelaEdicaoDependente();"> Cancelar Edi��o</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                                        <th>Remunera��o Bruta do Estudante</th>
                                                        <td><script>document.write(formatarMoeda(<%=empresa.getRenda()%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Outra Renda do Estudante</th>
                                                        <td><script>document.write(formatarMoeda(<%=empresa.getOrenda()%>));</script></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Renda Total do Estudante(Remunera��o Bruta + Outra)</th>
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
                                                                Double total = despesa.getMoradia() + despesa.getAlimentacao() + despesa.getAgua() + despesa.getEnergia()
                                                                        + despesa.getTelefone() + despesa.getTransporte() + despesa.getFarmacia() + despesa.getOutrasDespesas();
                                                            %>
                                                        <td><script>document.write(formatarMoeda(<%=total%>));</script></td>
                                                    </tr>

                                                </table>
                                            </div>
                                                    <h3>Dados da Inscri��o</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md table-info h6">
                                                     <%if(inscricao.getEdital().getCampus().getId()==1){%>
                                                    <tr>    
                                                        <th>Almo�a no IFTO?:</th>
                                                        <td><%=inscricao.getAlmocaIfto()%></td>
                                                    </tr>
                                                     <%}%>
                                                    <tr>    
                                                        <th>1� Op��o de Bolsa:</th>
                                                        <td><%=inscricao.getBolsa1().getNome()%></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>2� Op��o de Bolsa:</th>
                                                        <td><%=inscricao.getBolsa2().getNome()%></td>
                                                    </tr>
                                                    <tr>    
                                                        <th>Justificativa do Estudante:</th>
                                                        
                                                        <td><textarea class="form-control"  rows="10" name="justificativa"  id="justificativa" disabled ><%=inscricao.getJustificativa()%></textarea></td>
                                                    </tr>
                                                    
                                                </table>
                                            </div>
                                                        <%if(entrevistas == null){%>
                                                            <h3 class="ui-state-disabled">N�O possui Aux�lios Anteriores</h3><div></div>
                                            <%}else{%>
                                            <h3>Aux�lios Anteriores</h3>
                                            <div>
                                                <table class="table table-striped table-responsive-md">
                                                    <tr>    
                                                        <th>Edital</th>
                                                        <th>Aux�lio 1</th>
                                                        <th>Resultado Aux�lio 1</th>
                                                        <th>Aux�lio 2</th>
                                                        <th>Resultado Aux�lio 2</th>
                                                        
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
