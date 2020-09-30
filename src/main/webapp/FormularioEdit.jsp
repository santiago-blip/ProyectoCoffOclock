<%-- 
    Document   : FormularioEdit
    Created on : 1/07/2020, 7:35:33 p. m.
    Author     : santi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.Conexion"%>
<%@page import="Controller.ControllerProductos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<%
    HttpSession sesion = request.getSession(false);
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
<% response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server  
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <meta http-equiv="Pragma" content="no-cache"> 
        <meta http-equiv="Cache-Control"      content="no-cache"> 
        <meta http-equiv="Expires" content="Sat, 01 Dec 2012 00:00:00 GMT">
        <link rel="stylesheet" href="css/mimediacss.css">
        <link rel="stylesheet" href="css/Inventario.css">
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = null;
            PreparedStatement st = null;
            ResultSet rs = null;
            try {
                con = Conexion.conexion();
                st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Id_Producto = ?");
                st.setInt(1, Integer.parseInt(request.getParameter("id")));
                rs = st.executeQuery();
                while (rs.next()) {
        %>

        <div class="container" style="margin-top:50px">
            <div class="col-lg-8 m-auto" >

                <form name='edit_product' id='edit_product' action='ControllerProductos?accion=EditarProducto' method='POST' enctype="multipart/form-data">
                    <div class="modal-header">
                        <h4 class='modal-title'>Editar Producto</h4>
                    </div>
                    <div class='modal-body'> 
                        <div class='form-group'>
                            <label>Nombre</label>
                            <input type='text' name='edit_name' id='edit_name' value="<%= rs.getString("Nombre_Producto")%>"  class='form-control' required>  
                        </div>
                        <div class='form-group'>
                            <label>Imagen</label>
                            <img src="<%=rs.getString("RutaImg_Producto")%>"  style="width: 200px;height: 200px" class=" rounded mx-auto d-block">
                            <input type='file' name='edit_name' id='edit_name'>
                        </div>                
                        <div class='form-group'>
                            <label>Descripcion</label>
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="textareaEdit"><%= rs.getString("Descripcion_Producto")%></textarea>
                        </div>

                        <div class='form-group'>
                            <label>Precio</label>
                            <input type='text' name='edit_precio' id='edit_category' value="<%= rs.getDouble("Precio_Producto")%>" class='form-control' required>
                        </div>

                        <div class='form-group'>
                            <label>Cantidad</label>
                            <input type='text' name='edit_cantidad' id='edit_price'  value="<%= rs.getInt("Cantidad_Producto")%>" class='form-control'required >
                        </div>
                        <label>Categoria</label>
                        <div class="checks">
                            <%  if (rs.getString("Categoria_Producto").equalsIgnoreCase("Fritos")) {%>
                            <div>
                                <label for="Frito">Fritos</label>
                                <input type="radio" name="edit_categoria" id="Frito" value="<%= rs.getString("Categoria_Producto")%>" required checked="">
                            </div>
                            <div>
                                <label for="Bebida">Bebidas</label>
                                <input type="radio" name="edit_categoria" id="Bebida" value="Bebidas" required>
                            </div>
                            <div>
                                <label for="Otro">Otros</label>
                                <input type="radio" name="edit_categoria" id="Otro" value="Otros" required>
                            </div>
                            <%}%>
                            <%  if (rs.getString("Categoria_Producto").equalsIgnoreCase("Bebidas")) {%>
                            <div>
                                <label for="Frito">Fritos</label>
                                <input type="radio" name="edit_categoria" id="Frito" value="Fritos" required>
                            </div>
                            <div>
                                <label for="Bebida">Bebidas</label>
                                <input type="radio" name="edit_categoria" id="Bebida" value="<%= rs.getString("Categoria_Producto")%>" required checked="">
                            </div>
                            <div>
                                <label for="Otro">Otros</label>
                                <input type="radio" name="edit_categoria" id="Otro" value="Otros" required>
                            </div>
                            <%}%>
                            <%  if (rs.getString("Categoria_Producto").equalsIgnoreCase("Otros")) {%>
                            <div>
                                <label for="Frito">Fritos</label>
                                <input type="radio" name="edit_categoria" id="Frito" value="Fritos" required>
                            </div>
                            <div>
                                <label for="Bebida">Bebidas</label>
                                <input type="radio" name="edit_categoria" id="Bebida" value="Bebidas" required>
                            </div>
                            <div>
                                <label for="Otro">Otros</label>
                                <input type="radio" name="edit_categoria" id="Otro" value="<%= rs.getString("Categoria_Producto")%>" required checked="" required>
                            </div>
                            <%}%>


                        </div>
                        <div class='form-group'>
                            <label>Fecha</label>
                            <input type='date' name='edit_fecha' id='edit_stock' value="<%= rs.getString("FechaVen_Producto")%>" class='form-control' required>
                        </div>
                        <div class='form-group'>
                            <input type='hidden' name='edit_id'  value="<%= rs.getInt("Id_Producto")%>" class='form-control' >
                            <input type='hidden' name='RutaImagenEdit' value="<%=rs.getString("RutaImg_Producto")%>">
                        </div>
                    </div>
                    <div class='modal-footer text-center'>

                        <a href='./productos.jsp' class='btn btn-default' data-dismiss='modal'>Cancelar</a>
                        <input type='submit' class='btn btn-info' value='Guardar datos'>
                    </div>
                </form>

            </div>
        </div>
        <%}
            } catch (Exception e) {
            } finally {
                Conexion.cerrar(con);
                Conexion.cerrar(st);
                Conexion.cerrar(rs);
            }
        %>

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
