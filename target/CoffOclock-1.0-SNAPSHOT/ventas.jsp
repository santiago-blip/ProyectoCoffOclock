<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Controller.ControllerUser" %>
<!DOCTYPE html>
<%--<%
HttpSession sesion = request.getSession();

if(sesion.getAttribute("logAdmin")==null ||  !sesion.getAttribute("logAdmin").equals("2")){
    response.sendRedirect("index.jsp");
}
%>
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
%>--%>
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
        <!-- == Gráficas == -->

        <canvas id="myChart" width="400" height="400"></canvas>
        <script src="vendor2/chart.js/Chart.bundle.min.js"></script>
        <script src="vendor2/chart.js/Chart.min.js"></script>


        <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                    datasets: [{
                            label: '# of Votes',
                            data: [12, 19, 3, 5, 2, 3],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>











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
