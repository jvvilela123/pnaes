<%-- 
    Document   : cadastrarDependente
    Created on : 12/02/2018, 06:29:44
    Author     : ronan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Aluno</title>
        <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            
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
                                                <h4 class="card-title" id="striped-row-layout-icons">Sistema PNAES</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Texto info
                                                    </div>
                                                    <center><h1>Aterar dados do Dependente</h1></center>
                                                        <%
                                                            DataFormat dataFormat = new DataFormat();
                                                            SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
                                                            Integer id = Integer.parseInt(request.getParameter("id"));
                                                            //Dependente dependente = daoFactory.getDependenteDao().pesquisarPorId(id);
                                                              out.println("DATA: "+formatador.format(dependente.getDtn().getTime()));
                                                           
                                                        %>
                                                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletDependente?opcao=alterar&id=<%=dependente.getId()%>">
                                                        <div class="form-body">
                                                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nome">Nome:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="nome" id="nome" class="form-control" value="<%=dependente.getNome()%>" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cpf">CPF:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="cpf" id="cpf" class="form-control" value="<%=dependente.getCpf()%>" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="rg">RG:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="rg" id="rg"  class="form-control" value="<%=dependente.getRg()%>" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ufe">Uf de Expedição do RG:</label>
                                                                <div class="col-md-9">
                                                                    <select id="ufe" name="ufe" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione a UF de Expedição</option>
                                                                        <%

                                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                                            for (Uf ufe : ufes) {
                                                                                out.print("<option selected value=" + dependente.getUfExpedicao().getId()+ ">" + dependente.getUfExpedicao().getNome() + "</option>");
                                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="sexo">Sexo:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if(dependente.getSexo().equals("Masculino")){
                                                                                    out.println("<input checked type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom' required>");                                         
                                                                                }else{
                                                                                    out.println("<input type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if(dependente.getSexo().equals("Feminino")){
                                                                                    out.println("<input checked type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof' required>");                                         
                                                                                }
                                                                                else{
                                                                                    out.println("<input type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento:</label>
                                                                <div class="col-md-9">
                                                                    <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" value="<%=formatador.format(dependente.getDtn().getTime())%>" maxlength="10" OnKeyPress="formatar('##/##/####', this)" required>
                                                                </div>
                                                            
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="email">E-mail:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="email" id="email"  class="form-control" value="<%=dependente.getEmail()%>" required>
                                                                </div>
                                                            </div>                                                
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="telefone">Telefone:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="telefone" id="telefone"  class="form-control" value="<%=dependente.getTelefone()%>" OnKeyPress="formatar('## #####-####', this)" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="grauParentesco">Grau de Parentesco:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="grauParentesco" id="grauParentesco" class="form-control" value="<%=dependente.getGrauParentesco()%>" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="atividadeProf">Atividade Ocupacional:</label>
                                                                <div class="col-md-9">
                                                                    <select id="atividadeProf" name="atividadeProf" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione a Atividade Profissional</option>
                                                                        <%
                                                                        if(dependente.getAtividadeProf().equals("Empregado CLT"))
                                                                        out.print("<option selected value='Empregado CLT'>Empregado de carteira Assinada</option>");
                                                                        else
                                                                        out.print("<option value='Empregado CLT'>Empregado de carteira Assinada</option>");
                                                                        if(dependente.getAtividadeProf().equals("Funcionanio Publico"))
                                                                        out.print("<option selected value='Funcionanio Publico'>Funcionario Público</option>");
                                                                        else
                                                                        out.print("<option value='Funcionanio Publico'>Funcionario Público</option>");
                                                                        if(dependente.getAtividadeProf().equals("Desempregado"))
                                                                        out.print("<option selected value='Desempregado'>Desempregado</option>");
                                                                        else
                                                                        out.print("<option value='Desempregado'>Desempregado</option>");
                                                                        if(dependente.getAtividadeProf().equals("Autonomo"))
                                                                        out.print("<option selected value='Autonomo'>Autônomo</option>");
                                                                        else
                                                                        out.print("<option value='Autonomo'>Autônomo</option>");
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="renda">Renda Mensal:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="renda" id="renda" class="form-control" value="<%=dependente.getRenda()%>" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/dependente/listar.jsp"><button  class="btn btn-primary" type="button" >Voltar</button></a>&nbsp;
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