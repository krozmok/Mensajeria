<%-- 
    Document   : pgnSubirFoto
    Created on : Sep 13, 2017, 11:32:44 PM
    Author     : Paul
--%>

<%@page import="com.mongodb.client.gridfs.GridFSBucket"%>
<%@page import="com.mongodb.*"%>
<%@page import="com.mongodb.gridfs.GridFSInputFile"%>
<%@page import="com.mongodb.gridfs.GridFS"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="org.apache.tomcat.util.http.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemIterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String user = sesion.getAttribute("Usuario").toString();
           ServletFileUpload upload = new ServletFileUpload();
            FileItemIterator iter = upload.getItemIterator(request);
            while(iter.hasNext()){
                FileItemStream item = iter.next();
                InputStream stream = item.openStream();
                if (item.isFormField()) {
                   response.sendRedirect("modificar_perfil.jsp");
                }else{
                    MongoClient miCliente = new MongoClient("127.0.0.1",27017);
                    DB baseDatos = miCliente.getDB("BDMensajeria");
                    
                    String nomArch = item.getName();
                    GridFS fsArchivo = new GridFS(miCliente.getDB("BDMensajeria"),"Archivos");
                    GridFSInputFile gfArchivo = fsArchivo.createFile(stream);
                    gfArchivo.setFilename(nomArch);
                    gfArchivo.save();  
                    
                    DBCollection C = baseDatos.getCollection("Usuario");
                    BasicDBObject query = new BasicDBObject();
                    query.put("Usuario", user);
                    
                    BasicDBObject act = new BasicDBObject();
                    act.append("$set", new BasicDBObject().append("ImgPerfil", nomArch));
                    C.update(query, act);
                    miCliente.close();
                 response.sendRedirect("perfil.jsp");
                     
                }
            }
        %>
         
    </body>
</html>
