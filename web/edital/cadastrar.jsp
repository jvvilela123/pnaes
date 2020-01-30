<%@page import="modelo.Bolsa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Uf"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Edital</title>
        <%@include file="../imports.jsp" %>
                  <%
                        List<Bolsa> bolsas = new ArrayList<Bolsa>();
                        
                    %>
        <script type="text/javascript" >
            function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i)
                if (texto.substring(0, 1) != saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            $.extend( true, $.fn.dataTable.defaults, {
    "searching": false,
    "ordering": false,
     "paging": false,
     "info":     false
} );
            $(document).ready(function() {
                $('#tabelaAuxilios').DataTable( {
                    styles: {
                    tableHeader: {
                        alignment: 'center'
                    }},
                    "language": {
                    "sEmptyTable": "Nenhum registro encontrado",
                    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                    "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                    "sInfoPostFix": "",
                    "sInfoThousands": ".",
                    "sLengthMenu": "_MENU_ resultados por página",
                    "sLoadingRecords": "Carregando...",
                    "sProcessing": "Processando...",
                    "sZeroRecords": "Nenhum registro encontrado",
                    "sSearch": "Pesquisar",
                    "oPaginate": {
                        "sNext": "Próximo",
                        "sPrevious": "Anterior",
                        "sFirst": "Primeiro",
                        "sLast": "Último"
                    },
                    "oAria": {
                        "sSortAscending": ": Ordenar colunas de forma ascendente",
                        "sSortDescending": ": Ordenar colunas de forma descendente"
                    },
                    "select": {
                        "rows": {
                            "_": "Selecionado %d linhas",
                            "0": "Nenhuma linha selecionada",
                            "1": "Selecionado 1 linha"
                        }
                    }
                      }
               
                } );
            } );
            
          

                function inserirAuxilio() {
                   var tabela = $('#tabelaAuxilios').DataTable();
                   var nome = document.getElementById('nomeAuxilio').value;
                    var valor = document.getElementById('valorAuxilio').value;
                    if(nome==='')
                        alert("preencha nome");
                   else if(valor==='')
                        alert("preencha valor");
                   if(nome!==''&&valor!==''){
                    tabela.row.add( [
                     nome,
                     valor,
                   "<a href='#' onclick='removerAuxilio(this)' title='Excluir' class='text-danger'><div class='os-icon os-icon-x'></div><span>Excluir</span></a>"
                    ] ).draw(false);
                    }
                    document.getElementById('nomeAuxilio').value = '';
                    document.getElementById('valorAuxilio').value = '';
                    <%
                        Bolsa bolsa = new Bolsa();
                        bolsa.setNome(""+%>nome<%"");
                        //bolsa.setValor(Double.parseDouble(request.getParameter("valorAuxilio")));
                        System.out.println("Bolsa: "+bolsa.getNome());
                        bolsas.add(bolsa);
                        
                    %>
                }
                
                function removerAuxilio(id) {
                    //alert("teste");
                     var tabela = $('#tabelaAuxilios').DataTable();
                     alertify.confirm('<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>ATENÇÃO!</h5>', 'Deseja realmente excluir o Auxílio <h5 class="card-title">'+tabela.rows($(id).parents('tr')).data[1]+'?</h5>', 
                function(){
                    tabela.rows($(id).parents('tr')).remove().draw();
                   // var url = "../ServletDependente?opcao=excluir&id=" + id;
                    //window.location = url; 
                }
                , function(){ alertify.error('Exclusão Cancelada');}).set('labels', {ok:'Excluir', cancel:'Cancelar'});
                    
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
                        <div class="content-header-right col-md-6 col-12" >
                            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">

                            </div>
                        </div>
                        <center>
                            <div style="width: 80%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Cadastro de Edital</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                        Preencha os dados corretamente
                                                    </div>

                                                    <form class="form form-horizontal striped-rows form-bordered" method="POST" action="../ServletEdital?opcao=cadastrar">
                                                        <div class="form-body">
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="numero">Numero do edital:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="numero" id="numero" class="form-control" placeholder="Numero do Edital">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dataInicial">Data de Abertura:</label>
                                                                <div class="col-md-9">
                                                                    <input type="date" name="dataInicial" id="dataInicial" class="form-control" placeholder="dd/MM/yyyy" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                                </div>
                                                            </div>
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="dataFinal">Data de Encerramento:</label>
                                                                <div class="col-md-9">
                                                                    <input type="date" name="dataFinal" id="dataFinal" class="form-control" placeholder="dd/MM/yyyy" required maxlength="10" OnKeyPress="formatar('##/##/####', this)">
                                                                </div>
                                                            </div>
                                                            
                                                            <br>
                                                        
                                                            <div class="form-group row">
                                                                <label class="col-md-3 label-control" for="nomeAuxilio">Nome do Auxílio:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="nomeAuxilio" id="nomeAuxilio" class="form-control" placeholder="Auxílio Transporte" required >
                                                                </div>
                                                                <label class="col-md-3 label-control" for="valorAuxilio">Valor do Auxílio:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text" name="valorAuxilio" id="valorAuxilio" class="form-control" placeholder="R$ 0.00" required>
                                                                </div>
                                                                <input type='button' onclick='inserirAuxilio()' value='Inserir Auxílio' />
                                                                    
                                                                    
                                                            </div>
                                                            <div class="card-text">
                                                                Lista de Auxílios
                                                             </div>
                                                               <table class="table table-striped table-responsive-md" id="tabelaAuxilios">
                                                                    <thead>
                                                                    <tr>
                                                                       <th>Nome do Auxílio</th>
                                                                        <th>Valor do Auxílio</th>
                                                                        <th>Remover</th>
                                                                   </tr>
                                                                    </thead>
                                                                </table>    
                                                            

                                                            <div class="form-actions right">
                                                                <button type="reset" value="Limpar" class="btn btn-warning mr-1">
                                                                    <i class="ft-x"></i> Limpar
                                                                </button>
                                                                <button type="submit" value="Cadastrar" class="btn btn-primary">
                                                                    <i class="fa fa-check-square-o"></i>Enviar
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