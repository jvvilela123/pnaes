<%-- 
    Document   : listar
    Created on : 17/08/2018, 00:06:08
    Author     : euzebio
--%>
<%@page import="modelo.Dependente"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Informações do Grupo Familiar</title>
        <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            function apagar(id,nome) {
                alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ATENÇÃO!</h5>', 'Deseja realmente excluir o membro familiar <h5 class="card-title">'+nome+'?</h5>', 
                function(){ 
                    var url = "../ServletDependente?opcao=excluir&id=" + id;
                    window.location = url; 
                }
                , function(){ alertify.error('Exclusão Cancelada')}).set('labels', {ok:'Excluir', cancel:'Cancelar'});;
                
                }
                
            function verificaGrupo() {
            
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
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Informações do Grupo Familiar</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <% if (aluno.getDependeciaFamiliar()!=null) { %>
                                            <form id="formGrupo" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=alterar_3_passo&id=<%=session.getAttribute("aluno_id")%>">
                                                <% } else {%>
                                             <form id="formGrupo" class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletAluno?opcao=cadastrar_3_passo&id=<%=session.getAttribute("aluno_id")%>"> 
                                             <%}%>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="moradia">Como Você Mora?*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <%
                                                                                if (aluno.getMoradia()!=null && aluno.getMoradia().equals("sozinho")){
                                                                                    out.println("<input checked type='radio' name='moradia' id='sozinho' value='sozinho' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='moradia' id='sozinho' value='sozinho' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sozinho">Sozinho&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMoradia()!=null && aluno.getMoradia().equals("comFamilia")){
                                                                                    out.println("<input checked type='radio' name='moradia' id='comFamilia' value='comFamilia' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='moradia' id='comFamilia' value='comFamilia' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="comFamilia">Com a Família&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                         <div class="d-inline-block custom-control custom-radio">
                                                                              <%
                                                                                if (aluno.getMoradia()!=null && aluno.getMoradia().equals("comTerceiros")){
                                                                                    out.println("<input checked type='radio' name='moradia' id='comTerceiros' value='comTerceiros' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='moradia' id='comTerceiros' value='comTerceiros' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                           
                                                                            <label class="custom-control-label" for="comTerceiros">Com Terceiros (Amigos, Conhecidos, etc...)</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dependenciaFamiliar">Como se Configura a sua Relação de Dependência Financeira?*:</label>
                                                                <div class="col-md-6">
                                                                    <div class="input-group" >
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getDependeciaFamiliar()!=null && aluno.getDependeciaFamiliar().equals("indepTodas")){
                                                                                    out.println("<input checked type='radio' name='dependenciaFamiliar' id='indepTodas' value='indepTodas' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='dependenciaFamiliar' id='indepTodas' value='indepTodas' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                          
                                                                            <label class="custom-control-label" for="indepTodas">É INDEPENDENTE financeiramente e responsável por todas as despesas domésticas &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div> 
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getDependeciaFamiliar()!=null && aluno.getDependeciaFamiliar().equals("indepParte")){
                                                                                    out.println("<input checked type='radio' name='dependenciaFamiliar' id='indepParte' value='indepParte' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='dependenciaFamiliar' id='indepParte' value='indepParte' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                           <label class="custom-control-label" for="indepParte">É INDEPENDENTE financeiramente e responsável por parte das despesas doméstica &nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getDependeciaFamiliar()!=null && aluno.getDependeciaFamiliar().equals("depFamilia")){
                                                                                    out.println("<input checked type='radio' name='dependenciaFamiliar' id='depFamilia' value='depFamilia' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='dependenciaFamiliar' id='depFamilia' value='depFamilia' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                            <label class="custom-control-label" for="depFamilia">DEPENDENTE financeiramente da renda dos pais&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getDependeciaFamiliar()!=null && aluno.getDependeciaFamiliar().equals("depParentes")){
                                                                                    out.println("<input checked type='radio' name='dependenciaFamiliar' id='depParentes' value='depParentes' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='dependenciaFamiliar' id='depParentes' value='depParentes' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                            <label class="custom-control-label" for="depParentes">DEPENDENTE financeiramente de outros parentes&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                         <div class="d-inline-block custom-control custom-radio">
                                                                             <%
                                                                                if (aluno.getDependeciaFamiliar()!=null && aluno.getDependeciaFamiliar().equals("depTerceiros")){
                                                                                    out.println("<input checked type='radio' name='dependenciaFamiliar' id='depTerceiros' value='depTerceiros' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='dependenciaFamiliar' id='depTerceiros' value='depTerceiros' class='custom-control-input' required>");
                                                                                }
                                                                              %>
                                                                            <label class="custom-control-label" for="depTerceiros">DEPENDENTE financeiramente de terceiros (Amigos, Conhecidos, etc...)</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                                </br>

                                                            <div class="card-text" style="border-style: dashed; border-radius: 15px;">
                                                                <h5> Lista de membros Familiares</h5>
                                                        DEVERÃO SER INCLUÍDOS SOMENTE os membros do grupo em que reside ou que possui relação de 
                                                        dependência financeira.<br>
                                                  <div class="row">
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/dependente/cadastrar.jsp"><button class="mr-2 mb-2 btn btn-primary " type="button"><span class="os-icon os-icon-plus"></span>Incluir Membro Familiar</button></a>
                                                        </div>
                                                        
                                                    </div>                                                    
                                                    <%                                                        
                                                        DataFormat dataFormat = new DataFormat();
                                                        
                                                    %>
                                                    <table class="table table-striped table-responsive-md">
                                                        <tr>
                                                            <th>Nome</th>
                                                            <th>CPF</th>
                                                            <th>RG</th>
                                                            <th>Data de Nascimento</th>
                                                            <th>Sexo</th>
                                                            <th>Telefone</th>
                                                            <th>Grau Parentesco</th>
                                                            <th>Aluno</th>
                                                            <th>Alterar</th>
                                                            <th>Excluir</th>
                                                        </tr>
                                                        <%                    for (Dependente d : dependentes) {
                                                        %>
                                                        <tr>
                                                            <td><%=d.getNome()%></td>
                                                            <td><%=d.getCpf()%></td>
                                                            <td><%=d.getRg()%></td>
                                                            <td><%=dataFormat.formatarData(d.getDtn())%></td>
                                                            <td><%=d.getSexo()%></td>
                                                            <td><%=d.getTelefone()%></td>
                                                            <td><%
                                                                if(d.getGrauParentesco().equals("Mae"))
                                                                        out.print("Mãe");
                                                                if(d.getGrauParentesco().equals("filho"))
                                                                        out.print("Filho(a)");
                                                                if(d.getGrauParentesco().equals("esposo"))
                                                                        out.print("Esposo(a)");
                                                                if(d.getGrauParentesco().equals("Avo"))
                                                                        out.print("Avó ou Avô");
                                                                if(d.getGrauParentesco().equals("primo"))
                                                                        out.print("Primo(a)");
                                                                if(d.getGrauParentesco().equals("outro"))
                                                                        out.print("Outro(Bisavós, Padrinhos, Amigos, ect...)");
                                                                %>
                                                              </td>
                                                            <td><%=d.getAluno().getNome()%></td>
                                                            <td><a href="alterar.jsp?id=<%=d.getId()%>" title="Editar" class="text-info"><div class="os-icon os-icon-edit"></div><span>Editar</span></a></td>
                                                            <td><a href="#" onclick="apagar(<%=d.getId()%>,'<%=d.getNome()%>')" title="Excluir" class="text-danger"><div class="os-icon os-icon-x"></div><span>Excluir</span></a></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                    </table>  
                                                      </div>
                                               </br>
                                                    <div class="form-group row">

                                                       
                                                        <div class="col-md-3">
                                                            <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                            <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save" onclick="verificaGrupo();">
                                                                <i class="fa fa-check-square-o"></i> Salvar
                                                            </button>
                                                         

                                                        </div>
                                                        
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                          </form>
                                        
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