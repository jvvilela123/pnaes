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
                                PNAES - IFTO - <i>Campus </i> <%=edital.getCampus().getNome()%>
                            </h5>
                            <div class="element-inner-desc">
                              
                                <div class="alert alert-warning" role="alert">
                                    Total de Inscritos no Edital Nº <%=edital.getNumeroEAno()%>:<h4 class="alert-heading"> <% out.print(inscricoes.size()); %></h4>
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
                                    List<Inscricao> inscricoes_por_bolsa = null;
                                   for (Bolsa b : bolsas) {
                                       inscricoes_por_bolsa = daoFactory.getInscricaoDao().perquisarPorBolsa(b.getId(),edital.getId());
                                        //não aparecer a opção nenhum
                                       // if(b.getId()!=6)
                                     out.print(inscricoes_por_bolsa.size()  + ",");
                                    }
                                                %>
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
                                                window.chartColors.gray,
                                                window.chartColors.purple,
                                                [238,130,238]
					],
					label: 'Dataset 1'
				}],
				labels: [
                                    <%
                                    
                                    for (Bolsa b : bolsas) {
                                         inscricoes_por_bolsa = daoFactory.getInscricaoDao().perquisarPorBolsa(b.getId(),edital.getId());
                                        //não aparecer a opção nenhum
                                       // if(b.getId()!=6)
                                        out.print("\'"+b.getNome() +" - "+ inscricoes_por_bolsa.size()+ " ( " + decimal.format(inscricoes_por_bolsa.size()*100.0 / inscricoes.size()) + "%" + " ) \',");
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
                                   List<Inscricao> inscricoes_por_categoria = null;
                                    
                                   for (Categoria c : categorias) {
                                       
                                       inscricoes_por_categoria = daoFactory.getInscricaoDao().perquisarPorCategoria(c.getId(),edital.getId());
                                     
                                        out.print(inscricoes_por_categoria.size() + ",");
                                    }
                                                %>
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue
					],
					label: 'Dataset 1'
				}],
				labels: [
                                    <%
                                    
                                    for (Categoria c : categorias) {
                                        
                                        inscricoes_por_categoria = daoFactory.getInscricaoDao().perquisarPorCategoria(c.getId(),edital.getId());
                                        
                                        out.print("\'"+c.getNome() +" - "+ inscricoes_por_categoria.size()+ " ( " + decimal.format(inscricoes_por_categoria.size()*100.0 / inscricoes.size()) + "%" + " ) \',");
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
   
          
           
          
   
