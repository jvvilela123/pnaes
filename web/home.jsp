<%@page import="modelo.Inscricao"%>

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
                            msg = request.getParameter("msg");
                            if (session.getAttribute("nivel").toString().equals("1")) {
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
                            <%                                        
                                }
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