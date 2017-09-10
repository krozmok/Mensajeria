<%-- 
    Document   : usuarios
    Created on : Sep 9, 2017, 3:21:05 PM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <title>Usuarios</title>
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
            <li><a class = "Menu" href="archivos.jsp">Archivos</a></li>
             <li><a class = "Menu" href="usuarios.jsp">Usuarios</a></li>
            </ul>
        </nav>
       
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                
                <div id ="botones">
                    
                    <%
                        
                        String BaseDatos = "BDMensajeria";
                        MongoClient mCliente = new MongoClient("127.0.0.1",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection coleccion = db.getCollection("Usuario");
                        BasicDBObject Usuarios = new BasicDBObject();
                        Usuarios.put("Conectado", true);
                        Cursor C = coleccion.find(Usuarios);
                        out.println("<h3>USUARIOS CONECTADOS</h3>");
                    %>
                    <form name="fmEnviarMensaje" method="get" action ="conversacion.jsp">
                    <%
                        while(C.hasNext()){
                            DBObject Us = C.next();
                            String Nick = Us.get("Usuario").toString();
                            if (!Usuario.equals(Nick)) {
                    %>
                            <input class="btn" name = "UsuarioD" type ="submit" value="<%=Nick%>" />
                    <%
                                }
                        }
                            %>
                    </form>
                    <form name="fmEnviarMensaje" method="get" action ="conversacion.jsp">
                            <%
                        
                        Usuarios = new BasicDBObject();
                        Usuarios.put("Conectado", false);
                        out.println("<h3>USUARIOS DESCONECTADOS</h3>");
                        C = coleccion.find(Usuarios);
                     while(C.hasNext()){
                            DBObject Us = C.next();
                            String Nick = Us.get("Usuario").toString();
                            if (!Usuario.equals(Nick)) {
                    %>
                            <input class="btn" name = "UsuarioD" type ="submit" value="<%=Nick%>" />
                    <%
                                }
                        }
                            %>
                   </form>
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
