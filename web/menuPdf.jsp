<%@page import="modelo.Inscricao"%>
<%@page import="modelo.Edital"%>
<%@page import="dao.DaoFactory"%>
<!--------------------
START - Mobile Menu
-------------------->
<div class="menu-mobile menu-activated-on-click color-scheme-dark">
    <div class="mm-logo-buttons-w">
        <a class="mm-logo" href="/pnaes/home.jsp"><img src="/pnaes/img/logo123.png"><span>PORTO NACIONAL - TO</span></a>
        <div class="mm-buttons">
            <div class="content-panel-open">
                <div class="os-icon os-icon-grid-circles"></div>
            </div>
            <div class="mobile-menu-trigger">
                <div class="os-icon os-icon-hamburger-menu-1"></div>
            </div>
        </div>
    </div>
    <div class="menu-and-user">
        <div class="logged-user-w">
            <div class="avatar-w">
                <img alt="" src="/pnaes/img/avatar1.jpg">
            </div>
            <div class="logged-user-info-w">
                <div class="logged-user-name">
                    <%                    
                        if (session.getAttribute("nome") != null) {
                            out.print(session.getAttribute("nome"));
                        }
                    %>
                </div>
                <div class="logged-user-role">
                    <%                      
                        if (session.getAttribute("cpf") != null) {
                            out.print(session.getAttribute("cpf"));
                        }
                    %>
                </div>
            </div>
        </div>
        <!--------------------
        START - Mobile Menu List
        -------------------->
        <ul class="main-menu">
            <li class="sub-header">
                <span>MENU</span>
            </li>
            <li class="selected menu">
                <a href="/pnaes/home.jsp">
                    <div class="icon-w">
                        <div class="os-icon os-icon-layout"></div>
                    </div>
                    <span>Inicio</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Inicio
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-layout"></i>
                    </div>
                </div>
            </li>
            <li class="selected menu">
                <a href="/pnaes/edital/listar.jsp">
                    <div class="icon-w">
                        <div class="os-icon os-icon-layout"></div>
                    </div>
                    <span>Edital</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Edital
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-layout"></i>
                    </div>

                </div>
            </li>


            <li class="selected menu">
                <a href="/pnaes/bolsa/listar.jsp">
                    <div class="icon-w">
                        <div class="os-icon os-icon-layout"></div>
                    </div>
                    <span>Bolsa</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Bolsa
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-layout"></i>
                    </div>

                </div>
            </li>
            <li class=" has-sub-menu">
                <a href="apps_bank.html">
                    <div class="icon-w">
                        <div class="os-icon os-icon-package"></div>
                    </div>
                    <span>Avaliar</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Avaliar
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-package"></i>
                    </div>
                    <div class="sub-menu-i">
                        <ul class="sub-menu">
                            <li>
                                <a href="/pnaes/documento/documento.jsp">Analise documental</a>
                            </li>
                            <li>
                                <a href="/pnaes/entrevista/horario.jsp">Marcar Entrevista</a>
                            </li>
                            <li>
                                <a href="/pnaes/entrevista/entrevista.jsp">Entrevistar</a>
                            </li>    
                            <li>
                                <a href="/pnaes/visita/cadastrar.jsp">Visita</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </li>


            <li class=" has-sub-menu">
                <a href="#">
                    <div class="icon-w">
                        <div class="os-icon os-icon-file-text"></div>
                    </div>
                    <span>Relatorios</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Relatorios
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-file-text"></i>
                    </div>
                    <div class="sub-menu-i">
                        <ul class="sub-menu">
                            <li>
                                <a href="/pnaes/aluno/listar.jsp">Lista de alunos</a>
                            </li>
                            <li>
                                <a href="/pnaes/inscricao/listar.jsp">Lista de inscritos</a>
                            </li>
                            <li>
                                <a href="/pnaes/documento/listar.jsp">Lista de classificação</a>
                            </li>
                            <li>
                                <a href="/pnaes/entrevista/listar.jsp">Lista de Entrevista</a>
                            </li>
                            <li>
                                <a href="/pnaes/visita/listar.jsp">Lista de Visitas</a>
                            </li>
                            <li>
                                <a href="/pnaes/entrevista/resultado.jsp">Resultado final</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>



            <li class=" has-sub-menu">
                <a href="#">
                    <div class="icon-w">
                        <div class="os-icon os-icon-file-text"></div>
                    </div>
                    <span>Pesquisa</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Pesquisa
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-file-text"></i>
                    </div>
                    <div class="sub-menu-i">
                        <ul class="sub-menu">
                            <li>
                                <a href="misc_invoice.html">Pesquisar Inscritos</a>
                            </li>
                            <li>
                                <a href="rentals_index_grid.html">Pesquisar Edital</a>
                            </li>
                            <li>
                                <a href="misc_charts.html">Pesquisar Relação de beneficiados</a>
                            </li>
                            <li>
                                <a href="auth_login.html">Pesquisar  Relatorio de entrevista</a>
                            </li>
                            <li>
                                <a href="auth_register.html">Pesquisar  Relatorio de visita</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </li>

            <li class="selected menu">
                <a href="#">
                    <div class="icon-w">
                        <div class="os-icon os-icon-layout"></div>
                    </div>
                    <span>Contato</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Contato
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-layout"></i>
                    </div>

                </div>
            </li>

        </ul>
        <!--------------------
        END - Mobile Menu List
        -------------------->
        <div class="mobile-menu-magic">
            <h4>
                Admin
            </h4>
            <p>
                Bootstrap 4
            </p>
            <div class="btn-w">
                <a class="btn btn-white btn-rounded" href="#" target="_blank"> NowCCS</a>
            </div>
        </div>
    </div>
</div>
<!--------------------
END - Mobile Menu
-------------------->
<!--------------------
START - Main Menu
-------------------->
<div class="menu-w color-scheme-light color-style-default menu-position-side menu-side-left menu-layout-compact sub-menu-style-inside sub-menu-color-light selected-menu-color-light menu-activated-on-click menu-has-selected-link">
    <div class="logo-w">
        <a href="/pnaes/home.jsp"><img alt="" src="/pnaes/img/logo123.png" style="width: 60%;"></a>
    </div>
    <div class="logged-user-w avatar-inline">
        <div class="logged-user-i">
            <div class="avatar-w">
                <img alt="" src="/pnaes/img/avatar1.jpg">
            </div>
            <div class="logged-user-info-w">
                <div class="logged-user-name">
                    <%                      
                        if (session.getAttribute("nome") != null) {
                            out.print(session.getAttribute("nome"));
                        }

                    %>
                </div>
                <div class="logged-user-role">
                    <%                      
                        if (session.getAttribute("cpf") != null) {
                            out.print(session.getAttribute("cpf"));
                        }
                    %>
                </div>
            </div>
            <div class="logged-user-toggler-arrow">
                <div class="os-icon os-icon-chevron-down"></div>
            </div>
            <div class="logged-user-menu color-style-bright">
                <div class="logged-user-avatar-info">
                    <div class="avatar-w">
                        <img alt="avatar1" src="/pnaes/img/avatar1.jpg">
                    </div>
                    <div class="logged-user-info-w">
                        <div class="logged-user-name">
                            <%                          
                                if (session.getAttribute("nome") != null) {
                                    out.print(session.getAttribute("nome"));
                                }
                            %>
                        </div>
                        <div class="logged-user-role">
                            <%                          
                                if (session.getAttribute("cpf") != null) {
                                    out.print(session.getAttribute("cpf"));
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="bg-icon">
                    <i class="os-icon os-icon-wallet-loaded"></i>
                </div>
                <ul>

                    <li>
                        <a href="/pnaes/index.jsp?sair=1"><i class="os-icon os-icon-signs-11"></i><span>Sair</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="element-search autosuggest-search-activator">
        <input placeholder="Buscar..." type="text">
    </div>
    <h1 class="menu-page-header">
        JSP Page
    </h1>
    <div class="menu-actions">


    </div>  
    <%             
        if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
    %>
    <ul class="main-menu">
        <li class="sub-header">
            <span>MENU</span>
        </li>

        <li class="selected menu">
            <a href="/pnaes/home.jsp">
                <div class="icon-w">
                    <div class="os-icon os-icon-layout"></div>
                </div>
                <span>Inicio</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Inicio
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-layout"></i>
                </div>

            </div>
        </li>


        <%
            DaoFactory daoFactory = new DaoFactory();
            Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
            int tam = daoFactory.getEditalDao().listar().size();
            Edital edital = new Edital();
            if(tam > 0){
                edital = daoFactory.getEditalDao().listar().get(tam-1);
            }
            
            //System.out.println("/pnaes/"+edital.getNumero()+"/alunos/"+inscricao.getAluno().getCpf()+"/da.pdf");
        %>
        <li class="selected menu">
            <a href="../<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/da.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-layout"></div>
                </div>
                <span>Documentos do Aluno</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos do Aluno
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-layout"></i>
                </div>

            </div>
        </li>
        <li class="selected menu">
            <a href="../<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/dd.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-layout"></div>
                </div>
                <span>Documentos dos Dependentes</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos dos Dependentes
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-layout"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/dr.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-layout"></div>
                </div>
                <span>Documentos da Renda</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos da Renda
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-layout"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/dd.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-layout"></div>
                </div>
                <span>Documentos das Despesas</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos das Despesas
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-layout"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../<%=edital.getNumero()%>/alunos/<%=inscricao.getAluno().getCpf()%>/od.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-layout"></div>
                </div>
                <span>Outros Documentos</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Outros Documentos
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-layout"></i>
                </div>
            </div>
        </li>
    </ul>
    <%
        }
    %>
    <div class="side-menu-magic">
        <h4>
            Admin
        </h4>
        <p>
            Bootstrap 4 
        </p>
        <div class="btn-w">
            <a class="btn btn-white btn-rounded" href="https://themeforest.net/item/light-admin-clean-bootstrap-dashboard-html-template/19760124?ref=Osetin" target="_blank"> Now</a>
        </div>
    </div>
</div>
<!--------------------
END - Main Menu
-------------------->