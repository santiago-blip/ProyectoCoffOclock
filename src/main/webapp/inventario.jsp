<%-- 
    Document   : inventario
    Created on : 19 ago. 2020, 17:31:04
    Author     : santi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Productos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Conexion"%>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.ControllerProductos" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/inventario.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Inventario.css">
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
                    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
                            aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
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
                                <a class="nav-link" href="ControllerPedidosADMIN?accion=verPedidos">Pedidos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="inventario.jsp">Inventario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ControllerGraficas?accion=VerGrafica">Ventas</a>
                            </li>
                        </ul>
                    </div>
                    <!--                    <button type="button" class="btn btn-b-n navbar-toggle-box-collapse d-none d-md-block" data-toggle="collapse"
                                                data-target="#navbarTogglerDemo01" aria-expanded="false">
                                            <span class="fa fa-cog" aria-hidden="true"></span>
                                        </button>-->
                    <a class="btn btn-outline-danger" href="ControllerUser?accion=CerrarSesion&user=adminInv">Cerrar Sesión</a>
                </div>
            </nav>
        </div>
        <!--Row-->
        <!-- Fin menú general-->
        <!--Inicio menú Lateral-->
        <input type="checkbox" id="menu" />
        <label for="menu" class="menu">
            <span></span>
            <span></span>
            <span></span>
        </label>
        <nav class="nav">
            <ul>
                <li><a href="inventario.jsp">Agregar Producto</a></li>
                <li><a href="html/Pagotados.html">Productos agotados</a></li>
                <li><a href="productos.jsp">Productos</a></li> <!--productos.jsp--> <!--<li><a href="./productos.jsp">Productos</a></li>-->
                <!--<li><a href="#">Contacto</a></li>-->
            </ul>
        </nav>
        <!--Fin menú lateral-->
        <!--Inicio formulario-->
        <div class="formularioProductos">
            <div class="contenerProducto" style="height:670px">
                <form class="formulario" action="ControllerProductos?accion=insertar" method="POST" enctype="multipart/form-data">
                    <label for="Nombre">Nombre</label>
                    <input type="text" name="NombreP" id="Nombre" class="input" required>
                    <label for="">Categorias</label>
                    <div class="checks">
                        <div>
                            <label for="Frito">Fritos</label>
                            <input type="radio" name="inputs" id="Frito" value="Fritos" required>
                        </div>
                        <div>
                            <label for="Bebida">Bebidas</label>
                            <input type="radio" name="inputs" id="Bebida" value="Bebidas" required>
                        </div>
                        <div>
                            <label for="Otro">Otros</label>
                            <input type="radio" name="inputs" id="Otro" value="Otros" required>
                        </div>
                    </div>
                    <!--Checks-->
                    <label for="Precio">Precio</label>
                    <input type="text" name="PrecioProducto" id="Precio" class="input" required>
                    <label for="cantidad">Cantidad</label>
                    <input type="text" name="CantidadProducto" id="cantidad" class="input" required>
                    <label for="cantidad">Descripción</label>
                    <input type="textarea" name="descripcion" id="cantidad" class="input" required>
                    <label for="cantidad">Imagen</label>
                    <input type="file" name="img" id="cantidad" class="input" accept="image/*"  required>
                    <!-- <input name="image" type="file" id="fileName" accept=".jpg,.jpeg,.png" /> -->
                    <label for="fecha">Fecha</label>
                    <input type="date" name="fecha"  id="fecha" class="input" required>
                    <input type="submit" class="btn btn-outline-success sub">
                </form>
            </div>
        </div>

        <!--        
   
        <!--Fin formulario-->
        <%
            String nombre = "";
            Productos p = null;
            List<Productos> listaProducto = new ArrayList<>();
            try {
                Connection con = Conexion.conexion();
                PreparedStatement st = con.prepareStatement("SELECT Nombre_Producto FROM tbl_productos WHERE Cantidad_Producto =0");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    p = new Productos();
                    p.setNombre_Producto(rs.getString("Nombre_Producto"));
                    listaProducto.add(p);
                }
                
            } catch (Exception e) {
                System.out.println("No se pudo traer el producto agotado");
            }
        %>

            <%
            System.out.println("Lista es: "+listaProducto.size());
            if(listaProducto.size()==1){%>
                <script>swal("¡Producto agotado!", "Se ha agotado el siguiente producto:<%=listaProducto.get(0).getNombre_Producto()%> ", "info");</script>
       <%}else if(listaProducto.size()>1){%>
                <script>swal("¡Producto agotado!", "Se han agotado varios productos ", "info");</script>
<%}%>
        <!--Scripts-->
        <%
            String validar = (String) request.getAttribute("Existe");
            if (validar != null) {
                if (validar.equals("1")) {
        %>
        <script>swal("¡Producto agregado!", "Se ha agregado el producto al inventario.", "success");</script>
        <%} else if (validar.equals("2")) {%>
        <script>swal("¡ERROR!", "El producto que intenta registrar, ya fue ingresado.", "error");</script>
        <%}
            }%>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/scrollreveal/scrollreveal.min.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <!--Fin scripts-->
    </body>
</html>
