<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Daddos da Moradia</title>        
        <script type="text/javascript" >
            
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
                          
                        </div>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <h4 class="form-section"><i class="ft-user"></i>Dados da Moradia</h4>
                                                    <div class="card-text">
                                                        Preencha todos os campos corretamente
                                                    </div>
                                                    <%
                                                        if(aluno.getOndeReside()!=null){
                                                      %>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=alterar_4_passo&id=<%=session.getAttribute("aluno_id")%>">
                                                        <% } else {%>
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=cadastrar_4_passo&id=<%=session.getAttribute("aluno_id")%>">
                                                        <%}%>
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ondeReside">Onde Reside?*:</label>
                                                                <div class="col-md-4">
                                                                    <div class="input-group" >
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getOndeReside()!=null && aluno.getOndeReside().equals("rural")){
                                                                                    out.println("<input checked type='radio' name='ondeReside' id='rural' value='rural' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ondeReside' id='rural' value='rural' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="rural">Zona Rural (Indígena, Quilombola, Assentamento) &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                          <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getOndeReside()!=null && aluno.getOndeReside().equals("rural2")){
                                                                                    out.println("<input checked type='radio' name='ondeReside' id='rural2' value='rural2' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ondeReside' id='rural2' value='rural2' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="rural2">Zona Rural (Fazenda, Chácara, Sítio ) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getOndeReside()!=null && aluno.getOndeReside().equals("urbana")){
                                                                                    out.println("<input checked type='radio' name='ondeReside' id='urbana' value='urbana' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ondeReside' id='urbana' value='urbana' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="urbana">Zona Urbana &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                   </div>
                                                                </div>
                                                            </div>
                                                             <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="tipoMoradia">Em que Tipo de Moradia?*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" >
                                                                        <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("propriaQuitada")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='propriaQuitada' value='propriaQuitada' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='propriaQuitada' value='propriaQuitada' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label " for="propriaQuitada">Própria da Família (Quitada) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                    </div>
                                                                          <div class="input-group" >
                                                                          <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("propriaFinan")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='propriaFinan' value='propriaFinan' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='propriaFinan' value='propriaFinan' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="propriaFinan">Própria da Família (Financiada) &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                          </div>
                                                                          <div class="input-group" >
                                                                          <div class=" custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("propriaParc")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='propriaParc' value='propriaParc' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='propriaParc' value='propriaParc' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label " for="propriaParc">Própria da Família, adquirida por meio de projeto social de habitação com pagamento de parcelas &nbsp;&nbsp;</label>
                                                                        </div>
                                                                          </div>
                                                                           <div class="input-group" >
                                                                          <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("propriaSocialQuitada")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='propriaSocialQuitada' value='propriaSocialQuitada' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='propriaSocialQuitada' value='propriaSocialQuitada' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="propriaSocialQuitada">Própria da Família, adquirida por meio de projeto social de habitação quitado &nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                         <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("heranca")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='heranca' value='heranca' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='heranca' value='heranca' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="heranca">Herança &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                          <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("cedida")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='cedida' value='cedida' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='cedida' value='cedida' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="cedida">Cedida (Gratuita) &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                          <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("alugada")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='alugada' value='alugada' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='alugada' value='alugada' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="alugada">Alugada &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                         <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("terceirosSem")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='terceirosSem' value='terceirosSem' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='terceirosSem' value='terceirosSem' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="terceirosSem">Casa de Terceiros (Sem Contribuição) &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                          <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("terceirosCom")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='terceirosCom' value='terceirosCom' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='terceirosCom' value='terceirosCom' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="terceirosCom">Casa de Terceiros (Com Contribuição) &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                        <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("casaEstudante")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='casaEstudante' value='casaEstudante' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='casaEstudante' value='casaEstudante' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="casaEstudante">Casa de Estudante &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                           </div>
                                                                           <div class="input-group" >
                                                                          <div class="custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getTipoMoradia()!=null && aluno.getTipoMoradia().equals("ocupacao")){
                                                                                    out.println("<input checked type='radio' name='tipoMoradia' id='ocupacao' value='ocupacao' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='tipoMoradia' id='ocupacao' value='ocupacao' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          <label class="custom-control-label" for="ocupacao">Ocupação &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                   </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" >Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i>  <%
                                                        if(aluno.getOndeReside()!=null){
                                                      %>Salvar
                                                      <% } else {%>
                                                        Avançar
                                                        <%}%>
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

