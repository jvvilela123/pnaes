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
            
            function naotrabalha() {
                document.getElementById('div1').style.display = 'none';
                document.getElementById('div2').style.display = 'block';
                document.getElementById('div3').style.display = 'none';
                document.getElementById('autonomosim').checked = false;
                document.getElementById('autonomonao').checked = false;
            }
            function trabalha() {
                document.getElementById('div1').style.display = 'block';
                document.getElementById('div2').style.display = 'none';
                document.getElementById('div3').style.display = 'none';
                document.getElementById('autonomosim').checked = false;
                document.getElementById('autonomonao').checked = false;
                document.getElementById('fazsim').checked = false;
                document.getElementById('faznao').checked = false;

            }
            function trabalhaautonomo() {
                document.getElementById('div1').style.display = 'block';
                document.getElementById('div2').style.display = 'none';
                document.getElementById('div3').style.display = 'none';

            }
            function trabalhaempresa() {
                document.getElementById('div3').style.display = 'block';
                document.getElementById('div2').style.display = 'none';
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
                alertify.errorAlert("<h6 class='card-title'>Preencha o campo Tem Carteira de Trabalho.</h6>");
                prencheuTudo = false;
                }else if(!verificaRadioChecadoPeloName('tab')){
                document.getElementById('tabsim').focus();
                alertify.errorAlert("<h6 class='card-title'>Preencha o campo Trabalha atualmente.</h6>");
                prencheuTudo = false;
             }
             var atividade = document.getElementById("atividade");
             var uf = document.getElementById("uf");
             var cidade = document.getElementById("cidade");
             // $('#div3').is(':visible') && 
             if ($('#div3').is(':visible')){
               if(document.getElementById('nome').value === ""){
              document.getElementById('nome').focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Nome da Empresa</h6>");
              prencheuTudo = false;
               } else if(document.getElementById('telefone').value === ""){
              document.getElementById('telefone').focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Telefone da Empresa</h6>");
              prencheuTudo = false;
               } else if(document.getElementById('responsavel').value === ""){
              document.getElementById('responsavel').focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Nome do responsável da empresa</h6>");
              prencheuTudo = false;
              } else if(uf.options[uf.selectedIndex].value === "Selecione o estado (UF)"){
              uf.focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Estado (UF)</h6>");
              prencheuTudo = false;
               } else if(cidade.options[cidade.selectedIndex].value === "Selecione a cidade"){
              cidade.focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Cidade</h6>");
              prencheuTudo = false;
              } else if(atividade.options[atividade.selectedIndex].value === "Selecione a Sua Atividade Profissional"){
              atividade.focus();
              alertify.errorAlert("<h6 class='card-title'>Preencha o campo Sua Atividade Profissional</h6>");
              prencheuTudo = false;
               }
              }
             if ($('#div1').is(':visible')){
                if(!verificaRadioChecadoPeloName('autonomo')){
                document.getElementById('autonomosim').focus();
                alertify.errorAlert("<h6 class='card-title'>Preencha o campo Trabalha como autônomo .</h6>");
                prencheuTudo = false;
                }
            }
            
             if ($('#div2').is(':visible')){
                if(!verificaRadioChecadoPeloName('faz')){
                document.getElementById('fazsim').focus();
                alertify.errorAlert("<h6 class='card-title'>Preencha o campo Qual a sua situação.</h6>");
                prencheuTudo = false;
                }
            }
          
                //if (!empresa.getAtividade().equals("Autonomo") && empresa.getTrabalha().equals("sim"))
                //if(!document.getElementById('doencaCronica1sim').s)
                if (prencheuTudo)
                    document.getElementById("formEmpresa").submit();
                 //}
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
                                                                                if (empresa.getCarteira().equals("sim")){
                                                                                    out.println("<input checked type='radio' name='carteira' id='carteirasim' value='sim' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='carteira' id='carteirasim' value='sim' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="carteirasim">Sim</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                 
                                                                                if (empresa.getCarteira().equals("nao")) {
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
                                                                <label class="col-md-3 label-control" for="tab">Trabalha atualmente ?*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <%
                                                                                System.out.println("EMpresa:" + empresa.getTrabalha());
                                                                                if (empresa.getTrabalha().equals("sim")) {
                                                                                    out.println("<input checked type='radio' name='tab' id='tabsim' value='sim' class='custom-control-input' onclick='trabalha();' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tab' id='tabsim' value='sim' class='custom-control-input' onclick='trabalha();'required>");
                                                                                }
                                                                            %>
                                                                          
                                                                            <label class="custom-control-label" for="tabsim">Sim</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                if (empresa.getTrabalha().equals("nao")) {
                                                                                    out.println("<input checked type='radio' name='tab' id='tabnao' value='nao' class='custom-control-input' onclick='naotrabalha();' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tab' id='tabnao' value='nao' class='custom-control-input' onclick='naotrabalha();'required>");
                                                                                }
                                                                            %>
                                                                           
                                                                            <label class="custom-control-label" for="tabnao">Não</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                            <%
                                                                                if (empresa.getTrabalha().equals("sim")) {
                                                                                    out.println("<div id='div1' class='show'>");
                                                                                } else {
                                                                                    out.println("<div id='div1' class='hide'>");
                                                                                }
                                                                            %>
                                                          
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="autonomo">Trabalha como autônomo ?*:</label>
                                                                    <div class="col-md-9">
                                                                        <div class="input-group">
                                                                            <div class="d-inline-block custom-control custom-radio mr-1">
                                                                                 <%
                                                                                if (empresa.getAtividade().equals("Autônomo")) {
                                                                                    out.println("<input checked type='radio' name='autonomo' id='autonomosim' value='sim' class='custom-control-input' onclick='trabalhaautonomo();'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='autonomo' id='autonomosim' value='sim' class='custom-control-input' onclick='trabalhaautonomo();'>");
                                                                                }
                                                                               %> 
                                                                               <label class="custom-control-label" for="autonomosim">Sim</label>
                                                                            </div>
                                                                            <div class="d-inline-block custom-control custom-radio">
                                                                                 <%
                                                                                if (!empresa.getAtividade().equals("Autônomo")) {
                                                                                    out.println("<input checked type='radio' name='autonomo' id='autonomonao' value='nao' class='custom-control-input' onclick='trabalhaempresa();'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='autonomo' id='autonomonao' value='nao' class='custom-control-input' onclick='trabalhaempresa();'>");
                                                                                }
                                                                               %>
                                                                                <label class="custom-control-label" for="autonomonao">Não</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%
                                                                if (!empresa.getAtividade().equals("Autônomo") && empresa.getTrabalha().equals("nao")) {
                                                                    out.println("<div id='div2' class='show'>");
                                                                } else {
                                                                    out.println("<div id='div2' class='hide'>");
                                                                }
                                                              %>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="faz">Qual a sua situação ?*:</label>
                                                                    <div class="col-md-9">
                                                                        <div class="input-group">
                                                                            <div class="d-inline-block custom-control custom-radio mr-1">
                                                                                <%
                                                                                if (empresa.getAtividade().equals("Aposentado/Pensionista")) {
                                                                                    out.println("<input checked type='radio' name='faz' id='fazsim' value='Aposentado/Pensionista' class='custom-control-input' >");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='faz' id='fazsim' value='Aposentado/Pensionista' class='custom-control-input'>");
                                                                                }
                                                                               %>
                                                                              <label class="custom-control-label" for="fazsim">Aposentado/Pensionista</label>
                                                                            </div>
                                                                            <div class="d-inline-block custom-control custom-radio">
                                                                               <%
                                                                                if (empresa.getAtividade().equals("Desempregado")) {
                                                                                    out.println("<input checked type='radio' name='faz' id='faznao' value='Desempregado' class='custom-control-input' >");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='faz' id='faznao' value='Desempregado' class='custom-control-input'>");
                                                                                }
                                                                               %>
                                                                                <label class="custom-control-label" for="faznao">Desempregado</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                           <%
                                                                if (!empresa.getAtividade().equals("Autônomo") && empresa.getTrabalha().equals("sim")) {
                                                                    out.println("<div id='div3' class='show'>");
                                                                } else {
                                                                    out.println("<div id='div3' class='hide'>");
                                                                }
                                                              %>
                                                              <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Trabalho</h4>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="nome">Local de Trabalho:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome da Empresa" value="<%=empresa.getNome()!=null?empresa.getNome():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="telefone">Telefone do Trabalho:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="telefone" id="telefone"  class="form-control" placeholder="Telefone da Empresa DDD 99999-9999" maxlength="14" OnKeyPress="formatar('## #####-####', this)" value="<%=empresa.getTelefone()!=null?empresa.getTelefone():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="responsavel">Nome do Responsável da Empresa:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="responsavel" id="responsavel" class="form-control" placeholder="Nome do responsavel" value="<%=empresa.getResponsavel()!=null?empresa.getResponsavel():""%>">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="logradouro">Logradouro (Rua, Avenida...) da Empresa:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="logradouro" id="logradouro" class="form-control" placeholder="Logradouro (Rua, Avenida...)" value="<%=empresa.getEndereco()!=null?empresa.getEndereco().getLogradouro():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="numero">Número:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero" value="<%=empresa.getEndereco()!=null?empresa.getEndereco().getNumero():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="bairro">Bairro:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="bairro" id="bairro" class="form-control" placeholder="Bairro" value="<%=empresa.getEndereco()!=null?empresa.getEndereco().getBairro():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="complemento">Complemento:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="complemento" id="complemento" class="form-control" placeholder="Complemento" value="<%=empresa.getEndereco()!=null?empresa.getEndereco().getComplemento():""%>">                                              
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="cep">CEP:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="cep" id="cep" class="form-control" placeholder="CEP" maxlength="10" OnKeyPress="formatar('##.###-###', this)" value="<%=empresa.getEndereco()!=null?empresa.getEndereco().getCep():""%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="uf">Estado (UF)*:</label>
                                                                    <div class="col-md-9">
                                                                        <select id="uf" name="uf" class="form-control">
                                                                            <option selected="" disabled="">Selecione o estado (UF)</option>
                                                                           
                                                                               <%
                                                                            List<Uf> ufs = daoFactory.getUfDao().listar();
                                                                            for (Uf uf : ufs) {
                                                                                if(empresa.getEndereco()!=null)
                                                                                out.print("<option selected value=" + empresa.getEndereco().getCidade().getUf().getId() + ">" + empresa.getEndereco().getCidade().getUf().getNome() + "</option>");
                                                                                out.print("<option value=" + uf.getId() + ">" + uf.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                           
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="cidade">Cidade:</label>
                                                                    <div class="col-md-9">
                                                                        <select id="cidade" name="cidade" class="form-control">
                                                                            <%
                                                                            //List<Cidade> cidades = new ArrayList<Cidade>();
                                                                            if(empresa.getEndereco()!=null){ 
                                                                            List<Cidade> cidades = daoFactory.getCidadeDao().buscarCidadePorUf(empresa.getEndereco().getCidade().getUf().getId());
                                                                           
                                                                              for (Cidade cidade : cidades) {
                                                                                if(empresa.getEndereco()!=null)
                                                                                out.print("<option selected value=" + empresa.getEndereco().getCidade().getId() + ">" + empresa.getEndereco().getCidade().getNome() + "</option>");
                                                                                out.print("<option value=" + cidade.getId() + ">" + cidade.getNome() + "</option>");
                                                                            }
                                                                            } else{
                                                                          %> 
                                                                        <option selected="" disabled="">Selecione primeiro o estado (UF) ↑</option>
                                                                        <% } %> 

                                                                        </select>
                                                                    </div>
                                                                </div> 
                                                             <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividade">Sua Ocupação*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividade" name="atividade" class="form-control">
                                                                        <option selected="" disabled="">Selecione a sua Ocupação</option>
                                                                        <%
                                                                        if(empresa.getAtividade().equals("Empregado CLT"))
                                                                        out.print("<option selected value='Empregado CLT'>Empregado de carteira Assinada</option>");
                                                                        else
                                                                        out.print("<option value='Empregado CLT'>Empregado de carteira Assinada</option>");
                                                                        if(empresa.getAtividade().equals("Funcionanio Publico"))
                                                                        out.print("<option selected value='Funcionanio Publico'>Funcionario Público</option>");
                                                                        else
                                                                        out.print("<option value='Funcionanio Publico'>Funcionario Público</option>");
                                                                        %>
                                                                        <!--<option value="Desempregado">Desempregado</option> 
                                                                        <option value="Empregado CLT">Empregado de carteira Assinada</option>
                                                                       <option value="Autonomo">Autonomo</option> 
                                                                        <option value="Funcionanio Publico">Funcionario Publico</option>
                                                                        <option value="Aposentado">Aposesntado</option> -->  
                                                                    </select>
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