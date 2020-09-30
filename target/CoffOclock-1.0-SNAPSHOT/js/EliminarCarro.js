$(document).ready(function () {
    $(".btndelete").click(function () {
        var idProducto = $(this).parent().find(".idC").val();
        if (confirm("¿Está Seguro de eliminar el registro?")) {
            eliminar(idProducto);
            parent.location.href = "ControllerCarrito?accion=MostrarCarro";
        }
    });

    function eliminar(id) {
        var url = "ControllerCarrito?accion=EliminarCarrito";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idC=" + id,
            success: function (data, textStatus, jqXHR) {
                alert("Registro eliminado");
            }
        });
    }
   
   $(".cantidad").click(function(){
      var idcamb = $(this).parent().find(".idpCam").val();
      var cantidad =$(this).parent().find(".cantidad").val();
      $.ajax({
            type: 'POST',
            url: "ControllerCarrito?accion=ActualizarCantidad",
            data: "cantidadCamb="+cantidad+"&idCAMB="+idcamb,
            success: function (data, textStatus, jqXHR) {
                parent.location.href = "ControllerCarrito?accion=MostrarCarro";
            }
      });
   });
   
   
});

