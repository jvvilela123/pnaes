
<meta content="ie=edge" http-equiv="x-ua-compatible">
<meta content="template language" name="keywords">
<meta content="Tamerlan Soziev" name="author">
<meta content="Admin dashboard html template" name="description">
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="favicon.png" rel="shortcut icon">
<link href="apple-touch-icon.png" rel="apple-touch-icon">
<!--<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet" type="text/css">-->
<link href="/pnaes/css/googlecss.css?family=Rubik:300,400,500" rel="stylesheet" type="text/css">
<link href="/pnaes/bower_components/select2/dist/css/select2.min.css" rel="stylesheet">
<link href="/pnaes/bower_components/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
<link href="/pnaes/bower_components/dropzone/dist/dropzone.css" rel="stylesheet">
<link href="/pnaes/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="/pnaes/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<link href="/pnaes/bower_components/perfect-scrollbar/css/perfect-scrollbar.min.css" rel="stylesheet">
<link href="/pnaes/bower_components/slick-carousel/slick/slick.css" rel="stylesheet">
<link href="/pnaes/css/main.css?version=4.4.0" rel="stylesheet">
<script src="/pnaes/js/jquery.js"></script>
<script src="/pnaes/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/pnaes/bower_components/popper.js/dist/umd/popper.min.js"></script>
<script src="/pnaes/bower_components/moment/moment.js"></script>
<script src="/pnaes/bower_components/chart.js/dist/Chart.min.js"></script>
<script src="/pnaes/bower_components/select2/dist/js/select2.full.min.js"></script>
<script src="/pnaes/bower_components/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
<script src="/pnaes/bower_components/ckeditor/ckeditor.js"></script>
<script src="/pnaes/bower_components/bootstrap-validator/dist/validator.min.js"></script>
<script src="/pnaes/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="/pnaes/bower_components/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
<script src="/pnaes/bower_components/dropzone/dist/dropzone.js"></script>
<script src="/pnaes/bower_components/editable-table/mindmup-editabletable.js"></script>
<script src="/pnaes/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/pnaes/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="/pnaes/bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
<script src="/pnaes/bower_components/perfect-scrollbar/js/perfect-scrollbar.jquery.min.js"></script>
<script src="/pnaes/bower_components/tether/dist/js/tether.min.js"></script>
<script src="/pnaes/bower_components/slick-carousel/slick/slick.min.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/util.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/alert.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/button.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/carousel.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/collapse.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/dropdown.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/modal.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/tab.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/tooltip.js"></script>
<script src="/pnaes/bower_components/bootstrap/js/dist/popover.js"></script>
<script src="/pnaes/js/demo_customizer.js?version=4.4.0"></script>
<script src="/pnaes/js/main.js?version=4.4.0"></script>
<script src="/pnaes/js/jspdf.min.js"></script>
<script src="/pnaes/js/html2canvas.min.js"></script>
<script src="/pnaes/js/pdf.js"></script>
<script src="/pnaes/js/jspdf.debug.js"></script>
<!-- include alertify script -->
<script src="/pnaes/js/alertify.js"></script>
<script type="text/javascript">
//override defaults
alertify.defaults.transition = "slide";
alertify.defaults.theme.ok = "btn btn-primary";
alertify.defaults.theme.cancel = "btn btn-danger";
alertify.defaults.theme.input = "form-control";

//Fun��o Gen�rica para validar se pelo menos 1 dos radios foi selecionado, par�metro nome do campo (name), retorno Boolean
            function verificaRadioChecadoPeloName(nameRadio){
                var temAlgumChecado = false;
		var elementParaCheckar = document.getElementsByName(nameRadio);
		
        
                     for (var x = 0; x < elementParaCheckar.length; x++) {					
			if(elementParaCheckar[x] !== null && elementParaCheckar[x].checked !== false){
			     //Tem um elemento checado
			      temAlgumChecado = true;
			 }
					
		      }
                return temAlgumChecado;
            }
            
      function startCountdown(tempo){
    
       div = $( "#divTempo" );

	// Se o tempo n�o for zerado
	if((tempo - 1) >= 0){

		// Pega a parte inteira dos minutos
		var min = parseInt(tempo/60);
		// Calcula os segundos restantes
		var seg = tempo%60;

		// Formata o n�mero menor que dez, ex: 08, 07, ...
		if(min < 10){
			min = "0"+min;
			min = min.substr(0, 2);
		}
		if(seg <=9){
			seg = "0"+seg;
		}

		// Cria a vari�vel para formatar no estilo hora/cron�metro
		horaImprimivel = min + ':' + seg;
		//JQuery pra setar o valor
		 //document.getElementById('tempo').html(horaImprimivel);
                 div.html( "<strong>Tempo Restante de sess�o: "+ horaImprimivel + "</strong>");
                // document.getElementById("divTempo").innerHTML = "<h1>" + horaImprimivel +"</h1>";
                
		// diminui o tempo
		tempo--;
                // Define que a fun��o ser� executada novamente em 1000ms = 1 segundo
		setTimeout('startCountdown('+tempo+')',1000);

	// Quando o contador chegar a zero faz esta a��o
	} else {
                //div.classList.remove('alert-info');
                //div.classList.add('alert-danger');
                document.getElementById('divTempo').className = 'alert alert-danger';
                //$( "#divTempo" ).html("00:00 Sess�o expirada! Clique <a href='/pnaes/index.jsp?sair=1'><strong>AQUI</strong></a>e refa�a o seu login!");
               // await sleep(2000);
                window.open('/pnaes/index.jsp?sair=1', '_self');
	}

}      
</script>
