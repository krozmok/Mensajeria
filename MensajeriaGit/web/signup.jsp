<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Sign Up</title>
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
        %>
        <jsp:forward page="menu.jsp"/>
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
            <li> <a class = "Menu" href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign Up</a></li>
            <li ><a class = "Menu" href = "login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Log In</a></li>
            <li><a class = "Menu" href="#"><i class="fa fa-life-ring" aria-hidden="true"></i> Soporte</a></li>
             <li><a class = "Menu" href="#"><i class="fa fa-phone" aria-hidden="true"></i> Contactanos</a></li>
            </ul>
        </nav>
        <div id = "contenedor">
        <section class="section">
            <h1>SIGN UP</h1>
            <form name = "frmSignUp" method = "post" action="validarRegistro.jsp">
            Nombre: <input type = "text" name = "txtNombre"><br>
            Nickname: <input type = "text" name = "txtNick"><br>
            Fecha Nacimiento:  <input type = "date" name = "dateNacimiento"><br>
            Sexo : <input type = "radio" name = "rdioSexo" value = "H"> Hombre   <input type = "radio" name = "rdioSexo" value = "H"> Mujer <br>
           
            Contraseña: <input type = "text" name = "txtpass"><br>
            Confirmar contraseña: <input type = "text" name = "txtpassconfirm"><br>
            Pregunta secreta: <input type = "text" name = "txtpregunta"><br>
            Respuesta: <input type ="text" name ="txtrespuesta"><br>
            <input type="submit" value="Registrarse">
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
