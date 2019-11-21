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

                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEmpresa?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="carteira">Tem Carteira de Trabalho?*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <input type="radio" name="carteira" value="sim" class="custom-control-input" id="carteirasim" required>
                                                                            <label class="custom-control-label" for="carteirasim">Sim</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <input type="radio" name="carteira" value="nao" class="custom-control-input" id="carteiranao" required>
                                                                            <label class="custom-control-label" for="carteiranao">Não</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="tab">Trabalha atualmente ?*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <input type="radio" name="tab" value="sim" class="custom-control-input" id="tabsim" onclick="trabalha();" required>
                                                                            <label class="custom-control-label" for="tabsim">Sim</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <input type="radio" name="tab" value="nao" class="custom-control-input" id="tabnao" onclick="naotrabalha();" required>
                                                                            <label class="custom-control-label" for="tabnao">Não</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="div1" class="hide">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="autonomo">Trabalha como autônomo ?*</label>
                                                                    <div class="col-md-9">
                                                                        <div class="input-group">
                                                                            <div class="d-inline-block custom-control custom-radio mr-1">
                                                                                <input type="radio" name="autonomo" value="sim" class="custom-control-input" id="autonomosim" onclick="trabalhaautonomo();">
                                                                                <label class="custom-control-label" for="autonomosim">Sim</label>
                                                                            </div>
                                                                            <div class="d-inline-block custom-control custom-radio">
                                                                                <input type="radio" name="autonomo" value="nao" class="custom-control-input" id="autonomonao" onclick="trabalhaempresa();">
                                                                                <label class="custom-control-label" for="autonomonao">Não</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="div2" class="hide">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="faz">Qual a sua situação ?</label>
                                                                    <div class="col-md-9">
                                                                        <div class="input-group">
                                                                            <div class="d-inline-block custom-control custom-radio mr-1">
                                                                                <input type="radio" name="faz" value="Aposentado/Pensionista" class="custom-control-input" id="fazsim">
                                                                                <label class="custom-control-label" for="fazsim">Aposentado/Pensionista</label>
                                                                            </div>
                                                                            <div class="d-inline-block custom-control custom-radio">
                                                                                <input type="radio" name="faz" value="Desempregado" class="custom-control-input" id="faznao">
                                                                                <label class="custom-control-label" for="faznao">Desempregado</label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="div3" class="hide">
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="nome">Nome da Empresa</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="telefone">Telefone</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="telefone" id="telefone"  class="form-control" placeholder="Telefone">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="responsavel">Responsavel</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="responsavel" id="responsavel" class="form-control" placeholder="Nome do responsavel">
                                                                    </div>
                                                                </div>

                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="logradouro">Logradouro</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="logradouro" id="logradouro" class="form-control" placeholder="Logradouro">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="numero">Numero</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="bairro">Bairro</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="bairro" id="bairro" class="form-control" placeholder="Bairro">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="complemento">Complemento</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="complemento" id="complemento" class="form-control" placeholder="Complemento">                                              </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="cep">CEP</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text" name="cep" id="cep" class="form-control" placeholder="CEP" maxlength="10" OnKeyPress="formatar('##.###-###', this)">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="uf">Uf</label>
                                                                    <div class="col-md-9">
                                                                        <select id="uf" name="uf" class="form-control">
                                                                            <option selected="" disabled="">Selecione a UF</option>
                                                                            <%
                                                                                List<Uf> ufs = daoFactory.getUfDao().listar();
                                                                                for (Uf uf : ufs) {
                                                                                    out.print("<option value=" + uf.getId() + ">" + uf.getNome() + "</option>");
                                                                                }
                                                                            %>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group row">
                                                                    <label class="col-md-3 label-control" for="cidade">Cidade</label>
                                                                    <div class="col-md-9">
                                                                        <select id="cidade" name="cidade" class="form-control">

                                                                        </select>
                                                                    </div>
                                                                </div> 
                                                             <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividade">Atividade Profissional</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividade" name="atividade" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione a Atividade Profissional</option>
                                                                        <!--<option value="Desempregado">Desempregado</option> -->
                                                                        <option value="Empregado CLT">Empregado de carteira Assinada</option>
                                                                        <!--<option value="Autonomo">Autonomo</option> -->
                                                                        <option value="Funcionanio Publico">Funcionario Público</option>
                                                                        <!--<option value="Aposentado">Aposesntado</option> -->  
                                                                    </select>
                                                                </div>
                                                            </div>   
                                                            </div>
                                                                     
                                                            <div class="card-text">
                                                                Informe na seção abaixo <b>APENAS</b> os seus ganhos. Não cabe informar aqui a renda que será declarada dos membros familiares, apenas se você possuir mais de uma renda.
                                                            </div><br>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="renda">Sua remuneração Bruta:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="renda" id="renda"  value="0.00" class="form-control" placeholder="Remuneração Bruta" onKeyPress="return(moeda(this, '', '.', event))" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="orenda">Você possui outra renda Ex: Aluguel, Pensão Alimentícia, Bolsa Família, etc</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="orenda" id="orenda" value="0.00" class="form-control" placeholder="Outra Renda do Aluno" onKeyPress="return(moeda(this, '', '.', event))" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <button type="reset" value="Limpar"  class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" class="btn btn-primary" name="cadastrar" value="Cadastrar">
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