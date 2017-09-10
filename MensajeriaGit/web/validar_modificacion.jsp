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
            try{
		String pass_current = request.getParameter("txtpass");
		String Nombre = request.getParameter("txtNombre");
		String Sexo = request.getParameter("rdioSexo");
		String pass_new = request.getParameter("txtnpass");
        %>
	<jsp:useBean id="miSesion" class="bean.Signup" scope = "session">
	    <jsp:setProperty name="miSesion" property = "aNombre" value="<%=Nombre%>" />
	    <%--
	    <jsp:setProperty name="miSesion" property = "aUsuario" value="<%=Usuario%>" />
	    <jsp:setProperty name="miSesion" property = "aFechaNacimiento" value="<%=Nacimiento%>" />
	    --%>
	    <jsp:setProperty name="miSesion" property = "aSexo" value="<%=Sexo%>" />
	    <%--
	    <jsp:setProperty name="miSesion" property = "aContrasena" value="<%=Pass%>" />
	    <jsp:setProperty name="miSesion" property = "aPreguntaSecreta" value="<%=Pregunta%>" />
	    <jsp:setProperty name="miSesion" property = "aRespuesta" value="<%=Respuesta%>" />
	    --%>
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
