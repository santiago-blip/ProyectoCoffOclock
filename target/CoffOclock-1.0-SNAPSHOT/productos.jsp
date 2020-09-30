<%-- 
    Document   : productos
    Created on : 30/05/2020, 5:24:22 p. m.
    Author     : santi
--%>
<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("log") == null) {
        response.sendRedirect("inventario.jsp");
    } else {
        if (sesion.getAttribute("log").equals("0")) {
            response.sendRedirect("index.jsp");
        } else if (!sesion.getAttribute("log").equals("2")) {
            response.sendRedirect("UsuarioLog.jsp");
        }
    }
%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.Conexion"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="Clases.Productos" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <link rel="stylesheet" href="css/mimediacss.css">
        <link rel="stylesheet" href="css/vistaInventario.css">
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
                    <a class="navbar-brand text-brand" href="admon.html">PE<span class="color-b">&AMP;Z</span></a>
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
                                <a class="nav-link" href="pedidos.jsp">Pedidos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="inventario.jsp">Inventario</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="ventas.jsp">Ventas</a>
                            </li>
                        </ul>
                    </div>
                    <a class="btn btn-outline-danger" href="ControllerUser?accion=CerrarSesion&user=adminPrd">Cerrar Sesión</a>
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
                <li><a href="productos.jsp">Productos</a></li>
                <!--<li><a href="#">Contacto</a></li>-->
            </ul>
        </nav>
        <!--Fin menú lateral-->

        <div class="container" style="margin-top: 150px;">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h1><strong>Productos</strong></h1>
                        <div class="mx-auto">
                            <div id="custom-search-input">
                                <div class="input-group">
                                    <!-- <input type="text" class="form-control" placeholder="Buscar"> Buscar -->
                                    <!-- <span class="input-group-btn">
                                        <button class="btn btn-info" type="button">
                                            <span class="glyphicon glyphicon-search"></span>
                                        </button>
                                    </span> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="outer_div">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center">
                                        <font style="vertical-align: inherit;">ID</font>
                                    </th>
                                    <th>
                                        <font style="vertical-align: inherit;">Nombre </font>
                                    </th>
                                    <th class="text-center">
                                        <font style="vertical-align: inherit;">Imagen </font>
                                    </th>
                                    <th class="text-center">
                                        <font style="vertical-align: inherit;">Descripcion </font>
                                    </th>
                                    <th>
                                        <font style="vertical-align: inherit;">Precio</font>
                                    </th>
                                    <th class="text-center">
                                        <font style="vertical-align: inherit;">Cantidad</font>
                                    </th>
                                    <th class="text-center">
                                        <font style="vertical-align: inherit;">Categoria </font>
                                    </th>
                                    <th class="text-center">
                                        <font style="vertical-align: inherit;">Fecha </font>
                                    </th>
                                    <th class="text-center">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%      try {
                                        Connection con = Conexion.conexion();
                                        PreparedStatement st = con.prepareStatement("SELECT * FROM tbl_productos");
                                        ResultSet rs = st.executeQuery();
                                        while (rs.next()) {
                                %>
                                <tr class="">
                                    <td class="text-center">
                                        <font style='vertical-align: inherit;' id='myid'><%=rs.getInt("Id_Producto")%></font>
                                    </td>
                                    <td>
                                        <font style='vertical-align: inherit;'><%=rs.getString("Nombre_Producto")%></font>
                                    </td>
                                    <td>
                                        <img src="<%=rs.getString("RutaImg_Producto")%>"  style="width: 100px;height: 100px">
                                    </td>
                                    <td>
                                        <font style='vertical-align: inherit;'><%=rs.getString("Descripcion_Producto")%></font>
                                    </td>
                                    <td>
                                        <font style='vertical-align: inherit;'><%=rs.getDouble("Precio_Producto")%></font>
                                    </td>
                                    <td class="text-center">
                                        <font style='vertical-align: inherit;'><%=rs.getInt("Cantidad_Producto")%></font>
                                    </td>
                                    <td class="text-center">
                                        <font style='vertical-align: inherit;'><%=rs.getString("Categoria_Producto")%></font>
                                    </td>
                                    <td class="text-center">
                                        <font style='vertical-align: inherit;'><%=rs.getString("FechaVen_Producto")%></font>
                                    </td>
                                    <td class="text-center">
                                        <form action="FormularioEdit.jsp" method="POST" >
                                            <input type="hidden" value="<%= rs.getInt("Id_Producto")%>" class="btn btn-outline-success m-lg-2" name="id"> <%--<a href='FormularioEdit.jsp?id=<%= rs.getInt("Id_Producto")%>' class="btn btn-outline-success m-lg-2" >Editar</a>--%>
                                            <button type="submit" class="btn btn-outline-success btn-block m-lg-2" data-toggle="modal" data-target="#editProductModal">Editar</button>
                                        </form>
                                        <a  href=""  onclick="eliminarFunc(<%= rs.getInt("Id_Producto")%>)" class="btn btn-outline-danger btn-block m-lg-2" >Eliminar <!--href="../EliminarProducto?id=%= rs.getInt("Id_Producto")%>"-->
                                        </a>
                                    </td>
                                </tr>
                                <%}
                                    } catch (SQLException ex) {
                                        out.println("Error al listar los productos: " + ex);
                                    }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL EDITAR -->
        <!-- Button trigger modal -->


        <!-- Modal -->
 
        
        <!-- MODAL EDITAR -->



        <div id="deleteProductModal" class="modal fade" style="display: none;"> 
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="delete_product" id="delete_product" action="../../controlador/eliminarProducto.php" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Eliminar Producto</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        </div>
                        <div class="modal-body">
                            <p>¿Seguro que quieres eliminar este producto?</p>
                            <p class="text-warning"><small>Esta acción no se puede deshacer.</small></p>
                            <input type="hidden" name="delete_id" id="delete_id" value=""> 
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar ">
                            <input type="submit" class="btn btn-danger" value="Eliminar">
                        </div>
                    </form>
                </div>
            </div>
        </div>










        <!--Scripts-->
        <script src="js/jsEliminar.js"></script>
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
        <!--Fin scripts-->
    </body>
</html>


