<%-- 
    Document   : productosUsLog
    Created on : 2/07/2020, 5:09:11 p. m.
    Author     : santi
--%>


<%@page import="Clases.Carrito"%>
<%@page import="Model.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <li><a href="ControllerCarrito?accion=verProductos">Productos</a></li>
                <li><a href="ControllerCarrito?accion=MostrarCarro">Carrito</a></li>
                <li><a href="CerrarSesion">Cerrar sesión</a></li>
            </ul>
        </div>
        <!--Fin menú desplegable-->
        <!--Posiciones absolutas y modal-->

        <div class="container-fluid" style="margin-top: 50px;">
            <h3><strong>CARRITO</strong></h3>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Nombre</th>
                                <th>Imagen</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Subtotal</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%int i = 0;%>
                            <c:forEach var="c" items="${ListadoCarro}">
                                <tr>
                                    <td><%=++i%></td>
                                    <td><strong> ${c.getNombre_Producto()}</strong></td>
                                    <td><img src="${c.getRutaImg_Producto()}" style="width: 200px; height: 200px"></td>
                                    <td>${c.getPrecio_producto()}</td>
                                    <td>
                                        <input type="hidden" value="${c.getIdProducto()}" class="idpCam">
                                        <input type="number" value="${c.getCantidad_Producto()}" min="1" id="cantidad" class="form-control text-center cantidad">
                                    </td>
                                    <td>${c.getPrecioPagar()}</td>
                                    <td>
                                        <input type="hidden" id="idC" value="${c.getIdProducto()}" class="idC">
                                        <a href="" id="btndelete"  class="btn btn-outline-info btn-block btndelete">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <h3>Generar comprar</h3>
                        </div>
                        <div class="card-body">
                            <label>Total a pagar</label>
                            <input type="text" readonly="" class="form-control" value="$ ${TotalPagar}">
                        </div>
                        <div class="card-footer">
                            <a href="" class="btn btn-info btn-block">Realizar pago</a>
                            <a href="ControllerCarrito?accion=GenerarCompra" class="btn btn-danger btn-block">Generar compra</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
                        
         <%
         if(sesion.getAttribute("Pedido") !=null){
             if(sesion.getAttribute("Pedido").equals("si")){
                 String codigo = (String) sesion.getAttribute("codigoPedido");
           %>
             <script>alert("Se hizo su pedido con éxito este es el código de su pedido:<%=codigo%> ");</script>
           <%  
               sesion.setAttribute("Pedido", "nn");
                      }else if(sesion.getAttribute("Pedido").equals("no")){
             %>
             <script>alert("No se pudo hacer su pedido");</script>
             <%
                 sesion.setAttribute("Pedido", "nn");
}
}
         %>
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
        <script src="js/EliminarCarro.js" type="text/javascript"></script>
    </body>
</html>


