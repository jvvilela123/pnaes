<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Despesa Mensal</title>        
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
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
        </script>
        <%@include file="../imports.jsp" %>
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <% session.getAttribute("aluno_id");
        %>
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
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <h4 class="form-section"><i class="ft-user"></i>Alteração dos Dados da Despesa Mensal</h4>
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <%
                                                        if(request.getParameter("status")!=null){
                                                        aluno.setStatusCadastro(request.getParameter("status"));
                                                        daoFactory.getAlunoDao().inserirOuAlterar(aluno);
                                                        }
                                                    %>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDespesa?opcao=alterar_4_passo&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="moradia">Moradia:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="moradia" id="moradia" value="<%=despesa.getMoradia()!=null?despesa.getMoradia():""%>" class="form-control" placeholder="valor gasto com Moradia" onKeyPress="return(moeda(this,'','.',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="agua">Agua:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="agua" id="agua" value="<%=despesa.getAgua()!=null?despesa.getAgua():""%>" class="form-control" placeholder="valor gasto com Agua" onKeyPress="return(moeda(this,'','.',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="energia">Energia:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="energia" value="<%=despesa.getEnergia()!=null?despesa.getEnergia():""%>" id="energia" class="form-control" placeholder="valor gasto com Energia" onKeyPress="return(moeda(this,'','.',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="telefone">Telefone:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="telefone"  value="<%=despesa.getTelefone()!=null?despesa.getTelefone():""%>" id="telefone" class="form-control" placeholder="valor gasto com Telefone" onKeyPress="return(moeda(this,'','.',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="farmacia">Farmacia:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="farmacia" id="farmacia" value="<%=despesa.getFarmacia()!=null?despesa.getFarmacia():""%>" class="form-control" placeholder="valor gasto com Farmacia" onKeyPress="return(moeda(this,'','.',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="outrasDespesas">Outras Despesas:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="outrasDespesas" value="<%=despesa.getOutrasDespesas()!=null?despesa.getOutrasDespesas():""%>" id="outrasDespesas" class="form-control" placeholder="valor gasto com Outras Despesas" onKeyPress="return(moeda(this,'','.',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-primary" type="button" >Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                    <i class="fa fa-check-square-o"></i> Salvar
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

