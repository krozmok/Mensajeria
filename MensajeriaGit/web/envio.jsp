<%-- 
    Document   : envio
    Created on : Aug 28, 2017, 11:42:14 PM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String UsuarioO = sesion.getAttribute("Usuario").toString();
            String Mensaje = request.getParameter("txtMensaje");
            String UsuarioD = request.getParameter("UsuarioD");
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("127.0.0.1",27017);
            DB db = mCliente.getDB(BaseDatos);
            DBCollection coleccion = db.getCollection("Mensaje");
            BasicDBObject documento = new BasicDBObject();
            documento.put("UsuarioO", UsuarioO);
            documento.put("UsuarioD",UsuarioD);
            documento.put("Mensaje", Mensaje);
            coleccion.insert(documento);
            
        %>
        <jsp:forward page="conversacion.jsp"/>
    </body>
</html>
