<%-- 
    Document   : check
    Created on : Aug 17, 2017, 8:22:52 AM
    Author     : Paul
--%>

<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
        <%
            try{
            // Conexion a la base de datos
           String Usuario = request.getParameter("txtUSR");
           String Password = request.getParameter("txtPASS");
        %>
        <jsp:useBean id="miLogin" class="bean.CLogin" scope="session">
            <jsp:setProperty name="miLogin" property="aUsuario" value="<%=Usuario%>"/>
            <jsp:setProperty name="miLogin" property="aContraseña" value="<%=Password%>"/>
        </jsp:useBean>
        <%
            if(miLogin.ValidarLogIn()){
                HttpSession sesionOK = request.getSession();
                sesionOK.setAttribute("Usuario", Usuario);
                sesionOK.setAttribute("setLoggin", "true");
                response.sendRedirect("menu.jsp");
                %>
                
             
        <%
            }else{
                HttpSession sesionOK = request.getSession();
                sesionOK.setAttribute("Usuario", null);
                sesionOK.setAttribute("setLoggin", "false");
                sesionOK.invalidate();
                response.sendRedirect("login.jsp");
            }
        %>
        
        <%
        }catch(MongoException e){
            out.println(e);
            %>
            
        <%
            }
            %>
    
</html>
