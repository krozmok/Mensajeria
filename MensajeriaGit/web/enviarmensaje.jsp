<%-- 
    Document   : enviarmensjae
    Created on : Aug 24, 2017, 8:23:30 AM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.css">
		<script src ="https://code.jquery.com/jquery-latest.js"></script>
		<script language="JavaScript" type="text/javascript" src="main.js"></script>
		<script language="JavaScript" type="text/javascript" src="motor.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <header class="header">
			<div class="contenedor">
				<div class="logo">
				<h1>STE MAIL<br> <i class="fa fa-envelope-o" aria-hidden="true"></i></h1>
				</div>
				<!-- INICIO DEL NAV -->
				<nav class = "menu">
					<ul>
						<li ><a class = "Logo" href = "index.html"> <b>STE MAIL</b><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
						<li ><a class = "Menu" href = "login.jsp">Log In</a></li>
						<li><a class = "Menu" href="signup.html"> Sign UP</a></li>
						<li><a class = "Menu" href="#"> Soporte</a></li>
						 <li><a class = "Menu" href="#"> Contactanos</a></li>
					</ul>
				</nav>
			</div>
		</header>
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                    <%
                        String BaseDatos = "BDMensajeria";
                        MongoClient mCliente = new MongoClient("127.0.0.1",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection coleccion = db.getCollection("Usuario");
                        DBCursor cursor = coleccion.find();
                        %>
                        <form name="fmEnviarMensaje" method="get" action ="conversacion.jsp">
                        <table border ="1px">
                        
                        <%
                        while(cursor.hasNext()){
                            String Usuario1 = cursor.next().get("Usuario").toString();
                            if (Usuario1.equals())
                        %>
                        <tr>
                            <td><input type = "submit" value="<%=Usuario1%>"></td>
                            
                        </tr>
                        <%
                        }
                    %>
                    </table>
                    </form>
                </div>
            </section>
        </div>
    </body>
</html>
