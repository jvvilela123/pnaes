<%-- 
    Document   : cadastrarEntrevista
    Created on : 15/02/2018, 08:04:06
    Author     : ronan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body class="site">
        <h1>Hello World!</h1>
        <form  method="POST" action="ServletEntrevista">
            <fieldset>
                <legend>CADASTRO DE ENTREVISTA</legend>
                DATA ENTREVISTA: <input type="text" name="dataEntrevista"><br/>
                SITUAÇAO: <input type="text" name="situacao"><br/>
                
                 
            </fieldset>
                <input type="reset" value="Limpar"/>
                <input type="submit" value="Cadastrar"/>            
                <input type="hidden" name="opcao" value="cadastrar"/>            
        </form>
    </body>
</html>
