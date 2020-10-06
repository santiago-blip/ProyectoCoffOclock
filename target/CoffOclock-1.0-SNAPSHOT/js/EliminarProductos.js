$(document).ready(function () {
    $(".btndeleteProducto").click(function () {
        var idProducto = $(this).parent().find(".idProductoEliminar").val();
        swal({
            title: "¿Seguro que quiere eliminar el producto?",
            text: "Se eliminará el producto del inventario",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        }).then((willDelete) => {
            if (willDelete) {
                eliminar(idProducto);
                swal("Se ha eliminado el producto");
            } else {
                swal("No se ha eliminado ningun producto");
            }
        });
    });
    function eliminar(id) {
        var url = "ControllerProductos?accion=EliminarProducto";
        $.ajax({
            type: 'POST',
            url: url,
            data: "Id_Producto=" + id,
            success: function (data, textStatus, jqXHR) {
                
                parent.location.href = "ControllerProductos?accion=IrVista";
            }
        });
    }
});


