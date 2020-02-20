<%@page import="java.util.TimeZone"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="modelo.Entrevista"%>
<%@page import="modelo.Bolsa"%>
<%@page import="util.DataFormat"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Inscricao"%>
<%@page import="modelo.Edital"%>
<%@page import="dao.DaoFactory"%>
<%  
                                            Empresa empresa = new Empresa();
                                            DaoFactory daoFactory = new DaoFactory();
                                            DataFormat dataFormat = new DataFormat();
                                            SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                  GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance(); 
                  TimeZone tz = TimeZone.getTimeZone("America/Araguaina");
		  TimeZone.setDefault(tz);
                  
                  cal.setTimeZone(tz);
                    GregorianCalendar dataAtual = new GregorianCalendar();

                                            Inscricao inscricao = (Inscricao) daoFactory.getInscricaoDao().pesquisarPorId(Integer.parseInt(request.getParameter("i_id")));
                                            List<Bolsa> bolsas = daoFactory.getBolsaDao().perquisarListaPorAluno(inscricao.getAluno().getId());

                                            
                                            List<Dependente> dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                            List<Empresa> empresas = new DaoFactory().getEmpresaDao().perquisarListaPorAluno(inscricao.getAluno().getId());
                                            
                                            

                                            FichaMedica fichaMedica = new DaoFactory().getFichaMedicaDao().perquisarListaPorAluno(inscricao.getAluno().getId()).get(0);
                                            if (empresas.size() != 0) {
                                                empresa = empresas.get(0);
                                            }
                                            Integer alunoId = Integer.parseInt(session.getAttribute("aluno_id").toString());

                                           Edital edital = (Edital) daoFactory.getEditalDao().pesquisarPorId(inscricao.getEdital().getId());
                                            DecimalFormat decimal = new DecimalFormat("###,###,###,##0.00");
                                        %>
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
                <!--<img alt="" src="/pnaes/img/avatar1.jpg">-->
                <img alt="" src="/pnaes/alunos/<%=session.getAttribute("cpf")%>/<%=session.getAttribute("cpf")%>.jpg">
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
        <%             
        if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
    %>
        <ul class="main-menu">
            <li class="sub-header">
                <span>MENU (Análise dos Documentos)</span>
            </li>
            <li class="selected menu">
                <a href="/pnaes/home.jsp">
                    <div class="icon-w">
                        <div class="os-icon os-icon-home"></div>
                    </div>
                    <span>Início</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Início
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-home"></i>
                    </div>
                </div>
            </li>
            
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/da.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos do Aluno</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos do Aluno
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>

            </div>
        </li>
        <%if (dependentes.size() > 0) {    %>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/dd.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos dos Dependentes</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos dos Dependentes
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
        <%}%>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/dr.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos da Renda</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos da Renda
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/dd.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos das Despesas</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos das Despesas
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/od.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Outros Documentos</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Outros Documentos
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
    </ul>
    <%
        }
    %>
            


            
     <!--------------------
        END - Mobile Menu List
        -------------------->
      
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
                <img alt="" src="/pnaes/alunos/<%=session.getAttribute("cpf")%>/<%=session.getAttribute("cpf")%>.jpg">
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
                        <img alt="" src="/pnaes/alunos/<%=session.getAttribute("cpf")%>/<%=session.getAttribute("cpf")%>.jpg">
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

     
    <%             
        if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
    %>
    <ul class="main-menu">
        <li class="sub-header">
            <span>MENU (Análise dos Documentos)</span>
        </li>

        <li class="selected menu">
            <a href="/pnaes/home.jsp">
                <div class="icon-w">
                    <div class="os-icon os-icon-home"></div>
                </div>
                <span>Início</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Início
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-home"></i>
                </div>

            </div>
        </li>


       
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/da.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos do Aluno</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos do Aluno
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>

            </div>
        </li>
        <%if (dependentes.size() > 0) {    %>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/dd.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos dos Dependentes</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos dos Dependentes
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
        <%}%>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/dr.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos da Renda</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos da Renda
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/dd.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Documentos das Despesas</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Documentos das Despesas
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
        <li class="selected menu">
            <a href="../alunos/<%=inscricao.getAluno().getCpf()%>/<%=edital.getNumero()%>/od.pdf" onclick="abrir(this);return false;">
                <div class="icon-w">
                    <div class="os-icon os-icon-file-text"></div>
                </div>
                <span>Outros Documentos</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Outros Documentos
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-file-text"></i>
                </div>
            </div>
        </li>
    </ul>
    <%
        }
    %>
 
</div>
<!--------------------
END - Main Menu
-------------------->