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
        <title>Cadastro de Empresa</title>
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
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            
            function mostraCampos() {
                 if(document.getElementById('atividade').value === "Empregado CLT" || 
                    document.getElementById('atividade').value === "Funcionanio Publico" || 
                    document.getElementById('atividade').value === "Servidor Publico"){ 
                       document.getElementById('div3').style.display = 'block';
                 }else{
                    document.getElementById('nome').value = ""
                    document.getElementById('telefone').value = ""
                    document.getElementById('div3').style.display = 'none'; 
                 }
            }
            function moeda(a, e, r, t) {
                let n = ""
                        , h = j = 0
                        , u = tamanho2 = 0
                        , l = ajd2 = ""
                        , o = window.Event ? t.which : t.keyCode;
                if (13 == o || 8 == o)
                    return !0;
                if (n = String.fromCharCode(o),
                        -1 == "0123456789".indexOf(n))
                    return !1;
                for (u = a.value.length,
                        h = 0; h < u && ("0" == a.value.charAt(h) || a.value.charAt(h) == r); h++)
                    ;
                for (l = ""; h < u; h++)
                    -1 != "0123456789".indexOf(a.value.charAt(h)) && (l += a.value.charAt(h));
                if (l += n,
                        0 == (u = l.length) && (a.value = ""),
                        1 == u && (a.value = "0" + r + "0" + l),
                        2 == u && (a.value = "0" + r + l),
                        u > 2) {
                    for (ajd2 = "",
                            j = 0,
                            h = u - 3; h >= 0; h--)
                        3 == j && (ajd2 += e,
                                j = 0),
                                ajd2 += l.charAt(h),
                                j++;
                    for (a.value = "",
                            tamanho2 = ajd2.length,
                            h = tamanho2 - 1; h >= 0; h--)
                        a.value += ajd2.charAt(h);
                    a.value += r + l.substr(u - 2, u)
                }
                return !1
            }
            
            function verificaAtividade() {
                prencheuTudo = true;
             
             if(!verificaRadioChecadoPeloName('carteira')){
                document.getElementById('carteirasim').focus();
                alertify.errorAlert("<h6 class='card-title'>Selecione uma opção no campo Tem Carteira de Trabalho.</h6>");
                prencheuTudo = false;
                }else
                
               if(document.getElementById('atividade').value === ""){
               document.getElementById('atividade').focus();
               alertify.errorAlert("<h6 class='card-title'>Selecione uma opção no campo Sua Ocupação.</h6>");
               prencheuTudo = false;
                }
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
                                                <h4 class="card-title" id="striped-row-layout-icons">INFORMAÇÃO OCUPACIONAL DO CANDIDATO</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">

                                                    </div>
                                                 <form id="formEmpresa" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEmpresa?opcao=alterar_2_passo&aluno_id=<%=session.getAttribute("aluno_id")%>">
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
                                                                            <label class="custom-control-label" for="carteirasim">Sim</label>
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
                                                                    <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();">
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
                                                                        out.print("<option selected value='Funcionanio Publico'>Funcionario Público (Contratado)</option>");
                                                                        else
                                                                        out.print("<option value='Funcionanio Publico'>Funcionario Público (Contratado)</option>");
                                                                        
                                                                        if(empresa.getAtividade().equals("Servidor Publico"))
                                                                        out.print("<option selected value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                                                        else
                                                                        out.print("<option value='Servidor Publico'>Servidor Público (Concursado)</option>");
                                                                        
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
                                                                    empresa.getAtividade().equals("Funcionanio Publico") || 
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
                                                                        <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Local de Trabalho" value="<%=empresa.getNome()!=null?empresa.getNome():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="telefone">Telefone do Local de Trabalho:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="telefone" id="telefone"  class="form-control" placeholder="Telefone do Local de Trabalho DDD 99999-9999" maxlength="14" OnKeyPress="formatar('## #####-####', this)" value="<%=empresa.getTelefone()!=null?empresa.getTelefone():""%>">
                                                                    </div>
                                                                </div>
                                                              </div>
                                                            <div class="card-text">
                                                                Informe na seção abaixo <strong>APENAS os seus ganhos.</strong>  Não cabe informar aqui a renda que será declarada dos membros familiares, apenas se você possuir mais de uma renda.
                                                            </div><br>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="renda">Sua remuneração Bruta*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="renda" id="renda"  value="<%=empresa.getRenda()!=null?empresa.getRenda():""%>" class="form-control" placeholder="Remuneração Bruta" onKeyPress="return(moeda(this, '', '.', event))" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="orenda">Você possui outra renda Ex: Aluguel, Pensão Alimentícia, Bolsa Família, etc*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="orenda" id="orenda" value="<%=empresa.getOrenda()!=null?empresa.getOrenda():""%>" class="form-control" placeholder="Outra Renda do Aluno" onKeyPress="return(moeda(this, '', '.', event))" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger" type="button" >Voltar</button></a>&nbsp;
                                                                
                                                                <button type="reset" value="Limpar"  class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                
                                                                <button type="button" class="btn btn-primary" name="cadastrar" value="Cadastrar" onclick="verificaAtividade()">
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