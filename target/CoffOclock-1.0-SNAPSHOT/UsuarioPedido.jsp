<%-- 
    Document   : UsuarioPedido
    Created on : 30 sept. 2020, 14:01:32
    Author     : santi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.PedidosADMON"%>
<%@page import="Controller.ControllerPedidosADMIN" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <!-- Libreria Archivos CSS  -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>

        <!--Inicio tabla-->

        <%
            if (request.getAttribute("ResultadoVenta") != null) {
                if ((Integer) request.getAttribute("ResultadoVenta") > 0) {

        %>
        <script>alert("Se hizo la venta con éxito");</script>
        <%        } else {

        %>
        <script>alert("No se pudo realizar la venta porque uno de los productos agotó su cantidad");</script>
        <%                }
            }

        %>

        <%            String nombreU = "";
            Double totalpagar = 0.0;
            int identificador = 0;
            if (request.getAttribute("Usuario") != null) {
                List<PedidosADMON> nombre = (ArrayList) request.getAttribute("Usuario");
                if (nombre.size() > 0) {
                    nombreU = nombre.get(0).getNombre() + " " + nombre.get(0).getApellido();
                    totalpagar = nombre.get(0).getTotalVenta();
                    identificador = nombre.get(0).getIdentificadoPedido();
                }
            }

        %>
        <div class="container" style="margin-top: 150px">
            <h3> <%=nombreU%> </h3>
            <div class="row">
                <div class="col-sm-9">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Pedido</th>
                                <th>Nombre</th>
                                <th>Cédula</th>
                                <th>Producto</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Total</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${Usuario}">
                                <tr>
                                    <td>${c.getIdentificadoPedido()}</td>
                                    <td>${c.getNombre()} ${c.getApellido()}</td>
                                    <td>${c.getCedula()}</td>
                                    <td>${c.getListaNombres()}</td>
                                    <td>$. ${c.getListaPrecioU()}</td>
                                    <td>${c.getListaCantidad()}</td>
                                    <td>${c.getListaTotalPrecio()}</td>
                                    <td>${c.getFechaVenta()}</td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-header">
                            <h3>Total Pedido</h3>
                        </div>
                        <div class="card-body">
                            <label>Total a pagar</label>
                            <label><%=totalpagar%></label>
                        </div>
                        <div class="card-footer">
                            <a href="ControllerPedidosADMIN?accion=RealizarVenta&identificadorVenta=<%=identificador%>" class="btn btn-danger btn-block">Generar compra</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <a href="ControllerPedidosADMIN?accion=verPedidos" class="btn btn-outline-primary">Regresar</a>
            </div>
        </div>

        <!--Fin tabla-->


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
