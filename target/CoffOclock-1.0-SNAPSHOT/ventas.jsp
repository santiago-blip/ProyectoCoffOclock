<%@page import="Clases.Grafica"%>
<%@page import="Clases.Ventas"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="Controller.ControllerUser" %>
<!DOCTYPE html>
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
        <link rel="stylesheet" href=" ${pageContext.request.contextPath}/css/inventario.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Inventario.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <!-- Libreria Archivos CSS  -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <script src="vendor2/chart.js/Chart.bundle.min.js"></script>
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
                            <a class="nav-link " href="admon.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ControllerPedidosADMIN?accion=verPedidos">Pedidos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="inventario.jsp">Inventario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link  active" href="ventas.jsp">Ventas</a>
                        </li>
                    </ul>
                </div>
                <a class="btn btn-outline-danger" href="ControllerUser?accion=CerrarSesion&user=admin">Cerrar Sesión</a>
            </div>
        </nav>

        <!-- == Gráficas == -->
        <div class="container-fluid" style="margin-top: 150px;">
            <div class="row">
                <div class="col-5 m-auto">
                    <canvas id="myChart" width="400px" height="400px"></canvas>
                </div>

            </div>
        </div>


      <%
            List<Grafica> listaVenta = null;
            double listaVentas[] = null;
            String listaFecha[] = null;
            listaFecha = new String[12];
            listaFecha[0] = "'ENERO'";
            listaFecha[1] = "'FEBRERO'";
            listaFecha[2] = "'MARZO'";
            listaFecha[3] = "'ABRIL'";
            listaFecha[4] = "'MAYO'";
            listaFecha[5] = "'JUNIO'";
            listaFecha[6] = "'JULIO'";
            listaFecha[7] = "'AGOSTO'";
            listaFecha[8] = "'SEPTIEMBRE'";
            listaFecha[9] = "'OCTUBRE'";
            listaFecha[10] = "'NOVIEMBRE'";
            listaFecha[11] = "'DICIEMBRE'";
            if (sesion.getAttribute("Venta") != null) {
                
               listaVenta = (ArrayList)sesion.getAttribute("Venta");
               //ESTABLECER VALORES PARA LOS MESES
                listaVentas = new double[12];
                for (int i = 0; i < listaVenta.size(); i++) {

                    switch (listaVenta.get(i).getMes()) {
                        case 1:
                            listaVentas[0] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 2:
                            listaVentas[1] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 3:
                            listaVentas[2] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 4:
                            listaVentas[3] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 5:
                            listaVentas[4] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 6:
                            listaVentas[5] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 7:
                            listaVentas[6] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 8:
                            listaVentas[7] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 9:
                            listaVentas[8] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 10:
                            listaVentas[9] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 11:
                            listaVentas[10] = listaVenta.get(i).getTotalGrafica();
                            break;
                        case 12:
                            listaVentas[11] = listaVenta.get(i).getTotalGrafica();
                            break;
                    }
              

               
            }
            }
        %>

        <script>
            var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
            var diasSemana = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado");
            var f = new Date();
            document.write(diasSemana[f.getDay()] + ", " + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
        </script>
        <script>

            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: <%=Arrays.toString(listaFecha)%>,
                    datasets: [{
                            label: 'Ventas',
                            borderColor:'green',
                            data:<%=Arrays.toString(listaVentas)%>,
                            borderWidth: 2
                        }
                    ]
                },
                options: {
                title:{
                display:true,
                text:"Gráficas del año <%=sesion.getAttribute("year")%>",
                fontSize:30,
                padding:30,
                fontColor:"rgb(135,156,189)"
                },
                 legend:{
                     position:'bottom',
                     labels:{
                         padding:20,
                         boxWidth:25,
                         fontFamily:"system-ui",
                         fontColor:"black",
                        }
                 },
                   layout:{
                       padding:{
                           right:50
                       }
                   },
                   tooltips:{
                   backgroundColor:"black",
                   titleFontSize:20,
                   xPadding:20,
                   yPadding:20,
                   bodyFontSize:15,
                   bodySpacing:10,
                   mode:"x"
                         },
                   elements:{
                   line:{
                       borderWidth:100,
                       fill:false
                   },
                   point:{
                       radius:6,
                       borderWidth:4,
                       backgroundColor:"white",
                       hoverRadius:8,
                       hoverborderRadius:4
                   }
                        },
                    scales: {
                        yAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }],
                        xAxes:[{
                               gridLines:{
                                   display:false
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
