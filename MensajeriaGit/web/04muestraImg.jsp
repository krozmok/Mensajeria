<%-- 
AUTOR: Rony Villafuerte Serna
FECHA: 01-06-2014
DESCRIPCION: Pagina encargada de procesar la imagen sacada de la BD.
en la BD.
--%>

<%@page import="com.mongodb.*"%>
<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="com.mongodb.MongoException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.mongodb.gridfs.*"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.DBCursor"%>
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
            
            String BaseDatos = "BDMensajeria";
                        MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection C = db.getCollection("Usuario");
                        BasicDBObject Datosusuario= new BasicDBObject();
                        String usuario = request.getParameter("usuario");
                        Datosusuario.put("Usuario", usuario);
                        Cursor cursor = C.find(Datosusuario);
                        DBObject Usuario = cursor.next();
                        GridFS fsArchivo = new GridFS(db, "Archivos");
                        
            try{
                            String Imagen = Usuario.get("ImgPerfil").toString();
                            out.println(Imagen);
                            GridFSDBFile imgPmostrar = fsArchivo.findOne(Imagen);
                            response.setContentType("image/jpg");
                            OutputStream salida = response.getOutputStream();
                            imgPmostrar.writeTo(salida);
                            salida.flush();
                            salida.close(); 
                        }catch(Exception e){
                            String Imagen = "default.jpg";
                            GridFSDBFile imgPmostrar = fsArchivo.findOne(Imagen);
                            response.setContentType("image/jpg");
                            OutputStream salida = response.getOutputStream();
                            imgPmostrar.writeTo(salida);
                            salida.flush();
                            salida.close();
                        }
        %>
    </body>
</html>
