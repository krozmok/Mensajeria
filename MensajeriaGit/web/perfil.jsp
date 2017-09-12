<%-- 
    Document   : perfil
    Created on : Aug 28, 2017, 9:27:58 PM
    Author     : Paul
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.*"%>
<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
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
            if(sesion.getAttribute("setLoggin") == null || sesion.getAttribute("setLoggin").toString().compareTo("true")!=0){
        %>
        <jsp:forward page="login.jsp"/>
        <%
            }else{}
            HttpSession sesionOK = request.getSession();
            String usuario = sesionOK.getAttribute("Usuario").toString();
        %>
        <%
                        String BaseDatos = "BDMensajeria";
                        MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection C = db.getCollection("Usuario");
                        BasicDBObject Datosusuario= new BasicDBObject();
                        Datosusuario.put("Usuario", usuario);
                        Cursor cursor = C.find(Datosusuario);
                        DBObject Usuario = cursor.next();
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
             <li><a class ="Menu" href="cerrarsesion.jsp">Sign Out</a></li>
            </ul>
        </nav>
        <div id="contenedor">
            <section class="section">
                <div id = "perfil-image">
                    <h3><font style="text-transform: uppercase"><%=usuario%></font> <br></h3> 
                    <img src="04muestraImg.jsp" width="200px">
                    
                </div>
                <div id= "Datos">
                    <%
                        out.println("<h3> Nombre <br>" + Usuario.get("Nombre") + "</h3><br>");
                        out.println("<h3> Usuario <br>" + Usuario.get("Usuario") + "</h3><br>");
                        out.println("<h3> Fecha de Nacimiento <br>" + Usuario.get("FechaNacimiento") + "</h3><br>");
                    %>
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
