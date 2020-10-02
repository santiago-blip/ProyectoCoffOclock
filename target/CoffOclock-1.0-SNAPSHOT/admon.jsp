<%-- 
    Document   : admon
    Created on : 30/05/2020, 4:55:48 p. m.
    Author     : santi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Controller.ControllerUser" %>
<!DOCTYPE html>
<%--<%
HttpSession sesion = request.getSession();

if(sesion.getAttribute("logAdmin")==null ||  !sesion.getAttribute("logAdmin").equals("2")){
    response.sendRedirect("index.jsp");
}
%>--%>
<%
HttpSession sesion = request.getSession();

if(sesion.getAttribute("log")==null){
    response.sendRedirect("index.jsp");
}else{
    if(sesion.getAttribute("log").equals("0")){
    response.sendRedirect("index.jsp");
    }else if(!sesion.getAttribute("log").equals("2")){
       response.sendRedirect("UsuarioLog.jsp"); 
    }
}
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="descriptison">
        <meta content="" name="keywords">
        <title>PE&Z</title>
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
    </head>

    <body>
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
                <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
                        data-target="#navbarTogglerDemo01" aria-expanded="false">
                    <span class="fa fa-search" aria-hidden="true"></span>
                </button>
                <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="admon.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ControllerPedidosADMIN?accion=verPedidos">Pedidos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="inventario.jsp">Inventario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ventas.jsp">Ventas</a>
                        </li>
                    </ul>
                </div>
                <a class="btn btn-outline-danger" href="ControllerUser?accion=CerrarSesion&user=admin">Cerrar Sesión</a>
            </div>
        </nav>
        <!-- == CARUCEL == -->
        <div class="intro intro-carousel">
            <div id="carousel" class="owl-carousel owl-theme">
                <div class="carousel-item-a intro-item bg-image" style="background-image: url(img/bases.png)">
                    <div class="overlay overlay-a"></div>
                    <div class="intro-content display-table">
                        <div class="table-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="intro-body">
                                            <h1 class="intro-title mb-4">
                                                <span class="color-b">... </span> Sistematizacion
                                                <br> De Procesos</h1>
                                            <p class="intro-subtitle intro-price">
                                                <a href="#"><span class="price-a">...</span></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item-a intro-item bg-image" style="background-image: url(img/analisis.jpg)">
                    <div class="overlay overlay-a"></div>
                    <div class="intro-content display-table">
                        <div class="table-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="intro-body">
                                            <h1 class="intro-title mb-4">
                                                <span class="color-b">... </span> Analisis
                                                <br> De Ventas</h1>
                                            <p class="intro-subtitle intro-price">
                                                <a href="#"><span class="price-a">...</span></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item-a intro-item bg-image" style="background-image: url(img/tienda.jpg)">
                    <div class="overlay overlay-a"></div>
                    <div class="intro-content display-table">
                        <div class="table-cell">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="intro-body">
                                            <h1 class="intro-title mb-4">
                                                <span class="color-b">... </span> Productos
                                                <br> En linea</h1>
                                            <p class="intro-subtitle intro-price">
                                                <a href="#"><span class="price-a">...</span></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <main id="main">
            <!-- == SERVICIOS == -->
            <section class="section-services section-t8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a"> Servicios</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card-box-c foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="fa fa-database"></span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h2 class="title-c">Sistematizar</h2>
                                    </div>
                                </div>
                                <div class="card-body-c">
                                    <p class="content-c">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Ratione, sit hic? Expedita nulla veniam,
                                        ratione, nostrum aperiam in iure perspiciatis aspernatur obcaecati, totam esse ea hic nisi quibusdam
                                        quae delectus?
                                    </p>
                                </div>
                                <div class="card-footer-c">
                                    <!-- <a href="#" class="link-c link-icon">Saber mas
                                      <span class="ion-ios-arrow-forward"></span>           
                                    </a> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-box-c foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="fa fa-cog"></span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h2 class="title-c">Analisis</h2>
                                    </div>
                                </div>
                                <div class="card-body-c">
                                    <p class="content-c">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Debitis maiores tempore illo non maxime,
                                        eligendi laborum rerum pariatur mollitia repellendus provident autem animi. Est molestiae quos fugit
                                        alias aliquam error!
                                    </p>
                                </div>
                                <div class="card-footer-c">
                                    <!-- <a href="#" class="link-c link-icon">Saber mas
                                      <span class="ion-ios-arrow-forward"></span>
                                    </a> -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-box-c foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="fa fa-shopping-cart"></span>
                                    </div>
                                    <div class="card-title-c align-self-center">
                                        <h2 class="title-c">Online</h2>
                                    </div>
                                </div>
                                <div class="card-body-c">
                                    <p class="content-c">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident eaque atque similique non a
                                        voluptatum soluta eum voluptatem fugit, modi, velit repellendus expedita impedit cum neque alias
                                        officia vero cupiditate.
                                    </p>
                                </div>
                                <div class="card-footer-c">
                                    <!-- <a href="#" class="link-c link-icon">Saber mas
                                      <span class="ion-ios-arrow-forward"></span>
                                    </a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- == EQUIPO DE TRABAJO == -->
            <section class="section-agents section-t8">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="title-wrap d-flex justify-content-between">
                                <div class="title-box">
                                    <h2 class="title-a">Equipo de trabajo</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card-box-d">
                                <div class="card-img-d">
                                    <img src="img/gray.jpg" alt="" class="img-d img-fluid">
                                </div>
                                <div class="card-overlay card-overlay-hover">
                                    <div class="card-header-d">
                                        <div class="card-title-d align-self-center">
                                            <h3 class="title-d">
                                                <a href="#" class="link-two">Santiago Vallejo
                                                    <br> Villa S</a>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="card-body-d">
                                        <p class="content-d color-text-a">
                                            ...
                                        </p>
                                        <div class="info-agents color-a">
                                            <p>
                                                <strong>Celular: </strong> 305 3175689</p>
                                            <p>
                                                <strong>Email: </strong> santyvallejovilla@gmail.com</p>
                                        </div>
                                    </div>
                                    <div class="card-footer-d">
                                        <div class="socials-footer d-flex justify-content-center">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-box-d">
                                <div class="card-img-d">
                                    <img src="img/gray.jpg" alt="" class="img-d img-fluid">
                                </div>
                                <div class="card-overlay card-overlay-hover">
                                    <div class="card-header-d">
                                        <div class="card-title-d align-self-center">
                                            <h3 class="title-d">
                                                <a href="#" class="link-two">Andres Felipe
                                                    <br> Buelvas Rivera</a>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="card-body-d">
                                        <p class="content-d color-text-a">
                                            ...
                                        </p>
                                        <div class="info-agents color-a">
                                            <p>
                                                <strong>Celular: </strong> 312 8804768</p>
                                            <p>
                                                <strong>Email: </strong> buelvasandres92@gmail.com</p>
                                        </div>
                                    </div>
                                    <div class="card-footer-d">
                                        <div class="socials-footer d-flex justify-content-center">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card-box-d">
                                <div class="card-img-d">
                                    <img src="img/gray.jpg" alt="" class="img-d img-fluid">
                                </div>
                                <div class="card-overlay card-overlay-hover">
                                    <div class="card-header-d">
                                        <div class="card-title-d align-self-center">
                                            <h3 class="title-d">
                                                <a href="#" class="link-two">Alejandro
                                                    <br> Gomez</a>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="card-body-d">
                                        <p class="content-d color-text-a">
                                            ...
                                        </p>
                                        <div class="info-agents color-a">
                                            <p>
                                                <strong>Celular: </strong> 312 2563477</p>
                                            <p>
                                                <strong>Email: </strong> alejandro.gomez.1152@gmail.com</p>
                                        </div>
                                    </div>
                                    <div class="card-footer-d">
                                        <div class="socials-footer d-flex justify-content-center">
                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-facebook" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-twitter" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-instagram" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-pinterest-p" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="#" class="link-one">
                                                        <i class="fa fa-dribbble" aria-hidden="true"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <hr>
        </main>
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