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
            <li ><a class = "Menu" href = "mensajes.jsp">Mensajes</a></li>
            <li><a class = "Menu" href="archivos.jsp">Archivos</a></li>
             <li><a class = "Menu" href="usuarios.jsp">Usuarios</a></li>
            </ul>
        </nav>
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                    <%String Usuario = sesion.getAttribute("Usuario").toString();%>
                    
                    <h3>A quien desea enviar un mensaje, <%=Usuario%></h3>
                    <%
                        String BaseDatos = "BDMensajeria";
                        MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection coleccion = db.getCollection("Usuario");
                        DBCursor cursor = coleccion.find();
                        %>
                        <form name="fmEnviarMensaje" method="get" action ="conversacion.jsp">
                        
                        
                        <%
                        while(cursor.hasNext()){
                            
                            String Usuario1 = cursor.next().get("Usuario").toString();
                            if (!Usuario1.equals(Usuario)){
                        %>
                        
                            <td><input class = "btn" type = "submit" name="UsuarioD" value="<%=Usuario1%>"></td>
                        
                        <%
                            }
                        }
                    %>
                    </form>
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
