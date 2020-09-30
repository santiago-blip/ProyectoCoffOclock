<%-- 
    Document   : RecuperarContrasena
    Created on : 29 sept. 2020, 18:44:29
    Author     : santi
--%>


<%

if(request.getAttribute("NoIngresar") != null){
    if(request.getAttribute("NoIngresar").equals("false")){
        request.setAttribute("NoIngresar", "true");
    }else{
        response.sendRedirect("index.jsp");
    }
}else{
    response.sendRedirect("index.jsp");
}

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <!-- Libreria Archivos CSS  -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
        
        String correo = (String) request.getAttribute("CorreoCambio");
        
        %>
        
        
        <div class="container">
            <form action="RecuperarPass?accion=cambiar" method="POST">
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="hidden" value="<%=correo%>" name="CorreoCam">
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pass">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

        </div>











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
