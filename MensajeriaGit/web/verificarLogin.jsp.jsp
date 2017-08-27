<%-- 
    Document   : check
    Created on : Aug 17, 2017, 8:22:52 AM
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
       <h1>Hello World!</h1>
        <%
            // Conexion a la base de datos
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("127.0.0.1",27017);
            DB db = mCliente.getDB(BaseDatos);
            DBCollection coleccion = db.getCollection("Usuario");
           
            String usuario = request.getParameter("txtUSR");
            out.println(usuario);
            String contraseña = request.getParameter("txtPASS");
            BasicDBObject documento = new BasicDBObject();
            documento.put("Usuario", usuario);
            documento.put("Contraseña", contraseña);
            DBCursor cursor = coleccion.find(documento);
            out.println(cursor.hasNext());
            %>
         
            <%
            if (cursor.hasNext()) {
                    HttpSession sesionOK = request.getSession();
                    sesionOK.setAttribute("Usuario", usuario);
                    sesionOK.setAttribute("setLoggin","true");
        %>
        <jsp:forward page="menu.jsp"/>
        <%
            }else{
            
            %>
            <jsp:forward page="login.jsp" />
        <%
            }
            %>
    
</html>
