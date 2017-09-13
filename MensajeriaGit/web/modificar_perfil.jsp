<%-- 
    Document   : modificar_perfil
    Created on : 09-sep-2017, 19:04:12
    Author     : WozMit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Modificar perfil de usuario</title>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
		<script src ="https://code.jquery.com/jquery-latest.js"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("setLoggin") == null || sesion.getAttribute("setLoggin").toString().compareTo("true")!=0){
        %>
        <jsp:forward page="login.jsp"/>
        <%
            }else{}
        %>
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
        <div id = "contenedor">
        <section class="section">
            <h1>Modificar información de usuario</h1>
            
            <form name = "frmModify" method = "post" action="validar_modificacion.jsp">
                <input placeholder="Contraseña" type = "text" name = "txtpass"><br><br>
                <input placeholder="Nombre" type = "text" name = "txtNombre"><br>
                <input placeholder="Sexo" type = "radio" name = "rdioSexo" value = "H"> Hombre   <input type = "radio" name = "rdioSexo" value = "H"> Mujer <br>
                <input placeholder="Nueva contraseña" type = "text" name = "txtnpass"><br>
                <input placeholder="Confirmar nueva contraseña" type = "text" name = "txtpassconfirm"><br>
		<input type="submit" value="Confirmar">
            </form>
            
        </section>
        </div>
        <div class="footer">
                <h3>Grupo:<br>
                    <ul>
                        <li>Caceres Thamiña Paul Vladimir</li>
                        <li>Campos Ardiles Isaac</li>
                        <li>Leon Malpartida Jared</li>
                        <li>Rimayhuaman Grajeda Brayan</li>
                    </ul>
                </h3>
        </div>
    </body>
</html>
