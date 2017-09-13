<%-- 
    Document   : validarRegistro
    Created on : Aug 24, 2017, 7:59:16 AM
    Author     : Paul
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
               
                String Nombre = request.getParameter("txtNombre");
                String Usuario = request.getParameter("txtNick");
                String Nacimiento = request.getParameter("dateNacimiento");
                String Sexo = request.getParameter("rdioSexo");
                String Pass = request.getParameter("txtpass");
                String Pregunta = request.getParameter("txtpregunta");
                String Respuesta = request.getParameter("txtrespuesta");
                
        %>
            <jsp:useBean id="miSesion" class="bean.Signup" scope = "session">
                <jsp:setProperty name="miSesion" property = "aNombre" value="<%=Nombre%>" />
                <jsp:setProperty name="miSesion" property = "aUsuario" value="<%=Usuario%>" />
                <jsp:setProperty name="miSesion" property = "aFechaNacimiento" value="<%=Nacimiento%>" />
                <jsp:setProperty name="miSesion" property = "aSexo" value="<%=Sexo%>" />
                <jsp:setProperty name="miSesion" property = "aContrasena" value="<%=Pass%>" />
                <jsp:setProperty name="miSesion" property = "aPreguntaSecreta" value="<%=Pregunta%>" />
                <jsp:setProperty name="miSesion" property = "aRespuesta" value="<%=Respuesta%>" />
            </jsp:useBean>
            <%
                miSesion.Insertar();
            %>
            <jsp:forward page="menu.jsp"/>
                    <%    
                }
            catch(MongoException e){
               out.println(e);
            }
            
            
        %>
        
    </body>
</html>
