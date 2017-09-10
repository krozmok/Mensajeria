<%-- 
    Document   : login
    Created on : Aug 22, 2017, 8:04:12 AM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <%
            
            HttpSession sesion = request.getSession();
            if(sesion.getAttribute("setLoggin") == null) sesion.setAttribute("setLoggin", "false");
            
            if(sesion.getAttribute("setLoggin").toString().compareTo("true")==0){
                response.sendRedirect("menu.jsp");
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
            <li> <a class = "Menu" href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</a></li>
            <li ><a class = "Menu" href = "login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Log In</a></li>
            <li><a class = "Menu" href="#"><i class="fa fa-life-ring" aria-hidden="true"></i> Soporte</a></li>
             <li><a class = "Menu" href="#"><i class="fa fa-phone" aria-hidden="true"></i> Contactanos</a></li>
            </ul>
        </nav>
        
        <div id="contenedor">
            
	<section class="section">
               
	<h1>LOG IN</h1>	
            <form action = "verificarLogin.jsp" name = "frmMain" method = "get">
                Usuario: <input type = "text" name = "txtUSR"><br>
                Contraseña: <input type ="password"  name ="txtPASS"><br>
	<input type ="submit" value="Validar">
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
