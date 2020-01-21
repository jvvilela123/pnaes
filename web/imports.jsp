
<meta content="ie=edge" http-equiv="x-ua-compatible">
<meta content="template language" name="keywords">
<meta content="Tamerlan Soziev" name="author">
<meta content="Admin dashboard html template" name="description">
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="/pnaes/img/favicon.png" rel="shortcut icon">
<link rel=icon href="/pnaes/img/favicon.png" sizes="16x16" type="image/png">
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
<link rel="stylesheet" href="/pnaes/css/alertify.css">
<link rel="stylesheet" href="/pnaes/css/datatables.css">

<script src="/pnaes/js/jquery.js"></script>
<script src="/pnaes/js/Chart.min.js"></script>
<script src="/pnaes/js/utils.js"></script>





 
 
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
<script src="/pnaes/js/popImg.js"></script>

<!-- include alertify script -->
<script src="/pnaes/js/alertify.js"></script>

<!-- Include JqueryUI-->
<link rel="stylesheet" href="/pnaes/css/jquery-ui.css">
<script src="/pnaes/js/jquery-ui.js"></script>
<script src="/pnaes/js/dataTable/datatables.js"></script>
<script src="/pnaes/js/dataTable/dataTables.buttons.min.js"></script>
<script src="/pnaes/js/dataTable/buttons.flash.min.js"></script>
<script src="/pnaes/js/dataTable/jszip.min.js"></script>
<script src="/pnaes/js/dataTable/pdfmake.min.js"></script>
<script src="/pnaes/js/dataTable/vfs_fonts.js"></script>
<script src="/pnaes/js/dataTable/buttons.html5.min.js"></script>
<script src="/pnaes/js/dataTable/buttons.print.min.js"></script>

<script type="text/javascript">
     //Zoom na Imagem do Aluno
    $(function () {
    $("img.img_aluno").popImg();
    });
//override defaults
alertify.defaults.transition = "slide";
alertify.defaults.theme.ok = "btn btn-primary";
alertify.defaults.theme.cancel = "btn btn-danger";
alertify.defaults.theme.input = "form-control";
if (!alertify.errorAlert) {
    alertify.dialog('errorAlert', function factory() {
        return{
            build: function () {
                var errorHeader = '<h5 class="card-title"><img src="/pnaes/img/error-24px.svg"/>Preencha corretamente os campos</h5>';
                this.setHeader(errorHeader);
            }
        };
    }, true, 'alert');
}

//Função Genérica para validar se pelo menos 1 dos radios foi selecionado, parâmetro nome do campo (name), retorno Boolean
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

	// Se o tempo não for zerado
	if((tempo - 1) >= 0){

		// Pega a parte inteira dos minutos
		var min = parseInt(tempo/60);
		// Calcula os segundos restantes
		var seg = tempo%60;

		// Formata o número menor que dez, ex: 08, 07, ...
		if(min < 10){
			min = "0"+min;
			min = min.substr(0, 2);
		}
		if(seg <=9){
			seg = "0"+seg;
		}

		// Cria a variável para formatar no estilo hora/cronômetro
		horaImprimivel = min + ':' + seg;
		//JQuery pra setar o valor
		 //document.getElementById('tempo').html(horaImprimivel);
                 div.html( "<strong>Tempo Restante de sessão: "+ horaImprimivel + "</strong>");
                // document.getElementById("divTempo").innerHTML = "<h1>" + horaImprimivel +"</h1>";
                
		// diminui o tempo
		tempo--;
                // Define que a função será executada novamente em 1000ms = 1 segundo
		setTimeout('startCountdown('+tempo+')',1000);

	// Quando o contador chegar a zero faz esta ação
	} else {
                //div.classList.remove('alert-info');
                //div.classList.add('alert-danger');
                document.getElementById('divTempo').className = 'alert alert-danger';
                //$( "#divTempo" ).html("00:00 Sessão expirada! Clique <a href='/pnaes/index.jsp?sair=1'><strong>AQUI</strong></a>e refaça o seu login!");
               // await sleep(2000);
                window.open('/pnaes/index.jsp?sair=1', '_self');
	}

}
function formatar(mascara, documento) {
                var i = documento.value.length;
                var saida = mascara.substring(0, 1);
                var texto = mascara.substring(i);
                if (texto.substring(0, 1) !== saida) {
                    documento.value += texto.substring(0, 1);
                }
            }
            
            function formatarMoeda(valor) {
            var valorFormatado = valor.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
            return valorFormatado;
	     //alert('O valor formatado de ' + valor + ' é ' + valorFormatado);
            }
            
            function moeda(a, e, r, t) {
            let n = ""
              , h = j = 0
              , u = tamanho2 = 0
              , l = ajd2 = ""
              , o = window.Event ? t.which : t.keyCode;
              a.value = a.value.replace('R$ ','');            
            if (n = String.fromCharCode(o),
            -1 == "0123456789".indexOf(n))
                return !1;
            for (u = a.value.replace('R$ ','').length,
            h = 0; h < u && ("0" == a.value.charAt(h) || a.value.charAt(h) == r); h++)
                ;
            for (l = ""; h < u; h++)
                -1 != "0123456789".indexOf(a.value.charAt(h)) && (l += a.value.charAt(h));
            if (l += n,
            0 == (u = l.length) && (a.value = ""),
            1 == u && (a.value = "R$ 0" + r + "0" + l),
            2 == u && (a.value = "R$ 0" + r + l),
            u > 2) {
                for (ajd2 = "",
                j = 0,
                h = u - 3; h >= 0; h--)
                    3 == j && (ajd2 += e,
                    j = 0),
                    ajd2 += l.charAt(h),
                    j++;
                for (a.value = "R$ ",
                tamanho2 = ajd2.length,
                h = tamanho2 - 1; h >= 0; h--)
                    a.value += ajd2.charAt(h);
                a.value += r + l.substr(u - 2, u)
            }
            return !1
        }
            
</script>
