<%-- 
    Document   : listar
    Created on : 11/03/2018, 12:21:16
    Author     : euzebio
--%>
<%@page import="modelo.Categoria"%>
<%@page import="util.DataFormat"%>
<%@page import="modelo.Inscricao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Inscritos</title>
        <%@include file="../imports.jsp" %>
        <script type="text/javascript" >
             $(document).ready(function () {
                $('#cat').change(function () {
                    //$('#divcurso')[0].style.display="block";
                    //$('#divcurso').style.display = 'block';
                    $('#curso').load('/pnaes/cursoajax.jsp?categoria=' + $('#cat').val());
                });

            });
           
            function apagar(id) {
                if (window.confirm("Deseja realmente excluir?")) {
                    var url = "../ServletBolsa?opcao=excluir&id=" + id;
                    window.location = url;
                }
            }
            
            $(document).ready(function() {
                $('table.dataTable').DataTable( {
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
                        

                    },
                    dom: 'Bfrtip',
                    
        buttons: [
            {
            extend: 'pdf',
            text: 'Gerar PDF',
            orientation:"landscape",
            className: 'btn btn-outline-primary btn-sm',
            exportOptions: {
                         
                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
                }
        },
            {
            extend: 'pdfHtml5',
            text: 'Gerar PDF Com Logo',
            orientation:"landscape",
            className: 'btn btn-outline-primary btn-sm',
            exportOptions: {
                     className:"cell-border",     
                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
                },
            customize: function ( doc ) {
                
                 var objLayout = {};
						objLayout['hLineWidth'] = function(i) { return .50; };
						objLayout['vLineWidth'] = function(i) { return .50; };
						objLayout['hLineColor'] = function(i) { return '#1D1E22'; };
						objLayout['vLineColor'] = function(i) { return '#1D1E22'; };
						objLayout['paddingLeft'] = function(i) { return 4; };
						objLayout['paddingRight'] = function(i) { return 4; };
						doc.content[0].layout = objLayout;
                // Splice the image in after the header, but before the table
                doc.content.splice( 0, 0, {
                    margin: [ 0, 0, 0, 12 ],
                    alignment: 'center',
                    image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAABVCAYAAAAMoKsDAAABN2lDQ1BBZG9iZSBSR0IgKDE5OTgpAAAokZWPv0rDUBSHvxtFxaFWCOLgcCdRUGzVwYxJW4ogWKtDkq1JQ5ViEm6uf/oQjm4dXNx9AidHwUHxCXwDxamDQ4QMBYvf9J3fORzOAaNi152GUYbzWKt205Gu58vZF2aYAoBOmKV2q3UAECdxxBjf7wiA10277jTG+38yH6ZKAyNguxtlIYgK0L/SqQYxBMygn2oQD4CpTto1EE9AqZf7G1AKcv8ASsr1fBBfgNlzPR+MOcAMcl8BTB1da4Bakg7UWe9Uy6plWdLuJkEkjweZjs4zuR+HiUoT1dFRF8jvA2AxH2w3HblWtay99X/+PRHX82Vun0cIQCw9F1lBeKEuf1UYO5PrYsdwGQ7vYXpUZLs3cLcBC7dFtlqF8hY8Dn8AwMZP/fNTP8gAAAAJcEhZcwAACxMAAAsTAQCanBgAAAZ0aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MiA3OS4xNjA5MjQsIDIwMTcvMDcvMTMtMDE6MDY6MzkgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIEZpcmV3b3JrcyBDUzQiIHhtcDpDcmVhdGVEYXRlPSIyMDE0LTExLTExVDEyOjE3OjAwWiIgeG1wOk1vZGlmeURhdGU9IjIwMTgtMDctMjlUMTc6MjQ6MjYtMDM6MDAiIHhtcDpNZXRhZGF0YURhdGU9IjIwMTgtMDctMjlUMTc6MjQ6MjYtMDM6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiBwaG90b3Nob3A6Q29sb3JNb2RlPSIzIiBwaG90b3Nob3A6SUNDUHJvZmlsZT0iQWRvYmUgUkdCICgxOTk4KSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo4NWE3YThhNi03MzQxLTVhNDQtOWUzMS1mZjNhM2U3MGVhNjUiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NmJhMzExMzQtZjEzNC0yMjRkLTg3M2MtZThjMzU1NTFhODM4IiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6NmJhMzExMzQtZjEzNC0yMjRkLTg3M2MtZThjMzU1NTFhODM4Ij4gPHBob3Rvc2hvcDpEb2N1bWVudEFuY2VzdG9ycz4gPHJkZjpCYWc+IDxyZGY6bGk+eG1wLmRpZDoxQjE5NTU1OTdFNDgxMUU4QjA4RUExMUQ2M0E5QjhEQTwvcmRmOmxpPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo2YmEzMTEzNC1mMTM0LTIyNGQtODczYy1lOGMzNTU1MWE4MzgiIHN0RXZ0OndoZW49IjIwMTgtMDctMjlUMTc6MjM6MDEtMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6ODVhN2E4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00+H0+lEJBbDaSefXPrn11//dsWKFW8tW76c7+zoGLV+zRpkZGejKxJBVnY2rrz6quLPP/1s+IEDB/oYmgab3Y5PFyzYn52dc8ozTz396rx334Wqqn05jhs3bdq0h+c+/viUjz76CGvWrn2qsbFx7UMPPVSqalrhU08/jR3bt298f948LFmyBLIkvXBMefmkWDx+7pNz5w7w+nzo27cvO236dBx33HHYsH79i5/Onz996ZdfIhgK9XU4HBfk5+WRQCBw4R8effTVYFtb2h8MePWFF19sSiaT506eOLH0vgcffOZ3N930bCwW/eNnn3569huvv45nX3jhEavVOpPRDSVqYZ2w8W4QhgNhedgYF6zUChtxpmM3WBYCYwXHCCCETTKES3CMACvvPuph490wVUBRNEWWFRCwsPJOgFIcTalsmOmhcenSpWhtbYXL5YJgsUCwWMCwrEIIwYMPPtiwacuWeW+89da8gM+3MxwO28aMHdv66muvXnPtddd2PPfss4VV1dXlfr9/f7fdI86xLCyCYDiczopoNFr+2SefFNpstgWXXnbZwFGjR+Mvb701s7mlhY4fN+7BrkjEFAUB7aHQsQMGDhy04LPPfEuXLs0aO3bsgksuu2xgdmYmlixZMnPdunX4euXKy9uDQWtnZyeJRiIFp59xhm3RokWly5YuzZp47LGLbvjd7waWDR+uffjBBzNHjR49+uxzzsHESZNQsXcvvvn6a2zcuNH6+WefzUzE4+bMs87qP+OUU9avWb26sLm5eZrT6dwpCkKYAHJDQwNK+/XDshUrfvx84cJ555xzzg8TJ016LJFIYPuOHdNEUTwTILVuj6dCUdXy+R99VEgpXXDFVVcNnFBejmVffXWnbtI8a3dsCACnpmkjqiorkZOdjS2bN0eqKyu7WltbewylVFGUqEUU8cqf/9ywfv36eXPmzp3nCwR2TZs+Dffde6/6pxdf/PajTz8NS6kUrr/hBmPJ0qUbr7766svD4XDuddddp23YsmX+wsWLPznuuOM8K5YvX8oQgvc//PCBm2+9NfH2m2/2BXBRZmbmsmg8jkWLFp2v6XqWqigonzChNuDz3Tl3zhzz5ltu+frr7767pk+fPuG5TzwxjeO4c6yiWGsRBMNms9FoVxfa2tqmPf/ss8eOHj06vOrHH6+56pprvv7T88+b69etu+OTjz8+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'
                } );
                // Data URL generated by http://dataurl.net/#dataurlmaker
                
               
            }
        },
            {
            extend: 'excel',
            text: 'Gerar EXCEL',
            orientation:"landscape",
            className: 'btn btn-outline-primary btn-sm',
            exportOptions: {
                        
                    columns: [ 0, 1, 2, 3, 4, 5, 6 ]
                }
        }
        
       /*, {
            extend: 'pdf',
            text: 'Gerar PDF da Página Atual',
            className: 'btn btn-outline-primary btn-sm',
            exportOptions: {
                modifier: {
                    page: 'current'
                }
            }
        }*/
    ]
                   
                } );
            } );
            
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
                            <div style="width: 90%">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title" id="striped-row-layout-icons">Lista de Inscritos</h4>
                                                <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                                                <div class="heading-elements">
                                                </div>
                                            </div>
                                            <div class="card-content collpase show">
                                                <div class="card-body">
                                                    <div class="card-text">
                                                       Lista com todos os incritos no Edital corrente 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <form class="form form-horizontal form-bordered" method="POST" action="listar.jsp">
                                                                <div class="form-body">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 label-control" for="pesquisa">Pesquisa por Auxílio 1ª Opção:</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pBolsa1" class="form-control">
                                                                                <option selected="" disabled="">Selecione o Auxílio ↓</option>
                                                                                <%     
                                                                                    List<Bolsa> bolsas = daoFactory.getBolsaDao().listar();
                                                                                    for (Bolsa b : bolsas) {
                                                                                        out.print("<option value=" + b.getId() + ">" + b.getNome() + "</option>");
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                            <div class="form-group row">
                                                                         <label class="col-md-3 label-control" for="pCat">Pesquisa por Modalidade:</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pCategoria" id ="cat" class="form-control">
                                                                                <option selected="" disabled="">Selecione a Modalidade ↓</option>
                                                                                <%
                                                                                    List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                                                                    for (Categoria c : categorias) {
                                                                                        out.print("<option value=" + c.getId() + ">" + c.getNome() + "</option>");
                                                                                    }
                                                                                %>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group row">
                                                                       <label class="col-md-3 label-control" for="pesquisa">Pesquisa por Curso:</label>
                                                                        <div class="col-md-4">
                                                                            <select name="pCurso" id="curso" class="form-control">
                                                                               <option selected="" disabled="">Selecione primeiro a Modalidade do Curso ↑</option>
                                                                                
                                                                            </select>
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <button type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                                                                                <i class="fa fa-check-square-o"></i>Buscar
                                                                            </button>&nbsp;
                                                                           
                                                                        </div>
                                                                        <div class="col-md-2">
                                                                            <a href="/pnaes/inscricao/listar.jsp"> <button type="button" value="Limpar" class="btn btn-danger">
                                                                                <i class="fa fa-check-square-o"></i>Limpar Busca/Filtro
                                                                            </button></a>
                                                                            <div style="margin: 25px 50px 75px 100px;">
                                                                                <!-- <button class="btn btn-primary" onclick="generate()">
                                                                                    <i class="fa fa-check-square-o"></i>Gerar PDF
                                                                                </button>-->
                                                                            </div>
                                                                        </div>    
                                                                    </div>
                                                                </div>
                                                            </form>                                                            
                                                        </div>
                                                    </div>
                                                    <%
                                                        DataFormat dataFormat = new DataFormat();
                                                        List<Inscricao> inscricoes = daoFactory.getInscricaoDao().perquisarPorEdital(edital.getId());
                                                        
                                                       
                                                        if (request.getParameter("pBolsa1") != null && request.getParameter("pCategoria") == null && request.getParameter("pCurso") == null) {
                                                            //selecionou somente a Bolsa
                                                           inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsa(Integer.parseInt(request.getParameter("pBolsa1")),edital.getId());
                                                         } else if (request.getParameter("pBolsa1") != null && request.getParameter("pCategoria") != null && request.getParameter("pCurso") == null) {
                                                           //Selecionou Bolsa e Categoria
                                                           inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsaECategoria(Integer.parseInt(request.getParameter("pBolsa1")), Integer.parseInt(request.getParameter("pCategoria")),edital.getId());
                                                             } else if (request.getParameter("pBolsa1") != null && request.getParameter("pCategoria") != null && request.getParameter("pCurso") != null) {
                                                                 //Selecionou Bolsa, Categoria e Curso
                                                                 inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsaECategoriaECurso(Integer.parseInt(request.getParameter("pBolsa1")), Integer.parseInt(request.getParameter("pCategoria")), Integer.parseInt(request.getParameter("pCurso")), edital.getId());
                                                             } else if (request.getParameter("pBolsa1") == null && request.getParameter("pCategoria") != null && request.getParameter("pCurso") == null) {
                                                                 //Selecionou Somente a Categoria
                                                                 inscricoes = daoFactory.getInscricaoDao().perquisarPorCategoria(Integer.parseInt(request.getParameter("pCategoria")),edital.getId());
                                                             } else if (request.getParameter("pBolsa1") == null && request.getParameter("pCategoria") != null && request.getParameter("pCurso") != null) {
                                                                //Selecionou Categoria e Curso
                                                                inscricoes = daoFactory.getInscricaoDao().perquisarPorCategoriaECurso(Integer.parseInt(request.getParameter("pCategoria")),Integer.parseInt(request.getParameter("pCurso")),edital.getId());
                                                             }
                                                       %>



                                                    <table class="table table-striped table-responsive-md dataTable">
                                                         <thead>
                                                             <tr>
                                                                <th>Nº da Inscrição</th>
                                                                <th>Aluno</th>
                                                                <th>CPF</th>
                                                                <th>Modalidade - Curso</th>
                                                                <th>Auxílio 1ª Opção</th>
                                                                <th>Auxílio 2ª Opção</th>
                                                                <th>Data da Inscrição</th>
                                                                <th>Visualizar</th>
                                                            </tr>
                                                         </thead>
                                                            <%
                                                                for (Inscricao i : inscricoes) {
                                                            %>
                                                            <tr>
                                                                <td><%=i.getId()%></td>
                                                                <td><%=i.getAluno().getNome()%></td>
                                                                <td><%=i.getAluno().getCpf()%></td>
                                                                <td><%=i.getAluno().getCurso().getCategoria().getNome()%> - <%=i.getAluno().getCurso().getNome()%></td>
                                                                <td><%=i.getBolsa1().getNome()%></td>
                                                                <td><%=i.getBolsa2().getNome()%></td>
                                                                <td><%=dataFormat.formatarData(i.getDataInscricao())%></td>
                                                                <td><a href="/pnaes/inscricao/visualizar.jsp?id=<%=i.getAluno().getId()%>"><img src="/pnaes/<%=edital.getNumero()%>/alunos/<%=i.getAluno().getCpf()%>/<%=i.getAluno().getCpf()%>.jpg" width="30" height="40"/></a></td>

                                                            </tr>
                                                            <%
                                                                }
                                                            %>
                                                            <tfoot>
                                                             <tr>
                                                                <th>Nº da Inscrição</th>
                                                                <th>Aluno</th>
                                                                <th>CPF</th>
                                                                <th>Modalidade - Curso</th>
                                                                <th>Auxílio 1ª Opção</th>
                                                                <th>Auxílio 2ª Opção</th>
                                                                <th>Data da Inscrição</th> 
                                                                <th>Visualizar</th>
                                                            </tr>
                                                         </tfoot>
                                                    </table> 

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
        <script src='/pnaes/js/jspdf.plugin.autotable.js'></script>                                                       
    </body>
</html>