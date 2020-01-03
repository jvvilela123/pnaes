<%@page import="modelo.Inscricao"%>
<%@page import="modelo.Edital"%>
<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<%
   
                   Long segundos = session.getMaxInactiveInterval() - (System.currentTimeMillis() - session.getLastAccessedTime()) / 1000;
    //segundos = 5L;
                     /*  long minutosRestantes = TimeUnit.SECONDS.toMinutes(segundos);
                      String tempoSessao =  String.format("%02d:%02d", TimeUnit.SECONDS.toMinutes( segundos ),segundos  % 60 );
                       //out.print("sessão:"+minutosRestantes); // Exibe o tempo (em minutos) restante*/
                        %>
            <script type="text/javascript">

            // Chama a função que conta a sessão
            startCountdown(<%=segundos%>);

            </script>
<div class="top-bar color-scheme-transparent">
    
    <!--------------------
    START - Top Menu Controls
    -------------------->
    <div style="margin-left: 20px" >
        <center>
            <a class="mm-logo" href="/pnaes/home.jsp"><img src="/pnaes/img/logotop.png"></a>
        </center>
    </div>
        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-info" role="alert" id="divTempo">
                                    
                                </div>
                            </div>
        </div>   
    <!--------------------
    <div class="top-menu-controls">
        <div class="element-search autosuggest-search-activator">
            <input placeholder="Buscar..." type="text">
        </div>
    </div>
    

--------------------><!--------------------

--------------------><!--------------------
    START - User avatar and menu in secondary top menu
    -------------------->
    <div class="logged-user-w">
        <div class="logged-user-i">
            <div class="avatar-w">
                <img alt="" src="/pnaes/<%=edital.getNumero()%>/alunos/<%=session.getAttribute("cpf")%>/<%=session.getAttribute("cpf")%>.jpg">
            </div>
            <div class="logged-user-menu color-style-bright">
                <div class="logged-user-avatar-info">
                    <div class="avatar-w">                        
                        <img alt="" src="/pnaes/<%=edital.getNumero()%>/alunos/<%=session.getAttribute("cpf")%>/<%=session.getAttribute("cpf")%>.jpg">
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
                            <%   if (session.getAttribute("cpf") != null) {
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
    <!--------------------
    END - User avatar and menu in secondary top menu
    -------------------->
</div>
