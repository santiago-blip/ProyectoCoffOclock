$(document).ready(function () {
    $("#select").change(function () {
        var year = $(this).val();
        console.log("El año es: "+year);
        $.ajax({
            type: 'POST',
            url: "ControllerGraficas?accion=VerGrafica",
            data: "year="+year,
            success: function (data, textStatus, jqXHR) {
                parent.location.href = "ventas.jsp";
            }
        });
    });
});

console.log("Hola");