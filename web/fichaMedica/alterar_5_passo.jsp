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
        <title>Alteração das Informações da saúde do estudante e do grupo familiar</title>
        

        <%@include file="../imports.jsp" %>
        <!-- include alertify.css -->

        <script  type="text/javascript">
            $(document).ready(function () {
                $('#uf').change(function () {
                    $('#cidade').load('../cidadeajax.jsp?estado=' + $('#uf').val());
                });

            });
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)

                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }

            }
            //Funções de Show e Hide das Div's 
            function naoTemDoenca() {
                document.getElementById('div_doenca').style.display = 'none';
                document.getElementById('div_outra_doenca').style.display = 'none';
                document.getElementById('hipertencao').checked = false;
                document.getElementById('diabetes').checked = false;
                document.getElementById('epilepsia').checked = false;
                document.getElementById('asma').checked = false;
                document.getElementById('hepatiteb').checked = false;
                document.getElementById('osteoporose').checked = false;
                document.getElementById('enxaqueca').checked = false;
                document.getElementById('dependenciaQuimica').checked = false;
                document.getElementById('doencaMental').checked = false;
                document.getElementById('outros').checked = false;
                document.getElementById('outrosqual').value = "";
            }
            function temDoencaCronica() {
                document.getElementById('div_doenca').style.display = 'block';
                document.getElementById('div_outra_doenca').style.display = 'none';
                document.getElementById('hipertencao').checked = false;
                document.getElementById('diabetes').checked = false;
                document.getElementById('epilepsia').checked = false;
                document.getElementById('asma').checked = false;
                document.getElementById('hepatiteb').checked = false;
                document.getElementById('osteoporose').checked = false;
                document.getElementById('enxaqueca').checked = false;
                document.getElementById('dependenciaQuimica').checked = false;
                document.getElementById('doencaMental').checked = false;
                document.getElementById('outros').checked = false;
                document.getElementById('outrosqual').value = "";
            }
            function temOutraDoenca() {
                document.getElementById('div_outra_doenca').style.display = 'block';
            }
            function naoTemOutraDoenca() {
                document.getElementById('div_outra_doenca').style.display = 'none';
                document.getElementById('outrosqual').value = "";
            }
            function temDoencaFamilia() {
                document.getElementById('div_doenca_familia').style.display = 'block';
                document.getElementById('hipertencaofamilia').checked = false;
                document.getElementById('diabetesfamilia').checked = false;
                document.getElementById('epilepsiafamilia').checked = false;
                document.getElementById('asmafamilia').checked = false;
                document.getElementById('hepatitebfamilia').checked = false;
                document.getElementById('osteoporosefamilia').checked = false;
                document.getElementById('enxaquecafamilia').checked = false;
                document.getElementById('dependenciaQuimicafamilia').checked = false;
                document.getElementById('doencaMentalfamilia').checked = false;
                document.getElementById('outrosfamilia').checked = false;
                document.getElementById('outrosqualfamilia').value = "";
            }

            function naoTemDoencaFamilia() {
                document.getElementById('div_doenca_familia').style.display = 'none';
                document.getElementById('div_outra_doenca_familia').style.display = 'none';
                document.getElementById('hipertencaofamilia').checked = false;
                document.getElementById('diabetesfamilia').checked = false;
                document.getElementById('epilepsiafamilia').checked = false;
                document.getElementById('asmafamilia').checked = false;
                document.getElementById('hepatitebfamilia').checked = false;
                document.getElementById('osteoporosefamilia').checked = false;
                document.getElementById('enxaquecafamilia').checked = false;
                document.getElementById('dependenciaQuimicafamilia').checked = false;
                document.getElementById('doencaMentalfamilia').checked = false;
                document.getElementById('outrosfamilia').checked = false;
                document.getElementById('outrosqualfamilia').value = "";
            }
            function temOutraDoencaFamilia() {
                document.getElementById('div_outra_doenca_familia').style.display = 'block';
            }
            function naoTemOutraDoencaFamilia() {
                document.getElementById('div_outra_doenca_familia').style.display = 'none';
                document.getElementById('outrosqualfamilia').value = "";
            }
            function temMedicamentoControlado() {
                document.getElementById('div_medicamento').style.display = 'block';
            }
            function naoTemMedicamento() {
                document.getElementById('div_medicamento').style.display = 'none';
                document.getElementById('qualM').value = "";
            }
            function temMedicamentoFamilia() {
                document.getElementById('div_medicamento_familia').style.display = 'block';
            }
            function naoTemMedicamentoFamilia() {
                document.getElementById('div_medicamento_familia').style.display = 'none';
                document.getElementById('qualMd').value = "";
            }
            function temDeficienciaa() {
                document.getElementById('div_deficiencia').style.display = 'block';
                document.getElementById('auditiva').checked = false;
                document.getElementById('fisica').checked = false;
                document.getElementById('visual').checked = false;
                document.getElementById('mental').checked = false;
                document.getElementById('multiplas').checked = false;
            }
            function naoTemDeficiencia() {
               document.getElementById('div_deficiencia').style.display = 'none';
               document.getElementById('auditiva').checked = false;
               document.getElementById('fisica').checked = false;
               document.getElementById('visual').checked = false;
               document.getElementById('mental').checked = false;
               document.getElementById('multiplas').checked = false;
               document.getElementById('outraDeficiencia').checked = false;
               document.getElementById('div_outra_deficiencia').style.display = 'none';
               document.getElementById('outraDeficienciaQual').value="";
            }
            function temDeficienciaFamilia() {
                document.getElementById('div_deficiencia_familia').style.display = 'block';
                document.getElementById('auditiva_familia').checked = false;
                document.getElementById('fisica_familia').checked = false;
                document.getElementById('visual_familia').checked = false;
                document.getElementById('mental_familia').checked = false;
                document.getElementById('multiplas_familia').checked = false;
            }
            function naoTemDeficienciaFamilia() {
               document.getElementById('div_deficiencia_familia').style.display = 'none';
               document.getElementById('auditiva_familia').checked = false;
               document.getElementById('fisica_familia').checked = false;
               document.getElementById('visual_familia').checked = false;
               document.getElementById('mental_familia').checked = false;
               document.getElementById('multiplas_familia').checked = false;
               document.getElementById('outraDeficienciaFamilia').checked = false;
               document.getElementById('div_outra_deficiencia_familia').style.display = 'none';
               document.getElementById('outraDeficienciaFamiliaQual').value="";
            }
            
            function temOutraDeficiencia() {
                document.getElementById('div_outra_deficiencia').style.display = 'block';
                document.getElementById('outraDeficienciaQual').value="";
               
            }
            function naoTemOutraDeficiencia() {
                document.getElementById('div_outra_deficiencia').style.display = 'none';
                document.getElementById('outraDeficienciaQual').value="";
            }
             function temOutraDeficienciaFamilia() {
                document.getElementById('div_outra_deficiencia_familia').style.display = 'block';
                document.getElementById('outraDeficienciaFamiliaQual').value="";
            }
            function naoTemOutraDeficienciaFamilia() {
                document.getElementById('div_outra_deficiencia_familia').style.display = 'none';
                document.getElementById('outraDeficienciaFamiliaQual').value="";
            }

            function verificaCampos() {
                prencheuTudo = true;
                if(!alertify.errorAlert){
                      alertify.dialog('errorAlert',function factory(){
                        return{
                                build:function(){
                                    var errorHeader = '<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>Preencha corretamente os campos</h5>';
                                    this.setHeader(errorHeader);
                                }
                            };
                        },true,'alert');
                    }
                //Verifica se falta selecionar alguma campo obrigatório
                 if(!document.getElementById('susnao').checked && !document.getElementById('sussim').checked){
                    alertify.errorAlert("<h6 class='card-title'>Você Possui o Cartão do SUS?</h6>");
                    prencheuTudo = false;
               } else if(!document.getElementById('planonao').checked && !document.getElementById('planosim').checked){
                    alertify.errorAlert("<h6 class='card-title'>Você Possui Plano de Saúde?</h6>");
                    prencheuTudo = false;
               } else if(!document.getElementById('doencaCronica1sim').checked && !document.getElementById('doencaCronica1nao').checked){
                    alertify.errorAlert("<h6 class='card-title'>Você tem alguma doença crônica?</h6>");
                    prencheuTudo = false;
               } 
               else if(document.getElementById('doencaCronica1sim').checked &&  !verificaRadioChecadoPeloName('qualDoenca')){
                    alertify.errorAlert("<h6 class='card-title'>Selecione a sua doença crônica.</h6>");
                    prencheuTudo = false;
                }else if( document.getElementById('outros').checked && document.getElementById('outrosqual').value === ""){
                    document.getElementById('outrosqual').focus();
                    alertify.errorAlert("<h6 class='card-title'>Preencha a(s) sua(s) Doença(s) no campo Outros.</h6>");
                    prencheuTudo = false;
                }else if(!document.getElementById('doencaCronicafamilianao').checked && !document.getElementById('doencaCronicafamiliasim').checked){
                    alertify.errorAlert("<h6 class='card-title'>Há alguem com doença cronica na família?</h6>");
                    prencheuTudo = false;
                }else if(document.getElementById('doencaCronicafamiliasim').checked &&  !verificaRadioChecadoPeloName('qualDoencaDep')){
                    alertify.errorAlert("<h6 class='card-title'>Preencha a doença crônica da sua família.</h6>");
                    prencheuTudo = false;
                }else if( document.getElementById('outrosfamilia').checked && document.getElementById('outrosqualfamilia').value === ""){
                    document.getElementById('outrosqualfamilia').focus();
                    alertify.errorAlert("<h6 class='card-title'>Preencha a(s) doença(s) da sua família no campo Outros.</h6>");
                    prencheuTudo = false;
                 }else if(!document.getElementById('naom').checked && !document.getElementById('simm').checked){
                    alertify.errorAlert("<h6 class='card-title'>Você faz uso de medicamento controlado?</h6>");
                    prencheuTudo = false;
                }else if (document.getElementById('simm').checked && document.getElementById('qualM').value === ""){
                    document.getElementById('qualM').focus();
                    alertify.errorAlert("<h6 class='card-title'>Preencha o(s) nome(s) do(s) seu(s) medicamento(s).</h6>");
                    prencheuTudo = false;
                }else if(!document.getElementById('naomd').checked && !document.getElementById('simmd').checked){
                    alertify.errorAlert("<h6 class='card-title'>Há alguem que faz uso de medicamento controlado na família?</h6>");
                    prencheuTudo = false;
                }else if (document.getElementById('simmd').checked && document.getElementById('qualMd').value === ""){
                    document.getElementById('qualMd').focus();
                    alertify.errorAlert("<h6 class='card-title'>Preencha o nome de quem faz o uso do medicamento na sua família.</h6>");
                    prencheuTudo = false;
                }else if(!document.getElementById('deficiencianao').checked && !document.getElementById('deficienciasim').checked){
                    alertify.errorAlert("<h6 class='card-title'>Você tem alguma deficiência?</h6>");
                    prencheuTudo = false;
                }else if (document.getElementById('deficienciasim').checked && !verificaRadioChecadoPeloName('qualDeficiencia')) {
                    alertify.errorAlert("<h6 class='card-title'>Preencha a sua deficiência.</h6>");
                    prencheuTudo = false;
                }else if( document.getElementById('outraDeficiencia').checked && document.getElementById('outraDeficienciaQual').value === ""){
                    document.getElementById('outraDeficienciaQual').focus();
                    alertify.errorAlert("<h6 class='card-title'>Preencha Qual(is) a(s) sua(s) Deficiêcnia(s) no campo Outras.</h6>");
                    prencheuTudo = false;
                 }else if(!document.getElementById('simd').checked && !document.getElementById('naod').checked){
                    alertify.errorAlert("<h6 class='card-title'>Há pessoa(s) na família com deficiência?</h6>");
                    prencheuTudo = false;
                }else if (document.getElementById('simd').checked && !verificaRadioChecadoPeloName('qualDeficienciaDep')) {
                    alertify.errorAlert("<h6 class='card-title'>Preencha a deficiência na sua família.</h6>");
                    prencheuTudo = false;
                }else if( document.getElementById('outraDeficienciaFamilia').checked && document.getElementById('outraDeficienciaFamiliaQual').value === ""){
                    document.getElementById('outraDeficienciaFamiliaQual').focus();
                    alertify.errorAlert("<h6 class='card-title'>Preencha Qual(is) a(s) Deficiêcnia(s) na sua Família no campo Outras.</h6>");
                    prencheuTudo = false;
                 }
              if(prencheuTudo)  
              document.getElementById("formFichaMedica").submit();
            }

        </script>

    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <div class="all-wrapper with-side-panel solid-bg-all">
            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>

                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h3 class="card-title" id="striped-row-layout-icons">Alteração das Informações da Saúde do Estudante e do Grupo Familiar</h3>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                       Preencha corretamente todos os campos
                                                       
                                                    </div>
                                                   
                                                    <%  
                                                        msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");
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
                            }%>
                                                    <form method="Post" action="../ServletFichaMedica?opcao=alterar_5_passo&aluno_id=<%=aluno.getId()%>" class="form form-horizontal" id="formFichaMedica">
                                                        <div class="form-body">
                                                          
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="sus">Você possui Cartão do SUS?*:</label>
                                                                <div class="col-md-3">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="col-md-3">
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                   if (!fichaMedica.getTemCartaoSUS()) {
                                                                                        out.println("<input checked type='radio' name='sus' id='susnao' value='Não' class='custom-control-input' >");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='sus' id='susnao' value='Não' class='custom-control-input'>");
                                                                                    }
                                                                                %>
                                                                                <label class="custom-control-label" for="susnao">Não</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                    if (fichaMedica.getTemCartaoSUS()) {
                                                                                        out.println("<input checked type='radio' name='sus' id='sussim' value='Sim' class='custom-control-input' >");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='sus' id='sussim' value='Sim' class='custom-control-input' >");
                                                                                    }
                                                                                %>

                                                                                <label class="custom-control-label" for="sussim">Sim</label>
                                                                            </div> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="planoSaude">Você possui Plano de Saúde?*:</label>
                                                                <div class="col-md-3">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="col-md-3">
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                   if (!fichaMedica.getTemPlanoSaude()) {
                                                                                        out.println("<input checked type='radio' name='planoSaude' id='planonao' value='Não' class='custom-control-input' >");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='planoSaude' id='planonao' value='Não' class='custom-control-input'>");
                                                                                    }
                                                                                %>
                                                                                <label class="custom-control-label" for="planonao">Não</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                    if (fichaMedica.getTemPlanoSaude()) {
                                                                                        out.println("<input checked type='radio' name='planoSaude' id='planosim' value='Sim' class='custom-control-input' >");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='planoSaude' id='planosim' value='Sim' class='custom-control-input' >");
                                                                                    }
                                                                                %>

                                                                                <label class="custom-control-label" for="planosim">Sim</label>
                                                                            </div> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="doencaCronica">Você tem alguma doença ?*:</label>
                                                                <div class="col-md-3">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="col-md-3">
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                    Boolean temOutraDoenca = false;
                                                                                   
                                                                                    if (!fichaMedica.getTemDoenca()) {
                                                                                        out.println("<input checked type='radio' name='temDoenca' id='doencaCronica1nao' value='Não' class='custom-control-input' onclick='naoTemDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDoenca' id='doencaCronica1nao' value='Não' class='custom-control-input' onclick='naoTemDoenca();'>");
                                                                                    }
                                                                                %>
                                                                                <label class="custom-control-label" for="doencaCronica1nao">Não</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                    if (fichaMedica.getTemDoenca()) {
                                                                                        out.println("<input checked type='radio' name='temDoenca' id='doencaCronica1sim' value='Sim' class='custom-control-input' onclick='temDoencaCronica();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDoenca' id='doencaCronica1sim' value='Sim' class='custom-control-input' onclick='temDoencaCronica();'>");
                                                                                    }
                                                                                %>

                                                                                <label class="custom-control-label" for="doencaCronica1sim">Sim</label>
                                                                            </div> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%
                                                                if (fichaMedica.getTemDoenca()) {
                                                                    out.println("<div id='div_doenca' class='show'>");
                                                                } else {
                                                                    out.println("<div id='div_doenca' class='hide'>");
                                                               }
                                                            %>
                                                                 <div class="form-group row">
                                                                      
                                                                    <label class="col-md-3 label-control" for="tipoDoenca">Qual a sua doença ?*: <h6 class="card-title" id="striped-row-layout-icons">(Atenção! Caso possui mais de uma doença, marque outras e informe quais são as doenças.) </h6></label>
                                                                    
                                                          
                                                  
                                                                    <div class="col-md-9">
                                                                        <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                    //if(fichaMedica.getQualDoenca()!=null){
                                                                                    if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Hipertencao")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='hipertencao' value='Hipertencao' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='hipertencao' value='Hipertencao' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                                
                                                                                <label class="custom-control-label" for="hipertencao">Hipertensão Arterial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                  <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Diabetes")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='diabetes' value='Diabetes' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='diabetes' value='Diabetes' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                                
                                                                                <label class="custom-control-label" for="diabetes">Diabetes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Epilepsia")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='epilepsia' value='Epilepsia' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='epilepsia' value='Epilepsia' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                               <label class="custom-control-label" for="epilepsia">Epilepsia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Asma")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='asma' value='Asma' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='asma' value='Asma' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                              <label class="custom-control-label" for="asma">Asma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Hepatite B")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='hepatiteb' value='Hepatite B' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='hepatiteb' value='Hepatite B' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                                <label class="custom-control-label" for="hepatiteb">Hepatite B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" name="qualDoenca" id="osteoporose" value="Osteoporose" class="custom-control-input" onclick="naoTemOutraDoenca();">
                                                                                <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Osteoporose")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='osteoporose' value='Osteoporose' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='osteoporose' value='Osteoporose' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                                <label class="custom-control-label" for="osteoporose">Osteoporose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Enxaqueca")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='enxaqueca' value='Enxaqueca' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='enxaqueca' value='Enxaqueca' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                                <label class="custom-control-label" for="enxaqueca">Enxaqueca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                 <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Dependencia Quimica")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='dependenciaQuimica' value='Dependencia Quimica' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='dependenciaQuimica' value='Dependencia Quimica' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                                <label class="custom-control-label" for="dependenciaQuimica">Dependência Química&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                if (fichaMedica.getQualDoenca()!=null && fichaMedica.getQualDoenca().equals("Doenca Mental")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='doencaMental' value='Doenca Mental' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='doencaMental' value='Doenca Mental' class='custom-control-input' onclick='naoTemOutraDoenca();'>");
                                                                                    }
                                                                                
                                                                                %>
                                                                                <label class="custom-control-label" for="doencaMental">Doença Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <%
                                                                                 if (fichaMedica.getQualDoenca()!=null && !fichaMedica.getQualDoenca().equals("Doenca Mental")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Dependencia Quimica")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Enxaqueca")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Osteoporose")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Hepatite B")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Asma")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Diabetes")&&
                                                                                    !fichaMedica.getQualDoenca().equals("Hipertencao")) {
                                                                                        out.println("<input checked type='radio' name='qualDoenca' id='outros' value='Outros' class='custom-control-input' onclick='temOutraDoenca();'>");
                                                                                        temOutraDoenca = true;
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoenca' id='outros' value='Outros' class='custom-control-input' onclick='temOutraDoenca();'>");
                                                                                    }
                                                                               
                                                                                %>
                                                                                <label class="custom-control-label" for="outros">Outras</label>
                                                                            </div>
                                                                             <%
                                                                                if (temOutraDoenca) {
                                                                                    out.println("<div id='div_outra_doenca' class='show col-md-9' >");
                                                                                } else {
                                                                                    out.println("<div id='div_outra_doenca' class='hide col-md-9' >");
                                                                               }
                                                                            %> 
                                                                           <div class="position-relative has-icon-left">
                                                                               <%
                                                                                if (temOutraDoenca) {
                                                                                    out.println("<input type='text' name='qualDoencaOutro' id='outrosqual' value='"+fichaMedica.getQualDoenca()+"' class='form-control' placeholder='Qual(is) Doença(s)?'>");
                                                                                } else {
                                                                                    out.println("<input type='text' name='qualDoencaOutro' id='outrosqual'  class='form-control' placeholder='Qual(is) Doença(s)?'>");
                                                                               }
                                                                               //  }
                                                                            %>                                                                                    
                                                                                    <div class="form-control-position">
                                                                                        <i class="fa fa-briefcase"></i>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="doencaCronica">Há alguem com alguma doença na família?*:</label>
                                                            <div class="col-md-3">
                                                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                    <div class="col-md-3">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    Boolean temOutraDoencaDep = false;
                                                                                    
                                                                                    if (!fichaMedica.getTemDoencaDep()) {
                                                                                        out.println("<input checked type='radio' name='temDoencaDep' id='doencaCronicafamilianao' value='Não' class='custom-control-input' onclick='naoTemDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDoencaDep' id='doencaCronicafamilianao' value='Não' class='custom-control-input' onclick='naoTemDoencaFamilia();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="doencaCronicafamilianao">Não</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (fichaMedica.getTemDoencaDep()) {
                                                                                        out.println("<input checked type='radio' name='temDoencaDep' id='doencaCronicafamiliasim' value='Sim' class='custom-control-input' onclick='temDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDoencaDep' id='doencaCronicafamiliasim' value='Sim' class='custom-control-input' onclick='temDoencaFamilia();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="doencaCronicafamiliasim">Sim</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                                            <%
                                                                if (fichaMedica.getTemDoencaDep()) {
                                                                    out.println("<div id='div_doenca_familia' class='show'>");
                                                                } else {
                                                                    out.println("<div id='div_doenca_familia' class='hide'>");
                                                               }
                                                            %>
                                                         <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="tipoDoencafamilia">Qual doença na sua família?*: <h6 class="card-title" id="striped-row-layout-icons">(Atenção! Caso possui mais de uma doença, marque outras e informe quais são as doenças.) </h6></label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   // if(fichaMedica.getQualDoencaDep()!=null){
                                                                                    if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Hipertencao")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='hipertencaofamilia' value='Hipertencao' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='hipertencaofamilia' value='Hipertencao' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="hipertencaofamilia">Hipertensão Arterial&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Diabetes")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='diabetesfamilia' value='Diabetes' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='diabetesfamilia' value='Diabetes' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="diabetesfamilia">Diabetes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Epilepsia")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='epilepsiafamilia' value='Epilepsia' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='epilepsiafamilia' value='Epilepsia' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                             <label class="custom-control-label" for="epilepsiafamilia">Epilepsia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Asma")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='asmafamilia' value='Asma' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='asmafamilia' value='Asma' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="asmafamilia">Asma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Hepatite B")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='hepatitebfamilia' value='Hepatite B' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='hepatitebfamilia' value='Hepatite B' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                           <label class="custom-control-label" for="hepatitebfamilia">Hepatite B&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Osteoporose")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='osteoporosefamilia' value='Osteoporose' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='osteoporosefamilia' value='Osteoporose' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="osteoporosefamilia">Osteoporose&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Enxaqueca")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='enxaquecafamilia' value='Enxaqueca' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='enxaquecafamilia' value='Enxaqueca' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="enxaquecafamilia">Enxaqueca&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Dependencia Quimica")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='dependenciaQuimicafamilia' value='Dependencia Quimica' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='dependenciaQuimicafamilia' value='Dependencia Quimica' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="dependenciaQuimicafamilia">Dependência Química&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   if (fichaMedica.getQualDoencaDep()!=null && fichaMedica.getQualDoencaDep().equals("Doenca Mental")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='doencaMentalfamilia' value='Doenca Mental' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='doencaMentalfamilia' value='Doenca Mental' class='custom-control-input' onclick='naoTemOutraDoencaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="doencaMentalfamilia">Doença Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                 if (fichaMedica.getQualDoencaDep()!=null && !fichaMedica.getQualDoencaDep().equals("Doenca Mental")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Dependencia Quimica")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Enxaqueca")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Osteoporose")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Hepatite B")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Asma")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Diabetes")&&
                                                                                    !fichaMedica.getQualDoencaDep().equals("Hipertencao")) {
                                                                                        out.println("<input checked type='radio' name='qualDoencaDep' id='outrosfamilia' value='Outros' class='custom-control-input' onclick='temOutraDoencaFamilia();'>");
                                                                                        temOutraDoencaDep = true;
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDoencaDep' id='outrosfamilia' value='Outros' class='custom-control-input' onclick='temOutraDoencaFamilia();'>");
                                                                                    }
                                                                               
                                                                                %>
                                                                            <label class="custom-control-label" for="outrosfamilia">Outras</label>
                                                                        </div>
                                                                            <%
                                                                                if (temOutraDoencaDep) {
                                                                                    out.println("<div id='div_outra_doenca_familia' class='show col-md-9' >");
                                                                                } else {
                                                                                    out.println("<div id='div_outra_doenca_familia' class='hide col-md-9' >");
                                                                               }
                                                                            %> 
                                                                        <div class="position-relative has-icon-left">
                                                                            <%
                                                                                if (temOutraDoencaDep) {
                                                                                    out.println("<input type='text' name='qualDoencaDepOutro' id='outrosqualfamilia' value='"+fichaMedica.getQualDoencaDep()+"' class='form-control' placeholder='Qual(is) Doença(s)?'>");
                                                                                } else {
                                                                                    out.println("<input type='text' name='qualDoencaDepOutro' id='outrosqualfamilia'  class='form-control' placeholder='Qual(is) Doença(s)?'>");
                                                                               }
                                                                                // }
                                                                            %>   
                                                                                
                                                                                <div class="form-control-position">
                                                                                    <i class="fa fa-briefcase"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="medicamento">Você faz uso de medicamento controlado?*</label>
                                                            <div class="col-md-9">
                                                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                    <div class="col-md-2">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (!fichaMedica.getTemMedicamento()) {
                                                                                        out.println("<input checked type='radio' name='temMedicamento' id='naom' value='Não' class='custom-control-input' onclick='naoTemMedicamento();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temMedicamento' id='naom' value='Não' class='custom-control-input' onclick='naoTemMedicamento();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="naom">Não</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (fichaMedica.getTemMedicamento()) {
                                                                                        out.println("<input checked type='radio' name='temMedicamento' id='simm' value='Sim' class='custom-control-input' onclick='temMedicamentoControlado();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temMedicamento' id='simm' value='Sim' class='custom-control-input' onclick='temMedicamentoControlado();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="simm">Sim</label>
                                                                        </div>
                                                                    </div>
                                                                            <%
                                                                                    if (!fichaMedica.getTemMedicamento()) {
                                                                                        out.println("<div id='div_medicamento' class='hide col-md-9'>");
                                                                                    } else {
                                                                                        out.println("<div id='div_medicamento' class='col-md-9'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                          <div class="col-md-9">
                                                                            <div class="position-relative has-icon-left">
                                                                                <%
                                                                                if(fichaMedica.getQualMedicamento()!=null){
                                                                                    out.println("<input type='text' name='qualMedicamento' id='qualM' value='"+fichaMedica.getQualMedicamento()+"' class='form-control' placeholder='Qual(is) Medicamento(s)?'>");
                                                                                } else {
                                                                                    out.println("<input type='text' name='qualMedicamento' id='qualM'  class='form-control' placeholder='Qual(is) Medicamento(s)?'>");
                                                                               }
                                                                             %>
                                                                                <div class="form-control-position">
                                                                                    <i class="fa fa-briefcase"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="medicamento">Há alguém da família que faz uso de medicamentos controlado?*</label>
                                                            <div class="col-md-9">
                                                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                    <div class="col-md-2">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (!fichaMedica.getTemMedicamentoDep()) {
                                                                                        out.println("<input checked type='radio' name='temMedicamentoDep' id='naomd' value='Não' class='custom-control-input' onclick='naoTemMedicamentoFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temMedicamentoDep' id='naomd' value='Não' class='custom-control-input' onclick='naoTemMedicamentoFamilia();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="naomd">Não</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (fichaMedica.getTemMedicamentoDep()) {
                                                                                        out.println("<input checked type='radio' name='temMedicamentoDep' id='simmd' value='Sim' class='custom-control-input' onclick='temMedicamentoFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temMedicamentoDep' id='simmd' value='Sim' class='custom-control-input' onclick='temMedicamentoFamilia();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="simmd">Sim</label>
                                                                        </div>
                                                                    </div>
                                                                            <%
                                                                                    if (!fichaMedica.getTemMedicamentoDep()) {
                                                                                        out.println("<div id='div_medicamento_familia' class='hide col-md-9'>");
                                                                                    } else {
                                                                                        out.println("<div id='div_medicamento_familia' class='col-md-9'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                         <div class="col-md-10">
                                                                            <div class="position-relative has-icon-left">
                                                                                <%
                                                                                if(fichaMedica.getQuemMedicamentoDep()!=null){
                                                                                    out.println("<input type='text' name='quemMedicamentoDep' id='qualMd' value='"+fichaMedica.getQuemMedicamentoDep()+"' class='form-control' placeholder='Quem na família faz uso de Medicamento?'>");
                                                                                } else {
                                                                                    out.println("<input type='text' name='quemMedicamentoDep' id='qualMd'  class='form-control' placeholder='Quem na família faz uso de Medicamento?'>");
                                                                               }
                                                                             %>
                                                                               <div class="form-control-position">
                                                                                    <i class="fa fa-briefcase"></i>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="deficiencia">Você tem alguma deficiência?*:</label>
                                                            <div class="col-md-3">
                                                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                    <div class="col-md-3">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (!fichaMedica.getTemDeficiencia()) {
                                                                                        out.println("<input checked type='radio' name='temDeficiencia' id='deficiencianao' value='Não' class='custom-control-input' onclick='naoTemDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDeficiencia' id='deficiencianao' value='Não' class='custom-control-input' onclick='naoTemDeficiencia();'>");
                                                                                    }
                                                                                %>
                                                                             <label class="custom-control-label" for="deficiencianao">Não</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (fichaMedica.getTemDeficiencia()) {
                                                                                        out.println("<input checked type='radio' name='temDeficiencia' id='deficienciasim' value='Sim' class='custom-control-input' onclick='temDeficienciaa();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDeficiencia' id='deficienciasim' value='Sim' class='custom-control-input' onclick='temDeficienciaa();'>");
                                                                                    }
                                                                                %>
                                                                          <label class="custom-control-label" for="deficienciasim">Sim</label>
                                                                        </div> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                  <%
                                                            if (fichaMedica.getTemDeficiencia()) {
                                                                out.println("<div id='div_deficiencia' class='show' >");
                                                            } else {
                                                                out.println("<div id='div_deficiencia' class='hide' >");
                                                            }

                                                        %>
                                                        <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="deficiencia">Qual a sua deficiência?*: <h6 class="card-title" id="striped-row-layout-icons">(Atenção! Caso possui mais de uma deficiência, marque outras e informe quais são as deficiências.) </h6></label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                   // if(fichaMedica.getQualDeficiencia()!=null){
                                                                                    if (fichaMedica.getQualDeficiencia()!=null && fichaMedica.getQualDeficiencia().equals("Auditiva")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficiencia' id='auditiva' value='Auditiva' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficiencia' id='auditiva' value='Auditiva' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="auditiva">Auditiva&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficiencia()!=null && fichaMedica.getQualDeficiencia().equals("Fisica")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficiencia' id='fisica' value='Fisica' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficiencia' id='fisica' value='Fisica' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="fisica">Física&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficiencia()!=null && fichaMedica.getQualDeficiencia().equals("Visual")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficiencia' id='visual' value='Visual' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficiencia' id='visual' value='Visual' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="visual">Visual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficiencia()!=null && fichaMedica.getQualDeficiencia().equals("Intelectual")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficiencia' id='mental' value='Intelectual' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficiencia' id='mental' value='Intelectual' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="mental">Intelectual/Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio" >
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficiencia()!=null && fichaMedica.getQualDeficiencia().equals("Multiplas")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficiencia' id='multiplas' value='Multiplas' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficiencia' id='multiplas' value='Multiplas' class='custom-control-input' onclick='naoTemOutraDeficiencia();'>");
                                                                                    }
                                                                                //  }  
                                                                                %>
                                                                           <label class="custom-control-label" for="multiplas">Deficiência Múltiplas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                          <div class="custom-control custom-radio">
                                                                              <%
                                                                                  if (fichaMedica.getQualDeficiencia()!=null && 
                                                                                      !fichaMedica.getQualDeficiencia().equals("Multiplas") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Intelectual") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Visual") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Fisica") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Auditiva")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficiencia' id='outraDeficiencia' value='Outras' class='custom-control-input' onclick='temOutraDeficiencia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficiencia' id='outraDeficiencia' value='Outras' class='custom-control-input' onclick='temOutraDeficiencia();'>");
                                                                                    }
                                                                                //  }  
                                                                                %>
                                                                            <label class="custom-control-label" for="outraDeficiencia">Outras</label>
                                                                         </div>
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficiencia()!=null && 
                                                                                      !fichaMedica.getQualDeficiencia().equals("Multiplas") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Intelectual") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Visual") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Fisica") &&
                                                                                      !fichaMedica.getQualDeficiencia().equals("Auditiva")) { %>
                                                         <div id="div_outra_deficiencia">
                                                                 <% } else { %>
                                                         <div id="div_outra_deficiencia" class="hide col-md-9">
                                                             <% }%>
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualDeficienciaOutro" id="outraDeficienciaQual" class="form-control" placeholder="Qual(is) Deficiência(s)?" value="<%=fichaMedica.getQualDeficiencia()%>">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                         </div>
                                                            </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-md-3 label-control" for="deficienciaDep">Há pessoa(s) na família com deficiência?*: </label>
                                                            <div class="col-md-3">
                                                                <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                    <div class="col-md-3">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (!fichaMedica.getTemDeficienciaDep()) {
                                                                                        out.println("<input checked type='radio' name='temDeficienciaDep' id='naod' value='Não' class='custom-control-input' onclick='naoTemDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDeficienciaDep' id='naod' value='Não' class='custom-control-input' onclick='naoTemDeficienciaFamilia();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="naod">Não</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    if (fichaMedica.getTemDeficienciaDep()) {
                                                                                        out.println("<input checked type='radio' name='temDeficienciaDep' id='simd' value='Sim' class='custom-control-input' onclick='temDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='temDeficienciaDep' id='simd' value='Sim' class='custom-control-input' onclick='temDeficienciaFamilia();'>");
                                                                                    }
                                                                                %>
                                                                            <label class="custom-control-label" for="simd">Sim</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%
                                                            if (fichaMedica.getTemDeficienciaDep()) {
                                                                out.println("<div id='div_deficiencia_familia' class='show'>");
                                                            } else {
                                                                out.println("<div id='div_deficiencia_familia' class='hide'>");
                                                            }

                                                        %>
                                                       <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="qualdeficienciaDep">Qual deficiência na sua família?*: <h6 class="card-title" id="striped-row-layout-icons">(Atenção! Caso possui mais de uma deficiência, marque outras e informe quais são as deficiências.) </h6></label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group" style="border-width: medium; border-style: solid; border-color: #DEE2E6;">
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                    //if(fichaMedica.getQualDeficienciaDep()!=null){
                                                                                    if (fichaMedica.getQualDeficienciaDep()!=null && fichaMedica.getQualDeficienciaDep().equals("Auditiva")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficienciaDep' id='auditiva_familia' value='Auditiva' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficienciaDep' id='auditiva_familia' value='Auditiva' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="auditiva_familia">Auditiva&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficienciaDep()!=null && fichaMedica.getQualDeficienciaDep().equals("Fisica")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficienciaDep' id='fisica_familia' value='Fisica' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficienciaDep' id='fisica_familia' value='Fisica' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                           <label class="custom-control-label" for="fisica_familia">Física&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficienciaDep()!=null && fichaMedica.getQualDeficienciaDep().equals("Visual")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficienciaDep' id='visual_familia' value='Visual' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficienciaDep' id='visual_familia' value='Visual' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="visual_familia">Visual&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio">
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficienciaDep()!=null && fichaMedica.getQualDeficienciaDep().equals("Intelectual")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficienciaDep' id='mental_familia' value='Intelectual' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficienciaDep' id='mental_familia' value='Intelectual' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    }
                                                                                    
                                                                                %>
                                                                            <label class="custom-control-label" for="mental_familia">Intelectual/Mental&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio" >
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficienciaDep()!=null && fichaMedica.getQualDeficienciaDep().equals("Multiplas")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficienciaDep' id='multiplas_familia' value='Multiplas' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficienciaDep' id='multiplas_familia' value='Multiplas' class='custom-control-input' onclick='naoTemOutraDeficienciaFamilia();'>");
                                                                                    }
                                                                                   // }
                                                                                %>
                                                                            <label class="custom-control-label" for="multiplas_familia">Deficiência Múltiplas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                            <div class="custom-control custom-radio">
                                                                              <%
                                                                                  if (fichaMedica.getQualDeficienciaDep()!=null && 
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Multiplas") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Intelectual") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Visual") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Fisica") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Auditiva")) {
                                                                                        out.println("<input checked type='radio' name='qualDeficienciaDep' id='outraDeficienciaFamilia' value='Outras' class='custom-control-input' onclick='temOutraDeficienciaFamilia();'>");
                                                                                    } else {
                                                                                        out.println("<input type='radio' name='qualDeficienciaDep' id='outraDeficienciaFamilia' value='Outras' class='custom-control-input' onclick='temOutraDeficienciaFamilia();'>");
                                                                                    }
                                                                                //  }  
                                                                                %>
                                                                            <label class="custom-control-label" for="outraDeficienciaFamilia">Outras</label>
                                                                         </div>
                                                                            <%
                                                                                  if (fichaMedica.getQualDeficienciaDep()!=null && 
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Multiplas") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Intelectual") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Visual") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Fisica") &&
                                                                                      !fichaMedica.getQualDeficienciaDep().equals("Auditiva")) { %>
                                                         <div id="div_outra_deficiencia_familia" >
                                                                 <% } else { %>
                                                         <div id="div_outra_deficiencia_familia" class="hide col-md-9">
                                                             <% }%>
                                                            <div class="position-relative has-icon-left">
                                                                <input type="text" name="qualDeficienciaOutroFamilia" id="outraDeficienciaFamiliaQual" class="form-control" placeholder="Qual(is) Deficiência(s) na Família?" value="<%=fichaMedica.getQualDeficienciaDep()%>">
                                                                <div class="form-control-position">
                                                                    <i class="fa fa-briefcase"></i>
                                                                </div>
                                                            </div>
                                                         </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-actions">
                                                            <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                            <button type="reset" value="Limpar"  class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                <i class="ft-x"></i> Limpar
                                                            </button>
                                                            <button type="button" class="btn btn-primary os-icon os-icon-save" name="cadastrar" value="Cadastrar" onclick="verificaCampos()">
                                                                <i class="la la-check-square-o"></i> Salvar
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
