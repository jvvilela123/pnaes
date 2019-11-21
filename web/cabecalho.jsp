<%@page import="modelo.Inscricao"%>
<%@page import="modelo.Edital"%>
<%@page import="dao.DaoFactory"%>
<%@page import="java.util.List"%>
<div class="top-bar color-scheme-transparent">
    <!--------------------
    START - Top Menu Controls
    -------------------->
    <div style="margin-left: 20px">
        <center>
            <a class="mm-logo" href="/pnaes/home.jsp"><img src="/pnaes/img/logotop.png"></a>
        </center>
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
                <img alt="" src="/pnaes/img/avatar1.jpg">
            </div>
            <div class="logged-user-menu color-style-bright">
                <div class="logged-user-avatar-info">
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
