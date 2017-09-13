<%-- 
    Document   : chatgrupal
    Created on : Sep 12, 2017, 5:41:59 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chat grupal</title>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style.css">
	<script src ="https://code.jquery.com/jquery-latest.js"></script>
	<script language="JavaScript" type="text/javascript" src="main.js"></script>
    </head>
    <body>
        <header class="header">
            <div class="contenedor">
                <div class="logo">
                    <h1><a href="index.jsp">STE MAIL<br> <i class="fa fa-envelope-o" aria-hidden="true"></i></a></h1>
                </div>
	
            </div>
	</header>
	
	<nav class = "menu">
            <ul>
            <li ><a class = "Logo" href = "index.jsp"> <b>STE MAIL</b><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
            <li> <a class = "Menu" href="perfil.jsp">Mi perfil</a></li>
            <li ><a class = "Menu" href = "mensajes.jsp">Ver Mensajes</a></li>
            <li ><a class = "Menu" href = "enviarmensaje.jsp">Enviar Mensajes</a></li>
            <li><a class = "Menu" href="archivos.jsp">Archivos</a></li>
             <li><a class = "Menu" href="usuarios.jsp">Usuarios</a></li>
             <li><a class = "Menu" href="modificar_perfil.jsp">Modificar Perfil</a></li>
             <li><a class ="Menu" href="cerrarsesion.jsp">Sign Out</a></li>
            </ul>
        </nav>
        
        <div id="contenedor">
        <section class="section">
            <div id="presentacion">
                <div class="chat">
                        <div class="Imagen1">
                            
                        </div>
                        <div class="Usuarios">
                            <ul>
                                

                            </ul>

                        </div>
                        <div id="Mensajes" >
                            
                        </div>
            </div>
        </section>
        </div>
    </body>
</html>
