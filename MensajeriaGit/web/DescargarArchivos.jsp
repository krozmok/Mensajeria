<%-- 
    Document   : Archivos
    Created on : 07-sep-2017, 7:45:36
    Author     : Isaac
--%>

<%@page import="com.mongodb.gridfs.*"%>
<%@page import="com.mongodb.*"%>
<%@page import="com.mongodb.client.gridfs.GridFSBuckets"%>
<%@page import="com.mongodb.client.gridfs.GridFSBucket"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="java.io.OutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       /* String nomArchivo = request.getParameter("Archivo");
        //OutputStream salida = response.getOutputStream();

        MongoClient miCliente = new MongoClient("127.0.0.1", 27017);
        MongoDatabase baseDatos = miCliente.getDatabase("BDMensajeria");
        GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "Archivos");

        gridFSBucket.downloadToStream(nomArchivo, salida);

        response.setContentType("image/jpg");

        salida.flush();
        salida.close();*/
        MongoClient miCliente = new MongoClient("25.94.233.89", 27017);
            DB baseDatos = miCliente.getDB("BDMensajeria");
            GridFS fsArchivo = new GridFS(baseDatos, "Archivos");
            //GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "misArchivos");

            String nomArchivo = request.getParameter("Archivo");
            String [] S = nomArchivo.split(".");
            
            
            GridFSDBFile imgMostrar = fsArchivo.findOne(nomArchivo);
            //response.setContentType("image/jpg");
            response.setContentType("image/jpg");
            OutputStream salida = response.getOutputStream();
            
            imgMostrar.writeTo(salida);
            //gridFSBucket.downloadToStream(nomArchivo, salida);
            
            
            
            salida.flush();
            salida.close();
            miCliente.close();
    %>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
