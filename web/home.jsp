<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="modelo.Inscricao"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="dao.DaoFactory"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>

        <%@include file="imports.jsp" %>

    </head>


    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">
            <!-- popup -->
            <div class="all-wrapper solid-bg-all">

                <div class="layout-w">
                    <%@include file="menu.jsp" %>
                    <div class="content-w">
                        <%@include file="cabecalho.jsp" %>

                        <%                            msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
                            if (msg.isEmpty() == false) {

                        %>

                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-danger" role="alert">
                                    <strong><%=msg%></strong>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                            //msg = request.getParameter("msg");

                            if (session.getAttribute("nivel").toString().equals("1")) {
                                if (aluno.getStatusCadastro().equals("7")) {%>
                                    <script type="text/javascript">
                                       window.location.href = "inscricao/inscricao.jsp";
                                     </script>

                                <%}
                            List<Inscricao> is = daoFactory.getInscricaoDao().perquisarAlunoPorEdital(alunoId, edital.getId());
                            if (is.isEmpty() == false) {
                                msg = "Candidato já Inscrito";

                        %>
                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-success" role="alert">
                                    <center><strong><%=msg%></strong></center>
                                </div>
                            </div>
                        </div>
                        <%
                        } else {
                        %>
                        <%@include file="menuAluno.jsp" %>    
                        <%                                }
                        } else {

                        %>

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
                        <%                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>