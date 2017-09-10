<%-- 
    Document   : envioArchivo
    Created on : 10-sep-2017, 12:37:23
    Author     : Isaac
--%>


<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
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
            String Mensaje = request.getParameter("Mensaje");
            out.println(Mensaje);
            if(Mensaje.compareTo("") != 0){
                String UsuarioD = request.getParameter("UsuarioD");
                String BaseDatos = "BDMensajeria";
                MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                DB db = mCliente.getDB(BaseDatos);
                DBCollection coleccion = db.getCollection("Mensaje");
                BasicDBObject documento = new BasicDBObject();
                documento.put("UsuarioO", UsuarioO);
                documento.put("UsuarioD",UsuarioD);
                documento.put("Mensaje", Mensaje);
                documento.put("Tipo", 1);
                coleccion.insert(documento);
            }
        %>
        <jsp:forward page = "archivos.jsp"/>
    </body>
</html>
