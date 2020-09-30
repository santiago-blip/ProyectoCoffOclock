<%-- 
    Document   : Verificar
    Created on : 29 sept. 2020, 15:02:22
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if (request.getAttribute("Activo") != null) {
                if ((Integer) request.getAttribute("Activo") == 1) {
        %>
        <div class="alert alert-success" role="alert">
            ¡SE VERIFICÓ SU CUENTA! Ya puede acceder a CoffOclock.   <a class="text-success stretched-link" href="index.jsp">CoffOclock</a>
        </div>
        <%
        } else if ((Integer) request.getAttribute("Activo") == 0) {
        %>
        <div class="alert alert-danger" role="alert">
            No se pudo verificar su cuenta, intente mandar otra petición.  <a class="text-warning stretched-link" href="index.jsp">CoffOclock</a>
        </div>
        <%
                }
            }
        %>
    </body>
</html>
