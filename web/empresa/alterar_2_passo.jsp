<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.Uf"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração da Ocupação</title>
         <%@include file="../imports.jsp" %>
        <script>
            
            $(document).ready(function () {
               $('#uf').change(function () {
                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());
                });
            });
            
           
                
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i);
                if (texto.substring(0, 1) !== saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            
            function mostraCampos() {
                 if(document.getElementById('atividade').value === "Estagiario" ||
                    document.getElementById('atividade').value === "Empregado CLT" || 
                    document.getElementById('atividade').value === "Funcionanio Publico" || 
                    document.getElementById('atividade').value === "Servidor Publico"){ 
                       document.getElementById('div3').style.display = 'block';
                       $("#nome").prop('required',true);
                       $("#telefone").prop('required',true);
                 }else{
                    document.getElementById('nome').value = "";
                    document.getElementById('telefone').value = "";
                    document.getElementById('renda').value = "";
                    $("#nome").prop('required',false);
                    $("#telefone").prop('required',false);
                    document.getElementById('div3').style.display = 'none'; 
                 }
                 if(document.getElementById('atividade').value === "Desempregado"){ 
                       document.getElementById('div4').style.display = 'none';
                       document.getElementById('renda').value = "";
                       $("#renda").prop('required',false);
                 }else{
                       document.getElementById('div4').style.display = 'block';
                       $("#renda").prop('required',true);
                 }
            }
            
            
            function verificaAtividade() {
                prencheuTudo = true;
             
            if ($('#div3').is(':visible')){
              if(document.getElementById('nome').value === ""){
              document.getElementById('nome').focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Nome do Local de Trabalho</h6>");
              prencheuTudo = false;
               } else if(document.getElementById('telefone').value === ""){
              document.getElementById('telefone').focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Telefone do Local de Trabalho</h6>");
              prencheuTudo = false;
               } 
              }
           
        if (prencheuTudo)
           document.getElementById("formEmpresa").submit();
            }
            
        </script> 
    </head>
    <body class="menu-position-side menu-side-left full-screen" >
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                        <%
                                                if (request.getParameter("msg") != null) {
                                            %>
                                            <center>
                                                <div class="alert alert-danger" role="alert">
                                                    <strong><%=request.getParameter("msg")%></strong>
                                                </div>
                                            </center>
                                            <%
                                                }
                                            %>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">INFORMAÇÃO OCUPACIONAL DO CANDIDATO</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">

                                                    </div>
                                                    <form id="formEmpresa" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEmpresa?opcao=alterar_2_passo&aluno_id=<%=session.getAttribute("aluno_id")%>" onload="mostraCampos()">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="carteira">Tem Carteira de Trabalho?*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <%
                                                                                if (empresa.getTemCarteira()){
                                                                                    out.println("<input checked type='radio' name='carteira' id='carteirasim' value='sim' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='carteira' id='carteirasim' value='sim' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="carteirasim">Sim ou Extraviada&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                 
                                                                                if (!empresa.getTemCarteira()) {
                                                                                    out.println("<input checked type='radio' name='carteira' id='carteiranao' value='nao' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='carteira' id='carteiranao' value='nao' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="carteiranao">Não</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                            
                                                                            
                                                           <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividade">Sua Ocupação*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();" oninvalid="setCustomValidity('Por favor, preencha a Sua Ocupação')">
                                                                        <option selected="" disabled="" value="">Selecione a sua Ocupação</option>
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
                                                                </div>
                                                            </div> 

                                              
                                                                           
                                                           <%
                                                                if (empresa.getAtividade().equals("Empregado CLT") ||
                                                                    empresa.getAtividade().equals("Funcionario Publico") || 
                                                                    empresa.getAtividade().equals("Servidor Publico")) {
                                                                    out.println("<div id='div3' class='show'>");
                                                                } else {
                                                                    out.println("<div id='div3' class='hide'>");
                                                                }
                                                              %>
                                                              <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Local de Trabalho</h4>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="nome">Nome do Local de Trabalho:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Local de Trabalho" value="<%=empresa.getNome()!=null?empresa.getNome():""%>" 
                                                                               <%
                                                                            if(empresa.getNome()!=null && !empresa.getNome().equals(""))
                                                                                out.print("required");%>
                                                                                >
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="telefone">Telefone do Local de Trabalho (DD 99999-9999):</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="telefone" id="telefone"  class="form-control" pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$" placeholder="Telefone do Local de Trabalho DD 999999999" maxlength="12" OnKeyPress="formatar('## #########', this)" value="<%=empresa.getTelefone()!=null?empresa.getTelefone():""%>"
                                                                               <%
                                                                            if(empresa.getTelefone()!=null && !empresa.getTelefone().equals(""))
                                                                                out.print("required");%>
                                                                                >
                                                                    </div>
                                                                </div>
                                                              </div>
                                                            <div class="card-text">
                                                                Informe abaixo <strong>APENAS os seus ganhos.</strong>  Não cabe informar aqui a renda que será declarada dos membros familiares, apenas se você possuir mais de uma renda.
                                                            </div><br>
                                                             <%
                                                                if (empresa.getAtividade().equals("Desempregado")) {
                                                                    out.println("<div id='div4' class='hide'>");
                                                                } else {
                                                                    out.println("<div id='div4' class='show'>");
                                                                }
                                                              %>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="renda">Valor da Sua remuneração Bruta (R$ 0,00)*:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="renda" id="renda"  value="<%=empresa.getRenda()!=null&&empresa.getRenda()>0?"R$ "+decimal.format(empresa.getRenda()):""%>" class="form-control" placeholder="Valor da Sua Remuneração Bruta (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))" 
                                                                               <%
                                                                            if(empresa.getRenda()!=null&&empresa.getRenda()>0)
                                                                              out.print("required");%>>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="orenda">Valor da outra renda Ex: Aluguel, Pensão Alimentícia, Bolsa Família, etc (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="orenda" id="orenda" value="<%=empresa.getOrenda()!=null&&empresa.getOrenda()>0?"R$ "+decimal.format(empresa.getOrenda()):""%>" class="form-control" placeholder="Valor da Outra Renda do Aluno (R$ 0,00)" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                
                                                                <button type="reset" value="Limpar"  class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                
                                                                <button type="submit" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar">
                                                                    <i class="la la-check-square-o"></i> Salvar
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