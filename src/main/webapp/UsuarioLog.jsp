<%-- 
    Document   : UsuarioLog
    Created on : 30/05/2020, 4:49:48 p. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.ControllerUser" %>
<!DOCTYPE html>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("log") == null) {
        response.sendRedirect("index.jsp");
    } else {
        if (sesion.getAttribute("log").equals("0")) {
            response.sendRedirect("index.jsp");
        }else if (!sesion.getAttribute("log").equals("1")) {
            response.sendRedirect("admon.jsp");
        }
    }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="cafetería,comida,café,ctgi,pedidos">
        <meta name="description" content="Sitio web dedicado a la cafetería C.T.G.I para hacer pedidos online">
        <link rel="icon" href="img/logo.png">
        <link rel="stylesheet" href="css/usuarioLog.css">
        <link rel="stylesheet" href="css/mediaUsuarioLog.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <!-- Libreria Archivos CSS  -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>CoffOclock</title>
    </head>
    <body>

        <div class="nav">
            <div class="logo">
                <div class="imgLogo" ><img src="img/logo.png"   alt=""></div>
            </div>
            <div class="menu">
                <div class="bars"><img src="img/bars-solid.svg" class="imgbars" alt="">  
                </div>
                <ul>
                    <li><a href="#" id="activo">Inicio</a></li>
                    <!--<li><a href="productosUsLog.jsp">Productos</a></li>-->
                    <li><a href="ControllerCarrito?accion=verProductos">Productos</a></li>
                    <li><a href="ControllerCarrito?accion=MostrarCarro"><i>(<label style="color: orange">${Contador}</label>)</i>Carrito</a></li>
                    <li><a href="ControllerUser?accion=CerrarSesion&user=usuario">Cerrar sesión</a></li>
                </ul>
            </div>
        </div>
        <!--Inicio menú desplegable-->
        <div class="ulmenu">
            <ul class="uldesp ulmen">
                <li><a href="#" id="activo">Inicio</a></li>
                <li><a href="#">Productos</a></li>
                <li><a href="carrito.jsp">Carrito</a></li>
                <li><a href="ControllerUser?accion=CerrarSesion&user=usuario">Cerrar sesión</a></li>
            </ul>
        </div>
        <!--Fin menú desplegable-->
        <!--Posiciones absolutas y modal-->
        <img src="img/right.svg" id="right">
        <!--Fin posiciones absolutas y modal-->
        <div class="container-fluid carta">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cartas">
                        <h2>Bienvenidos a la cafetería del C.T.G.I.</h2>
                        <p>Bienvenidos, disfruten de sus comidas.</p>
                    </div>
                </div>
            </div>
        </div>








        <!--Script propio-->
        <script src="js/despMenu.js"></script>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/scrollreveal/scrollreveal.min.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
