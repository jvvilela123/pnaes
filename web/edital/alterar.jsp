<%@page import="modelo.Edital"%>
<%@page import="util.DataFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Edital</title>
        <script language=JavaScript src="../jquery.js" type="text/javascript"></script>
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)

                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
        </script>
        <%@include file="../imports.jsp" %>
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Aleração de Edital</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Preencha os dados corretamente
                                                    </div>
                                                    <%            
                                                        DataFormat dataFormat = new DataFormat();
                                                        edital = (Edital) daoFactory.getEditalDao().pesquisarPorId(Integer.parseInt(request.getParameter("id")));
                                                    %>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEdital?opcao=alterar&id=<%=edital.getId()%>&campus_id=<%=aluno.getCurso().getCampus().getId()%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="numero">Numero</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="numero" id="numero" class="form-control" value="<%=edital.getNumero()%>" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dataInicial">Data de Abertura</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="dataInicial" id="dataInicial" class="form-control" value="<%=dataFormat.formatarData(edital.getDataInicial())%>" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dataFinal">Data de Encerramento</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="dataFinal" id="dataFinal" class="form-control" value="<%=dataFormat.formatarData(edital.getDataFinal())%>" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/edital/listar.jsp"><button  class="btn btn-danger" type="button" >Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                    <i class="fa fa-check-square-o"></i>Enviar
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