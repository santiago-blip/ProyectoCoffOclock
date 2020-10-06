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
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <link rel="stylesheet" href="css/CSSproductoUsLog.css">
        <link rel="stylesheet" href="css/mediaUsuarioLog.css">
        <link rel="icon" href="img/logo.png">
        <link rel="stylesheet" href="css/usuario.css">
        <link rel="stylesheet" href="css/validations.css">
        <link rel="stylesheet" href="css/mediaUsuario.css">
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
                    <li><a href="index.jsp" id="activo">Inicio</a></li>
                    <li><a href="ControllerPedidosIndex?accion=verPedidoIndex">Productos</a></li>
                    <li><a href="" class="iniciar">Iniciar sesión</a></li>
                    <li><a href="" class="modalR">Registrarse</a></li>
                </ul>
            </div>
        </div>
        <!--Inicio menú desplegable-->
        <div class="ulmenu">
            <ul class="uldesp ulmen">
                <li><a href="index.jsp" id="activo">Inicio</a></li>
                <li><a href="#">Pedidos</a></li>
                <li><a href="#">Iniciar sesión</a></li>
                <li><a href="#">Registrarse</a></li>
            </ul>
        </div>
        <!--Fin menú desplegable-->
        <!--Posiciones absolutas y modal-->

        <!--Fin posiciones absolutas y modal-->
        <div class="container-fluid" style="margin-top: 100px;">   
            <div class="row">


                <c:forEach var="p" items="${ListadoPedidoIndex}" >
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
                                    <button type="button" disabled="true" class="btn btn-outline-success btn-block">Disponible</button>
                                </c:if>

                                <c:if test="${p.getCantidad_Producto()==0}">
                                    <button type="button"  class="btn btn-outline-danger btn-block" disabled="true">No disponible</button>
                                </c:if>
                            </div>
                        </div>
                    </div>  

                    <!--Modales-->
                    <div class="contenedor-modal">
                        <div class="mimodal modal-close">
                            <div class="row justify-content-center">
                                <div class="col-xl-10 col-lg-12 col-md-9">
                                    <div class="card o-hidden border-0 shadow-lg my-5">
                                        <div class="card-body p-0">
                                            <div class="row">
                                                <div class="col-lg-6 d-none d-lg-block bg-login-image">
                                                    <img class="imglog" src="img/undraw_welcome_cats_thqn.svg" alt="">
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="p-5">
                                                        <div class="text-center">
                                                            <h1 class="h4 text-gray-900 mb-4">Bienvenido!</h1>
                                                        </div>
                                                        <form class="user" method="POST" action="ControllerUser?accion=Login" name="formUs"> <!--INICIO FORMULARIO LOGIN-->
                                                            <div class="form-group">
                                                                <input type="email" class="form-control form-control-user" name="correoL" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Ingresa tu E-mail..." required>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="password" class="form-control form-control-user" name="passL" id="exampleInputPassword" placeholder="Contraseña" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <!-- <div class="custom-control custom-checkbox small">
                                                                   <input type="checkbox" class="custom-control-input" id="customCheck">
                                                                   <label class="custom-control-label" for="customCheck">Recuerdame</label>
                                                                 </div>-->
                                                            </div>
                                                            <input type="submit" class="btn btn-primary btn-user btn-block" name="iniciarU" id="customCheck" value="Iniciar" "> <!--onclick="validarUser(this.form)-->
                                                        </form> <!--FIN FORMULARIO LOGIN-->
                                                        <hr>
                                                        <div class="text-center">
                                                            <a class="small restablece" href="#">¿Olvidaste tu contraseña?</a>
                                                        </div>
                                                        <div class="text-center">
                                                            <a class="small modalR" href="#">¡Crear una cuenta!</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!--Cierra el contenedor modal-->
                    <!--Modal registro-->
                    <div class="contenedor-modalR">
                        <div class="mimodalR modal-closeR">
                            <div class="card o-hidden border-0 shadow-lg my-5">
                                <div class="card-body p-0">
                                    <div class="row">
                                        <div class="col-lg-5 d-none d-lg-block bg-register-image">
                                            <img class="imglog" src="img/undraw_welcome_cats_thqn.svg" alt="">
                                        </div>
                                        <div class="col-lg-7">
                                            <div class="p-5">
                                                <div class="text-center">
                                                    <h1 class="h4 text-gray-900 mb-4">Crear cuenta!</h1>
                                                </div>
                                                <form class="user" id="formulario"  action="ControllerUser?accion=Registrar" method="POST"> <!--FORMULARIO--> <!--METÍ ACTION Y METHOD POR PHP, ESTO SE PUEDE BORRAR-->
                                                    <div class="form-group  row" id="grupo_nombre">
                                                        <div class="col-sm-6 mb-3 mb-sm-0 inputs">
                                                            <input type="text" class="campo form-control form-control-user" id="nombre" name="nombre" placeholder="Nombre" required>
                                                            <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                                        </div>
                                                        <p class="error">El nombre de usuario debe tener máximo 16 caracteres</p>
                                                    </div>
                                                    <div class="form-group  row" id="grupo_apellido">
                                                        <div class="col-sm-6 inputs">
                                                            <input type="text" class="campo form-control form-control-user" id="apellido" name="apellido" placeholder="Apellido" required>
                                                            <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                                        </div>
                                                        <p class="error">Apellido invalido</p>
                                                    </div>
                                                    <div class="form-group row" id="grupo_documento">
                                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                                            <select class="custom-select mr-sm-2" id="tipodocumento" name="tipoDoc" required >
                                                                <option value="Cedula de ciudadania">C.C</option>
                                                                <option value="Tarjeta de identidad">T.I</option>
                                                            </select>                  
                                                        </div>
                                                        <div class="col-sm-6 inputs">
                                                            <input type="text" class="campo-valido form-control form-control-user" id="documento" name="documento" placeholder="documento" required>
                                                            <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                                        </div>
                                                        <p class="error">Solo se permiten numeros de 8 a 12 caracteres</p>
                                                    </div>
                                                    <div class="form-group" id="grupo_correo">
                                                        <div class="inputs">
                                                            <input type="email" class="campo form-control form-control-user" id="correo" name="correo" placeholder="Direccion de E-mail" required>
                                                            <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                                        </div>
                                                        <p class="error">Email incorrecto</p>
                                                    </div>
                                                    <div class="form-group row" id="grupo_password">
                                                        <div class="col-sm-6 mb-3 mb-sm-0 inputs">
                                                            <input type="password" class="campo form-control form-control-user" id="password" name="password" placeholder="Contraseña" required>
                                                            <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                                        </div>
                                                        <p class="error">La contraseña debe tener de 4 a 16 caracteres</p>
                                                    </div>
                                                    <div class="form-group row" id="grupo_password2">
                                                        <div class="col-sm-6 inputs">
                                                            <input type="password" class="campo form-control form-control-user" id="password2" name="password2" placeholder="Repetir contraseña" required>
                                                            <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                                        </div>
                                                        <p class="error">La contraseña no coincide</p>
                                                    </div>
                                                    <div class="form-message" id="form-message" style="">
                                                        <p style="margin: 0; color: black;"><i class="fa fa-exclamation-triangle"></i> <b> Error: </b> por favor complete los campos</p>
                                                    </div>
                                                    <br>
                                                    <input type="hidden" class="form-control form-control-user" id="exampleRepeatPassword" name="rol" value="1">
                                                    <input type="submit" name="btnRegistrar" class="btn btn-primary btn-user btn-block" value="Crear cuenta"><br>
                                                    <p class="message-exitoso" id="message-exitoso">Registro exitoso!</p>
                                                </form> <!--Formulario-->
                                                <hr>
                                                <!-- <div class="text-center">
                                                  <a class="small restablece" href="#">¿Olvidaste tu contraseña?</a>
                                                </div> -->
                                                <div class="text-center">
                                                    <a class="small iniciar" href="#">¿Ya tienes una cuenta? ¡Iniciar sesión!</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Fin modal registro-->
                    <!--MODAL DE REESTABLECER CONTRASEÑA-->
                    <div class="contenedor-reestablecer">
                        <div class="modalRestablece restablece-close">
                            <div class="row justify-content-center">
                                <div class="col-xl-10 col-lg-12 col-md-9">
                                    <div class="card o-hidden border-0 shadow-lg my-5">
                                        <div class="card-body p-0">
                                            <div class="row">
                                                <div class="col-lg-6 d-none d-lg-block bg-password-image">
                                                    <img class="imglog" src="img/undraw_private_data_7q35.svg" alt="">
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="p-5">
                                                        <div class="text-center">
                                                            <h1 class="h4 text-gray-900 mb-2">Olvidaste tu contraseña?</h1>
                                                            <p class="mb-4">Lo entendemos, estas cosas suelen pasar. Simplemente ingrese su dirección de correo electrónico a continuación y 
                                                                le enviaremos un enlace para restablecer su contraseña.
                                                            </p>
                                                        </div>
                                                        <form class="user" action="RecuperarPass?accion=GenerarCodigo" method="POST">
                                                            <div class="form-group">
                                                                <input type="email" class="form-control form-control-user" id="exampleInputEmail" name="RecuperarMail" aria-describedby="emailHelp" placeholder="Ingrese la direccion de correo electronico...">
                                                            </div>
                                                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                                                Restablecer contraseña
                                                            </button>
                                                        </form>
                                                        <hr>
                                                        <div class="text-center">
                                                            <a class="small modalR" href="#">¡Crear cuenta!</a>
                                                        </div>
                                                        <div class="text-center">
                                                            <a class="small iniciar" href="#">¿Ya tienes una? ¡Iniciar sesión!</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--FIN MODAL DE REESTABLECER CONTRASEÑA-->
                    <!--fin modales-->
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
        <script src="js/usuario.js"></script>
        <script src="js/validarUser.js"></script>
        <script src="js/modalRegistro.js"></script>
        <script src="js/reestablece.js"></script>
        <script src="js/despMenu.js"></script>
        <!-- Template Main JS File --> 
        <script src="assets/js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </body>
</html>
