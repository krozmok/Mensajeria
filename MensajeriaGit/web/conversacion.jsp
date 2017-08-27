<%-- 
    Document   : conversacion
    Created on : Aug 23, 2017, 4:00:04 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style.css">
	<script src ="https://code.jquery.com/jquery-latest.js"></script>
        <%--<script language="JavaScript" type="text/javascript" src="main.js"></script>--%>
	<script language="JavaScript" type="text/javascript" src="motor.js"></script>
    </head>
    <body>
        <header class="header">
	<div class="contenedor">
            <h1>STE MAIL<br> <i class="fa fa-envelope-o" aria-hidden="true"></i></h1>
				
	<!-- INICIO DEL NAV -->
	<nav class = "menu">
	<ul>
        <li ><a class = "Logo" href = "index.html"> <b>STE MAIL</b><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
	<li ><a class = "Menu" href = "javascript:Carga('login.jsp','contenedor');">Log In</a></li>
	<li><a class = "Menu" href="javascript:Carga('signup.html','contenedor');"> Sign UP</a></li>
        <li><a class = "Menu" href="#"> Soporte</a></li>
        <li><a class = "Menu" href="#"> Contactanos</a></li>
	</ul>
	</nav>
	</div>
	</header>
        
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                    <div class="chat">
                        <div class="Imagen1">
                            
                        </div>
                        <div class="Imagen2">
                            
                        </div>
                    </div>
                    <form class="message-box">
                        <input type="text" name="txtMensaje" id="caja_envio" autocomplete = "off">
                        <input type="submit" value="Enviar" id="boton_envio">
                    </form>
                </div>
            </section>
        </div>
        
    </body>
</html>
