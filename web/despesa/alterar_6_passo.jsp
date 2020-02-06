
<%@page import="modelo.Dependente"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Despesa Mensal</title>  
        <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
            $(function(){
                $("#outrasDespesas").removeAttr("required");
                $("#qualOutrasDespesas").removeAttr("required");
                });
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            function naoTemOutra() {
                document.getElementById('temOutra').style.display = 'none';
                document.getElementById('outrasDespesas').value ='R$ 0,00';
                $("#outrasDespesas").removeAttr("required");
                $("#qualOutrasDespesas").removeAttr("required");
            
            }
            function temOutraDespesa() {
                document.getElementById('temOutra').style.display = 'block';
               
            }
           
            
        </script>
        
    </head>
    <body class="menu-position-side menu-side-left full-screen">
        <% session.getAttribute("aluno_id");
        %>
        <div class="all-wrapper with-side-panel solid-bg-all">

            <div class="all-wrapper solid-bg-all">
                <div class="layout-w">
                    <%@include file="../menu.jsp" %>
                    <div class="content-w">
                        <%@include file="../cabecalho.jsp" %>
                       <%
                                                if (request.getParameter("msg") != null) {
                                            %>
                                            <center>
                                                <div class="alert alert-danger" role="alert">
                                                    <strong><%=request.getParameter("msg")%></strong>
                                                </div>
                                            </center>
                                            <%
                                                }
                                            %>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <h4 class="form-section"><i class="ft-user"></i>Alteração dos Dados da Despesa Mensal</h4>
                                                    <div class="card-text" align="justify">
                                                       Se você não possui algumas das despesas abaixo, deixe o item em branco (R$ 0,00). Mas atenção, não deixe de informar a sua realidade, pois a NÃO declaração poderá comprometer a análise socioeconômica.
                                                    </div><br>
                                                    
                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletDespesa?opcao=alterar_6_passo&aluno_id=<%=session.getAttribute("aluno_id")%>">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="moradia">Moradia (Aluguel, Parcela de Financiamento, etc..) (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="moradia" id="moradia" value="<%=despesa.getMoradia()!=null?"R$ "+decimal.format(despesa.getMoradia()):""%>" class="form-control" placeholder="valor gasto com Moradia" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="alimentacao">Alimentação (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="alimentacao" id="alimentacao" value="<%=despesa.getAlimentacao()!=null?"R$ "+decimal.format(despesa.getAlimentacao()):""%>" class="form-control" placeholder="valor gasto com Alimentação" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>    
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="agua">Àgua (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="agua" id="agua" value="<%=despesa.getAgua()!=null?"R$ "+decimal.format(despesa.getAgua()):""%>" class="form-control" placeholder="valor gasto com Agua" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="energia">Energia (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="energia" value="<%=despesa.getEnergia()!=null?"R$ "+decimal.format(despesa.getEnergia()):""%>" id="energia" class="form-control" placeholder="valor gasto com Energia" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="telefone">Telefone (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="telefone"  value="<%=despesa.getTelefone()!=null?"R$ "+decimal.format(despesa.getTelefone()):""%>" id="telefone" class="form-control" placeholder="valor gasto com Telefone" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="transporte">Transporte (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="transporte" id="transporte" value="<%=despesa.getTransporte()!=null?"R$ "+decimal.format(despesa.getTransporte()):""%>" class="form-control" placeholder="valor gasto com Transporte" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>    
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="farmacia">Farmácia (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="farmacia" id="farmacia" value="<%=despesa.getFarmacia()!=null?"R$ "+decimal.format(despesa.getFarmacia()):""%>" class="form-control" placeholder="valor gasto com Farmacia" onKeyPress="return(moeda(this,'.',',',event))">
                                                                </div>
                                                            </div>
                                                                <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="temOutrasDespesas">Tem Outras Despesas?*:</label>
                                                                <div class="col-md-9">
                                                                    <div class="input-group">
                                                                        <div class="custom-control custom-radio">                                                                           
                                                                            <%
                                                                                if(despesa.getOutrasDespesas()<=0){
                                                                                    out.println("<input checked type='radio' name='temOutrasDespesas' value='Nao' class='custom-control-input' id='nao' required onclick='naoTemOutra();'>");                                         
                                                                                }else{
                                                                                    out.println("<input type='radio' name='temOutrasDespesas' value='Nao' class='custom-control-input' id='nao' required onclick='naoTemOutra();'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="nao">Não&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                                        </div>
                                                                        <div class="d-inline-block custom-control custom-radio">
                                                                            <%
                                                                                if(despesa.getOutrasDespesas()>0){
                                                                                    out.println("<input checked type='radio' name='temOutrasDespesas' value='Sim' class='custom-control-input' id='sim' required onclick='temOutraDespesa();'>");                                         
                                                                                }
                                                                                else{
                                                                                    out.println("<input type='radio' name='temOutrasDespesas' value='Sim' class='custom-control-input' id='sim' required onclick='temOutraDespesa();'>");
                                                                                }
                                                                            %>
                                                                            <label class="custom-control-label" for="sim">Sim</label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <% if(despesa.getOutrasDespesas()!=null && despesa.getOutrasDespesas()<=0){%>
                                                            <div id="temOutra" class="hide">
                                                                <%}else{%>
                                                           <div id="temOutra">
                                                                <%}%>
                                                                <div class="card-text" >
                                                      Se possuir mais de uma despesa, informe o valor total e em seguida especifique quais são as despesas
                                                                </div><br>
                                                                <div class="form-group row"> 
                                                                <label class="col-md-3 label-control" for="outrasDespesas">Valor Total das Outras Despesas* (R$ 0,00):</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="outrasDespesas" value="<%=despesa.getOutrasDespesas()!=null?"R$ "+decimal.format(despesa.getOutrasDespesas()):""%>" id="outrasDespesas" class="form-control" placeholder="Valor Gasto com Outras Despesas" onKeyPress="return(moeda(this,'.',',',event))" required>
                                                                </div>
                                                            </div>
                                                                
                                                               <div class="form-group row"> 
                                                                <label class="col-md-3 label-control" for="qualOutrasDespesas">Especifique Quais são as Outras Despesas:</label>
                                                                <div class="col-md-3">
                                                                    <textarea name="qualOutrasDespesas" rows="4" cols="50" placeholder="Especifique Quais são as Outras Despesas" id="qualOutrasDespesas" required><%=despesa.getQualOutrasDespesas()!=null||despesa.getQualOutrasDespesas().equals("")?despesa.getQualOutrasDespesas():""%></textarea>
                                                                    
                                                                </div>
                                                            </div>
                                                           </div>
                                                            <div class="form-actions right">
                                                                <a href="/pnaes/home.jsp"><button  class="btn btn-danger os-icon os-icon-delete" type="button" > Voltar</button></a>&nbsp;
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1 os-icon os-icon-hash">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary os-icon os-icon-save">
                                                                    <i class="fa fa-check-square-o"></i> Salvar
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
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

