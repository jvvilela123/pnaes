<%@page import="modelo.Categoria"%>
<%@page import="modelo.Inscricao"%>
<%@page import="modelo.Bolsa"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Aluno"%>
<%@page import="dao.DaoFactory"%>
<div style="margin-left: 20px">
  
    <br>
    <div class="element-box">
        <div class="element-info">
            <div class="row align-items-center">
                <div class="col-sm-8">
                    <div class="element-info-with-icon">
                        <div class="element-info-icon">
                            <div class="os-icon os-icon-wallet-loaded"></div>
                        </div>
                        <div class="element-info-text">
                             <%
                          List<Inscricao> inscricoes = null;
	                  inscricoes = daoFactory.getInscricaoDao().perquisarPorEdital(edital.getId());
                          %>
                            <h5 class="element-inner-header">
                                PNAES - IFTO
                            </h5>
                            <div class="element-inner-desc">
                              
                                <div class="alert alert-warning" role="alert">
                                    Total de Inscritos no Edital Nº <% out.print(edital.getNumeroEAno()); %>:<h4 class="alert-heading"> <% out.print(inscricoes.size()); %></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-xl-6">
                <div class="element-box">
                    <h5 class="form-header">
                        INSCRIÇÕES POR 1ª OPÇÃO DE BOLSA
                    </h5>
                    <div class="form-desc">
                    </div>
                    <div class="element-box-content">
                    </div>
                    <div class="element-box-content">                     
                  
		          <canvas id="chart-area"></canvas>
                         
                        <script>
                            var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						<%
                                   List<Bolsa> bolsas = daoFactory.getBolsaDao().buscarBolsaPorEdital(edital.getId());
                                   
                                   for (Bolsa b : bolsas) {
                                       inscricoes = daoFactory.getInscricaoDao().perquisarPorBolsa(b.getId(),edital.getId());
                                        //não aparecer a opção nenhum
                                       // if(b.getId()!=6)
                                        out.print(inscricoes.size() + ",");
                                    }
                                                %>
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: [
                                    <%
                                    
                                    for (Bolsa b : bolsas) {
                                        //não aparecer a opção nenhum
                                       // if(b.getId()!=6)
                                        out.print("\'"+b.getNome() + "\',");
                                    }
                               %>
					
				]
			},
			options: {
				responsive: true
			}
		};

		
                        </script>
                  
                    </div>
                </div>
            </div>
                
            <div class="col-md-2 col-xl-6">
                <div class="padded b-l b-r-xl">
                    <div class="element-info-with-icon smaller">
                        <div class="element-box">
                            <h5 class="form-header">
                                 INSCRIÇÕES POR MODALIDADE
                            </h5>
                            <div class="form-desc">
                            </div>
                            <div class="element-box-content">
                            </div>
                            <div class="element-box-content">
                               <canvas id="chart-area2"></canvas>
                         
                        <script>
                            var config2 = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						<%
                                   List<Categoria> categorias = daoFactory.getCategoriaDao().listar();
                                   
                                   for (Categoria c : categorias) {
                                       inscricoes = daoFactory.getInscricaoDao().perquisarPorCategoria(c.getId(),edital.getId());
                                        //não aparecer a opção nenhum
                                      //  if(b.getId()!=6)
                                        out.print(inscricoes.size() + ",");
                                    }
                                                %>
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: [
                                    <%
                                    
                                    for (Categoria c : categorias) {
                                        //não aparecer a opção nenhum
                                       // if(c.getId()!=6)
                                        out.print("\'"+c.getNome() + "\',");
                                    }
                               %>
					
				]
			},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx2 = document.getElementById('chart-area2').getContext('2d');
			window.myPie = new Chart(ctx2, config2);
                        var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};
                        </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
           
            </div>
        </div>
    </div>
   
          
           
          
   
