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
                            <% if(request.getParameter("msg") != null){ %>
                         <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-success" role="alert">
                                    <strong><%=request.getParameter("msg")%></strong>
                                </div>
                            </div>
                        </div>
                                 <% }%>
                                 <% if(request.getParameter("msg2") != null){ %>
                         <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-danger" role="alert">
                                    <strong><%=request.getParameter("msg2")%></strong>
                                </div>
                            </div>
                        </div>
                                 <% }%>
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
                                                cb[7] = document.getElementById("compEnd");
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
                                                <h6 class="card-title" id="striped-row-layout-icons">Documentos faltantes</h6>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                       
                                                    </div>
                                                    <% if(request.getParameter("analisado") != null){ %>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar_analise&i_id=<%=inscricao.getId()%>">
                                                    <% }else{ %>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletInscricao?opcao=alterar&i_id=<%=inscricao.getId()%>">
                                                        <% } %>
                                                        <div class="form-body">

                                                            <div class="form-group row">
                                                                <div class="col-md-3">Selecione os Documentos Faltantes:
                                                                    <div class="input-group" >
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="docPessoaisCand" value="Docs. Pessoais do Candidato" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="docPessoaisCand">Documentos Pessoais do Candidato</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="docPessoaisDeps" value="Docs. Pessoais do(s) Familiar(es)" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="docPessoaisDeps">Documentos Pessoais do(s) Familiar(es)</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="compAgua" value="Comp. de Água" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compAgua">Comprovante de Água</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="compEnergia" value="Comp. de Energia" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compEnergia">Comprovante de Energia</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="compTelefone" value="Comp. de Telefone" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compTelefone">Comprovante de Telefone</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="compEnd" value="Comp. de Endereço" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compEnd">Comprovante de Endereço</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="compRendaCand" value="Comp. de Renda do Estudante" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compRendaCand">Comprovante de Renda do Estudante</label>
                                                                        </div>
                                                                        <div class="custom-control custom-checkbox" style="border-width: medium; border-style: solid; border-color: #F8CFCF;">
                                                                            <input type="checkbox" name="cbdf" id="compRendaDep" value="Comp. de Renda do(s) Familiar(es)" class="custom-control-input" onclick="soma()">
                                                                            <label class="custom-control-label" for="compRendaDep">Comprovante de Renda do(s) Familiar(es)</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-9">
                                                                    <textarea  cols="40" rows="8" name="docf" id="docf"><%if(request.getParameter("analisado") != null && inscricao.getDocumentosFaltantes()!=null){out.print(inscricao.getDocumentosFaltantes());}%></textarea>
                                                                </div>
                                                            </div>
                                                            <div class="card-header">
                                                <h6 class="card-title" id="striped-row-layout-icons">Observações:</h6>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                                 <textarea  cols="40" rows="8" name="observacaoAnaliseDocumental" id="observacaoAnaliseDocumental"><%if(request.getParameter("analisado") != null && inscricao.getObservacaoAnaliseDocumental()!=null){out.print(inscricao.getObservacaoAnaliseDocumental());}%></textarea>
                                            </div>
                                                            

                                                            <div class="form-group row">
                                                                <div class="col-md-12">
                                                                    <div class="input-group">
                                                                        <label class="col-md-12 label-control h4" for="resultado">Resultado da Análise Documental:</label>
                                                                        <div class="col-md-12">
                                                                            <select id="resultadoAnalise" name="resultadoAnalise" class="form-control" required>
                                                                                <option selected='' disabled='' value='' class="h6">Selecione o Resultado da Análise Documental</option>
                                                                                <%
                                                                               if(request.getParameter("analisado") != null && inscricao.getResultadoAnaliseDocumental()!=null){
                                                                                    if(inscricao.getResultadoAnaliseDocumental().equals("Classificado"))
                                                                                    out.print("<option selected value='Classificado' >Classificado</option>");
                                                                                    else
                                                                                    out.print("<option value='Classificado'>Classificado</option>");

                                                                                    if(inscricao.getResultadoAnaliseDocumental().equals("Classificado com falta de documentos"))
                                                                                    out.print("<option selected value='Classificado com falta de documentos'>Classificado com falta de Documentos</option>");
                                                                                    else
                                                                                    out.print("<option value='Classificado com falta de documentos'>Classificado com falta de Documentos</option>");
                                                                                    
                                                                                    if(inscricao.getResultadoAnaliseDocumental().equals("Desclassificado por falta de Documento"))
                                                                                    out.print("<option selected value='Desclassificado por falta de Documento'>Desclassificado por falta de Documento</option>");
                                                                                    else
                                                                                    out.print("<option value='Desclassificado por falta de Documento'>Desclassificado por falta de Documento</option>");
                                                                                    
                                                                                    if(inscricao.getResultadoAnaliseDocumental().equals("Eliminado"))
                                                                                    out.print("<option selected value='Eliminado'>Eliminado</option>");
                                                                                    else
                                                                                    out.print("<option value='Eliminado'>Eliminado</option>");
                                                                                    }else{%>
                                                                                <option value="Classificado">Classificado</option>
                                                                                <option value="Classificado com falta de documentos">Classificado com falta de Documentos</option>
                                                                                <option value="Desclassificado por falta de Documento">Desclassificado por falta de Documento</option>
                                                                                <option value="Eliminado">Eliminado</option>
                                                                                <%}%>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="usuario" value="<%=session.getAttribute("nome")%> em: <%=date.format(dataAtual.getTime())%>">
                                                            <div class="form-actions right">
                                                                <%if(request.getParameter("analisado") != null){%>
                                                                <a href="/pnaes/documento/documento.jsp?analisados=1"><button  class="btn btn-lg btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <%}else{%>
                                                                <a href="/pnaes/documento/documento.jsp"><button  class="btn btn-lg btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <%}%>
                                                              
                                                                <%if(request.getParameter("analisado") != null){%>
                                                                <button type="submit" value="Cadastrar" class="btn btn-lg btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i> Alterar Análise Documental
                                                                </button>
                                                                <%}else{%>
                                                                <button type="submit" value="Cadastrar" class="btn btn-lg btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i> Enviar
                                                                </button>
                                                                 <%}%>
                                                                 <div class="form-group row"><br></div>
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