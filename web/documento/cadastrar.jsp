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
                                                ta = document.getElementById("docf");
                                                var cb = [];
                                                cb[0] = document.getElementById("docPessoaisCand");
                                                cb[1] = document.getElementById("docPessoaisDeps");
                                                cb[2] = document.getElementById("compAgua");
                                                cb[3] = document.getElementById("compEnergia");
                                                cb[4] = document.getElementById("compTelefone");
                                                cb[5] = document.getElementById("compRendaCand");
                                                cb[6] = document.getElementById("compRendaDep");
                                                //console.log(cb)
                                                ta.value = '';
                                                for (i = 0; i < cb.length; i++) {
                                                    //console.log(i+" "+cb[i])
                                                    if (cb[i].checked) {
                                                        console.log(i + " " + cb[i].value+",");
                                                        ta.value = ta.value + cb[i].value+"," + "\n";
                                                    }
                                                }
                                            }


                                        </script>
                                    </div>
                                    <div class="col-md-6">
                                        <% 
                                            List<Entrevista> entrevistas = daoFactory.getEntrevistaDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                            Despesa despesa = daoFactory.getDespesaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
                                            empresa = daoFactory.getEmpresaDao().perquisarClassePorAluno(inscricao.getAluno().getId());
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
                                                        Selecione os documentos faltantes
                                                    </div>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                                                        <div class="form-body">

                                                            <div class="form-group row">
                                                                <div class="col-md-3">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="docPessoaisCand" value="Docs. Pessoais do Candidato" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="docPessoaisCand">Documentos Pessoais do Candidato</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="docPessoaisDeps" value="Docs. Pessoais do(s) Familiar(es)" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="docPessoaisDeps">Documentos Pessoais do(s) Familiar(es)</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="compAgua" value="Comp. de Água" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compAgua">Comprovante de Água</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="compEnergia" value="Comp. de Energia" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compEnergia">Comprovante de Energia</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="compTelefone" value="Comp. de Telefone" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compTelefone">Comprovante de Telefone</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="compRendaCand" value="Comp. de Renda do Candidato" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compRendaCand">Comprovante de Endereço</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox">
                                                                            <input type="checkbox" name="cbdf" id="compRendaDep" value="Comp. de Renda do(s) Familiar(es)" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compRendaDep">Comprovante de Renda do(s) Familiar(es)</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <textarea  cols="40" rows="8" name="docf" id="docf"></textarea>
                                                                </div>
                                                            </div>

                                                            <div class="form-group row">
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <label class="col-md-3 label-control" for="resultado">Resultado</label>
                                                                        <div class="col-md-9">
                                                                            <select id="resultado" name="resultado" class="form-control" required>
                                                                                <option selected='' disabled='' value=''>Selecione o Resultado</option>
                                                                                <option value="Classificado">Classificado</option>
                                                                                <option value="Classificado com falta de documentos">Classificado com falta de Documentos</option>
                                                                                <option value="Desclassificado por falta de Documento">Desclassificado por falta de Documento</option>
                                                                                <option value="Eliminado">Eliminado</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/documento/documento.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i> Enviar
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