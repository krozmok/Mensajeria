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
	String BaseDatos = "BDMensajeria";
	MongoClient mCliente = new MongoClient("25.94.233.89",27017);
	DB db = mCliente.getDB(BaseDatos);
	DBCollection coleccion = db.getCollection("Usuario");
	HttpSession sesionOK = request.getSession();
	String user = sesionOK.getAttribute("Usuario").toString();
	BasicDBObject doc = new BasicDBObject();
	doc.put("Usuario", user);
	doc.put("Contraseña", pass_current);
	DBCursor cursor = coleccion.find(doc);
	if(cursor.hasNext() && pass_new.equals(pass_new_conf)){
	    BasicDBObject doc_update = new BasicDBObject();
	    doc_update.append("$set", new BasicDBObject().append("Nombre", name));
            coleccion.update(doc, doc_update);
	    doc_update.append("$set", new BasicDBObject().append("Sexo", sex));
            coleccion.update(doc, doc_update);
	    doc_update.append("$set", new BasicDBObject().append("Contraseña", pass_new));
	    coleccion.update(doc, doc_update);
	    %>
	    <jsp:forward page="menu.jsp"/>
	    <%
	} else{
	    %>
            out.print("else");
	    <script>alert('Contraseña incorrecta. Inténtelo nuevamente');</script>
	    <jsp:forward page="modificar_perfil.jsp"/>
	    <%
	}
        %>
    </body>
</html>
