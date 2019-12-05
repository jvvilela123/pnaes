<%-- 
    Document   : cadastrarPessoa
    Created on : 08/02/2018, 15:02:10
    Author     : ronan
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <title>Cadastro</title>
        <%@include file="../imports.jsp" %>
        <script>
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('/pnaes/cidadeajax.jsp?estado=' + $('#uf').val());
                });
            });
         </script>
    </head>
    <body>
        <div class="element-box">
            <h1 class="form-header">Cadastro</h1>
            <div class="form-desc">
                
            </div>
            <div style="width: 80%" >
                <!-- Basic form layout section start -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                <div class="heading-elements"></div>
                            </div>
                            <div class="card-content collpase show">
                                <div class="card-body">
                                    <%
                                        if (request.getParameter("msg") != null) {
                                            
                                           
                                    %>
                                    <center>
                                        <div class="alert alert-warning" role="alert">
                                            <strong><%=request.getParameter("msg")%></strong>
                                        </div>
                                    </center>
                                    <%
                                        }
                                    %>
                                    <form method="Post" action="/pnaes/ServletAluno?opcao=cadastrar" class="form form-horizontal">
                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-user"></i>Dados Pessoais</h4>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="nome">Nome*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="nome" id="nome" class="form-control" placeholder="Nome" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="cpf">CPF*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="cpf" id="cpf" onfocus="validarCPF(cpf)" class="form-control" placeholder="CPF" maxlength="14" OnKeyPress="formatar('###.###.###-##', this)" required>                                                    
                                                </div>
                                            </div>
                                            <script>

                                            </script>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="rg">RG*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="rg" id="rg"  class="form-control" placeholder="RG" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="ufe">Estado(UF) de Expedição do RG*:</label>
                                                <div class="col-md-9">
                                                    <select id="ufe" name="ufe" class="form-control" required>
                                                        <option selected="" disabled="">Selecione o Estado(UF) de Expedição do RG</option>
                                                        <%
                                                            DaoFactory daoFactory = new DaoFactory();
                                                            List<Uf> ufes = daoFactory.getUfDao().listar();
                                                            for (Uf ufe : ufes) {
                                                                out.print("<option value=" + ufe.getId() + ">" + ufe.getNome() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="sexo">Sexo*:</label>
                                                <div class="col-md-9">
                                                    <div class="input-group">
                                                        <div class="d-inline-block custom-control custom-radio mr-1">
                                                            <input type="radio" name="sexo" value="Masculino" class="custom-control-input" id="sexom" required>
                                                            <label class="custom-control-label" for="sexom">Masculino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="d-inline-block custom-control custom-radio">
                                                            <input type="radio" name="sexo" value="Feminino" class="custom-control-input" id="sexof" required>
                                                            <label class="custom-control-label" for="sexof">Feminino&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                        </div>
                                                        <div class="d-inline-block custom-control custom-radio">
                                                            <input type="radio" name="sexo" value="Indefinino" class="custom-control-input" id="sexoi" required>
                                                            <label class="custom-control-label" for="sexoi">Indefinido</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="estadoCivil">Estado Civil*:</label>
                                                <div class="col-md-9">
                                                    <select id="estadoCivil" name="estadoCivil" class="form-control" required>
                                                        <option selected="" disabled="">Selecione o Estado Civil</option>
                                                        <option value="Solteiro">Solteiro(a)</option>
                                                        <option value="Casado">Casado(a)</option>
                                                        <option value="Separado">Separado(a)</option>
                                                        <option value="Divorciado">Divorciado(a)</option>
                                                        <option value="Viúvo">Viúvo(a)</option> 
                                                        <option value="Companheiro">Companheiro(a)</option>
                                                    </select>
                                                </div>
                                            </div>        
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="dtn">Data de Nascimento*:</label>
                                                <div class="col-md-9">
                                                    <input type="date" name="dtn" id="dtn" class="form-control" placeholder="dd/MM/yyyy" maxlength="10" OnKeyPress="formatar('##/##/####', this)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="email">Email*:</label>
                                                <div class="col-md-9">
                                                    <input type="email" name="email" id="email"  class="form-control" placeholder="Email" required>
                                                </div>
                                            </div>                                                
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="telefone">Telefone*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="telefone" id="telefone"  class="form-control" placeholder="DDD 99999-9999" maxlength="14" OnKeyPress="formatar('## #####-####', this)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="autoDeclaracao">Auto Declaração Cor/Raça*:</label>
                                                <div class="col-md-9">
                                                    <select id="atividadeProf" name="autoDeclaracao" class="form-control" required>
                                                        <option selected="" disabled=""> Selecione a sua Cor/Raça </option>
                                                        <option value="Branco">Branco</option>
                                                        <option value="Pardo">Pardo</option>
                                                        <option value="Preto">Preto</option>
                                                        <option value="Indígena">Indígena</option>
                                                        <option value="Outra">Outra</option>   
                                                    </select>
                                                </div>
                                            </div>        
                                            
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="matricula">Matricula (a mesma do SIGA ou SUAP)*:</label>
                                                <div class="col-md-9">
                                                    <div class="position-relative has-icon-left">
                                                        <input type="text" name="matricula" id="matricula" class="form-control" placeholder="Numero de Matricula" required>
                                                        <div class="form-control-position">
                                                            <i class="ft-user"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                    
                                            <h4 class="form-section"><i class="ft-clipboard"></i> Dados do Endereço</h4>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="logradouro">Logradouro(Rua, Avenida...)*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="logradouro" id="logradouro" class="form-control" placeholder="Logradouro(Rua, Avenida...)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="numero">Numero*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="bairro">Bairro*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="bairro" id="bairro" class="form-control" placeholder="Bairro" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="complemento">Complemento:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="complemento" id="complemento" class="form-control" placeholder="Complemento">                                              </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="cep">CEP*:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="cep" id="cep" class="form-control" placeholder="CEP" maxlength="10" OnKeyPress="formatar('##.###-###', this)" required>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="uf">Estado (UF)*:</label>
                                                <div class="col-md-9">
                                                    <select id="uf" name="uf" class="form-control" required>
                                                        <option selected="" disabled="">Selecione o estado (UF)</option>
                                                        <%
                                                            List<Uf> ufs = daoFactory.getUfDao().listar();
                                                            for (Uf uf : ufs) {
                                                                out.print("<option value=" + uf.getId() + ">" + uf.getNome() + "</option>");
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-md-3 label-control" for="cidade">Cidade*:</label>
                                                <div class="col-md-9">
                                                    <select id="cidade" name="cidade" class="form-control" required>
                                                        <option selected="" disabled="">Selecione primeiro o estado (UF) ↑</option>

                                                    </select>
                                                </div>
                                            </div>        

                                        </div>
                                        <div class="form-actions">
                                            <button type="reset" value="Limpar"  class="btn btn-warning mr-1">
                                                <i class="ft-x"></i> Limpar
                                            </button>
                                            <button type="submit" class="btn btn-primary" name="cadastrar" value="Cadastrar">
                                                <i class="la la-check-square-o"></i> Enviar
                                            </button>
                                        </div>                                                    
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                            
    </body>
</html>