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
        <!--
	<script src ="https://code.jquery.com/jquery-latest.js"></script>
        <script src="refresh.js" language="JavaScript" type="text/javascript"></script>-->
        <script src="push.js/push.min.js"></script>
        
	<script>
	    function Notificate(from){
		sub = 'Es mala educación dejar a la gente en visto...';
		//if(from !="") sub = from+" te envió un mensaje.";
		Push.create('Tienes un nuevo mensaje', {
		    body: sub,
		    timeout: 4000
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
                          <%
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("25.94.233.89",27017);
            DB db = mCliente.getDB(BaseDatos);
            DBCollection coleccion = db.getCollection("Mensaje");
            DBCursor cursor = coleccion.find();
            while(cursor.hasNext()){

                DBObject Mens = cursor.next();
                String Mensaje = Mens.get("Mensaje").toString();
                String UsuarioO = Mens.get("UsuarioO").toString();
                String UsuarioD = Mens.get("UsuarioD").toString();
                String Tipo = Mens.get("Tipo").toString();
                if ((UsuarioO.equals(UsuarioPrincipal) && UsuarioD.equals(UsuarioDestino)) || (UsuarioO.equals(UsuarioDestino) && UsuarioD.equals(UsuarioPrincipal)) ){
		    if(Mens.get("Visto").toString().compareTo("0") > 0){
			%>
			<script>
			    Notificate("");
			</script>
			<%
			//Actualizar la base
			BasicDBObject Mens_update = new BasicDBObject();
			Mens_update.append("$set", new BasicDBObject().append("Visto", 1));
			coleccion.update(Mens, Mens_update);
		    }
                    if(Tipo.compareTo("1") == 0){
                         out.println(UsuarioO + ">>");
                    %>
                   <a href="DescargarArchivos.jsp?Archivo=<%=Mensaje%>" download="<%=Mensaje%>"><%=Mensaje%></a><br>
                    <%
                   }                                        
                    else out.println(UsuarioO + ">>" + Mensaje + "<br>");
                }
            }
            mCliente.close();
        %>
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
