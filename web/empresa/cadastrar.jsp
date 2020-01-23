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
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
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
                 if(document.getElementById('atividade').value === "Desempregado"){ 
                       document.getElementById('div4').style.display = 'none';
                 }else{
                       document.getElementById('div4').style.display = 'block'; 
                 }
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

                                                    <form id="formEmpresa" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEmpresa?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="carteira">Tem Carteira de Trabalho ?*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <input type="radio" name="carteira" value="sim" class="custom-control-input" id="carteirasim" required>
                                                                            <label class="custom-control-label" for="carteirasim">Sim ou Extraviada&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <input type="radio" name="carteira" value="nao" class="custom-control-input" id="carteiranao" required>
                                                                            <label class="custom-control-label" for="carteiranao">Não</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividade">Sua Ocupação*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividade" name="atividade" class="form-control" required onchange="mostraCampos();">
                                                                        <option selected="" disabled="" value="">Selecione a Sua Ocupação</option>
                                                                        <option value="Desempregado">Desempregado</option>
                                                                        <option value="Empregado CLT">Empregado de Carteira Assinada</option>
                                                                        <option value="Trabalho sem carteira">Trabalho sem Carteira Assinada</option>
                                                                        <option value="Autonomo">Autônomo (Formal)</option>
                                                                        <option value="Autonomoi">Autônomo (Informal)</option>
                                                                        <option value="Funcionanio Publico">Funcionário Público (Contratado)</option>
                                                                        <option value="Servidor Publico">Servidor Público (Concursado)</option>
                                                                        <option value="Aposentado">Aposesntado</option> 
                                                                        <option value="Pensionista">Pensionista</option> 
                                                                    </select>
                                                                </div>
                                                            </div> 

                                                            <div id="div3" class="hide">
                                                                 <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Local de Trabalho</h4>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="nome">Nome do Local de Trabalho:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Local de Trabalho">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="telefone">Telefone do Local de Trabalho:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="telefone" id="telefone"  class="form-control" placeholder="Telefone do Local de Trabalho DDD 99999-9999" maxlength="14" OnKeyPress="formatar('## #####-####', this)">
                                                                    </div>
                                                                </div>
                                                               </div>
                                                                     
                                                            <div class="card-text">
                                                                Informe abaixo <b>APENAS</b> os seus ganhos. <strong>Não</strong> cabe informar aqui a renda que será declarada dos membros familiares, apenas se você possuir mais de uma renda.
                                                            </div><br>
                                                            <div id='div4' class='hide'>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="renda">Sua remuneração Bruta*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="renda" id="renda"  value="R$ 0.00" class="form-control" placeholder="Remuneração Bruta" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </div>
                                                            </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="orenda">Você possui outra renda Ex: Aluguel, Pensão Alimentícia, Bolsa Família, etc*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="orenda" id="orenda" value="R$ 0.00" class="form-control" placeholder="Outra Renda do Aluno" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar"  class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="button" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar" onclick="verificaAtividade()">
                                                                    <i class="la la-check-square-o"></i> Avançar
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