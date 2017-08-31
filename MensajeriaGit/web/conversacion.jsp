<%-- 
    Document   : conversacion
    Created on : Aug 23, 2017, 4:00:04 PM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="style.css">
	<script src ="https://code.jquery.com/jquery-latest.js"></script>
        <script language="JavaScript" type="text/javascript" src="main.js"></script>
	<script language="JavaScript" type="text/javascript" src="motor.js"></script>
        <script>
            $(document).ready(
            function() {
                setInterval(function() {$('.Mensajes')}, 3000);
            });
</script>
    <body>
        <%
            response.setIntHeader("Refresh", 10);
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
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("127.0.0.1",27017);
            DB db = mCliente.getDB(BaseDatos);
        %>
        
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
            <li ><a class = "Menu" href = "mensajes.jsp">Mensajes</a></li>
            <li><a class = "Menu" href="#">Archivos</a></li>
             <li><a class = "Menu" href="#">Usuarios</a></li>
            </ul>
        </nav>
        
        <div id="contenedor">
            <section class="section">
                <div id="presentacion">
                    <div class="chat">
                        <div class="Imagen1">
                            <%=UsuarioPrincipal%>
                        </div>
                        <div class="Imagen2">
                            <%=UsuarioDestino%>
                        </div>
                        <div class="Mensajes" >
                            <script>
                                
                            </script>
                            <% 
                                
                                DBCollection coleccion = db.getCollection("Mensaje");
                                DBCursor cursor = coleccion.find();
                                while(cursor.hasNext()){
                                    
                                    DBObject Mens = cursor.next();
                                    String Mensaje = Mens.get("Mensaje").toString();
                                    String UsuarioO = Mens.get("UsuarioO").toString();
                                    String UsuarioD = Mens.get("UsuarioD").toString();
                                    if ((UsuarioO.equals(UsuarioPrincipal) && UsuarioD.equals(UsuarioDestino)) || (UsuarioO.equals(UsuarioDestino) && UsuarioD.equals(UsuarioPrincipal)) ){
                                            out.println(UsuarioO + ">>" + Mensaje + "<br>");
                                        }
                                }
                            %>
                        </div>
                    </div>
                        <form class="message-box" method="post" action = "envio.jsp?UsuarioD=<%=UsuarioDestino%>">
                        <input type="text" name="txtMensaje" id="caja_envio" autocomplete = "off">
                        <input type="submit" value="Enviar" id="boton_envio">
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
