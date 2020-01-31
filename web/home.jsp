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

                        <% 
                            List<Inscricao> is = daoFactory.getInscricaoDao().perquisarListaPorAluno(alunoId);
                            if(request.getParameter("msg") != null){
                            msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
                            if (msg.isEmpty() == false && is.isEmpty()) {

                        %>

                        <div class="row align-items-center">
                            <div class="col-md-12">
                                <div class="alert alert-warning" role="alert">
                                    <strong><%=msg%></strong>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                           }
                            //msg = request.getParameter("msg");
                           
                            if (session.getAttribute("nivel").toString().equals("1")) {
                                if (aluno.getStatusCadastro() == 7) {%>
                                    <script type="text/javascript">
                                       window.location.href = "inscricao/inscricao.jsp";
                                     </script>

                                <%}
                            
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

                          <%@include file="menuAluno.jsp" %>
                        <%                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>