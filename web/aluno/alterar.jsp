<%@page import="modelo.Curso"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Cidade"%>
<%@page import="modelo.Aluno"%>
<%@page import="util.DataFormat"%>
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
                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            $(document).ready(function () {
                $('#cat').change(function () {
                $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val());
                });

            });
            $(document).ready(function () {
                $('#curso').change(function () {
                    $('#periodo').load('/pnaes/periodoajax.jsp?curso=' + $('#curso').val());
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
                                                        Alteração de Dados
                                                    </div>
                                                    <center><h1>Alterar Dados do Aluno</h1></center>
                                                        <%                                                            
                                                            DataFormat dataFormat = new DataFormat();
                                                            Integer id = Integer.parseInt(request.getParameter("id"));
                                                            aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(id);
                                                        %>
                                                    <form  class="form form-horizontal striped-rows form-bordered" method="Post" action="../ServletAluno?opcao=alterar&id=<%=aluno.getId()%>">
                                                        <div class="form-body">
                                                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nome">Nome</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="nome" id="nome" class="form-control" value="<%=aluno.getNome()%>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cpf">CPF</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="cpf" id="cpf" class="form-control" value="<%=aluno.getCpf()%>" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nivel">Permissão</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if (aluno.getNivel().equals(1)) {
                                                                                    out.println("<input checked type='radio' name='nivel' value='1' class='custom-control-input' id='nivela'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='nivel' value='1' class='custom-control-input' id='nivela'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nivela">Aluno</label>
                                                                        </div>
                                                                       
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getNivel().equals(3)) {
                                                                                    out.println("<input checked type='radio' name='nivel' value='3' class='custom-control-input' id='nivelad'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='nivel' value='3' class='custom-control-input' id='nivelad'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nivelad">Adminstrador</label>
                                                                        </div>    
                                                                    </div>
                                                                </div>
                                                            </div>    
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="rg">RG</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="rg" id="rg"  class="form-control" value="<%=aluno.getRg()%>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ufe">Uf de Expedição</label>
                                                                <div class="col-md-9">
                                                                    <select id="ufe" name="ufe" class="form-control">
                                                                        <option selected="" disabled="">Selecione a UF de Expedição</option>
                                                                        <%

                                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                                            for (Uf ufe : ufes) {
                                                                                out.print("<option selected value=" + aluno.getUfExpedicao().getId() + ">" + aluno.getUfExpedicao().getNome() + "</option>");
                                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="sexo">Sexo</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if (aluno.getSexo().equals("Masculino")) {
                                                                                    out.println("<input checked type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='sexo' value='Masculino' class='custom-control-input' id='sexom'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sexom">Masculino</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getSexo().equals("Feminino")) {
                                                                                    out.println("<input checked type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='sexo' value='Feminino' class='custom-control-input' id='sexof'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sexof">Feminino</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="dtn" id="dtn" class="form-control" value="<%=dataFormat.formatarData(aluno.getDtn())%>" maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="email">Email</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="email" id="email"  class="form-control" value="<%=aluno.getEmail()%>">
                                                                </div>
                                                            </div>                                                
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="telefone">Telefone</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="telefone" id="telefone"  class="form-control" value="<%=aluno.getTelefone()%>">
                                                                </div>
                                                            </div>
                                                            <!--<div class="form-group row">
                                                                <label class="col-md-3 label-control" for="senha">Senha</label>
                                                                <div class="col-md-9">
                                                                    <input type="password" name="senha" id="senha" class="form-control" value="<%//aluno.getSenha()%>" id="senha" onkeyup="javascript:verifica()"/>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="csenha">Confirmar Senha</label>
                                                                <div class="col-md-9">
                                                                    <input type="password" name="csenha" id="csenha" class="form-control">
                                                                </div>
                                                            </div>-->

                                                            <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Endereço</h4>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="logradouro">Logradouro</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="logradouro" id="logradouro" class="form-control" value="<%=aluno.getEndereco().getLogradouro()%>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="numero">Numero</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="numero" id="numero" class="form-control" value="<%=aluno.getEndereco().getNumero()%>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="bairro">Bairro</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="bairro" id="bairro" class="form-control" value="<%=aluno.getEndereco().getBairro()%>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="complemento">Complemento</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="complemento" id="complemento" class="form-control" value="<%=aluno.getEndereco().getComplemento()%>">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cep">CEP</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="cep" id="cep" class="form-control" value="<%=aluno.getEndereco().getCep()%>" maxlength="10" OnKeyPress="formatar('##.###-###', this)">
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
                                                                                out.print("<option selected value=" + aluno.getEndereco().getCidade().getUf().getId() + ">" + aluno.getEndereco().getCidade().getUf().getNome() + "</option>");
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
                                                                        <%
                                                                            List<Cidade> cidades = daoFactory.getCidadeDao().buscarCidadePorUf(aluno.getEndereco().getCidade().getUf().getId());
                                                                            for (Cidade cidade : cidades) {
                                                                                out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                                                                out.print("<option value=" + cidade.getId() + ">" + cidade.getNome() + "</option>");
                                                                            }
                                                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                                                        %>        
                                                                    </select>
                                                                </div>
                                                            </div>        
                                                            <h4 class="form-section"><i class="ft-user"></i>Dados Estudantis</h4>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="matricula">Matricula</label>
                                                                <div class="col-md-9">
                                                                    <div class="position-relative has-icon-left">
                                                                        <input type="text" name="matricula" id="matricula" class="form-control" value="<%=aluno.getMatricula()%>">
                                                                        <div class="form-control-position">
                                                                            <i class="ft-user"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="cat">Modalidade do Curso:</label>
                                                                <div class="col-md-9">
                                                                    <select id="cat" name="cat" class="form-control" required>
                                                                        <option selected="" disabled="">Selecione Modalidade do Curso</option>
                                                                        <%
                                                                          List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                          out.print("<option selected value=" + aluno.getCurso().getCategoria().getId() + ">" + aluno.getCurso().getCategoria().getNome() + "</option>");
                                                                            for (Categoria categoria : categorias) {
                                                                              if(categoria.getId()!=aluno.getCurso().getCategoria().getId())
                                                                              out.print("<option value=" + categoria.getId() + ">" + categoria.getNome() + "</option>");
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                                    <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="curso">Curso:*</label>
                                                                <div class="col-md-9">
                                                                    <select id="curso" name="curso" class="form-control" required>
                                                                        <%
                                                                            List<Curso> cursos = daoFactory.getCursoDao().buscarCursoPorCategoria(aluno.getCurso().getCategoria().getId());
                                                                            out.print("<option selected value=" + aluno.getCurso().getId() + ">" + aluno.getCurso().getNome() + "</option>");
                                                                            for (Curso curso : cursos) {
                                                                                if(curso.getId()!=aluno.getCurso().getId()) 
                                                                                out.print("<option value=" + curso.getId() + ">" + curso.getNome() + "</option>");
                                                                            }
                                                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                                                        %>  
                                                                    </select>
                                                                </div>
                                                            </div>        
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="periodo">Periodo:*</label>
                                                                <div class="col-md-9">
                                                                    <select id="periodo" name="periodo" class="form-control" required>
                                                                        
                                                                        <%
                                                                          List<Curso> cursos2 = daoFactory.getCursoDao().buscarCursoPorCategoria(aluno.getCurso().getCategoria().getId());
                                                                          Curso curso = (Curso) daoFactory.getCursoDao().pesquisarPorId(aluno.getCurso().getId());
                                                                           out.print("<option selected value=" + aluno.getPeriodo() + ">" + aluno.getPeriodo() + "º " + curso.getTipoPeriodo() +  "</option>");
                                                                            for (int i = 1; i <= curso.getqPeriodo(); i++) {
                                                                                if(i!=aluno.getPeriodo())
                                                                                out.println("<option value=" + i + ">" + i + "º " + curso.getTipoPeriodo() + "</option>");
                                                                                //out.println("<option value="+curso.getId()+">"+curso.getTipoPeriodo()+"</option>");
                                                                                //curso.setTipoPeriodo(curso.getTipoPeriodo());
                                                                            }
                                                                            
                                                                          //  out.print("<option selected value=" + aluno.getEndereco().getCidade().getId() + ">" + aluno.getEndereco().getCidade().getNome() + "</option>");
                                                                        %>  
                                                                        <!--<option value="1 Ano/Modulo/Periodo">1 Ano/Modulo/Periodo</option>
                                                                        <option value="2 Ano/Modulo/Periodo">2 Ano/Modulo/Periodo</option>
                                                                        <option value="3 Ano/Modulo/Periodo">3 Ano/Modulo/Periodo</option>
                                                                        <option value="4 Periodo">4 Periodo</option>
                                                                        <option value="5 Periodo">5 Periodo</option>
                                                                        <option value="6 Periodo">6 Periodo</option>
                                                                        <option value="7 Periodo">7 Periodo</option>
                                                                        <option value="8 Periodo">8 Periodo</option>-->

                                                                    </select>
                                                                </div>
                                                            </div>
                                                                                               
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="transporte">Qual seu meio de Transporte para chegar até o IFTO:*</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <!--<input type="radio" name="transporte" id="onibus" value="Onibus" class="custom-control-input" required>-->
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Onibus")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='onibus' value='Onibus' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='onibus' value='Onibus' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="onibus">Onibus&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                           <%
                                                                                if (aluno.getMeioTransporte().equals("Carro")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='carro' value='Carro' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='carro' value='Carro' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="carro">Carro&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Moto")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='moto' value='Moto' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='moto' value='Moto' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="moto">Moto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Bicicleta")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='bicicleta' value='Bicicleta' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='bicicleta' value='Bicicleta' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="bicicleta">Bicicleta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("A pé")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='ape' value='A pé' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='ape' value='A pé' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ape">A pé&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getMeioTransporte().equals("Carona")) {
                                                                                    out.println("<input checked type='radio' name='transporte' id='carona' value='Carona' class='custom-control-input' required>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='transporte' id='carona' value='Carona' class='custom-control-input' required>");
                                                                                }
                                                                            %>
                                                                           
                                                                            <label class="custom-control-label" for="carona">Carona</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoMedio">Você cursou o Ensino Medio em Colegio:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoMedio().equals("Publico")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' value='Publico' class='custom-control-input' id='ensinoMedioPu'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' value='Publico' class='custom-control-input' id='ensinoMedioPu'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPu">Publico</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoMedio().equals("Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoMedio' value='Particular' class='custom-control-input' id='ensinoMedioPa'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoMedio' value='ensinoMedio' class='custom-control-input' id='ensinoMedioPa'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoMedioPa">Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ensinoFundamental">Você cursou o Ensino Fundamental em Colegio:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoFundamental().equals("Publico")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' value='Publico' class='custom-control-input' id='ensinoFundamentalPu'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' value='Publico' class='custom-control-input' id='ensinoFundamentalPu'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPu">Publico</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEnsinoFundamental().equals("Particular")) {
                                                                                    out.println("<input checked type='radio' name='ensinoFundamental' value='Particular' class='custom-control-input' id='ensinoFundamentalPa'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ensinoFundamental' value='Particular' class='custom-control-input' id='ensinoFundamentalPa'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ensinoFundamentalPa">Particular</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="ifto">Como você ingressou no IFTO:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Ampla concorrencia")) {
                                                                                    out.println("<input checked type='radio' name='ifto' value='Ampla concorrencia' class='custom-control-input' id='ifto1'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ifto' value='Masculino' class='custom-control-input' id='ifto1'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ifto1">Ampla concorrência</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Cota")) {
                                                                                    out.println("<input checked type='radio' name='ifto' value='Cota' class='custom-control-input' id='ifto2'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ifto' value='Cota' class='custom-control-input' id='ifto2'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ifto2">Cota</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getEntradaIfto().equals("Sisu")) {
                                                                                    out.println("<input checked type='radio' name='ifto' value='Sisu' class='custom-control-input' id='ifto3'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='ifto' value='Sisu' class='custom-control-input' id='ifto3'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="ifto3">Sisu</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="periodoVisita">Qual o melhor horario para uma visita:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Manha")) {
                                                                                    out.println("<input checked type='radio' name='periodoVisita' value='Manha' class='custom-control-input' id='periodoVisita1'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='periodoVisita' value='Manha' class='custom-control-input' id='periodoVisita1'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="periodoVisita1">Manhã</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Tarde")) {
                                                                                    out.println("<input checked type='radio' name='periodoVisita' value='Masculino' class='custom-control-input' id='periodoVisita2'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='periodoVisita' value='Tarde' class='custom-control-input' id='periodoVisita2'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="periodoVisita2">Tarde</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                if (aluno.getPeriodoVisita().equals("Noite")) {
                                                                                    out.println("<input checked type='radio' name='periodoVisita' value='Noite' class='custom-control-input' id='periodoVisita3'>");
                                                                                } else {
                                                                                    out.println("<input type='radio' name='periodoVisita' value='Noite' class='custom-control-input' id='periodoVisita3'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="periodoVisita3">Noite</label>
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
