<%@page import="modelo.Aluno"%>
<%@page import="dao.DaoFactory"%>
<div style="margin-left: 20px">
    <%
        if (session.getAttribute("nivel").equals(1) || session.getAttribute("nivel").equals(3)) {
                   /*out.print(session.getAttribute("cpf"));
                                String cpf = new String();
                                cpf = session.getAttribute("cpf").toString().replace(".", "");
                                cpf = (cpf.replace("-", ""));
                                
                                Aluno aluno2 = (Aluno) daoFactory.getAlunoDao().buscarAlunoPor(cpf);*/
    %>
    <br>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
                <div class="col-sm-8">
                    <div class="element-info-with-icon">
                        <div class="element-info-icon">
                            <div class="os-icon os-icon-wallet-loaded"></div>
                        </div>
                        <div class="element-info-text">
                            <h5 class="element-inner-header">
                                PNAES - IFTO - TO
                            </h5>
                            <div class="element-inner-desc">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xl-4">
                <div class="element-box">
                    <h5 class="form-header">
                        INFORMA��ES DO ESTUDANTE
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">                     
                     <% if (aluno.getCurso()!=null) { %>
                       <a href="/pnaes/aluno/alterar_1_Passo.jsp?id=<%=aluno.getId()%>"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button" >Refazer o 1� Passo&#10004;</button> </a>
                     <% }else{ %>     
                       <a href="/pnaes/aluno/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">1� Passo</button> </a>
                     <% } %> 
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                OCUPA��O DO ESTUDANTE
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (empresa.getAtividade()!=null) { %>
                                <a href="/pnaes/empresa/alterar_2_passo.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Refazer o 2� Passo&#10004;</button> </a>
                                <%  }else{ %>   
                                <a href="/pnaes/empresa/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">2� Passo</button> </a>
                                <% }   %> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                INFORMA��ES DO GRUPO FAMILIAR
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (aluno.getStatusCadastro().equals("3")) { %>
                                <a href="/pnaes/dependente/listar.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Refazer o 3� Passo&#10004;</button> </a>
                                 <%  }else{ %> 
                                <a href="/pnaes/dependente/listar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">3� Passo</button> </a>
                                <% }   %> 
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                DESPESAS
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (despesas.size() > 0) { %>
                                <a href="/pnaes/despesa/alterar_4_passo.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Refazer o 4� Passo&#10004;</button> </a>
                                    <%  }else{ %> 
                                <a href="/pnaes/despesa/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">4� Passo</button> </a>
                                   <% }   %> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                SA�DE
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                                <% if (fichasMedicas.size() > 0) { %>
                                <a href="/pnaes/fichaMedica/alterar_5_passo.jsp"> <button  class="mr-2 mb-2 btn btn-info btn-lg" type="button">Refazer o 5� Passo&#10004;</button> </a>
                                    <%  }else{ %> 
                                <a href="/pnaes/fichaMedica/cadastrar.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">5� Passo</button> </a>
                                   <% }   %> 
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-xl-4">
                <div class="element-box">
                    <h5 class="form-header">
                        ENVIAR DOCUMENTA��O
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">
                        <a href="/pnaes/documento/upload.jsp"> <button  class="mr-2 mb-2 btn btn-primary btn-lg" type="button">6� Passo</button> </a>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <%
        }
    %>
</div>