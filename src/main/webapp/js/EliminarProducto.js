$(document).ready(function () {
    $(".btndeleteProducto").click(function () {
        var idProducto = $(this).parent().find(".idProductoEliminar").val();
        if (confirm("¿Está Seguro de eliminar el registro?")) {
            eliminar(idProducto);
        }
    });
    function eliminar(id) {
        var url = "ControllerProductos?accion=EliminarProducto";
        $.ajax({
            type: 'POST',
            url: url,
            data: "Id_Producto=" + id,
            success: function (data, textStatus, jqXHR) {
                alert("Registro eliminado");
                parent.location.href = "ControllerProductos?accion=IrVista";
            }
        });
    }
});



