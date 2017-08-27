<%-- 
    Document   : mensajes
    Created on : Aug 22, 2017, 8:17:13 AM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <%
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("127.0.0.1",27017);
            DB db = mCliente.getDB(BaseDatos);
            DBCollection coleccion = db.getCollection("Mensaje");
            String usuario = "";
            HttpSession sesionOK = request.getSession();
            usuario = sesionOK.getAttribute("Usuario").toString();
            
            BasicDBObject documento = new BasicDBObject();
            documento.put("UsuarioD", usuario);
            DBCursor cursor = coleccion.find(documento);
            
        %>
        <header class="header">
			<div class="contenedor">
				<div class="logo">
				<h1>STE MAIL<br> <i class="fa fa-envelope-o" aria-hidden="true"></i></h1>
				</div>
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
                LOGEASTE,<%=usuario%> QUE DESEAS HACER?
                
                <table border = "1px">
                    <tr>
                        <td>ORIGEN</td>
                        <td>DESTINO</td>
                        <td>MENSAJE</td>
                    </tr>
                    <%
                        while(cursor.hasNext())
                        {
                            DBObject Mensaje = cursor.next();
                            String UsuarioO = Mensaje.get("UsuarioO").toString();
                            String UsuarioD = Mensaje.get("UsuarioD").toString();
                            String mensaje = Mensaje.get("Mensaje").toString();
                    %>
                    <tr>
                        <td><%=UsuarioO%></td>
                        <td><%=UsuarioD%></td>
                        <td><%=mensaje%></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                
                </div>
            </section>
        </div>
    </body>
</html>
