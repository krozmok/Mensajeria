<%-- 
    Document   : validarRegistro
    Created on : Aug 24, 2017, 7:59:16 AM
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
            try{
                String BaseDatos = "BDMensajeria";
                MongoClient mCliente = new MongoClient("127.0.0.1",27017);
                DB db = mCliente.getDB(BaseDatos);
                DBCollection coleccion = db.getCollection("Usuario");  
                BasicDBObject documento = new BasicDBObject();
                documento.put("Nombre", request.getParameter("txtNombre"));
                documento.put("Usuario", request.getParameter("txtNick"));
                documento.put("FechaNacimiento", request.getParameter("dateNacimiento"));
                documento.put("Sexo", request.getParameter("rdioSexo"));
                documento.put("Contraseña", request.getParameter("txtpass"));
                documento.put("PreguntaSecreta", request.getParameter("txtpregunta"));
                documento.put("Respuesta", "txtrespuesta");
                coleccion.insert(documento);
                DBCursor cursor = coleccion.find(documento);
                if (cursor.hasNext()) {
                        HttpSession sesionOK = request.getSession();
                        sesionOK.setAttribute("Usuario", request.getParameter("txtNick"));
                        sesionOK.setAttribute("setLoggin","true");
                        %>
                        
                        <jsp:forward page="login.jsp"/>
                    <%    
                }
                else{
                    %>
                    <jsp:forward page="index.html"/>
                    <%
                }
            }
            catch(MongoException e){
                
            }
            
        %>
        
    </body>
</html>
