<%-- 
    Document   : index.jsp
    Created on : Aug 27, 2017, 8:00:29 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensajeria</title>
        <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            <li> <a class = "Menu" href="signup.html"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</a></li>
            <li ><a class = "Menu" href = "login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Log In</a></li>
            <li><a class = "Menu" href="#"><i class="fa fa-life-ring" aria-hidden="true"></i> Soporte</a></li>
             <li><a class = "Menu" href="#"><i class="fa fa-phone" aria-hidden="true"></i> Contactanos</a></li>
            </ul>
        </nav>
	<div id="contenedor">
            <section class="section">
                <div id="presentacion">
                <h1>BIENVENIDO A STE MAIL</h1>
                <img src="img/nube.gif" alt="gif">
                    <div id="botones">
                        <ul>
                            <li><a href="signup.html">SIGN UP</a></li>
                            <li><a href="login.jsp">LOG IN</a></li>
                        </ul>
                    </div>
                </div>
                <div id="introduccion">
                    <h1>CARACTERISTICAS</h1> 
                    <ul>
                        <li><i class="fa fa-thumbs-o-up fa-2x" aria-hidden="true" ></i><br>Ameno</li>
                        <li><i class="fa fa-handshake-o fa-2x" aria-hidden="true"></i><br>Confiable</li>
                        <li><i class="fa fa-exchange fa-2x" aria-hidden="true"></i><br>Veloz</li>
                    </ul>
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
