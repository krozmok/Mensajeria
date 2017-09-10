<%-- 
    Document   : validar_modificacion
    Created on : 09-sep-2017, 19:32:49
    Author     : WozMit
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validar modificación</title>
    </head>
    <body>
        <%
        //Obtener los datos ingresados en el form
        String pass_current = request.getParameter("txtpass");
        String name = request.getParameter("txtNombre");
        String sex = request.getParameter("rdioSexo"); //in(null, H, M)
        String pass_new = request.getParameter("txtnpass");
        String pass_new_conf = request.getParameter("txtpassconfirm");
        
        //Hacer la actualización en la base de datos        
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
        //DatosN.append("$set", new BasicDBObject("Conectado",false));
            col.update(DatosV, DatosN);
            session.setAttribute("Usuario", null);
            session.invalidate();
            
            response.sendRedirect("index.jsp");
            
        %>
    </body>
</html>
