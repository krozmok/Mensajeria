<%-- 
    Document   : menu
    Created on : Aug 17, 2017, 8:38:38 AM
    Author     : Isaac
--%>

<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    </head>
    <body>
        <%
            HttpSession sesio = request.getSession();
            if(sesio.getAttribute("setLoggin") == null || sesio.getAttribute("setLoggin").toString().compareTo("true")!=0){
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
                    <h1>Bienvenido <%=Usuario%>, ¿Que desea hacer con sus archivos? </h1>
                    <%
                        String BaseDatos = "BDMensajeria";
                        MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection coleccion = db.getCollection("Mensaje");
                        String usuario = "";
                        HttpSession sesionOK = request.getSession();
                        usuario = sesionOK.getAttribute("Usuario").toString();

                        BasicDBObject documento = new BasicDBObject();
                        documento.put("UsuarioD", usuario);
                        documento.put("UsuarioO", usuario);
                        DBCursor cursor = coleccion.find(documento);

                    %>
                    <table>
                        <form method = "get" action = "envioArchivo.jsp">
                            <%
                                while(cursor.hasNext())
                                {
                                    DBObject Mensaje = cursor.next();
                                    String mensaje = Mensaje.get("Mensaje").toString();
                            %>
                                <tr>
                                    <td><a href="DescargarArchivos.jsp?Archivo=<%=mensaje%>" download="<%=mensaje%>"><%=mensaje%></a><br></td>
                                    <td><input type="radio" name = "Mensaje" value = "<%=mensaje%>"><br></td>
                                </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td><select name="UsuarioD">
                                    <%
                                        DBCollection coleccionUsuario = db.getCollection("Usuario");
                                        cursor = coleccionUsuario.find();
                                        while(cursor.hasNext())
                                        {
                                            DBObject User = cursor.next();
                                            String U = User.get("Usuario").toString();
                                            if(U.compareTo(usuario) != 0){
                                                
                                            
                                    %>
                                    <option value="<%=U%>"><%=U%></option>
                                    <%
                                        }
                                        }
                                    %>
                                </select></td>
                                <td><input type="submit" value="Enviar"></td>
                            </tr>
                        </form>   
                    </table>
                    <%
                        String UsuarioO = sesion.getAttribute("Usuario").toString();
                    %>
                    <div>
                        <form class="message-box" method="post" enctype="multipart/form-data" action = "envio.jsp">
                            <input type="hidden" name = "UsuarioD" value= <%=UsuarioO%>>
                            <input type="file" name="archivo" multiple="">
                            <input type="submit" value="Subir Archivo">
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
