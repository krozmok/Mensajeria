<%-- 
    Document   : cerrarsesion
    Created on : Aug 28, 2017, 6:57:09 PM
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
        <h1>Hello World!</h1>
        <%
            //HttpSession sesionOK = request.getSession();
            String UsuarioPrincipal = session.getAttribute("Usuario").toString();
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("25.94.233.89",27017);
            DB db = mCliente.getDB(BaseDatos);
            DBCollection col = db.getCollection("Usuario");
            //Este primer BasicDBObject es el find del documento
            BasicDBObject DatosV = new BasicDBObject();
            DatosV.put("Usuario",UsuarioPrincipal);
            //Este segundo BasicDBObject es lo que se actualizará
            BasicDBObject DatosN = new BasicDBObject();
            //Al poner un $set nos permite actualizar solo un valor del documento
            //Si no se pone un $set entonces el documento entero será actualizado
            DatosN.append("$set", new BasicDBObject("Conectado",false));
            col.update(DatosV, DatosN);
            session.setAttribute("Usuario", null);
            session.invalidate();
            mCliente.close();
            response.sendRedirect("index.jsp");
            
        %>
       
    </body>
</html>
