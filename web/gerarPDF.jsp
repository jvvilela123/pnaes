<%-- 
    Document   : gerarPDF
    Created on : 25/10/2018, 14:03:00
    Author     : ti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.5/jspdf.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#btnPDF').click(function () {
                    savePDF(document.querySelector('#geraPDF'));
                });
            });

            function savePDF(codigoHTML) {
                var doc = new jsPDF('landscape', 'pt', 'a4'),
                        data = new Date();
                margins = {
                    top: 40,
                    bottom: 60,
                    left: 40,
                    width: 1000
                };
                doc.fromHTML(codigoHTML,
                        margins.left, // x coord
                        margins.top, {pagesplit: true},
                        function (dispose) {
                            doc.save("Relatorio - " + data.getDate() + "/" + data.getMonth() + "/" + data.getFullYear() + ".pdf");
                        });
            }
        </script>
        
        <div id="geraPDF">
            <h1>Hello World!</h1>
            [conteudo1]
            [conteudo2]
            [conteudo3]
        </div>

        <button class="btn btn-danger" id="btnPDF">Gerar PDF</button>

    </body>
</html>
