<%-- 
    Document   : envio
    Created on : Aug 28, 2017, 11:42:14 PM
    Author     : Isaac
--%><%@page import="org.bson.types.ObjectId"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.gridfs.model.GridFSUploadOptions"%>
<%@page import="com.mongodb.client.gridfs.GridFSBuckets"%>
<%@page import="com.mongodb.client.gridfs.GridFSBucket"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="org.apache.tomcat.util.http.fileupload.util.Streams"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemIterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
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
            /*
            HttpSession sesion = request.getSession();
            String UsuarioO = sesion.getAttribute("Usuario").toString();
            String Mensaje = request.getParameter("txtMensaje");
            out.println(Mensaje);
            if(Mensaje != ""){
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
                
            }
            */
            HttpSession sesion = request.getSession();
            String UsuarioO = sesion.getAttribute("Usuario").toString();
            ServletFileUpload paSubir = new ServletFileUpload();
            // gestionando el o los archivos subidos
            FileItemIterator iter = paSubir.getItemIterator(request);
            FileItemStream item =iter.next();
            InputStream stream = item.openStream();
            String UsuarioD = Streams.asString(stream);
            String BaseDatos = "BDMensajeria";
            while (iter.hasNext()) {
                item = iter.next();
                stream = item.openStream();
                if (item.isFormField()) {
                    String Mensaje = Streams.asString(stream);
                    //out.print(Mensaje);
                    if(Mensaje.compareTo("") != 0){
                        //out.print("ingreso mensaje");
                        MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection coleccion = db.getCollection("Mensaje");
                        BasicDBObject documento = new BasicDBObject();
                        documento.put("UsuarioO", UsuarioO);
                        documento.put("UsuarioD",UsuarioD);
                        documento.put("Mensaje", Mensaje);
                        documento.put("Tipo", 0);
                        coleccion.insert(documento);
                    }

                } else {//desde este modulo podemos hacer loq ue querramos con el INPUTSTREAM
                    //out.println(item.getName() + " ha sido subido a la BD.<br>");
                    String nombreArch = item.getName();

                    //INSERTAR EN BD
                    //conexio a base de datos
                    if(nombreArch.compareTo("") != 0){
                        //out.print("ingreso");
                        MongoClient mCliente = new MongoClient("25.94.233.89",27017);
                        DB db = mCliente.getDB(BaseDatos);
                        DBCollection coleccion = db.getCollection("Mensaje");
                        
                        BasicDBObject querry = new BasicDBObject();
                        querry.put("Mensaje", nombreArch);
                        DBCursor cursor = coleccion.find(querry);
                        
                        if(cursor.hasNext()){
                            DBCollection ArchivoFile = db.getCollection("Archivos.files");
                            BasicDBObject querry1 = new BasicDBObject();
                            querry1.put("filename", nombreArch);
                            DBObject arch = ArchivoFile.find(querry1).next();
                            String id = arch.get("_id").toString();
                            
                            DBCollection ArchivoChunk = db.getCollection("Archivos.chunks");
                            BasicDBObject dropp = new BasicDBObject();
                            dropp.put("files_id", id);
                            ArchivoChunk.remove(dropp);
                            ArchivoFile.remove(querry1);
                            
                        }else{
                            BasicDBObject documento = new BasicDBObject();
                            documento.put("UsuarioO", UsuarioO);
                            documento.put("UsuarioD",UsuarioD);
                            documento.put("Mensaje", nombreArch);
                            documento.put("Tipo", 1);
                            coleccion.insert(documento);
                        }
                        
                        
                        
                        
                        MongoClient miCliente = new MongoClient("25.94.233.89", 27017);
                        MongoDatabase baseDatos = miCliente.getDatabase(BaseDatos);
                        GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "Archivos");

                        GridFSUploadOptions opciones = new GridFSUploadOptions()
                                .chunkSizeBytes(1024)
                                .metadata(new Document("tipo", "imagen"));
                        ObjectId fileId = gridFSBucket.uploadFromStream(nombreArch, stream, opciones);
                        stream.close();
                        
                        
                    }else{
                        //out.print("No ingreso");
                    }
                    
                }
            }

            if(UsuarioO.compareTo(UsuarioD) != 0)
            {
        %>
        <jsp:forward page="conversacion.jsp">
        <jsp:param name = "UsuarioD" value="<%=UsuarioD%>"/>
        </jsp:forward>
        <%
            }else{
        %>
        <jsp:forward page="archivos.jsp"/>
        <%
            }
        %>
        </body>
</html>
