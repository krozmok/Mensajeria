<%-- 
    Document   : ventanaChat
    Created on : Sep 5, 2017, 7:45:09 AM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="push.js/push.min.js"></script>
	<script>
	    function Notificate(from, text){
		sub = from + ': '+text;
		Push.create('Nuevo mensaje de '+from, {
		    body: sub,
		    timeout: 5000
		});
	    }
	</script>
    </head>
    <body>
        <div class="Prueba">
            <% 
            HttpSession sesion = request.getSession();
            String UsuarioPrincipal = sesion.getAttribute("Usuario").toString();
           
            String UsuarioDestino = request.getParameter("UsuarioD");
            
            String BaseDatos = "BDMensajeria";
            MongoClient mCliente = new MongoClient("25.94.233.89",27017);
            DB db = mCliente.getDB(BaseDatos);
            DBCollection coleccion = db.getCollection("Mensaje");
            DBCursor cursor = coleccion.find();
                                while(cursor.hasNext()){
                                    
                                    DBObject Mens = cursor.next();
                                    String Mensaje = Mens.get("Mensaje").toString();
                                    String UsuarioO = Mens.get("UsuarioO").toString();
                                    String UsuarioD = Mens.get("UsuarioD").toString();
                                    String Tipo = Mens.get("Tipo").toString();
                                    if ((UsuarioO.equals(UsuarioPrincipal) && UsuarioD.equals(UsuarioDestino)) || (UsuarioO.equals(UsuarioDestino) && UsuarioD.equals(UsuarioPrincipal)) ){
					if(Mens.get("Visto").toString().compareTo("0") == 0 && UsuarioPrincipal.compareTo(UsuarioD) == 0){
					    %>
					    <script>
						Notificate('<%=UsuarioPrincipal%>', '<%=Mensaje%>');
					    </script>
					    <%
					    //Actualizar la base
					    BasicDBObject Mens_update = new BasicDBObject();
					    Mens_update.append("$set", new BasicDBObject().append("Visto", 1));
					    coleccion.update(Mens, Mens_update);
					}
                                        if(Tipo.compareTo("1") == 0){
                                             out.println(UsuarioO + ">>");
                                        %>
                                       <a href="DescargarArchivos.jsp?Archivo=<%=Mensaje%>" download="<%=Mensaje%>"><%=Mensaje%></a><br>
                                        <%
                                       }                                        
                                        else out.println(UsuarioO + ">>" + Mensaje + "<br>");
					%>
					<script>
					    Notificate("");
					</script>
					<%
                                    }
                                }
                                mCliente.close();
        %>
        </div>
        
    </body>
</html>
