<%-- 
    Document   : ventanaChat
    Created on : Sep 5, 2017, 7:45:09 AM
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
        <div class="Mensajes">
            <% 
            HttpSession sesion = request.getSession();
            //String UsuarioPrincipal = sesion.getAttribute("Usuario").toString();
            String UsuarioPrincipal = "krozmok";
            //String UsuarioDestino = request.getParameter("UsuarioD");
            String UsuarioDestino = "jonsnow";
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("127.0.0.1",27017);
            DB db = mCliente.getDB(BaseDatos);
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
        
    </body>
</html>
