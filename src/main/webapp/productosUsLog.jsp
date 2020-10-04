<%-- 
    Document   : productosUsLog
    Created on : 2/07/2020, 5:09:11 p. m.
    Author     : santi
--%>

<%@page import="java.util.List"%>
<%@page import="Clases.Productos"%>
<%@page import="Model.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        } else if (!sesion.getAttribute("log").equals("1")) {
            response.sendRedirect("admon.jsp");
        }
    }
%>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <link rel="stylesheet" href="css/CSSproductoUsLog.css">
        <link rel="stylesheet" href="css/mediaUsuarioLog.css">
        <!--Links boostrap-->
        <!-- icono -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <!-- Libreria Archivos CSS  -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
                    <li><a href="#" >Inicio</a></li>
                    <li><a href="ControllerCarrito?accion=verProductos" id="activo">Productos</a></li>
                    <li><a href="ControllerCarrito?accion=MostrarCarro"><i>(<label style="color: orange">${Contador}</label>)</i> Carrito</a></li>
                    <li><a href="ControllerUser?accion=CerrarSesion&user=productosUs">Cerrar sesión</a></li>
                </ul>
            </div>
        </div>
        <!--Inicio menú desplegable-->
        <div class="ulmenu">
            <ul class="uldesp ulmen">
                <li><a href="#" id="activo">Inicio</a></li>
                <li><a href="#">Productos</a></li>
                <li><a href="carrito.jsp">Carrito</a></li>
                <li><a href="CerrarSesion">Cerrar sesión</a></li>
            </ul>
        </div>
        <!--Fin menú desplegable-->
        <!--Posiciones absolutas y modal-->

        <!--Fin posiciones absolutas y modal-->
        <div class="container-fluid" style="margin-top: 100px;">   
            <div class="row">
                <%--  <%      try {
                          Connection con = Conexion.conexion();
                          PreparedStatement st = con.prepareStatement("SELECT * FROM tbl_productos");
                          ResultSet rs = st.executeQuery();
                          while (rs.next()) {
                  %> --%>

                <c:forEach var="p" items="${Listado}" >
                    <div class="m-5" >
                        <div class="card col-lg-12" >
                            <label class="font-weight-bold text-center">${p.getNombre_Producto()}</label>
                            <div class="card-body">

                                <img src="${p.getRutaImg_Producto()}"  style="width: 200px;height: 200px" class=" rounded mx-auto d-block">
                                <!-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p> -->
                            </div>
                            <div>
                                <p class="text-center">${p.getDescripcion_Producto()}<p>
                                <p class="text-center">Cantidad: ${p.getCantidad_Producto()}<p>
                                <p class="text-center"> $ ${p.getPrecio_Producto()}</p>

                            </div>
                            <div class="card text-center  mb-3">

                                <c:if test="${p.getCantidad_Producto()>0}">
                                    <button type="button" onclick="agregarProd(${p.getIdProducto()})" class="btn btn-outline-info btn-block">Agregar</button>
                                </c:if>

                                <c:if test="${p.getCantidad_Producto()==0}">
                                    <button type="button"  class="btn btn-outline-danger btn-block" disabled="true">No disponible</button>
                                </c:if>

                                <%--  <a href="ControllerCarrito?accion=comprarProducto&id=${p.getIdProducto()}" class="btn btn-outline-danger btn-block">Comprar sin js</a>
                                  <a href="" onclick="comprarProd(${p.getIdProducto()})" class="btn btn-outline-danger btn-block">Comprar</a> --%>
                            </div>
                        </div>
                    </div>  
                    <!-- cartas de boostrap --> 
                    <!-- cartas de boostrap -->
                </c:forEach>
            </div>
        </div>






        <!--Scripts-->

        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/scrollreveal/scrollreveal.min.js"></script>
        <!-- Template Main JS File --> 
        <script src="assets/js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/jsAgregarProd.js"></script>
        <script src="js/jsComprarProducto.js" type="text/javascript"></script>
    </body>
</html>
