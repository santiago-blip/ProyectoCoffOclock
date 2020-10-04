$(document).ready(function () {
    $(".btndelete").click(function () {
        var idProducto = $(this).parent().find(".idC").val();
//        if (confirm("¿Está Seguro de eliminar el registro?")) {
//            eliminar(idProducto);
//            parent.location.href = "ControllerCarrito?accion=MostrarCarro";
//        }
        swal({
            title: "¿Seguro que quiere eliminar el producto?",
            text: "Se eliminará el producto del carrito de compras",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idProducto);
            } else {
                swal("No se ha eliminado ningun producto");
            }
        });
    });

    function eliminar(id) {
        var url = "ControllerCarrito?accion=EliminarCarrito";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idC=" + id,
            success: function (data, textStatus, jqXHR) {
                swal("El producto ha sido eliminado", {
                    icon: "success",
                }).then(()=>{
                    parent.location.href = "ControllerCarrito?accion=MostrarCarro";
                });
                
            }
        });
    }

    $(".cantidad").click(function () {
        var idcamb = $(this).parent().find(".idpCam").val();
        var cantidad = $(this).parent().find(".cantidad").val();
        $.ajax({
            type: 'POST',
            url: "ControllerCarrito?accion=ActualizarCantidad",
            data: "cantidadCamb=" + cantidad + "&idCAMB=" + idcamb,
            success: function (data, textStatus, jqXHR) {
                parent.location.href = "ControllerCarrito?accion=MostrarCarro";
            }
        });
    });
});


