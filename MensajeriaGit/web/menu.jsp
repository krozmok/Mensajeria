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
    <%! 
        public void Conectar(String Usuario, HttpSession sesion){
            sesion.setAttribute("Usuario", Usuario);
            sesion.setAttribute("setLoggin","true");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <h1><a href="index.html">STE MAIL<br> <i class="fa fa-envelope-o" aria-hidden="true"></i></a></h1>
                </div>
	
            </div>
	</header>
	
	<nav class = "menu">
            <ul>
            <li ><a class = "Logo" href = "index.html"> <b>STE MAIL</b><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
            <li> <a class = "Menu" href="#">Mi perfil</a></li>
            <li ><a class = "Menu" href = "#">Mensajes</a></li>
            <li><a class = "Menu" href="#">Archivos</a></li>
             <li><a class = "Menu" href="#">Usuarios</a></li>
            </ul>
        </nav>ader>
       
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                <h1>LOGEASTE, QUE DESEAS HACER?</h1>
                <div id ="botones">
                <ul>
                    <%
                        HttpSession sesionok = request.getSession();
                        String User = sesionok.getAttribute("Usuario").toString();
                        if(User!= null){
                            HttpSession sesion = request.getSession();
                            out.println("<li><a href = 'mensajes.jsp'> Ver mensajes</a></li>");
                        }
                    %>
                    
                    
                    <li><a href = "enviarmensaje.jsp"> Enviar mensajes</a> </li>
                    <li><a href = "#"> Salir</a></li>

                </ul>
                </div>
                </div>
            </section>
        </div>
    </body>
</html>
