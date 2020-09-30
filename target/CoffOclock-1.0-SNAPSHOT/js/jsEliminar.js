
function eliminarFunc(Id_Producto) {
    if (confirm("¿Está Seguro de eliminar el registro?")) {
        window.location.href = "ControllerProductos?accion=EliminarProducto&Id_Producto=" + Id_Producto;
    }
}

