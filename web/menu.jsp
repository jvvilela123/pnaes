<%@page import="java.text.DecimalFormat"%>
<%@page import="modelo.Dependente"%>
<%@page import="modelo.FichaMedica"%>
<%@page import="modelo.Despesa"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Aluno"%>
<%@page import="modelo.Empresa"%>
<%@page import="modelo.Edital"%>
<%@page import="modelo.Inscricao"%>
<%@page import="dao.DaoFactory"%>
<%//@page errorPage="/pnaes/index.jsp?sair=1" %>
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
                <%
                    if(session.getAttribute("aluno_id")==null){
                        %>
                        <script>
                            window.open('/pnaes/index.jsp?sair=1', '_self');
                        </script>
                     <%}
                 
                    
                    
                    Boolean editalEncerrado = false;
                    DecimalFormat decimal = new DecimalFormat("###,###,###,##0.00");
                    String msg = new String();
                    DaoFactory daoFactory = new DaoFactory();
                    Edital edital = null;
                    Empresa empresa = new Empresa();
                    Despesa despesa = new Despesa();
                    FichaMedica fichaMedica = new FichaMedica();
                    Dependente dependente = new Dependente();
                    Integer alunoId = 0;
                    
                    
                    
                    alunoId = Integer.parseInt(session.getAttribute("aluno_id").toString());
                    Aluno aluno = (Aluno) daoFactory.getAlunoDao().pesquisarPorId(alunoId);
                    List<Edital> editais = null;
                    
                    if(aluno.getCurso()!=null)
                    editais = daoFactory.getEditalDao().buscarEditalPorCampus(aluno.getCurso().getCampus().getId());
                    else
                    editais = daoFactory.getEditalDao().buscarEditalPorCampus(1);
                    
                    
                    List<Empresa> empresas = daoFactory.getEmpresaDao().perquisarListaPorAluno(alunoId);
                    List<Despesa> despesas = daoFactory.getDespesaDao().perquisarListaPorAluno(alunoId);
                    List<FichaMedica> fichasMedicas = daoFactory.getFichaMedicaDao().perquisarListaPorAluno(alunoId);
                    List<Dependente> dependentes = daoFactory.getDependenteDao().perquisarListaPorAluno(alunoId);
                   
                     if(empresas.size() > 0){
                         empresa = empresas.get(0);
                     }
                     if(despesas.size() > 0){
                         despesa = despesas.get(0);
                     }
                     if(fichasMedicas.size() > 0){
                         fichaMedica = fichasMedicas.get(0);
                     }
                     
                     if(dependentes.size() > 0){
                        dependente = dependentes.get(0);
                                         }
                     
                    GregorianCalendar dataAtual = new GregorianCalendar();
                  if (editais.get(editais.size() - 1).getDataFinal().before(dataAtual)) {
                      editalEncerrado = true;
                  }
                edital = editais.get(editais.size() - 1);

                %>
                <img alt="" src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg">

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
                <%
        if (session.getAttribute("nivel").equals(3)) {
      %>
            <span>MENU (Administração)</span>
     <%
       }
      %>
      <%
        if (session.getAttribute("nivel").equals(2)) {
      %>
            <span>MENU (Coordenação)</span>
     <%
       }
      %>
      <%
        if (session.getAttribute("nivel").equals(1)) {
      %>
            <span>MENU (Alunos)</span>
     <%
       }
      %>
            </li>
            <li class="selected menu">
                <a href="/pnaes/home.jsp">
                    <div class="icon-w">
                        <div class="os-icon os-icon-home"></div>
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
            if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
        %>
         <%
                                if (session.getAttribute("nivel").equals(3)) {
                            %>
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
                    <span>Auxílio</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Auxílio
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
                    <span>Análise</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Análise
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-package"></i>
                    </div>
                    <div class="sub-menu-i">
                        <ul class="sub-menu">
                            <%
                                if (session.getAttribute("nivel").equals(3)) {
                            %>
                            <li>
                                <a href="/pnaes/documento/documento.jsp">Analise documental</a>
                            </li>
                            
                            <li>
                                <a href="/pnaes/entrevista/horario.jsp">Agendar Entrevista</a>
                            </li>
                            <li>
                                <a href="/pnaes/entrevista/entrevista.jsp">Entrevista</a>
                            </li>    
                            <li>
                                <a href="/pnaes/visita/cadastrar.jsp">Visita</a>
                            </li>
                            <li>
                                <a href="/pnaes/entrevista/resultado.jsp">Resultado final</a>
                            </li>
                            <%
                                }
                            %>

                        </ul>
                    </div>
                </div>
            </li>
            <%
                                }
                            %>


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
                             <%
                                if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
                            %>
                            <li>
                                <a href="/pnaes/aluno/listar.jsp">Lista de alunos</a>
                            </li>
                           
                            <li>
                                <a href="/pnaes/inscricao/listar.jsp">Lista de inscritos</a>
                            </li>
                             <%
                                }
                            %>
                            <%
                                if (session.getAttribute("nivel").equals(3)) {
                            %>
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
                                <a href="/pnaes/resultado/resultado.jsp">Resultado final</a>
                            </li>
                             <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </li>



            

            <%
                                if (session.getAttribute("nivel").equals(3)) {
                            %>
            <li class="selected menu">
                <a href="/pnaes/usuario/listar.jsp">
                    <div class="icon-w">
                        <div class="os-icon  os-icon-user"></div>
                    </div>
                    <span>Usuários</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Usuários
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon  os-icon-user"></i>
                    </div>

                </div>
            </li>
            <%
                             }
                            %>
          
          <%
            }
        %>
      
            <li class="selected menu">
                <a href="/pnaes/index.jsp?sair=1">
                    <div class="icon-w">
                        <div class="os-icon os-icon-signs-11"></div>
                    </div>
                    <span>Sair</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Sair
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-signs-11"></i>
                    </div>

                </div>
            </li>

                
        </ul>
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
                <img alt="" src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg">
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
                    <%    if (session.getAttribute("cpf") != null) {
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
                        <img alt="" src="/pnaes/alunos/<%=aluno.getCpf()%>/<%=aluno.getCpf()%>.jpg">
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

    
    
    <ul class="main-menu">
        <li class="sub-header">
       <%
        if (session.getAttribute("nivel").equals(3)) {
      %>
            <span>MENU (Administração)</span>
     <%
       }
      %>
      <%
        if (session.getAttribute("nivel").equals(2)) {
      %>
            <span>MENU (Coordenação)</span>
     <%
       }
      %>
      <%
        if (session.getAttribute("nivel").equals(1)) {
      %>
            <span>MENU (Alunos)</span>
     <%
       }
      %>
        </li>

        <li class="selected menu">
            <a href="/pnaes/home.jsp">
                <div class="icon-w">
                    <div class="os-icon os-icon-home"></div>
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
        if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
      %>
       <%
           if (session.getAttribute("nivel").equals(3)) {
        %>

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
                    <div class="os-icon os-icon-book"></div>
                </div>
                <span>Auxílio</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Auxílio
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
                <span>Análise</span></a>
            <div class="sub-menu-w">
                <div class="sub-menu-header">
                    Análise
                </div>
                <div class="sub-menu-icon">
                    <i class="os-icon os-icon-package"></i>
                </div>
                <div class="sub-menu-i">
                    <ul class="sub-menu">
                        <li>
                            <a href="/pnaes/documento/documento.jsp">Analise documental</a>
                        </li>
                        <%
                            if (session.getAttribute("nivel").equals(3)) {
                        %>
                        <li>
                            <a href="/pnaes/entrevista/horario.jsp">Agendar Entrevista</a>
                        </li>
                        <li>
                            <a href="/pnaes/entrevista/entrevista.jsp">Entrevista</a>
                        </li>    
                        <li>
                            <a href="/pnaes/visita/cadastrar.jsp">Visita</a>
                        </li>
                        <li>
                            <a href="/pnaes/entrevista/resultado.jsp">Resultado final</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </li>
 <%
                            }
                        %>

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
                        <%
                                if (session.getAttribute("nivel").equals(2) || session.getAttribute("nivel").equals(3)) {
                            %>
                        <li>
                            <a href="/pnaes/aluno/listar.jsp">Lista de alunos</a>
                        </li>
                        <li>
                            <a href="/pnaes/inscricao/listar.jsp">Lista de inscritos</a>
                        </li>
                        <%
             }
            %>
             <%
                                if (session.getAttribute("nivel").equals(3)) {
                            %>
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
                            <a href="/pnaes/resultado/resultado.jsp">Resultado final</a>
                        </li>
                        <%
             }
            %>
                    </ul>
                </div>
            </div>
        </li>
        
        <%
              if (session.getAttribute("nivel").equals(3)) {
                            %>
        <li class="selected menu">
                <a href="/pnaes/usuario/listar.jsp">
                    <div class="icon-w">
                       <div class="os-icon os-icon-user"></div>
                    </div>
                    <span>Usuários</span></a>
               
            </li>
            <%
             }
            %>

    
    <%
        }
    %>
    
     <li class="selected menu">
                <a href="/pnaes/index.jsp?sair=1">
                    <div class="icon-w">
                        <div class="os-icon os-icon-signs-11"></div>
                    </div>
                    <span>Sair</span></a>
                <div class="sub-menu-w">
                    <div class="sub-menu-header">
                        Sair
                    </div>
                    <div class="sub-menu-icon">
                        <i class="os-icon os-icon-signs-11"></i>
                    </div>

                </div>
            </li>
    </ul>
</div>
    
<!--------------------
END - Main Menu
-------------------->