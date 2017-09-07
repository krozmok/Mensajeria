<%-- 
    Document   : cerrarsesion
    Created on : Aug 28, 2017, 6:57:09 PM
    Author     : Paul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            //HttpSession sesionOK = request.getSession();
            session.setAttribute("Usuario", null);
            session.invalidate();
            response.sendRedirect("index.jsp");
            
        %>
       
    </body>
</html>
