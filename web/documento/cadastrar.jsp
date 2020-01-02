<%-- 
    Document   : cadastrar
    Created on : 22/03/2018, 08:11:55
    Author     : ronan
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Entrevista"%>
<%@page import="modelo.Bolsa"%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Análise de Documentos</title>
        <%@include file="../imports.jsp" %>
        

    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menuPdf.jsp" %>
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
                            <div style="width: 95%">
                                <br>
                                <div class="row">
                                    <div class="col-md-6" id="pdf">

                                        <script>
                                           
                                            function abrir(ele) {
                                                var elem = document.getElementById('dinamic_iframe');
                                                if (elem !== null) { // remover caso exista
                                                    elem.remove();
                                                }
                                                var iframe = document.createElement('iframe');
                                                iframe.src = ele.href;
                                                iframe.id = 'dinamic_iframe';
                                                iframe.width = "100%";
                                                iframe.height = 1800;
                                                document.getElementById("pdf").appendChild(iframe);
                                                return false;
                                            }
                                            function soma() {
                                                ta = document.getElementById("docf")
                                                var cb = []
                                                cb[0] = document.getElementById("cbdfrg")
                                                cb[1] = document.getElementById("cbdfcpf")
                                                cb[2] = document.getElementById("cbdfce")
                                                //console.log(cb)
                                                ta.value = ''
                                                for (i = 0; i < cb.length; i++) {
                                                    //console.log(i+" "+cb[i])
                                                    if (cb[i].checked) {
                                                        console.log(i + " " + cb[i].value)
                                                        ta.value = ta.value + cb[i].value + "\n"
                                                    }
                                                }
                                            }


                                        </script>
                                    </div>
                                    <div class="col-md-6">
                                        <% 
                                            List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                            Despesa despesa = daoFactory.getDespesaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                        %>
                                        <%@include file="../inscricao/dadosInscricao.jsp" %>
                                        

                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Documentos faltantes</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                                                        <div class="form-body">

                                                            <div class="form-group row">
                                                                <div class="col-md-3">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="cbdfrg" value="RG" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="cbdfrg">RG</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="cbdfcpf" value="CPF" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="cbdfcpf">CPF</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="cbdfce" value="Comprovante de endereço" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="cbdfce">Comprovante de Endereço</label>
                                                                        </div>                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <textarea  cols="40" rows="4" name="docf" id="docf"></textarea>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <label class="col-md-3 label-control" for="resultado">Resultado</label>
                                                                        <div class="col-md-9">
                                                                            <select id="resultado" name="resultado" class="form-control" required>
                                                                                <option selected="" disabled="">Selecione o Resultado</option>
                                                                                <option value="Classificado">Classificado</option>
                                                                                <option value="Classificado com falta de documentos">Classificado com falta de documentos</option>
                                                                                <option value="Eliminado">Eliminado</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
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