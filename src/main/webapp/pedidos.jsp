<%@page import="Clases.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Controller.ControllerPedidosADMIN" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    HttpSession sesion = request.getSession();
    if (sesion.getAttribute("log") == null) {
        response.sendRedirect("index.jsp");
    } else {
        if (sesion.getAttribute("log").equals("0")) {
            response.sendRedirect("index.jsp");
        } else if (!sesion.getAttribute("log").equals("2")) {
            response.sendRedirect("UsuarioLog.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <link rel="stylesheet" href="css/pedidos.css">
        <link rel="stylesheet" href="css/mediaPedidos.css">
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
        <!--Fin links boostrap-->
        <title>PE&Z</title>
    </head>

    <body>
        <!-- Menu general-->
        <div class="row">
            <!-- ======= Property Search Section ======= -->
            <div class="click-closed"></div>
            <!-- == BARRA DE NAVEGACION === -->
            <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
                <div class="container">
                    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
                            data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span></span>
                        <span></span>
                        <span></span>
                    </button>
                    <a class="navbar-brand text-brand" href="admon.jsp">Coff<span class="color-b">Oclock</span></a>
                    <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none"
                            data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-expanded="false">
                        <span class="fa fa-search" aria-hidden="true"></span>
                    </button>
                    <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="admon.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="pedidos.jsp">Pedidos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="inventario.jsp">Inventario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ControllerGraficas?accion=VerGrafica">Ventas</a>
                            </li>
                        </ul>
                    </div>
                    <a class="btn btn-outline-danger" href="ControllerUser?accion=CerrarSesion&user=admin">Cerrar Sesión</a>
                </div>
            </nav>
        </div>
        <!--Row-->
        <!-- Fin menÃº general-->
        <!-- Inicio menÃº Lateral --- esto va comentado
            <input type="checkbox" id="menu" />
        <label for="menu" class="menu">
              <span></span>
              <span></span>
          <span></span>
        </label>
        <nav class="nav">
            <ul>
                <li><a href="../html/Inventario.html">Agregar Producto</a></li>
                <li><a href="../html/Pagotados.html">Productos agotados</a></li>
                <li><a href="#">Categorias</a></li>
               <li><a href="#">Contacto</a></li> --- esto va comentado
            </ul>
        </nav>
        Fin menÃº lateral --- esto va comentado -->
        <!--Inicio cartas-->
        <div class="container-fluid primerRenglon mb-2">
            <div class="row">
                <c:if test="${ListaPADMON.size()==0}">
                    <div class="alert alert-danger col-6 m-auto text-lg-center" role="alert">
                        ¡A simple danger alert—check it out!
                    </div>
                </c:if>
                <c:forEach var="P" items="${ListaPADMON}">
                    <div class="col-lg-4 mt-md-5">
                        <div class="carta">
                            <div class="col-5">
                                <div class="usuario">
                                    <img src="img/user-solid.svg" alt="">
                                </div>
                            </div>
                            <div class="col-7">
                                <div class="credencial">
                                    <p>${P.getIdentificadoPedido()}</p>
                                    <p>${P.getNombre()} ${P.getApellido()}</p>
                                    <p>Código: ${P.getCodigoPedido()}</p>
                                    <p>Fecha: ${P.getFechaVenta()}</p>
                                    <a href="ControllerPedidosADMIN?accion=verCliente&identificador=${P.getIdentificadoPedido()}" class="btn btn-outline-primary btn-block">Ver más</a>
                                    <!-- <button type="button" class="btn btn-outline-danger">Cancelar</button>
                                    <button type="button" class="btn btn-outline-success">Aceptar</button> -->
                                </div>
                            </div>
                        </div>
                        <!--Carta-->
                    </div>
                </c:forEach>
            </div>
            <!--Row-->
        </div>
        <!--Containr-fluid-->
        <!--Fin cartas-->
    </body>
    <%
        if (sesion.getAttribute("ResultadoVenta") != null) {
            if ((Integer) sesion.getAttribute("ResultadoVenta") == 2) {
                sesion.setAttribute("ResultadoVenta",1);
    %>
    <script>swal("¡Venta realizada!", "Se hizo la venta con exito", "success");</script>
    <%        
        } else if((Integer) sesion.getAttribute("ResultadoVenta") == 0) {
          sesion.setAttribute("ResultadoVenta",3);
    %>
    <script>swal("¡ERROR!", "No se pudo realizar la venta, uno de los productos se agotó", "error");</script>
    <%                }
        }

    %>
</html>

