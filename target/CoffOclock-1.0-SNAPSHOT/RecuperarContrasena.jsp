<%-- 
    Document   : RecuperarContrasena
    Created on : 29 sept. 2020, 18:44:29
    Author     : santi
--%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
HttpSession sesion = request.getSession();

if(sesion.getAttribute("EntrarRecuperar") != null){
    System.out.println("Esto está trayendo el mail "+(Integer)sesion.getAttribute("EntrarRecuperar"));
    if((Integer)sesion.getAttribute("EntrarRecuperar")==1){
        sesion.setAttribute("EntrarRecuperar", 2);
        System.out.println("Esto está trayendo el mail después de cambiar "+(Integer)sesion.getAttribute("EntrarRecuperar"));
    }else if((Integer)sesion.getAttribute("EntrarRecuperar")==2){
        response.sendRedirect("index.jsp");
    }
}else{
    response.sendRedirect("index.jsp");
}
%>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- Libreria Archivos CSS  -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/validations.css">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
        
        String correo = (String) sesion.getAttribute("CorreoCambio");
        
        %>
        
        
        <div class="container mx-auto" style="margin-top: 100px">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" >
                    <div class="card card-signin my-5 ">
                        <div class="card-body">
                            <h5 class="card-title text-center">Recuperar contraseña</h5>
                            <form class="form-signin" action="RecuperarPass?accion=cambiar" method="POST" id="formularioRecuperar">
                                <div class="form-group " id="grupo_password">
                                    <div class="mb-3 mb-sm-0 inputs">
                                        <input type="password" class="campo form-control form-control-user" id="password" name="password" placeholder="Contraseña" required>
                                        <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                    </div>
                                    <p class="error">La contraseña debe tener de 4 a 16 caracteres</p>
                                </div>
                                <div class="form-group " id="grupo_password2">
                                    <div class="inputs">
                                        <input type="password" class="campo form-control form-control-user" id="password2" name="password2" placeholder="Repetir contraseña" required>
                                        <i class="validacion-campo fa fa-times-circle" style="font-size: 25px"></i>
                                    </div>
                                    <p class="error">La contraseña no coincide</p>
                                </div>

                                <hr class="my-4">
                                <input type="hidden" value="<%=correo%>" name="correoC">
                                <button class="btn btn-lg btn-outline-primary btn-block text-uppercase" type="submit">Sign in</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>











        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/scrollreveal/scrollreveal.min.js"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
        <script src="js/ValidarRecuperarContraseña.js"></script>
    </body>
</html>
