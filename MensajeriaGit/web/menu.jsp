<%-- 
    Document   : menu
    Created on : Aug 17, 2017, 8:38:38 AM
    Author     : Paul
--%>

<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("setLoggin") == null || sesion.getAttribute("setLoggin").toString().compareTo("true")!=0){
        %>
        <jsp:forward page="login.jsp"/>
        <%
            }else{}
        %>
        <%String Usuario = sesion.getAttribute("Usuario").toString(); %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
		<script src ="https://code.jquery.com/jquery-latest.js"></script>
		<script language="JavaScript" type="text/javascript" src="main.js"></script>
		<script language="JavaScript" type="text/javascript" src="motor.js"></script>
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
            <li ><a class = "Menu" href = "mensajes.jsp">Mensajes</a></li>
            <li><a class = "Menu" href="#">Archivos</a></li>
             <li><a class = "Menu" href="#">Usuarios</a></li>
            </ul>
        </nav>
       
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                <h1>Bienvenido <%=Usuario%>, ¿Qué desea hacer? </h1>
                <div id ="botones">
                    
                <ul>
                    <li><a href = 'perfil.jsp'> Mi perfil</a></li>
                    <li><a href = 'mensajes.jsp'> Ver mensajes</a></li>
                    <li><a href = "enviarmensaje.jsp"> Enviar mensajes</a> </li>
                    <li><a href = "cerrarsesion.jsp"> Salir</a></li>

                </ul>
                   
                </div>
                </div>
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
