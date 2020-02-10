<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Membro Familiar</title>
     
         <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
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
            
            $(function(){
      
           //Não Permite digitar letras
          $('#cpf').keyup(function() {
               $(this).val(this.value.replace(/\D/g, ''));
            });
            $('#rg').keyup(function() {
               $(this).val(this.value.replace(/\D/g, ''));
            });
        });
            
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
                                 <%
                                       
                                        if(request.getParameter("moradia")!=null){
                                        Aluno aluno2 = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(alunoId);
                                        
                                        aluno2.setMoradia(request.getParameter("moradia"));
                                        aluno2.setDependeciaFamiliar(request.getParameter("dependenciaFamiliar"));
                                        
                                        daoFactory.getAlunoDao().inserirOuAlterar(aluno2);
                                        }
                                        msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
                                    %>
                                
                            </div>
                        </div>
                                    
                        <center>
                            <% if(request.getParameter("msg") != null){ %>
                         <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-danger" role="alert">
                                    <strong><%=request.getParameter("msg")%></strong>
                                </div>
                            </div>
                        </div>
                                 <% }%>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Cadastro de Membro Familiar</h4>
                                                <div class="card-text" >
                                                       Preencha corretamente todos os campos
                                                    </div>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                                
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDependente?opcao=cadastrar&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nome">Nome do Membro Familiar*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome do Membro Familiar" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cpf">CPF do Membro Familiar:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF do Membro Familiar" maxlength="11">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="rg">RG do Membro Familiar*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG do Membro Familiar">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ufe">Uf de Expedição do RG*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="ufe" name="ufe" class="form-control">
                                                                        <option selected="" disabled="" value="">Selecione a UF de Expedição</option>
                                                                        <%
                                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                                            for (Uf ufe : ufes) {
                                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="sexo">Sexo do Membro Familiar*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                                            <input type="radio" name="sexo" value="Masculino" class="custom-control-input" id="sexom"  required>
                                                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <input type="radio" name="sexo" value="Feminino" class="custom-control-input" id="sexof"  required>
                                                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento do Membro Familiar*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" maxlength="10" OnKeyPress="formatar('##/##/####', this)"  required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="telefone">Telefone do Membro Familiar* (DD 99999-9999):</label>
                                                                <div class="col-md-9">
                                                                    <input type="tel" name="telefone" id="telefone"  class="form-control" placeholder="99 999999999" pattern="[0-9]{2} [0-9]{4,6}[0-9]{3,4}$" maxlength="12" OnKeyPress="formatar('## #########', this)"  required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="grauParentesco">Grau de Parentesco do Membro Familiar*:</label>
                                                                <div class="col-md-9">
                                                                   <select id="grauParentesco" name="grauParentesco" class="form-control" required>
                                                                        <option selected="" disabled="" value="">Selecione o Grau de Parentesco do Membro Familiar</option>
                                                                        <option value="mae">Mãe</option>
                                                                        <option value="pai">Pai</option>
                                                                        <option value="madrasta">Madrasta</option>
                                                                        <option value="padrasto">Padrastro</option>
                                                                        <option value="filho">Filho(a)</option>
                                                                        <option value="esposo">Esposo(a)</option>
                                                                        <option value="avo">Avó ou Avô</option>
                                                                        <option value="primo">Primo(a)</option>
                                                                        <option value="tio">Tio(a)</option>
                                                                        <option value="outro">Outro(Bisavós, Padrinhos, Amigos, ect...)</option>
                                                                         
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            
                                                          <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividade">Ocupação do Membro Familiar*:</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividade" name="atividade" class="form-control" required>
                                                                        <option selected="" disabled="" value="">Selecione a Ocupação do Membro Familiar</option>
                                                                        <option value="Desempregado">Desempregado</option>
                                                                        <option value="Empregado CLT">Empregado de Carteira Assinada</option>
                                                                        <option value="Trabalho sem carteira">Trabalho sem Carteira Assinada</option>
                                                                        <option value="Autonomo">Autônomo (Formal)</option>
                                                                        <option value="Autonomoi">Autônomo (Informal)</option>
                                                                        <option value="Funcionanio Publico">Funcionario Público (Contratado)</option>
                                                                        <option value="Servidor Publico">Servidor Público (Concursado)</option>
                                                                        <option value="Aposentado">Aposesntado</option> 
                                                                        <option value="Pensionista">Pensionista</option> 
                                                                    </select>
                                                                </div>
                                                            </div> 
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="renda">Renda Total Mensal do Membro Familiar (R$ 0,00)*:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="renda" id="renda"  value="R$ 0.00" class="form-control" placeholder="Renda Total Mensal do Membro Familiar" onKeyPress="return(moeda(this,'.',',',event))"  required>
                                                                </div>
                                                            </div>        
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/dependente/listar.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i> Cadastrar
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