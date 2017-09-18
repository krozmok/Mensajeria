<%-- 
    Document   : conversacion
    Created on : Aug 23, 2017, 4:00:04 PM
    Author     : Paul
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.GridFSDBFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
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
        <%
            String UsuarioPrincipal = sesion.getAttribute("Usuario").toString();
            String UsuarioDestino = request.getParameter("UsuarioD");
            
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content = "5">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style.css">
	<script src ="https://code.jquery.com/jquery-latest.js"></script>
        <script src="refresh.js" language="JavaScript" type="text/javascript"></script>
        <script src="push.js/push.min.js"></script>
	<script>
	    function Notificate(from, text){
		sub = from + ': '+text;
		Push.create('Nuevo mensaje de '+from, {
		    body: sub,
		    timeout: 5000
		});
	    }
	</script>
       
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
            <li ><a class = "Logo" href = "index.jsp"> <b>STE MAIL</b><i class="fa fa-envelope-o" aria-hidden="true"></i></a></li>
            <li> <a class = "Menu" href="perfil.jsp">Mi perfil</a></li>
            <li ><a class = "Menu" href = "mensajes.jsp">Ver Mensajes</a></li>
            <li ><a class = "Menu" href = "enviarmensaje.jsp">Enviar Mensajes</a></li>
            <li><a class = "Menu" href="archivos.jsp">Archivos</a></li>
             <li><a class = "Menu" href="usuarios.jsp">Usuarios</a></li>
             <li><a class = "Menu" href="modificar_perfil.jsp">Modificar Perfil</a></li>
             <li><a class ="Menu" href="cerrarsesion.jsp">Sign Out</a></li>
            </ul>
        </nav>
        
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                    <div class="chat">
                        <div class="Imagen1">
                            
                            <%=UsuarioPrincipal%><br>
                            <img src="04muestraImg.jsp?usuario=<%=UsuarioPrincipal%>" width="200px">
                        </div>
                        <div class="Imagen2">
                            <%=UsuarioDestino%><br>
                            <img src="04muestraImg.jsp?usuario=<%=UsuarioDestino%>" width="200px">
                        </div>
                        <div id="Mensajes" >
                        </div>
                        <script language="JavaScript" type="text/javascript">
                            var UsuarioO = '<%=UsuarioPrincipal%>';
                            var UsuarioD = '<%=UsuarioDestino%>';
                            refreshdiv(UsuarioO,UsuarioD);
                        </script>
                    </div>
                        <form class="message-box" method="post" enctype="multipart/form-data" action = "envio.jsp">
                            <input type="hidden" name = "UsuarioD" value= <%=UsuarioDestino%>>
                            <input type="text" name="txtMensaje" id="caja_envio" autocomplete = "off">
                            <input type="file" name="archivo" multiple="">
                            <input type="submit" value="Enviar" id="boton_envio">
                        </form>
                        
                </div>
                            <div id="Prueba"></div>
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
